Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF8248176
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670755; cv=none; b=Fd0WfBbmMwN+T+TrxNHawUfaIwm7xGMod7qqs+OqQoYihkEv1CmR52+ab5ZBCUONuXyBDOB9ZDh4n9LRQI0D3L4bCC0jEOsi5MlBfiQtRC8ejOsrgI0OplGUmqZHDwBXbtHA8S0LinZR6tSXD8YITFUrTriiMOia+NTYx+hmkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670755; c=relaxed/simple;
	bh=NTgWVUrUYjaObzH0fsi/8He5KrYlIX0x8gD4jTNG9uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpINbZ6wD8JVX84K/b4J1JShoVMLeV3xEGnG1sekBPeKtrZNt1PulKutpcD0PzIq2oHY/ERKkwtonx+GTnlVbBIQEzGO2bhrquGi1xNXLao9LEYtOH5Sb5EtVWKXfiQtrokKm4PpdghVvkWgKH334HHjbZm9WOfhYgW4tK8B2So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stMJ668h; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stMJ668h"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso1131654a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=stMJ668hBUruoNQosv6bNYKoCg/TQpJSc1KL1HVaA+7gGZzZy9V7BAqcAYRrX98pa1
         DjoPAdzaPb38J3N5dmgBHrCVMyhobkFcd8pzHPsUPFr6rawzuZNXFthreBDabhFXaRtD
         vbZLOx2JdHjRJC26mA7FV+TnOmlPxfrpBLyMPxv++KOTtlzI9TQfHwAFg4xQCD6CpVYk
         WdvchYKeNGCj7zelqouw6yU+hBFRJUFs63JoXB+9UyGjQsJvQyt8zYKlgy9fGS831WUu
         AtpXQOJJq8YhxdLVvWCxlffZJLVyB/kECYcaJerkSdsrxVuTdpcsU3/KN1pnC17Qbr7p
         8lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=peUfxuGIrrs9yWmXaSpdUrzh4/mtB/cNTz20S0cl69SwXw9uVqWj28W+ZAwqjf3j73
         SzlQisThSPqtRfpPCj03hSSfuI6IC8LP/b5IlXLLH1pIwMLUI6tAgRHs5SAsEMXes0yQ
         mXErBQdEWPzHs/5+FHw9Tr4AfIccocCE+3HdikK/Y1Qa1RGlfK+eWD/oIwbniiBq+GhU
         LAgbHJ37C8/wp9VIU2zJD+dGEYYeN4bK2MTx58UQdbhiqp+UT5IKcWkU67xmITzb9AT5
         FQSzsbxI9dNWZGQaP+r1IExiSYh6AuczmRFhIGKH7JX1dM6YfiKAMpp8opQao1F1+GwB
         AXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4kHsEgDY+84ESJ9uz+ZGjzUTJvzzlJYVWDU9nb01kUTnYlvyRg1vr3n+PWU8ovAvsLQGhxIPZRnvi7bA+b6GMeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJclIJAQOdffghNSV5D1IXf/KVK6UPB3MVlAN6PKBe1wsOPX8
	8h/FiLGHNaZNBnZJ8DkiqPKlAYVzXIr4LgsfyXC7vnXEjxzrm6J+be0scdsLIyY=
X-Gm-Gg: ASbGnctyXU//vlMDDOYj5BeuF/4a6aSmCPzqSQdgsv+rxYxy9z2s7oS2Y4nthoV4Wg6
	BKFm/5/A/rb/Czzv/8UKOxqFTVSAbSgBVc9EPYW/OI/iuFsmp3o2P1D6J/7h7qJO3NlLwufW76/
	6oP9gxM1xWLGajBDM01wjjv4i60hfkpbkh70ea/sjIf5HHC0HWPRqlBMat9lsYdEUu2lemVOLNo
	lSWCzRbk8iwTK0RMi68I9/7iLeP+JIWMSvaZ1bIiLde0THjV8WTBoVtgGSwuU6QkG4Xw968LWhc
	tnH5kmh2azxY+K83xdSUpv2teU/YUF5idNQgVCNycfKgA2d9hdZ5ut0SbZcCU5tNiIFD6IL7wXz
	xpVDn0DJAGa86zuF38sxt2oj5sZm8
X-Google-Smtp-Source: AGHT+IHqXiYq96qJtZ3yqV0dm+q8a7Y9OXDNzTpX/U8kjT+jFNIA0/WaLQE/aqJwj+78Op+QK5nrPQ==
X-Received: by 2002:a05:6402:3495:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5f04eacb1a8mr4769024a12.10.1743670748486;
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:05 +0100
Subject: [PATCH v3 13/32] mfd: sec: use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-13-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 1a6f14dda825adeaeee1a677459c7399c144d553..f4c606c5ee5a809a106b13e947464f35a926b199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -229,9 +229,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 966d116dd781ac6ab63453f641b2a68bba3945a9..a107a9c1e760f90fcb59a9944b74e9a39a0d946c 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -134,7 +134,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
@@ -166,12 +165,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892..9f0173c48b0c8186a2cdc1d2179db081ef2e09c4 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -487,18 +487,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.472.ge94155a9ec-goog

