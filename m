Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B628CF49
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649489; cv=none; b=jXBwBeMbERhRSrzo0iIlGV7eV6CMcH8aFe4d12n3jfK8KbX1IoGqDQn42g23vWjdwxldV66eDxiL0DwSsA+OdWTjw3n6BMU3oNpXm493d5VsSpTY4DpEWQxR6NcbnR8FCWRQamQaSXorUs8WpHzYNeqCJw/ID6DCzHK99xLjryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649489; c=relaxed/simple;
	bh=T7NQcuSTK0Wgag7FnGB316ybnPYMXfKzLolu3Rg73KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7s2oN1476dRd/bfeLoJAyWnC/dGUhMGXP0Qa9sO3oHfMGM4uYNqXycEoYAl5nmTGqKv/mcvjmGn0aE9g3/QuTyqMrqzXCNPjhpgSkqTLbvFU52fSkfE2Tic3jT6i3O9nhhKBV7zcE7ygSZkEk1PNTvmYv/2i36ti93fKIDP/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM7IpI3i; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM7IpI3i"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so1615137a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKVEwuNeEzYnlKtvmByCf7hR27qjuXrjbBMyGBFxDEU=;
        b=tM7IpI3iTc8e9VR6PlwXY7laJoWAGUkNUUFTnOJA7ksqJ8EyAME0R63q0Ky0YSUb1j
         ttI8hYCOwZx4TP45CaV65CwRuVMtEETgnrUwY8RY+o/jSimtkx+Hu0TuSlME9ZWKVf1M
         bNiG+Kye4mxWEmeu6g/48nzAassEJMX6MqGpLM5heL7PXfOXjzlSWrKgpvLKnCf7Fbky
         DlIRNHZ6cEdRg7AxgbgBnqLnUXfwPd5AtlrYhSUUfq9CQMvEUTNp7K1dWhr69oMIqDZ9
         GpoEteAQVbtxDa7zXSJdCgACeXyEG1u+uNq+wXFBKTd0sIblngj+CO+a+1RNjGvRzKKs
         I0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKVEwuNeEzYnlKtvmByCf7hR27qjuXrjbBMyGBFxDEU=;
        b=uvTxqCTT0uwECVVLSBl4+6RykAVuCSyhCaotYWWGDAUymQW+u7i5RNrewlB/SjIWxM
         MHM2YsGyEWESpjKELLMGQ0UvH1cb3k5zLk5+p6eFG7c2/DBdvom1/vNpB/j1O291YJVB
         nqgJLYJDsGx8gqwgxEIM1sWaZw07Swo6C45TY7Sky8Tx+oOkgosJkvuUcOsbQpAmzolp
         60QK2vflJ90CB7qDNTEP3B0ZtMI3M6AMuXLPWqh5GfMaycsOi7czHggTg7+AKtnUj3zS
         jhh25aVXVtfl9A2jsw8rTkFVzSg2Gn9+NtRWkPCmJay+Q2dYm5kAkfngs+SeuLJYfL71
         M0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2yCeum8Mg21hAbgmFa/9U0BKdebkR2nSL5MBKcBOfEzs6rqNbjQ0meXpJC+WQYIzTv9/c6Fjma/b+Ze+jqVqHxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysnGb7yd1OobMIk32wvLBHJXiPQbUtBZ8xPDnj0xnsWqeyL9FD
	QzWkQLM5j5vXuQBmuWjTw8z3Zcjr7YDaEji6h9K1DaDGBmLeheVleOxR8lqB6dXnNgS2sGp0G/P
	U3YRfAQc=
X-Gm-Gg: ASbGnct8DObRN5+EZAH8JmoLZR1xHxqhiCqxM2KBTTJOqWMwDYefx/mqyzXcd4d+VQT
	mDLKiPw6lXv010cF4uq/DRTiwLgBy0PEs7tWb8nMzXFvQj5CykzVLXCpCK0hxv93exiq5scB9kX
	8wAhD1tiqKcMjuUuIg2AWKcUVp8uMv+JG6yO7U02tC8T6r60LYYunSqPkIouWU5w/NFQqY2hDgx
	akZtm9gwiommOB4hqMd+6tlLtINVqvVniGWqH5zbn1t8/RhTcyJiqhf1ShC1G3MD3Y9vBjFCEwq
	rNJcaZQYusIs/ywgEKNriCMaOrEwm3PcWtHnFy/58SxDj6k7c3mcW9bVNI+AvQ/KjFXwRjDe5zi
	+zVZpqbJk72BUWc4FIOiNnBh6Wat1MGBKYFk4Qkrt6JnsLQ09PMBuqrKEDMac1tHSAfbrITTulV
	yoZ3nsT//6r9l3KzTbtDN3fIec3pvNUu/tomBtx5li02OsT/AaBArkPYXDax9clcIdIk7vQ0JYk
	iQKuw==
X-Google-Smtp-Source: AGHT+IGNU5sr6+plfXZt3ru5qeOfPaQbRzm/Ldfsyxj62YchoQXmawCsQ5xOWRL1NW15aw9u6Zb1PQ==
X-Received: by 2002:a17:906:c103:b0:b76:3a86:bccc with SMTP id a640c23a62f3a-b7654d8cfefmr397361066b.2.1763649486145;
        Thu, 20 Nov 2025 06:38:06 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 20 Nov 2025 14:38:05 +0000
Subject: [PATCH v2 2/3] rtc: s5m: query platform device IRQ resource for
 alarm IRQ
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-s5m-alarm-v2-2-cc15f0e32161@linaro.org>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
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
2.52.0.rc1.455.g30608eb744-goog

