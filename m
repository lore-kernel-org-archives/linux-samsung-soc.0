Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9242644B661
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096629; cv=none; b=l6b8dPFerr8v2bwjJ4tEYTRjQMfe/KDZ5RR8A/NsmUkxUlOeV8VdPbl4rLqGxcsC8heAfsj9Whx5lgj0pJiLJMeyCQm16Oj3Hy3kguK7YDnDohpCPolxObD6Cn5UHmW3IjBQB+W120w7au8RXu3stKoSUJywINHy1bzOM33Jnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096629; c=relaxed/simple;
	bh=mvLpDBDtjjTy7WC1hkY3vl1ccJiFCt7eD41ttUSpx+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krYxX3Os2gYSB/yv6M3dCHoQMdPNf+KjfM2UvFHqFxhAqTBXJb5vGISjKNdlEkXv1TDkcGRUBD8wpSy2xV98ZEttZC9IkMHvC5JdQTfsEMGKVhtIvdYAR2RoxHkp+/gV0AkcciLVFOahRrt5TC0KHpP40w4bxk87JFHgPcsyEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8Aa+9Nf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8Aa+9Nf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so2055427a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096621; x=1769701421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjAudqG82zBneeIXc6AyLX5P/jBbCjeUnuIz0dqoYGk=;
        b=D8Aa+9NfSwRfvFE9J8LVFGnQBCFxZJBJUpfzXI8sfw61cgY2YjNsctyot9MjAdXTgh
         +4kCgmTz6FVYOiAxXSOVpb0plaTkuuVNVLqdZ+x8sMSiHlMg4Gmqd/XSCE2bZ5JQW9+9
         drNe2yWNV8yMvo54IGIKoTJ0Ao3xyc9HKdjH2lKRHG91SDzTZ4ToSSZx/rDjIRGPnn1h
         GkavFaMbwHm016ZByak6DnTOqpHThlZ02GMArS7e9m5uHJW3e4aGExlhzp5gbsDN0QlK
         wNng27pp0xj3VfSo2rlJx7qNlEFV3rZ4wclAsqPpvd/KySQatvb4xBjgzACAvUP5GTIL
         /o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096621; x=1769701421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjAudqG82zBneeIXc6AyLX5P/jBbCjeUnuIz0dqoYGk=;
        b=WqD0Ge5zXKJricXybZMcfw2K/PHZ2xDOhDUfu2/3jyOOPoc/rj8hexDLP52FFiBrC+
         Zc93KcTKqwkpVV72jifIyXu+Re1wOmrIRY8yw+/0xCZ5zCNtqWmZ9uv6U9EYu5KryVHY
         zW4mhjgs+bTuZe9rzCNbgT5iN+O08nD0Fmfm1hONDz9hvL3Ja9PG5TtF3oAa+G96I3SW
         LtCHQAkIitEPXwUjEmf8JfHNlYYKsGcVNc/zsa0F6fZljjxnmahYwUwlhFl++onMrbS8
         81NGZl9nm8lcdbefbqyuLQkI4bZqq9Fo8wlh08NUBod4XT7ANhLMU++dZ0l7gb4JONwh
         5AoA==
X-Forwarded-Encrypted: i=1; AJvYcCVYBZW3eKnbSEAfCCwWKWgUgL8r32gTSqmJnpU7GD6MuKgYAmW4347ket+GzOpw/bCSQMXDxxay7hKxE4s3fmc4eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lmAhwd0sLdLBMvadRMAW+r8Q2MyLga5vIFXY2cXhBvoP+iIT
	NU45A/8rQTOHdBZCs5vpCm7JJ0S69SGF6ssX+nmKnSe9SM4/6PPXu27Ulm9CLY9580n7SHg2reO
	xLb166NM=
X-Gm-Gg: AZuq6aL9WZ96GnOKPZwHoZJsjKd57I0+CrGHeZZFz3KXh3Qm4VZRHf0z2j+VHc+9Dh3
	Ptb4deedLdfKXB9hjubq/wjdKqOc277lJFnpCNm8f96jALTfNIbnDUcgvvr4iWuJAFOvlBjFY8c
	w0pMPaLuuf6vamWETDCmllc0D5w+5JqahBbrk1UJxwjW5FGE6dspjwzmrrYSxvK1AKFKLRnJsiK
	fRZZhU83NW9HZMf21SMq7gALmb5jCeiIiCKDundXgGXpieQ60Jaq5YmzQMniANEqcPUXtxPu94G
	Ki33VSOtiV+yndnlR0ltfkMN56SmcsBAGwxfl0ad8JyweZUXjeFhTGBKdTRTmzYx27v0G86eW/7
	92SYP4TqtV0Wfb/ckDnIY1LmfjLPmoxWmajmoxf5KVoJOxf3Or3voBXlr+PLM5x3HUvym02OBay
	/Gz7XCDgZv90WUevrBLkKN+biTU3cnwSkUFfpzF+5OZcstm+haA2BMU/SWiI1r1YLC9scpwY+jB
	a7OQw==
X-Received: by 2002:a05:6402:350c:b0:64c:fc09:c956 with SMTP id 4fb4d7f45d1cf-658487b7eb7mr24682a12.29.1769096620921;
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:35 +0000
Subject: [PATCH v7 08/20] mfd: sec: s2mpg10: reorder regulators for better
 probe performance
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-8-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Bucks can reasonably be supplies for LDOs, but not the other way
around. Since rail registration is going to be ordered by 'enum
s2mpg10_regulators', it makes sense to specify bucks first, so that
during LDO registration it is more likely that the corresponding supply
is known already.

This can improve probe speed, as no unnecessary deferrals and retries
are required anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/s2mpg10.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..aec248c51f366359ff323f421e453a0ec1d1dfa3 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -407,6 +407,16 @@ enum s2mpg10_meter_reg {
 
 /* S2MPG10 regulator IDs */
 enum s2mpg10_regulators {
+	S2MPG10_BUCK1,
+	S2MPG10_BUCK2,
+	S2MPG10_BUCK3,
+	S2MPG10_BUCK4,
+	S2MPG10_BUCK5,
+	S2MPG10_BUCK6,
+	S2MPG10_BUCK7,
+	S2MPG10_BUCK8,
+	S2MPG10_BUCK9,
+	S2MPG10_BUCK10,
 	S2MPG10_LDO1,
 	S2MPG10_LDO2,
 	S2MPG10_LDO3,
@@ -438,16 +448,6 @@ enum s2mpg10_regulators {
 	S2MPG10_LDO29,
 	S2MPG10_LDO30,
 	S2MPG10_LDO31,
-	S2MPG10_BUCK1,
-	S2MPG10_BUCK2,
-	S2MPG10_BUCK3,
-	S2MPG10_BUCK4,
-	S2MPG10_BUCK5,
-	S2MPG10_BUCK6,
-	S2MPG10_BUCK7,
-	S2MPG10_BUCK8,
-	S2MPG10_BUCK9,
-	S2MPG10_BUCK10,
 	S2MPG10_REGULATOR_MAX,
 };
 

-- 
2.52.0.457.g6b5491de43-goog

