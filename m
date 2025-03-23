Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCCA1EB190
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769585; cv=none; b=WnNAqd6N+kKsDzzAg7CyCiwvw9uabkRaf8O/INcvs1wm/TvT9g10XaquuFqhKhJS1D408URS4aAZVn7Gqe8yLCnWoVLzKnVDbtFYNi69dfhhTfF2YD7/p2mmW2GAYOnb6gHHWPcATuHVRx1COLH0DKpizHMR7qZId5m8iPA2fG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769585; c=relaxed/simple;
	bh=/OXCrEd9LUPrpcKww+A0Kr+dM/K8OFFL8Z6qLEQS07c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tR9fHvESixf1pqQS5+DinCPF1BNLlQpbP84JcjGhyphxixvK9uvHz2qssdarExX0TWSmzKv6zLtgKoY3rjjFxOsA9G5Jx/92gIzHfJjrDr8HE+ld2NPvregihJuZw9FN5bqrhXc9g9FCnkpVTYxgfFaNCGMpoBykAOqtomU6pog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjTp/XUQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjTp/XUQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso5576648a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769578; x=1743374378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=FjTp/XUQBGfShXnTuX3CmHx6Ok4Dut8B0ibb0vSOCJNDotKOrZEqOLCTWulKfPQHMZ
         7hBe0vWxxKL+b3W85RBg4Y+aZAtHRK0VhQwukCv4lkIItO3e0FKC8hBNFTenmRTCJtKh
         iBPJ3q/PZv6i03YZku2cZpHUAp4bAY5M6UN2+2Rd/g0fbCWyLlDvXTELsHb5XNLPUNvy
         FrmYUCCX+qHaMXCut1EkE+K9pybz1E7KWJn6DDXDU3CrJkNtx1mob/HsKgZnYPOFTxEh
         jL8sXe1qYedjrbNwNBuWGJS+jXVyoKGwKq1b7bQk/W0FSLClmyE2lxT8bskJ1zyweLrW
         j9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769578; x=1743374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=AjIFmVeeOdZnoe7tR8eoy8Eis1IgBUaCrKBN0kcbKuT0yP0pTsWNe+syzGlwRzEFqn
         5lUuHEiE7jtXJWNAqCF1MpSveazSfpT7fOVpCCaW1h5t0KNhB25xSDJu/l81WTUuHHZD
         praiHTzWCXEZ2LRmk8y3+fUtdFN6t2k8FwWG19FfTmwFNOkFAIYQ4c3iZ/hTesMAbA6f
         fjeXaoSO6f25sQlyCB4qG49HN2x1AGp3gF54p9XnaFkT62CO8DNkxaNc9n0p5gdxSsrE
         zhCqFA4aGdv/cEVTAaQxbKphQ1vbF1b2f1iXA0BB4NvI3X2Iy3pQ8b9IyRZQWQYyT4O+
         E3tA==
X-Forwarded-Encrypted: i=1; AJvYcCVBQMNp61jdFDIps4gjRXTGJ2HW0L810N1JOZ/LPSBGJAbsz+jkiek07ylsVqb9lM550xVA800GSLU9vnQ/E0IfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCKVIOSuN1f4za11vCDjl2QlqOd/T5ARTOpdiwHgRK0reBNx0
	+PZgBC+PhozObnBJ6L/QoNADbvUujnZLNQrF/CQVNY/nAO6ZCHSSIs0kqXtdK4E=
X-Gm-Gg: ASbGncv23pepelZ6MMIDHm3QzGFoiP6tZwLmcAvpu/IWhS8F7pIhlFGg0+/lk6AkIfo
	e2EPNySVkDY5BK3QgZ4fQH0iEQtpy7mCUodlSgHytJmQy8caSZN6o3fz8rhDAzn7b+QADtUMYAG
	UncBEOe/xCBkubqa7tF3KsoItQD2EH9qBaYTjs5Kyq9nBmHDn7LMmx/HM+Z3D+GgH8xEtPiR3GW
	xiqwrMJdxuXT8yLy+GU3VduDROpcDy035OmGtY9TGZN7c3Ns2ad5r1D4E5n4ieTgfa70jko9qUu
	6MeMUl6hwfA8Y3j5YDilZvdCUyFNpCYCFE8yJ0GJrSw9bMVDGAlfDXyL7xidqNeGJ9YYH7bmptj
	7BIu4JkljaNfnMx/s2hFu6sPzOtXK
X-Google-Smtp-Source: AGHT+IGSiAkDAFqSZ3rMyd/nphhDlOTX1hDDy7CmBLGPyAROlgJin8tD1xxjQmFA6VfwByP2ficCYA==
X-Received: by 2002:a17:906:f5a3:b0:ac2:bb97:e56f with SMTP id a640c23a62f3a-ac3f2559a5emr850721866b.53.1742769577873;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:40 +0000
Subject: [PATCH 24/34] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-24-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
index 5ebc77d7edacbc1b7a3debb9069bb489109d57d7..77298e92642021679ea1eb95d338907fec098aea 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -23,16 +23,13 @@
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
@@ -44,53 +41,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
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
2.49.0.395.g12beb8f557-goog

