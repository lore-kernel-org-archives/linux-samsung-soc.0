Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B621018F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231064; cv=none; b=Em/Tmd1LevaBYt8/up4lYhnaVNlsBqiAOZzCF7gd5icG6vJ0LzqWjWM/m1rELV+jXlxeVr5B4r1LC4gyscPQhlwRhZZAaJwJDhm7zh8vkBFJtsSCUGhaNSaf3SenR/LWFVYWN2tMHTcLCHubPwR2lEW2DJUvcCdFFNe97DAMqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231064; c=relaxed/simple;
	bh=XNPLpibedDTSu7S33NUIPTJnGACKRxAom0wu7hI1PCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UieZFbwBs2PN/5nLuRdufpZDSkWGChD4qf24MOzsAtpagQ3GhvnyEolLJyokqaFdU8JVHski+727sIZbrlTu260DIlhIo6QqBGXRF34ffqH5Ot/AdSgGou8xAAjXqHA4eU4WE3WGAyJxnghoFeYhy5VTJMnG4WfYMD2GxOdbCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTdhWDRD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTdhWDRD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso17934766b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231057; x=1744835857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzEjXNkLNu9GbyJRrsPm3OGWMuRzZZwPEzkpfwqOZVo=;
        b=OTdhWDRDj8cUyEoBcRy7n2oKEqS8SgsRPrT6JDTUeTBOAMtzCua5No5Q6xxgkkjQ30
         ySFmmvi/cjO70Cux0AUtba6idIXfriM/xq0dEAeX2uJTeaA7ykRJ4PephyEEdtXyuB1p
         SWeee4xi5TdhVVehwgKKaiTo+k3Pc9xccaLl/pS9H+2MhcZLNxCSvreS0WAR9IapoLM8
         3mu1bBm9SlQv0x5/Gwjp6IinFBKpCn0aMxdsrBAZZJyUoAUrd8H/AOf66634XKwo47IM
         XTo/OABATYwfv/mfMFBnarXmOCfk5+HKV9ux4YldAG7mBKTmISLFOgKENqHiShYIXf0O
         8HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231057; x=1744835857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzEjXNkLNu9GbyJRrsPm3OGWMuRzZZwPEzkpfwqOZVo=;
        b=o38f0HJ9noc9l6RjkKosd0BQH1mEPN++guDRvV0/7rgjiLr6XctEJhJ66VoNsojcBZ
         rfB+lQEhxmd6eTTxutMzWUaXR/DNNsoaN8YGwsFDvkwoyhQcVbTmDAdOL3OXK+QFtZl7
         aDXIO7vtFQlGBP7lMYDUbE4k64AyuPvT4BdcH5roAXI0O8gZ4AEUt+QcD5xRzrMrDpcM
         tLbG68GRPzsFYLT3uDaR5P3MRW3y5/5BKhsrDqppnGeG4HQM26doLIsgvcTL7lxMukRG
         LuUR/QWKFEJ0W42MXNxdK5ZMD+kcoz9nwm2UPXgamxRO4qgfox6WyJyKSm//OEsDHRob
         2MsA==
X-Forwarded-Encrypted: i=1; AJvYcCVRns+lpL5CEO+t7gXXtKOXWJSrjwlFkP+IyiOuLp7zES2k0KY/MI4WMb3q4q2SuQzBc8dB7Oaix8I6lgtBhZBuLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywBpm7DMSSwE5RszqqJ589age5Y8wmzbKzdNFn5/UAKmlwpiLf
	CnPTbolAmQWStjKHjm9+zPELyn4uxgRQdIcn6JJeawATnrfCSfaB/2qHME+l7Ic=
X-Gm-Gg: ASbGncvhMNR0Ji+OUfIPpnQKNxUFlklNn5O8+f1z8mv4vcQlcYvUr9tlZf3Ih60QFhi
	sAwhqMF1X/Xq3ZcEy8x09fb9istm0w/8r5Rs2iJqNJCj+gG8Lc4udhR5wWviJQioXe/QV1OfyzS
	5lcaX6f9Q/YFjHE56GtpaMbMr3OmhlFarTxt5ZemS8hUALt7hTzL2U2u2JKzbKxeD0CXn3duL+h
	jWWreJhPssHoqBkotZPsNktGHVjzwXKY5yDjQBdt1eopxxWkM9PGlL6PkRCGy0iEiv20dpiPJNr
	TZMEzwr27x2+iuYAh5L09NeHd7hN/UEzQehgOYGWe+1bY4PSZLA2CK83dFOlkZqGh1mmN5nDJWT
	Dysp3C33mnTrnk6qqVJgNqmS/Abw143ZGCA/QFA==
X-Google-Smtp-Source: AGHT+IGzaRFtKWEVWYdD0lu6CSjddwUa5mqgDytfA0O5AR616wmqNvg2sZQEFHwPTrDOE7dwUEpCcw==
X-Received: by 2002:a17:907:3d09:b0:ac7:edc4:3d42 with SMTP id a640c23a62f3a-acabd24cb8amr9037566b.24.1744231056790;
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:35 +0100
Subject: [PATCH v4 14/32] mfd: sec-i2c: s2dos05/s2mpu05: Use explicit
 regmap config and drop default
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-14-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, and
completely remove the generic regmap config as it becomes an orphan
again that shouldn't be used by any device.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
* squash two previously separate patches into this one (Krzysztof)
---
 drivers/mfd/sec-i2c.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index a107a9c1e760f90fcb59a9944b74e9a39a0d946c..81f90003eea2a40f2caaebb49fc9494b89370e7f 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,7 +61,7 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
+static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
@@ -120,6 +120,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -138,6 +143,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -156,12 +164,16 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.604.gff1f9ca942-goog

