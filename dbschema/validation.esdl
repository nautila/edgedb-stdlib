module validation {
	scalar type bcrypt_hash_str extending str {
		annotation description := "A valid bcrypt hash string.";
		constraint regexp(r"^\$2[ayb]?\$[0-9]{2}\$.{53}$");
	}

	scalar type email_str extending str {
		annotation description := "Valid email address according to the W3C specification for input[type=email].";
		constraint regexp(r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
		# RFC: Is the W3C spec the best one to use?
		# - pro: it's (probably) the most widely used, and will work for _most_ cases.
		# - con: it doesn't cover all edge cases, especially for international email addresses - ie. those with non-ASCII characters.
	}

	scalar type locale_str extending str {
		annotation description := "Locale identifier string, formatted as xx_YY. (xx = country, YY = dialect)";
		constraint regexp(r"^[a-z]{2}_[A-Z]{2}$");
	}

	scalar type phone_number_str extending str {
		annotation description := "String representing a phone number, formatted according to E.164.";
		constraint regexp(r"^\+?[1-9]\d{1,14}$");
	}

	scalar type trimmed_str extending str {
		annotation description := "A string with no leading or trailing whitespace.";
		constraint expression on ( __subject__ = str_trim(__subject__) );
	}

	scalar type uuid_str extending str {
		annotation description := "A valid UUID string.";
		constraint regexp(r"^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$");
	}
}
