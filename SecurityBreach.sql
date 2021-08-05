/*
You are managing a large website that uses a special algorithm for user identification. In particular, it generates a unique attribute for each person based only on their first and last names and some additional metadata.

After analyzing the server logs today you found out that the website security has been breached and the data of some of your users might have been compromised.

The users' info is stored in the table users with the following structure:

first_name: user's first name;
second_name: user's last name;
attribute: a unique attribute string of this user.
It seems that only the users those attribute was generated by the old version of your special algorithm were affected. Such attributes have the following format (accurate to letter cases): <one or more arbitrary character>%<first name>_<second name>%<zero or more arbitrary characters>. It's your duty now to warn the users that have these attributes about possible risks.

Given the users table, compose the resulting table consisting only of the rows that contain affected users' info. The result should be sorted by the attributes in ascending order.

Example

For the following table users

first_name	second_name	attribute
Mikel	Cover	%Mikel_Cover%
Vicenta	Kravitz	0%Vicenta_Kravitz%
Tosha	Cover	02VO1aJ767GF7L186lpIfBR0fQ5406Q02YcpG42LDF4Bv26
Shayne	Dahlquist	0R0V331K8Q7ypBi4Az3B6Nm0jCqUk%Shayne_Dahlquist%46E3O0u7t7
Carrol	Llanes	2mDIb1SdJne5wfH1Al32BE92r7j1d60PJ263b2vyPn3zxQ2P7sVOM26J11UT6W0Np
Lizabeth	Cover	d1gM87S0NEHp386jXOk0aDc7w8bx4u8q7D82ff2Z4YT43iLyZ39xYbEDXMk
Mack	Chace	fAnU49nMrmGu308627J7ne3qqqSPJDnq6dwW607lahNB5DinTR2Rkp549G7
Vicenta	Marchese	kUJ3N67vLB07mQL9Ai7p18cXGzjdT32r8283ZQi
Mikel	Kravitz	PBX86iw1Ied87Z9OarE6sdSLdt%Mikel_Kravitz%W73XOY9YaOgi060r2x12D2EmD7
Deirdre	Chace	PBX86iw1Ied87Z9OarE6sdSLdtDeirdrelChaceW73XOY9YaOgi060r2x12D2EmD7
Josphine	Arzate	PwWD95BCKVYn5YD7iHLMa3HjP9tH%josphine_arzate%d2hNHNd3RpqfUREN47
Deirdre	Chace	ryCE5FIyS8q54A5036luzVS91j6C7P76E9X0O58htzgthuX24LG%DEirdre_Chace%
Julietta	Beer	Tn35g5h51u7ltW946J
the output should be

first_name	second_name	attribute
Vicenta	Kravitz	0%Vicenta_Kravitz%
Shayne	Dahlquist	0R0V331K8Q7ypBi4Az3B6Nm0jCqUk%Shayne_Dahlquist%46E3O0u7t7
Mikel	Kravitz	PBX86iw1Ied87Z9OarE6sdSLdt%Mikel_Kravitz%W73XOY9YaOgi060r2x12D2EmD7

*/
CREATE PROCEDURE securityBreach()
BEGIN
	SELECT * FROM users WHERE attribute LIKE BINARY CONCAT('%_\%%',first_name,'\_',second_name, '%\%%')
 ORDER BY attribute;
END
