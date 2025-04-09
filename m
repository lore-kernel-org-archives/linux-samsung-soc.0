Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F9219E9E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=u6kkl24Y7LjBemTWpL8sGQktLjqtBM9LI3/9KPUigP1ORBWKzbyIzk2FSur+YDfBva3isV/s3eEmy2imZ/3AiJcGHjNnzYSnR9zGFaEKL1f50OF3DQk40ir76iwBphJW9Iso8x7/NoAlatJCcjBWITAcGZQa+z5PH+f9k7Hhj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=3OWU4PadtGYnTOgmPw8gXiDUPGbaAd/UPB8FUmZS3tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCeI1Nrw0F9l7JF3HFyTv6Z3PKYxhV1wpmMH0sVKKWD7eXOTla/4FBS0ZrMjq3NNY4ewaEjX3efdlOOHBIBEp1p4jxAkw/k+/HMLJ2EfDyOe+sRoouwkBGKhBjBtSlp+XEYtqwqw5qYXnvfPVvv+4pYH76HrZpKN5MdrXNE/PAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ft4Jz9jb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ft4Jz9jb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2151188a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=Ft4Jz9jbMd1y08XA5sIYuyQpoPqAntACey9vUeLu+HxanYGg5jA/mMLzJ/F60Ch7oQ
         ekqCc+VOJWz6PFIpIedCa9OsZeQt3S7ZFeCNhIYoLGZe86yu/stCpTTBUMTcvYyHP+/Q
         2hTmIKTa2WwGDaqDmVyhPTJIpV0dRnsZRck1d+0Iq76t2LDdBQ2BHr9dlyDUZ6jslh+V
         R6NFBhcYaw/eXa9ZAjR+3sjCfNPjq+kjvf4g64pq9HKcMDJHPeOOFwjXm/TuRgfiX/h/
         Zr5UIpsqfshMA5sBwoLFtrV4ZXx7Ejy9gHJz3IdL/h5CAn+Zr5bPlh6iLfnWRvyfoSWe
         kXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=w1NCvWJ/4bBCDzIC2j7XZUaZ1TnexR54MMWY8TVkssn9SdzBd7hblxJVqW0gLc60db
         g+S033H42RggtHYkEATDD2ddGyzIftVqEUpmOGtg72lCmGhvXNdHD9CYql1GhaVrRk8O
         uuKwARVCXoxTNCmGkTurWmWSO3aNU+nlVIP1EJsQPcY7zAhlGkDll61hTS+07W8C1wmi
         43BbGblQmaLh+P/nesfYi2lGwJICp59WWHF6eQPHG4evABMXeIiOFQ4UWGbi4VoyMYq2
         A0pC+E0f/eY31rArN++nwNN8sYi2VE9auewF0cFUtI2uxJ1flCLZ0EMvCgNdJrF2ZjXC
         t5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWcr541NS6rQsxm10nLndVC0rEQQDmrmlzQSH+bvSbjiTqtHdfI+7xQOZXxLj7xKyYMDWiO9UVAzRG3+jEzg5kUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKxTSYBylug56iD/q2hmuHP/ZYUStJfkLh9X6Zg6u7GpBfA11
	A7xyXfFSqhYl77ePTeDwDnRdMZEeIeG9ywX8WbJuSJVBi4kPOLIxVOBXztXtxjo=
X-Gm-Gg: ASbGncuSmgC6UIOJhtUYhEAMNpiWyZZ+M/v1LawBi7P6Xj0MAeAfNM83HNXS8m3JL/y
	zzecwspXetEwITPIrvoAsBwM2/WnjOrUrrrZzUBfPSLqSYlSH8cyQQi2gBwFc1YFIlD0+1AQ27S
	CeHJnnWpFX1SeL3d8rpwDQqDE17XKlWcQWBnivmul39v3Vx1eXnjQpOkVcgwOYhS6iJ5mC4XgNq
	nEjxZlIWFpPv+VtXlMfkyNzR47q5Ptjm4o1D9EJ9yKoizzPjp+DEa6W4L8vy5+QtgyjHAEaGCqN
	GGXwKRe7/G90/Qvtf0R5ZeHqyFP+bBSMS7V3Py933WGHzVdPKMkaNiUwaSVZ0cG9rZJbnFw4T9z
	wEElty4fiiznSbhxOxM3tRNmKDTY=
X-Google-Smtp-Source: AGHT+IEEu5frM78xjaYtfvJpOfPA05D1eB7ySMJAK47y8ri2kTuUJkGDYBSO/DNVkH448CBSxwwKIQ==
X-Received: by 2002:a17:906:dc8d:b0:aca:b45a:7c85 with SMTP id a640c23a62f3a-acabd39ea82mr7993866b.19.1744231060332;
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:42 +0100
Subject: [PATCH v4 21/32] mfd: sec-common: Convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-21-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog

