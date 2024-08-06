Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FA1F937
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Aug 2024 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722958201; cv=none; b=k1hYnhVPCqXXxE9GKWHR3N6SlC/qp15tkj9MGADdVacDo7VKOoQMxqHgGHya0eTBZVYVrNKw/7DV9Ix0bHYFJl4WQzahNi7D8DAfdMm2S21OeDNzzvexy1odR/qsZOBnWgJiCU2Kthm97Ul3+qAR/KdIj2GP0BExrAObMAZRAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722958201; c=relaxed/simple;
	bh=PF0Vxx/H/Fh+6ybEWx6+PwT0mzFwGK4sk9orjriQwGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNIYxris6x2t6FNEjzFi4pqywi6EaY051aHw+fqnMtBu9q1LIkRHyenv12MCm3zlXQc4ajBoyKzfjpZvdWPYxI4eq/1EtbBkGMRA7LhJdRcna6WKwY62HzxQFwnbAGdblJGvzqMGPqAPWWhmrbxKzTzfL31gM29O4GO+OT3T8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k88V720B; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k88V720B"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso1569512e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2024 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722958197; x=1723562997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McdwXMf+aVpukum1jWBbRDvrxSrkWixRhMvgP59hNnk=;
        b=k88V720BVBKIcCJIBbzvwKHL25gQJ8JtselYsz6TfTylt3yw8/WpSgPMdTnLaZpbW3
         WXkKMw5ptMOGQsm7/TZ/JJqQoR5/jCTV8qeE51wqgBGmOwwLhje8UW86vDMe1ibWfQP0
         hJ3X9MIUXvYARLmhN/ScGKpB+rLEaURk8X0+QWJvjEjfEu2yJGw1u9z6c/5YH6FN2foM
         HwrXclkvislpuZpLkijGPmU2lK7MELLgdYQpupam3dBimBXzueLCwIN1nsY+bWXkOGyI
         ZUlKM8ye49MSCNiW9meRItSJWH82SMmletmSLNJEv3RI6SXWJ7rQWy2LATFnPm8MCDKi
         F9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722958197; x=1723562997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McdwXMf+aVpukum1jWBbRDvrxSrkWixRhMvgP59hNnk=;
        b=B6uAoW1g2LIg3VDf5968eDjLJ6dsUahoDfTgRumO0AE5Y8KMDiCKGt5SgDJ1Ea74EB
         h4RtETI2BkNkNALJthJOYyyrYu0TTnkmaN4UvftnGGrK+e4ke8D3TC0ipJYwKG61rKVL
         rQm99LcjhNjVXzpq+d9cLaKW4Yw430BmBydEOAvGLA9fxfPx1jswb+6cBBf6cTSAObuB
         JFb5gy63+2ap3aGys+OphG6/HG7bz6Vuk5GlWOBevDo7q8fYw+4QiMjPcRyiwOBT/6pm
         CSUKYfa3xMfpBJ+S54Gq4lO/9/viaAQfo04VpH7bLkY/eLAYKNCLW4wEg5AYeGcyJc5g
         fVhA==
X-Forwarded-Encrypted: i=1; AJvYcCVSOJ5ceuKys4DLNmSH+9ZXRAHnawHNZ5Xv7CfZlZZnl7x/RtuMRQHSP+zN3JpXg8e2nASK9Z4e6Bq1dip9+gG/x83I1BOkmPzGM3+ooFq3kvA=
X-Gm-Message-State: AOJu0YzrXCvDjWVr/gjuBF1IjYecii13yKALpg/Yn7av56uTUklJOgcY
	7xDz/LdieC2yykWs9Tqms57rP+woE5mVculEW3RWvVngFk307murHbsibo0njDY=
X-Google-Smtp-Source: AGHT+IFyj16EIZLaKK/87iLqK95suicQ+dQY2KgzMLkd9+nLfafpYvKVTsIdMVkQYiVfRocIZ68TBA==
X-Received: by 2002:a05:6512:3e26:b0:52c:dd25:9ac6 with SMTP id 2adb3069b0e04-530bb38cae9mr13232800e87.29.1722958196994;
        Tue, 06 Aug 2024 08:29:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4294fsm555274266b.103.2024.08.06.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 08:29:56 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 06 Aug 2024 16:29:46 +0100
Subject: [PATCH 2/2] tty: serial: samsung_tty: cast the interrupt's void
 *id just once
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240806-samsung-tty-cleanup-v1-2-a68d3abf31fe@linaro.org>
References: <20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org>
In-Reply-To: <20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The interrupt handler routines and helpers are casting the 'void *'
pointer to 'struct exynos_uart_port *' all over the place.

There is no need for that, we can do the casting once and keep passing
the 'struct exynos_uart_port *', simplifying the code and saving a few
lines of code.

No functional changes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 1c6d0ffe5649..971765aaeaca 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -707,9 +707,8 @@ static void enable_rx_pio(struct s3c24xx_uart_port *ourport)
 
 static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourport);
 
-static irqreturn_t s3c24xx_serial_rx_chars_dma(void *dev_id)
+static irqreturn_t s3c24xx_serial_rx_chars_dma(struct s3c24xx_uart_port *ourport)
 {
-	struct s3c24xx_uart_port *ourport = dev_id;
 	struct uart_port *port = &ourport->port;
 	struct s3c24xx_uart_dma *dma = ourport->dma;
 	struct tty_struct *tty = tty_port_tty_get(&ourport->port.state->port);
@@ -843,9 +842,8 @@ static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourport)
 	tty_flip_buffer_push(&port->state->port);
 }
 
-static irqreturn_t s3c24xx_serial_rx_chars_pio(void *dev_id)
+static irqreturn_t s3c24xx_serial_rx_chars_pio(struct s3c24xx_uart_port *ourport)
 {
-	struct s3c24xx_uart_port *ourport = dev_id;
 	struct uart_port *port = &ourport->port;
 
 	uart_port_lock(port);
@@ -855,13 +853,11 @@ static irqreturn_t s3c24xx_serial_rx_chars_pio(void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t s3c24xx_serial_rx_irq(void *dev_id)
+static irqreturn_t s3c24xx_serial_rx_irq(struct s3c24xx_uart_port *ourport)
 {
-	struct s3c24xx_uart_port *ourport = dev_id;
-
 	if (ourport->dma && ourport->dma->rx_chan)
-		return s3c24xx_serial_rx_chars_dma(dev_id);
-	return s3c24xx_serial_rx_chars_pio(dev_id);
+		return s3c24xx_serial_rx_chars_dma(ourport);
+	return s3c24xx_serial_rx_chars_pio(ourport);
 }
 
 static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport)
@@ -928,9 +924,8 @@ static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport)
 		s3c24xx_serial_stop_tx(port);
 }
 
-static irqreturn_t s3c24xx_serial_tx_irq(void *id)
+static irqreturn_t s3c24xx_serial_tx_irq(struct s3c24xx_uart_port *ourport)
 {
-	struct s3c24xx_uart_port *ourport = id;
 	struct uart_port *port = &ourport->port;
 
 	uart_port_lock(port);
@@ -950,11 +945,11 @@ static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 	irqreturn_t ret = IRQ_HANDLED;
 
 	if (pend & S3C64XX_UINTM_RXD_MSK) {
-		ret = s3c24xx_serial_rx_irq(id);
+		ret = s3c24xx_serial_rx_irq(ourport);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_RXD_MSK);
 	}
 	if (pend & S3C64XX_UINTM_TXD_MSK) {
-		ret = s3c24xx_serial_tx_irq(id);
+		ret = s3c24xx_serial_tx_irq(ourport);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_TXD_MSK);
 	}
 	return ret;
@@ -971,11 +966,11 @@ static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 	if (pend & (APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO)) {
 		wr_regl(port, S3C2410_UTRSTAT,
 			APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO);
-		ret = s3c24xx_serial_rx_irq(id);
+		ret = s3c24xx_serial_rx_irq(ourport);
 	}
 	if (pend & APPLE_S5L_UTRSTAT_TXTHRESH) {
 		wr_regl(port, S3C2410_UTRSTAT, APPLE_S5L_UTRSTAT_TXTHRESH);
-		ret = s3c24xx_serial_tx_irq(id);
+		ret = s3c24xx_serial_tx_irq(ourport);
 	}
 
 	return ret;

-- 
2.46.0.rc2.264.g509ed76dc8-goog

