Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4E30FC13
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966259; cv=none; b=sKI+WnlAoTdjFwD9aqxKVDUyRZ1BBATyX5RzuAUt9aLmoKvALiZ9F3LBC4jP+GuT9lbr2nSrmHKkvrzhPfJLTSSC6e8VdoWUjQfgEyEg3ju9JiIuRl6jNiBtFSQMbSU2Yo6NaBrCj+ZW4VftM7jIU9d/NHVwe0sbLTY6Ln6JUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966259; c=relaxed/simple;
	bh=H6IMjnPI8ZwYq64P5YA/CKhuGWLFID4mb3NAeF/Wkyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoEaiy4b7RaGmCnkh5DFtVdk0b78X8Hi/IXX7iSU582BxvXL3QyAjAu6HSvyOpmWgMIR55PGlk0wgyZb6cmnFI/z6HgePvfwGJ7r905MavZirip/QTZ5wBRN85gxI4ek0A8nHB5c5WCuouHtdaNAEGzAET6Osxjqdf6u1E93mY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZCbCOny; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZCbCOny"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7eff205947so493847466b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966256; x=1766571056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXjtVLazU4FisU7iYDrCs/cvEQo0Kb5lMS6lWuXDtFU=;
        b=ZZCbCOnyoob/cYwp4TjRRXMFpsBeO/8susIx1iu2K3LQO7UFhY/fyIMEdyzZzkE5xU
         VU9X651P/DEne1HlKkZQOqfkhgK35p3r07lOLDkSyVmI2WsdXB4W0WLj9XCBGLDsIxFr
         D02RrChZJr20pClz+h7E3bqNXSo3BCneelwF+Gtbt45JyiBC2QXdYVKaqxnxKnMAskY+
         eMhEao0N2TpJrbElvQ0yxZkn1k2ZiNPUQu8dqv+vWsvE8fq4qPwwrFpht+rtNjma14tI
         nfAmUYnvvYqsq3/amO/96wg/boz3t3abJUgn6RP2yT8Ir9xRNjG0ThD7R6KqB4QOUL5D
         Dj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966256; x=1766571056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXjtVLazU4FisU7iYDrCs/cvEQo0Kb5lMS6lWuXDtFU=;
        b=KNkRa1SA+dP2iLNwsTSrU1k2jOVYgT6DyR9+oAUfUUt8DJB+yV/wA2N3TiVROY6l0B
         GRIlOTM3UVGt2OqFPyfEDyQSQkwbEu7FLX8UEUBcW2DpnAUFikLVskcIFAVYK9CJHwAz
         ON66hPl21Qau3wjwEMA2LnjC7sXSdaF7Fs5GOJSBQT8UjDtZtKkJ4JiQfScrCIr94MoH
         uc7vCcGAI9UouQHnrrPzV1s+h+sWHgz5L0a6NpQZP0mgPEGOxtOxY3m+503FpYQg7yo3
         8T0KBGwVQCGLfEx22NwQt61ksUdXdEOC+gwJ3GkcIxNz4lLmcgDqanKzpKzzme1IDnxl
         RTQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ifvU1Z2fR727GVxYPkEPJNhhjwrD4RPkK0zpopHI/1Qyn6zm3MvBAqhNSZAgZVfWY6VmYMyEu7H4vdc7u9enWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJBZr6DdkDrILtImvU7/+3EvBYVWnFa5EGlzDwK7L7J4QQguN
	ULQYISSvip6SXQPz/pOdB6qnhWHhr3jhu4LFLrX8vX5bJfYiJwfWs4cwu1igUxYvqXM=
X-Gm-Gg: AY/fxX5eqMuxZpUMgGi2vPMt1Pa5z/JcNMg/vjwUfBhHAR+sSBweeQgN0KkuJP6YCIC
	OkfsL57SqWG+quBqHCs+O/tSwJmmGpZf3tjfbJ83hzXzvV0qrAwTMAukTf6yV3mqg8B/8BU3rAI
	5KbQR09QL9Lb6/7SYaZsxz3+vjoJ/BkFVSPodclne2ERQiFpjmVx8EzSnD5pOWp+9C/L8Ot9P7+
	nmC2kCzOeiXPwx1b5daXNShCsoh+z5B1Lqte0lb35NpEYr9bpBtmhLDOD4JUZXAtij8rjqDZqH3
	fyRtv3BTnu3pWodLGKapr2njb9OHEPWgsGAWJXSfL9TEx49hpM9Ndar6A1jQAtf5L50rA632Wp8
	7zCOdwFL3FExNnwQJOdXU6VtDo/o/YIYEu7StYRVZoLR2o9yATVGgVk7BnOEHc8hpdaFQSTrfV8
	7Bu/v/bbZ9qBbL3zEWI1FuHgr5r0868ZmSdnmTTYQsg0S54GQEy9dyD6xV+5HvJfFEvWBj6Sum9
	znXng==
X-Google-Smtp-Source: AGHT+IHyMM6etwDYB06WTSrwaBUmwLHwdFRBAH3MZ0Riio860UC6heeeZnSPn7h1ka6K1Zx6Y3HXtw==
X-Received: by 2002:a17:907:6d24:b0:b7a:1bde:1223 with SMTP id a640c23a62f3a-b7d23ad88e6mr1656378566b.64.1765966255551;
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 10:10:49 +0000
Subject: [PATCH RESEND v2 2/3] rtc: s5m: query platform device IRQ resource
 for alarm IRQ
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-s5m-alarm-v2-2-b7bff003e94c@linaro.org>
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

The core driver now exposes the alarm IRQ as a resource, so we can drop
the lookup from here to simplify the code and make adding support for
additional variants easier in this driver.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
2.52.0.351.gbe84eed79e-goog

