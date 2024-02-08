Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963767EEEB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707409290; cv=none; b=PxzfJkG6eFGTjwLzTTUpre8WvK/AEpCHou935vDw2zYpPdZlXdNb03ER39sTO5/KRSUpQAI/GiDFHaSc7pJB9PAdbjCBdT/ZbzIddGd7VT0l72hHCdEE3/5F9WlgJgxkpcdRrPffQDaXE7wQ60KQaExS5FAcN4TjS7ojOr8Mdnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707409290; c=relaxed/simple;
	bh=4BFXoEKq0dKkvxzn8sylQVAACo62MxLym87l7SMkOww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhnWEu5fwjwyuBubavP+zy9iz41ivuVPynHIP8zyWVSAg6+GSuc4wrNGjogvZpPvYraXmLFBzDmo1UMBTPoxYY2kY4g69oKlROEjzgCiNAMsA6wFcXmnepmYlNprAW6Lc5DlAOPKC+yIdbRKynEk+d0xINCBiklMXJwPFPUC++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7XS626l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7XS626l"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41047386d18so416135e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707409287; x=1708014087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxb698xf8QkMydB4z0YB9c3r/9JegaMn6kB+mk5+8LA=;
        b=J7XS626lTjGcri5LhjN1kT1BMZlUZlBR1M7U5MFL5DKLmZOlsVtiS1sKRFyIMDkvkh
         Oa5Sms0tfWuLQ1M1q3YR/q/qHvqUE6MHApSzfOKXUMib2VGWhdTiSwBEmE+4I9LcdXEB
         N8V1Ev63db+q2IqOktK3Cz3fYWHhlE5cVhgVT6kKElakAQk/1PWJIYGeaNjCGxoyXvFa
         aPAMnUOgcJeXAeSsZI05ZgNJaoQgyKro9peSF9IVb5H6QUk+O6z1H/v6p731J9O30HnK
         /IWDYJ/tBGe+Q3YFPiBWf994+jDbYThl/241sH/YURQJ+S9c8lxjSGB4ZqL1QGHK5dbm
         NS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707409287; x=1708014087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxb698xf8QkMydB4z0YB9c3r/9JegaMn6kB+mk5+8LA=;
        b=b5NeGMavBjO/tdcwA9GKYN5XFCtDXaYmomJWlWXZKOJi9iQU/nTOjgob1d3jAEKH0f
         TZCC/ba/2a/CzX45rDQja2jgL+Ntw5u5lEx5pG79Z9SptaSS5pVAFba0YocHZHKthteM
         qNSAR3+/I0YxbPGxsuyN+FaYqNou6PZKKfZr/IyabkOOccUk0yLh1/PixNQfp34wtn+W
         riQuCse2+a9eVoz3SQk0XwB5ua9yV4UFz1mlsbVOJa68Wn0CdwX9ELUZwu1IU01Dh9df
         +BaHZgQIMTPHbMTQxKtUepEABBTbSpMusdxwbM/gpmPJKzrRC4f9XFsZrBpA+G09lPsd
         FtQg==
X-Forwarded-Encrypted: i=1; AJvYcCUiis7+34A1vnE0TENxRjIWkrg+OzUs96jm02F6o4fhVZPkjGo8LxcouyxxCN4SQ5CbIZbKnNrqP686X3UK5bB8ABHqSy9q+tolmya0P5ge1oE=
X-Gm-Message-State: AOJu0Yxer/fISW8mI/i+PpEfEr4fRvT62CiK1Rz84FYTEBUN+pbyb38r
	5okXBqPHQfHQGCXR5zoA4NVIZrYx52sgQwwAIEsSH8WnXtk4603wVq8q6i7QpgU=
X-Google-Smtp-Source: AGHT+IE9GqRr3/H8i68cQfLtU2iGCsiCKO3R5gWttUZU/5XxgjUSyD0tIivpaca4ynGb4xceQrCnNg==
X-Received: by 2002:adf:f70a:0:b0:33b:37fd:eafe with SMTP id r10-20020adff70a000000b0033b37fdeafemr6274601wrp.69.1707409286849;
        Thu, 08 Feb 2024 08:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9QSqiihNfbdq7cJ4HSCgq7fx+xjvtIvCIXg1uNCblGGv7Zg6YsinZ5dEMJMj69hMDubW2XrTIRaH6V7oYBE1TZC8bkhHTFZ934qZoXq6oi9iOrCffZd40IW3EcRm+L5xkK57a7Ppt7kZeBlt+Zygiq57SPJdM37Woe2JsiCVeeDVsUZ1PoCHzxHB8fV14T1Y4zjvsLIZZ+dOzFTPdbMFOEqKU0pavc/Lohx+YQypK/LXXMPXfJQzDyOHL7J89SG4dkdanalvgC5BKGvCY/X5vTD1FzWtH9OKWfwkSTGyU1+bYYNm/uPKfETlFW3FDYzcaJTOrhjWXBxAQUxJreX/KIouUaKXP3vlto6kFlc85D4BApqOxAF6y8nrkPNe3Z+CkorGdR1jj67GzDFZ6Oqq+YR7zLHyiwktg8qnrYK9ImbMJEysPJ4Z73rPDIQ6OfMHQU4azQjrWrYCgXQURS3A7kCr0TOuRJAQPZa0jg+zadEv4d0Er4MQzyY840BGFmVxND9EZ7KD5p8b6G8m5mncaAIxZBGl4+h7lils0U0aYEGw9pNJ0HSkEe78rwZNhMgOiH1uZoKT5FOqrBWYXOeVIEIIX2DqWcvhpGGb8H80inclkduhb+myMYQxfQdW3d/Z94mtwlK/CuyzG22kzc2dlxNwiQalosE+9p0E=
Received: from gpeter-l.lan (host-92-21-139-67.as13285.net. [92.21.139.67])
        by smtp.gmail.com with ESMTPSA id v18-20020adfe4d2000000b0033aedaea1b2sm3915846wrm.30.2024.02.08.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 08:21:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: alexey.klimov@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs
Date: Thu,  8 Feb 2024 16:17:00 +0000
Message-ID: <20240208161700.268570-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240208161700.268570-1-peter.griffin@linaro.org>
References: <20240208161700.268570-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtain the PMU regmap using the new API added to exynos-pmu driver rather
than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
on mfd syscon remove that header and Kconfig dependency.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 -
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..d78fe7137799 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
-	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 349d30462c8c..686cf544d0ae 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
+#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
-						"samsung,syscon-phandle");
+		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
+						 "samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "syscon regmap lookup failed.\n");
+					     "PMU regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.43.0.594.gd9cf4e227d-goog

