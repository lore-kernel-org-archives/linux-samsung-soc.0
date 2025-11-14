Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFD73128AB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120848; cv=none; b=lvynKzeffjaQY01wP1LoAQNm8YwbEpIkq09gblPsMSLNvcklqEzoudXeyrSEXohcpKXgWSjE7qzZHWOPZ0mHFO1zjxH80c/xcWeH2pGjwzzchDyPkptiEWTAdTfApHkWPuPrHqD+79Oi2tXVeoB7sUnvlLCn7Aa+80WwUXSAZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120848; c=relaxed/simple;
	bh=epAZ4I9cYfPQx/rUTryoD/OTj8bRWME5BL2aIftN33w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDCxFlXVxLk2YF8uJ+GpeylTjj3JK3KikI5B8z+nJ5h3imazW74rn7uf4fKXuMiyOXpHDupHI34g2sEZWvoxoUzD9DaAdIzvV1FuvmWwmfBTN0wgURZ++nVTamszf7gR4mTuOwZ/vy0SLtKnZC84u2AhwMlj3fDEqA06SmLOkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pW0YhpL1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pW0YhpL1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so3071290a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120844; x=1763725644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6vZLQTlhnGkC3V5b/JVRIOiHJLrOs5aXHUloOcvWJw=;
        b=pW0YhpL103/o2GR7CS0MMNel2ctMES/eyIabp0I/4ngyH2tOPc0tBJs0mpb8whmDg4
         sCFtij8SYc4Lkyw1MTCYGwl8jlqeZd4G9V78tPO2MCOIXyuD3sZwfLtVVy944OPSdLl+
         a2sFpgnHrOaG8623gqvl2UbnWfTU/F/SzZbdd0hgCWwg3f9tTkywBrGS2TMTgJp1TLSD
         Fot05zonij7pfQDPU/DC07WBoceHj4TunKNL5AnRcf1ielK4g9CpBuyh7u5z8wZ0t+Nc
         2Tb/9iDGgN9W8t7nYM2uBH4K0Dx//97sQauRpwVyLGSXXP3nv6MRIvRoqtgp8Fh00A+B
         vwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120844; x=1763725644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6vZLQTlhnGkC3V5b/JVRIOiHJLrOs5aXHUloOcvWJw=;
        b=TkgtaVBwbyr9sX+cdSM4gp8gqhgu4UY1JkmLSsmPN7IhjUU949hXD2Yj0mBs/nXkQ/
         DlTPPUu68rMAcHUSn9krTcK5lWf05dLgJ1X0kdj/rvmeZpyPJIq/4eW3CwAL+gP4gDNL
         Pg7HB/+rHgUkhd+k8pFp75CvLVJA40DxQiCuJdPAYyD+CjjiuSE2xIvBSkHFBGOKPsnu
         iEluMcKs2twDxidn6uVdaX1OHo0LvSooRhftXRRj/U4cZaD7wTFw1HLE/Q8lCabYk/fp
         dXQ+9sTgfEKIcSwaJi63TnT0jm+rQG4PbvMXSxlLy0JIzr2o21kO41L/+N30b9J6upgl
         v5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU2W5OuFcGrWzYLSdcR+We2+qp4VB9R7lDe3N/uP/RjXzrF1NJWIbmMU4Twa0ZIXdwtoKB7F0L4K3AbQ83IoOPeGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3p7PZ9BDKu0wT+qHOSGZNu3sNu/pYkOHr5mSHmdTA21upfEs
	WzF6s8QHcp76/pe3qql4nApzqOFP2psx3qvH2Ft3nIxUzbBPjTrjlL39qqXTaPkQv4Q=
X-Gm-Gg: ASbGncuTpy8sKHzYr+ORr1e+PWSi8wpZAaBv5HsNBeGxHdyZEixdL7ZB71bv8yra5k5
	fuxEbBrqZ+gG+MoXosxbg9LCT8qzZpFtmzNU5G2ZFCPRYiWca4a6yoZ4lMZOFD54RgI/1auOWyb
	LGnS+u5SOmf+TRhG74fOSKEVR4u3M2Qv17LtUJMEslZwWRGBUQ9pSYv0BZHrV72dIi/0RwnwNV7
	1I7p7RmH1chS2tD5dmCMJhrHciP3s8lISG+UHe4f6QfyYCpOAgJqirGDwnSTCIsCyxawdt2YOkX
	NEXJ8WkN1dYf+ex8Kzzk6s508QXDhAQXKwho4erKzv7zQSvlDh7DOkdUaczG+CP/jFc8SJ9aNLT
	R6/1qWXeYQ1KI62UG1ag6myHzHzFXQRMzNWBNmxavzhZ4HSv8ZPtfFnjKY0/Pl3/rfOu3sbX13c
	/nlBeTZYXp4w0YN0cEP0FnfPMfrM/Lh/rBB1KxsmoTBKVZjBNvgWoqfHWM+RfgQ3LOgKqS+TJsI
	9xXVA==
X-Google-Smtp-Source: AGHT+IGWfcAafPJXf+nOG04FI28a638seYLqw5MKkweFunN5D3tFLgI80+YDjWlRRIldJ7pB8qo+LA==
X-Received: by 2002:a17:907:1c82:b0:b73:4006:1884 with SMTP id a640c23a62f3a-b7367b8d999mr301251266b.37.1763120844396;
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:22 +0000
Subject: [PATCH 2/3] rtc: s5m: query platform device IRQ resource for alarm
 IRQ
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-2-c9b3bebae65f@linaro.org>
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

The core driver now exposes the alarm IRQ as a resource, so we can drop
the lookup from here to simplify the code and make adding support for
additional variants easier in this driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index a7220b4d0e8dd35786b060e2a4106e2a39fe743f..c6ed5a4ca8a0e4554b1c88c879b01fc384735007 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -15,7 +15,6 @@
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/samsung/core.h>
-#include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/rtc.h>
 #include <linux/mfd/samsung/s2mps14.h>
 
@@ -683,22 +682,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		case S2MPS15X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps15_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S2MPS14X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps14_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S2MPS13X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps13_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S5M8767X:
 			regmap_cfg = &s5m_rtc_regmap_config;
 			info->regs = &s5m_rtc_regs;
-			alarm_irq = S5M8767_IRQ_RTCA1;
 			break;
 		default:
 			return dev_err_probe(&pdev->dev, -ENODEV,
@@ -719,7 +714,6 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 					     "Failed to allocate regmap\n");
 	} else if (device_type == S2MPG10) {
 		info->regs = &s2mpg10_rtc_regs;
-		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %d\n",
@@ -730,13 +724,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	info->s5m87xx = s5m87xx;
 	info->device_type = device_type;
 
-	if (s5m87xx->irq_data) {
-		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
-		if (info->irq <= 0)
-			return dev_err_probe(&pdev->dev, -EINVAL,
-					     "Failed to get virtual IRQ %d\n",
-					     alarm_irq);
-	}
+	alarm_irq = platform_get_irq_byname_optional(pdev, "alarm");
+	if (alarm_irq > 0)
+		info->irq = alarm_irq;
+	else if (alarm_irq == -ENXIO)
+		info->irq = 0;
+	else
+		return dev_err_probe(&pdev->dev, alarm_irq ? : -EINVAL,
+				     "IRQ 'alarm' not found\n");
 
 	platform_set_drvdata(pdev, info);
 

-- 
2.52.0.rc1.455.g30608eb744-goog

