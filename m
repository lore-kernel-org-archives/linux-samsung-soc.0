Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A623E2FF659
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120848; cv=none; b=raF1n+xZ5Y2LREICJdQ4r7eXIvwOZkwH3M6j7WDiCeOrP69QuV/QMyxgCXafnb3GIB9NxYMWSyzOwjm1/ed/dwpM+5qqkrcAdYdDVw04fYzdI4plkgRGyE83WckbtVVOWMNVmXvtE7ArATGbNXGxDQosTdPkm68iDb+dFprJnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120848; c=relaxed/simple;
	bh=1kTUYewu4Qf6eaZM79yswFLJrKWEOAk1UN22HB6JO80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTdaGRYopxH5bofwZ1O2rH1N/bSyr7eqK9gxI0KYSQ3a8tYWb64B9BFgc+zmxEVtUs45j1YmrP6nMJUYUMvHvacUylkt2p8PSqCHng4sUzao+4RTx2Xbmkugx3L+Pu1hGuVVoQqCqYiaCesP4Qiyn57zExx3uxsKHtzRstbpZgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1fk0Mxn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1fk0Mxn"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so3359967a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120844; x=1763725644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=G1fk0MxnWo5OkVA15w5p/tW556BXP34u2WNmwRlPT4DJ7deVFTtLx+jIvSNZMNOIbS
         9uwAdME1Qqis7RN6BWzamP+SfBAnk+/DBY6CB23zvUIf8hqbJUDrzABbFaBrJ5Nvbfjo
         yO/ItxBqGUbC4pT0Rzc5hD2Y47s4KEekkFRiCwya1GIvd/xAFJn001Gb/S7M6ZkkQ/mv
         uytE9vstug57+pQrRZ/id9RXXkHhhNGEszcai1zjKi7m8PnCmEmoAgN91Tc4MiWvI1H6
         yQoSyI8EJJnbpbNLZo7LGjej0P20wZCkEOhjecbWp/XB1dsZdK/RfC+HrNyp4gUVt+a/
         g/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120844; x=1763725644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=M2unYHtH3mHqYp+SOshMRSO0Cx+PuxVCtA/Nzdn/QBVV+7jSOdRht2u4xg7wXhin9B
         Fju+wdOhYPKFFBEk8T9K3RBGJQS+df3Ru90t01oY33xGjGvKL+RmP59Y68BjwwpltBZo
         ZytQsUvZ00Rc6/PZgB/SalwFpdTRberh12Hqa9C6dN9Dg0BNCJbgBh5iPmLexaYgR4cr
         l+ZNJ2vRIuRlE6DTaG1u8aeGFNJnVl2QCViSKcfa1pUkjJtRHChShOxhkgWxFZiBHGLl
         Ehn7RyCtztXnyVIOmzal8jYLYpGs/fbj/41twuPV5QEJOV1/JQc7WzMGh68wyvDvpUFG
         Q5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIM2+QcztUIAkpVr1QsIxEbrI/+mBaZbPRTlQWdIkTPjuOk/YLEhk9Z6eEot7aGpDPvTV4u9EAR1Mj3FbW0kVQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRPbbzzDBPD+Dk3teMjn1XLukQmW6+KBIlh4ICdSTtHGTTcyI
	HT+e9FdRDBTNSeGu48HdPdZVaM0ydvroErHMZ5W2Lwq6DKp8J9N4H4vVMIGyPDN+gVn+IBJ/guG
	RcvSTuOE=
X-Gm-Gg: ASbGncsHCQTKA6UcJRWhMLmkcj1qhJ/y9mwwQqR6FOSqzVepjrccK9seeLppvZIW414
	Os9c65kOMz0Kykv1Q8o5VKq1WD0QNQiDVFpbScFeW+uN9luQUqYdmLZ5EeVTvHfGrAI8Em/XGtS
	s5mhl4ShRUpeecveNNdTd3XGxeRtLz2DtpZiyqsQ8ci5sRI4RrqioV5qDAFHTDzuEkcNdLgoInU
	x5OB8z3FAPt7dvuqyhyW2UXUkQwyE75UeK8wUuxHcbi+dwQsIdKEZZ5a8MQVU8gVAr2vXNW6CXR
	cXGxOD1bl1ZTSfvf3FDcd37SHSQB0EkfxqXYkZZCiAkOXzklbplPMycB56Jd3w526fHXPh+x/CY
	y9USyiiXK/M/TXt3qGyCtSHoQEFWGLCHUQjlsMOtWkQ91ohjilBD9wylr3ZoK7xbtLMA6Hzlnp5
	DWjENt+nWFAD3mZVYLOD4vRIl8gzEZN6L2mxlPIB1ewaNGuscOsVLWrHjA6NCCeYBQl43E8FCYP
	vKvtw==
X-Google-Smtp-Source: AGHT+IFJrb5t+LjIPBx5pG10Xi0I9odWXxiMcRtHD1RF7OmqbxPtCtyv5Q78m29q5m+XfKIs1IpaPg==
X-Received: by 2002:a17:907:f818:b0:b72:5bdf:6074 with SMTP id a640c23a62f3a-b736780d4ebmr219404666b.20.1763120843860;
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:21 +0000
Subject: [PATCH 1/3] mfd: sec: add rtc alarm IRQ as platform device
 resource
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-1-c9b3bebae65f@linaro.org>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
In-Reply-To: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

By adding the RTC alarm IRQ to the MFD cell as a resource, the child
driver (rtc) can simply query that IRQ, instead of having a lookup
table itself.

This change therefore allows the child driver to be simplified with
regards to determining the alarm IRQ.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..77370db52a7ba81234136b29f85892f4b197f429 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -23,9 +23,13 @@
 #include <linux/regmap.h>
 #include "sec-core.h"
 
+static const struct resource s5m8767_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S5M8767_IRQ_RTCA1, "alarm"),
+};
+
 static const struct mfd_cell s5m8767_devs[] = {
 	MFD_CELL_NAME("s5m8767-pmic"),
-	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_RES("s5m-rtc", s5m8767_rtc_resources),
 	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
@@ -33,50 +37,66 @@ static const struct mfd_cell s2dos05_devs[] = {
 	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
+static const struct resource s2mpg10_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPG10_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
 	MFD_CELL_NAME("s2mpg10-regulator"),
-	MFD_CELL_NAME("s2mpg10-rtc"),
+	MFD_CELL_RES("s2mpg10-rtc", s2mpg10_rtc_resources),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
 };
 
+static const struct resource s2mps11_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPS11_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	MFD_CELL_NAME("s2mps11-regulator"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps11_rtc_resources),
 	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
+static const struct resource s2mps14_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPS14_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mps13_devs[] = {
 	MFD_CELL_NAME("s2mps13-regulator"),
-	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_RES("s2mps13-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
 	MFD_CELL_NAME("s2mps14-regulator"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
 	MFD_CELL_NAME("s2mps15-regulator"),
-	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_RES("s2mps15-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
 	MFD_CELL_NAME("s2mpa01-pmic"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps14_rtc_resources),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
 	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
+static const struct resource s2mpu05_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPU05_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mpu05_devs[] = {
 	MFD_CELL_NAME("s2mpu05-regulator"),
-	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_RES("s2mps15-rtc", s2mpu05_rtc_resources),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
@@ -220,7 +240,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, NULL);
+				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
 	if (ret)
 		return ret;
 

-- 
2.52.0.rc1.455.g30608eb744-goog

