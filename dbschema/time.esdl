module time {
	abstract type CreatedAt {
		required createdAt: datetime {
			default := datetime_current();
			readonly := true;
		};
		index on (.createdAt);
		required property sinceCreated := datetime_of_statement() - .createdAt;
	}

	# RFC: Should this rather be "ModifiedAt"?
	# - pro: adheres to standard UNIX nomenclature.
	# - con: diverges from CRUD terminology.
	abstract type UpdatedAt {
		required updatedAt: datetime {
			default := datetime_current();
			rewrite update using (datetime_current());
		};
		index on (.updatedAt);
		required property sinceUpdated := datetime_of_statement() - .updatedAt;
	}

	abstract type Timestamped extending CreatedAt, UpdatedAt {}

	# TODO: Figure out soft delete logic.
	# Access to objects with a `deletedAt` value should be restricted from queries by default, but still be accessible
	# when explicitly requested. This could probably be solved by using access policies and globals.
	# abstract type DeletedAt {
	# 	deletedAt: datetime;
	# 	index on (.deletedAt);
	# 	required property sinceDeleted := datetime_of_statement() - .deletedAt;
	# }
}
