Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FCA3126AD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966259; cv=none; b=YKp+z7bpb/iFqpQUcqMKv73zkuSLO+h+w6KCstpY0Une5MQE5IgNy9bywFIsheaM/BFEJZkefKSnTrP0HRYM0cwdcysOnl8V4ts7EoupKjASXuc82ZMlQvCQ8OU4SfzkZLH8JdyT0qKzdLSTcg1BGvdQu0pOr67APbLK3m6huFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966259; c=relaxed/simple;
	bh=vZuZvZxOilgG99K1CCus8hp1iS1vINW92yTYPy99geM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXxtpZEKqizvDKCEurM08nV6hDlYYeqH5IX/eZlfWW4voKa+PEXgBMQBRVqDvcysG+nkjmdAXVUbSyNbvVmelm3tIMz3anHxLOQkCR5aNynGd/KbJVBw/gUXxpR8QSIia3KZ5XYnJB2JKIXehRTLXh/RFrf4lIxO/2r88FZrGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDgSdMod; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDgSdMod"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8018eba13cso11539866b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966256; x=1766571056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I1z9PKfucHgXypI2JVRh4FRyFEf87RZSzZ/ck7bvnU=;
        b=GDgSdModrJQ06yGljKGx3U0fvfEKJANanRqHohca8x8t48BuF4tk+OLH/+ShG6qZ15
         v+mTY1ujJKM0NRFUXJB1cLx5BRKyvlyX5QmRhrUuErgjShlLDEvogrEZsg+1WvaxXOTi
         07VO0T4qSBeHQc9NSdtUnUfXRaz2kpnq871G2quR26UbzPAUVikeLznHpalbJY8Afj/Y
         pbl6zqG2TEzNJnLzzAJd/3PQszTXCbtxFcBPtIC3Sl7kBfjA6Orh44ZhabINQtx8PHQ8
         j722uSOqpN6R2DJoQmQ8MvzhtK0VFt2gAPJFsVOIj4+WhChlnS/GRcSswpLQYvNfjnvI
         GH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966256; x=1766571056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I1z9PKfucHgXypI2JVRh4FRyFEf87RZSzZ/ck7bvnU=;
        b=W2AW0NuA1xkDPA+8RVlQzPnl0cJ3GXSwxHf/Ebhm7LlPmmtZ8VnTJVQCvw8M2n+TLK
         3fLmf2yUNRvL0yaDLMFvrvsbv/EqvwYmB7ikJ7VXPFhmGFX5+rNqbF88ltMKdxdLtA6u
         XQEl90AuKwtfbJSUSbRvZsE6e+kC8db1XyAnRDgJPz2bnlZ/XCxxlqC1mX97nR/T5yjf
         lxIpMzr6tbFT81HPqd15YC6SfchQUsIDfbrbI6Ynw4X0Uytgd4wDWAYAbYeW/649AVhT
         jKDA0pK4XmhyXZUKqHonp9sJnPMgoeLHaan2v6fyaSgt12+OSqMYB2I1266sw6fXbdc1
         Ye1g==
X-Forwarded-Encrypted: i=1; AJvYcCVLwvRgeJlbowdDHsKmq/8JOKDskJkM8Qn5tVAXxgaQkq0qSUXaYtQn6f2pB84PZLUZ7vd9Ca1vPkTv7p2fMBhR/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn6U99iztyZFB5PRiMf+5GVJUHUwEC8lkgz87ytRkOLFlrfzXL
	KLoaRNmPBCx2K/s2CrEKLxOP3tkOo990dseSsycgxoqQ9s1f0nbJKKZFlEBkgPBH7os=
X-Gm-Gg: AY/fxX4e9v4ePQ8qtmD7oTCHt6XxirSPKpCZUQkN8wsQl3jWVShwX22wqGs8e7Yytc/
	I4uh2d96CFm5yFXJoDF6aRzkmsv+Czm209kvz7p8/g7guDwiT+bqYD6iFknThkd9ZoA6ZEYYkFi
	oeMIzYNv2Urt3jY8VoVcGqnF2FUARFghP6oTOS9PezeYJur4ky+PvedFvJlXszvNiIBq6Ef9DUX
	Udj6Ch01HbuEuXJbSSGzeFO3QJIx0vL7OXYryClnMS/GY4aR/ZaxpQozAjk6vRawHTlSDdmkM7E
	yeslQvjOnIL0tyB6jphuJ7ewpE8t74T4Bm11dUOvyzImrJwsbm45zTN22lY7FerCDlC09aaKokl
	IUS7kiSgLfTJr9xWhrNt2Fc5tidlWR6n8QRrZg9z/ZIvX90K6ptf995egV0n3Fkejha5VB2dmhA
	brkEGAoQDrvIbLsdGc8GlPBmqAptOrZ3S1UdtEX2+1v+WPWow5qNeHUvgtmn7s9bhU5r+Nt93Oh
	GeozA==
X-Google-Smtp-Source: AGHT+IEw9OR6970NlwrrVo2N5ViWtBVHSFhvWHB7PcDIt2dJr50vikuCJE35Z5BDLGoFltIUs/2JMQ==
X-Received: by 2002:a17:907:9282:b0:b79:f4e4:b544 with SMTP id a640c23a62f3a-b7d236c0376mr1941191166b.21.1765966255102;
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 10:10:48 +0000
Subject: [PATCH RESEND v2 1/3] mfd: sec: add rtc alarm IRQ as platform
 device resource
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-s5m-alarm-v2-1-b7bff003e94c@linaro.org>
References: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
In-Reply-To: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
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
2.52.0.351.gbe84eed79e-goog

