Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F724BBE3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670761; cv=none; b=L1yHSYFrrSUeq1SoluZaasLWjvALCkr57Ukd98HdBgNepGFmcA/0F6p+73NiYaQsOx4I7V9PgSbXAogiUImtZ2vtNxdSSPskWPWV4McO8OOQGfpfveQOcIhHAhKQ/5qOuuM8Dbt95mCGFcPCES6IpScqV/VbE/Oobj0YQxRK/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670761; c=relaxed/simple;
	bh=uZPaCVbPHBGfSgOGE/h2z8oZIqJdXRNHkC3wOcm11eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSwJf2WBZcnyZJQTxgb5Gb1SZXA44gWlGGlOl9o8dZ2U5LPlo8V1wxOkz79s32KF3CzsS0yCU/eUc/UkA0hxUs0Is0IoURtUYlBUa5qpcvaFoRcEuNu2o+CsBv2qV3s4bL6jHBkJCA7/eSkH5WnleOCvixfarvZ8E5n434b/myc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5DHmoiO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5DHmoiO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac345bd8e13so108742366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=r5DHmoiODxaHsy2jUz9U6uGinpNsTG8t7Rgx05pLFXLsh1Vr5scyqvahIQXq9i776e
         h+v0ITFLa9aNuN03UKLIF6Jlq9A7/AHbxUlKN4UyNHV3DimYKzdd9I/StgLnRjbJDj6P
         rnbrMTpFM0ecFIHTtj5E+A+E8ANw3BynCMNDJtoKhQqxVIMgAKbAO5lEkNf0tv/3WeYl
         950Um8azpVGsFWTSJA44Y8yDZ8Bj+q4Lxt/839vNZ4XXYJKaMvhgAGhsI9FVri9eKE0o
         YIVo7OAKu5AWKKTfbuqUqenu0E+pwq+8fIjnUzM7WqR1gh3qYSAO4p3uuDgshPaQ0RRh
         W6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=TBSAVkeO/4X1wk0EfPI0sBAQmJI3hwt1QjjNPm7o5JEVhnUYaY5ITAvLFCE/Mz2Z6X
         eLtPDRhj+H+edh1JQQioOGDfqseivVQnlSoDs/9JIcsqQNiOrb8H7S9hhbNek1ywCyH+
         S60+QJzIVZ8LrGySOwuwcubrnbrGzb6QgnbdZm+2jiKeBRRrYHHEH7yTOJ03M4W036Of
         06a8XmcmWBz5Fwl8AlNQsrevnkMXNW5f/rruOwq9lVG9rUxMwWif+WNsLA5vzosTZnBY
         5uXiUgLxrKTl7cwd18tzxbxkaPs1anCbkRka1DclS21CYj3Tehr/UNq0/yZD8zNBYBzY
         EOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEwsUwCgyY4qvlSc9RGiZ8nT7jEr+qcihA17FXt2WP3xhUeLfvgLkMIDphpE7VCxYAvxh/Ti3PFX7Ae879/cVmPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmxmqI/SFEZoL9Czhh/B81FK+b5r1zvLrY7XxyjzDTNSCsrBc
	1JnraqsgeRfrYZ7fEge7phpGvYR/uTTYPGL5kF8EvimdQhG5ZvQ7d6O+pma9dPE=
X-Gm-Gg: ASbGncu5v86pKY6XHfc4MnYhS4r0VHKugGicfkS2pDcrjKUoOP6tXhcQr/DeK80V+WS
	YfL1FtRpXKP1pFHgSegHMMNKkVZM4ijM8tXtmeLPa857rVZklwKuhHPDx9NICWb9kK2UwWLUwGk
	OeLfRrf0wDItm2zgK19iaMFLWmnl4/JqdyC15smejDgRRHI2ONNohk23BYGV/I6E0V5A+rWkWt2
	syof2Jse9A894LvCI8MCvNlWNgHrG6/NO/1wPl6mNPbxf5oxeHSna8UjmZ/616tFaqW6DIHurAb
	vd40sqNiyTW40MSmAMkQiXskUJPuqrHQGo+XWK4NdyMf5+gxp6Q1qLGvIIHDqpIJjybxC7PWUdS
	grX99apJfinkdbRRiKrdt+L0kgR9x
X-Google-Smtp-Source: AGHT+IFRyOdwPcEz80NSYeNSO9OIEAqrNZz0SsyzqP2x0gvOEZiZralRMKMAb8SO2ti+oPAesT2BCw==
X-Received: by 2002:a17:907:cc1a:b0:ac7:c59e:fc3e with SMTP id a640c23a62f3a-ac7c59efdf6mr46064366b.25.1743670753150;
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:13 +0100
Subject: [PATCH v3 21/32] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-21-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.472.ge94155a9ec-goog

