Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985143148C3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120848; cv=none; b=hGK7d6xNpLY28g9i7VKl2osGbnQFazuq6pqQbsjs6WJuuFGyYhzCUrkoxOx+O6UWaylF6fycv6k8wnu0IsiYXDvM7I7zUgiWi4Jv3EXAO4b5grS32WcRQMeyyHxtbGim8ktv5QgaaB9QHeXBx0Zn0PHnAZVAL1G2bSsVheFeQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120848; c=relaxed/simple;
	bh=yIx1/2/tttizwM9cUxKlUJvNvvJijTCkS/Ch+ARlNjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/nPmLx93uYm/JKIMZZuhgRrV57BOn6ZhmkjlsQ5KNnpN1pgqgvQYlrXcU7cBfW7TAP1wg+oEJs9Z/zaCFd01Hv76mRBFlMn5ocR7/ihCwt/+X5vje6MMi4RRwFJ0pWTMBOEsnzkAIQYlipCjQcA6CBa1aCoUcXf2WOlZakR8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=suCaNJe+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="suCaNJe+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735b89501fso162464566b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120845; x=1763725645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC2LO4E6Ag3mJVSI7KVkmGsqAOI0LYR1zjRab2wprm8=;
        b=suCaNJe+82sVqF5MUnUWTr+C8+0pyNnaRdrYcxM5tXfe47qj9GR5cv9OBZHavrbKh5
         V86qZQ085t69O5hybVksVdK5tPf24NSwyIJH2wcTdFG1SfjLSK9uTR5tlOc4bpEFN6UD
         Y9fcYYp0H3tfPm2WR42Unbw4l0ctMEhl/NzbMpAtWlI/NOyiQrkbRWScT2DwOg/lCuXz
         YD0OKyVLlme2La5TsAmnB1PmTSnYcUKpLOzX4q4xNGetiW6eXGBrApo/MEuLPuoBHEF2
         443W8Jr9pUdIYCCZwgqEJL6vp02+U5XMOtFh4bU2qkYP+OC2ab6/rBcEfNQrARQk+vQS
         Y1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120845; x=1763725645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GC2LO4E6Ag3mJVSI7KVkmGsqAOI0LYR1zjRab2wprm8=;
        b=XyLgUbFTCzzZbwmCDHPlOzno0w+YWMggQcggpxl/vZcj0SGJf0dcpbrstn+IXCI2mn
         tpJxptL7NfmUI8htGxWv6VaIZvsNrTApZ/B0myDhqvbzEU+0JRg5XXiKz246x4EN45D9
         mDKzyhGenxAHRtLV12cluPsm5jCVDKW6+CqaRWcR9aW6fGXLk/1jLJDRumx6YkpLkRqQ
         iEkTEFgiQxpAdd+sjaRFwMlxhnDFnOouL+ae8xYPagtWY3DfdQnYJ/PG1FpF3FYgCMyD
         9P3BIHHypDaT/wg/KRLjvkPcSvJa0bRM80wh4vt59UjXFgU/vrljh9RKXnBw/K6wjht9
         hWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTP/Uwstb7GkSzl/jjLVGL6hNcWTxvman7u/DtiEZIGgezEbRMar3HXsdcjQ+P1pvIInDP+5rd7wAzZJE7vOprLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtb3HpGdyyl14JTefcuURMimFnfBUBC7LFXq5nhIxkd5cQq2hX
	ir+j+r2b6StcCXdTWbwS/uCVksfdHNebx/WlEC/It0okw3wUOW8e1pZuQvCo68fhXCA=
X-Gm-Gg: ASbGnctOf1hgk8nhSShPqwA2ZwpPVXQQfz9xxj4E/rBXQkH80khEHKL6DEuPJITNzvH
	JeOvLKd6UB8RSGL9IZ230W+A+M+ySLszoBu6G4bjk1TikVhRjeXZFAZfhoAsCLP/n2wUiRLM2oX
	JyR/rh4Loh2S3Ken4pPwXWZAqxGjAUM0tpOoFElgOmXJIcMwEDDiQkPwt/tAhhyK67nJhvST9kf
	4fs6SCVanYOcNiP4s9/fnpsbt90SrCXIV45sJ+KJYu5yKhjkKKumgr6Ufd/8dGzCTlySFAsKL+0
	DVcRVBoPDFe+iVFsFZWWsZrUQUa2Cdh+WOjcCyDT29hMlBWxkRDCSKt5GFhAAjllItzUgmtvhZi
	ZZ0COGGOaHkCJMBBakB+iua+5yHBH8jhN5bFpb75C8/Aaaj/9VMVB7lKDfgpeUFEfidUNKQEqRR
	esnOlhoGiJe9fxC8sJsqMnXAoijvRuwEJ00TFPf58frwUSe+7nFZGBBsAqwO7OOrIZB/U=
X-Google-Smtp-Source: AGHT+IERx/gqNIuM/Dn5OIg4s10Il0uVrXiSyfX0ztaAPKunstiUftXQBuF4ITb25vKoBq+sjWueDA==
X-Received: by 2002:a17:907:3f97:b0:b73:36df:fe7 with SMTP id a640c23a62f3a-b7367829b93mr265910266b.28.1763120844913;
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:23 +0000
Subject: [PATCH 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-3-c9b3bebae65f@linaro.org>
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

This was used only to allow the s5m RTC driver to deal with the alarm
IRQ. That driver now uses a different approach to acquire that IRQ, and
::irq_data doesn't need to be kept around anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         |  5 +++--
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 10 ++--------
 include/linux/mfd/samsung/core.h |  1 -
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 77370db52a7ba81234136b29f85892f4b197f429..794c4e5398e7dd1a816aff9a6559a6c19fec75a5 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client)
 {
+	struct regmap_irq_chip_data *irq_data;
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
@@ -187,7 +188,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 
 	sec_pmic->pdata = pdata;
 
-	ret = sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic, &irq_data);
 	if (ret)
 		return ret;
 
@@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
+				   NULL, 0, regmap_irq_get_domain(irq_data));
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..c639180ea686f4308af3f872cb1d2209d201b2e7 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data);
 
 #endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c5c80b1ba104e6c5a55b442d2f10a8554201a961..05d4cc350a351d994e00ba08f5ce966d0d5c6a0b 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -253,7 +253,7 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 	.ack_base = S5M8767_REG_INT1,
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic)
+int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data)
 {
 	const struct regmap_irq_chip *sec_irq_chip;
 	int ret;
@@ -302,17 +302,11 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
-				       0, sec_irq_chip, &sec_pmic->irq_data);
+				       0, sec_irq_chip, irq_data);
 	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);
 
-	/*
-	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
-	 * so the interrupt number must be consistent.
-	 */
-	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) != S2MPS14_IRQ_RTCA0);
-
 	return 0;
 }
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index d785e101fe795a5d8f9cccf4ccc4232437e89416..c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -69,7 +69,6 @@ struct sec_pmic_dev {
 
 	int device_type;
 	int irq;
-	struct regmap_irq_chip_data *irq_data;
 };
 
 struct sec_platform_data {

-- 
2.52.0.rc1.455.g30608eb744-goog

