Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B544CDE1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661138; cv=none; b=WkBew9YPeSFmaNOwOOtw20gKskyk1SY7sceQlebA36gqMr+lSEKWaQjSQhWnrDhfP+YfJmZ3cbKbveDtuFIxkqvvCSwH1N9LHx/1JuamFkxQxlpqcXk7J+BStij0W47p+6cnHri8IYI49HtNRZ+Hb5P1PY5HwysIu/S6+mWzrrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661138; c=relaxed/simple;
	bh=F0EgC+aY2d9D0s9EMXRvXW6DwtHatOTbMqQA3afuWrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhhBj7F/htcxtg1tNvk8B2GO+QF/ZPXMlLgNM5mhMknmUjssDIcleMawNZpv5wwcHBwH0+Ao9Pscu9GZ3eSlYd6i2yzKWwH8g0CTkl3y2K0HCC5BDQupuG3DM9bzzVyzK0sNk4DZj69GuikV8kZr8KtpxfjS10VpkXSOwl4VlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oFC2hLrK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oFC2hLrK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e9ffab5f2so2091315e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661135; x=1706265935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLdYk7lMN8S67k1ZA1qBwWGzOiN17GG5/kldayDzF2I=;
        b=oFC2hLrK/NxbSrc4wCO2Ak0JzyrKW9plT1s9ND0tS45YUBraEYF3A56csBdyKlBsWG
         dNUwGx8PyrwbuhlFQjiUU3A9ClqqhaLMwu+uv8Ltk1dgVnLcHT0bGpmqqnTO0lnTziWI
         2yLQM7pn21V6lhx30efSPcIUwTktKo684h46WJmgrIvWpFXfRC2DZqFe53RSCJub2e3w
         pBlvz5QpK78c7WebgtlT3kXhRZA5puwyu8xGYhalRRdqZw313/NMYbX+pY8lv5kbdTJM
         xRBerLKZjWqi6W6J9X+7bK5uGkAV2ukaAAiLtgvminHSLEQai8R0Ydw/0z9pCIaaRET8
         Jgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661135; x=1706265935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLdYk7lMN8S67k1ZA1qBwWGzOiN17GG5/kldayDzF2I=;
        b=vyPOPmSOGKX0dqKHJL+mPrjkJNn8kVOxe1yVUrbWjql8sIdYKFXtVHEfKa6Ot8GG7o
         fqM1y5dDJXjwpdJ1AcewP5YgJH9SJiBCNzCeBCMSu9DUEE0KDkUKwJyBCQd+Ayml8jMB
         qOredfcS4J5Gh2QLUeIRQPw8kpU217TIjezIwUoEoGNGrNkT+bbB+PMGhKiY1t6400rW
         h6BjmBDCenw0CytyQInc/O1/wip67HBSRkAvbCAuaQC9jU2Wux2BOZChm2vuwWMUCyiW
         4GIv79Vy4BoZ6fw9Udfw83kcclskf6pUHt7mVB8OCZ6TiqCQd3Kuc0rlYLAykDmxpJh6
         bdIg==
X-Gm-Message-State: AOJu0YwG/JCnot+5QwFRgk5507/4+PGKjwvCdL03NJMHg75aLEBq1kTF
	uLwdK1VnlkG4JFXKO6A4pA5RHZaFGb00HOU5P6bhiuH8nSZ1+tQ3+BaVUMBGVt8=
X-Google-Smtp-Source: AGHT+IHStpeaJg7czVAXhy1YLg3/cMnP60jBDv2J1qFM0FiGJKfMOtGOvAXTPzU6UR+GGpcxYZaeFg==
X-Received: by 2002:a05:600c:1d03:b0:40e:8a59:c3a9 with SMTP id l3-20020a05600c1d0300b0040e8a59c3a9mr1568710wms.2.1705661134824;
        Fri, 19 Jan 2024 02:45:34 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 06/19] tty: serial: samsung: sort headers alphabetically
Date: Fri, 19 Jan 2024 10:45:13 +0000
Message-ID: <20240119104526.1221243-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorting headers alphabetically helps locating duplicates,
and makes it easier to figure out where to insert new headers.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 80b8fcf9e025..bd9064d4efe7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -21,26 +21,27 @@
  * BJD, 04-Nov-2004
  */
 
-#include <linux/dmaengine.h>
+#include <linux/console.h>
+#include <linux/clk.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
-#include <linux/slab.h>
+#include <linux/dmaengine.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/math.h>
 #include <linux/module.h>
-#include <linux/ioport.h>
-#include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/init.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
+#include <linux/slab.h>
 #include <linux/sysrq.h>
-#include <linux/console.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
-#include <linux/serial_core.h>
-#include <linux/serial.h>
-#include <linux/serial_s3c.h>
-#include <linux/delay.h>
-#include <linux/clk.h>
-#include <linux/cpufreq.h>
-#include <linux/of.h>
+
 #include <asm/irq.h>
 
 /* UART name and device definitions */
-- 
2.43.0.429.g432eaa2c6b-goog

