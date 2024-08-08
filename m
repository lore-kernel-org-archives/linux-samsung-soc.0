Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648471898E1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723104716; cv=none; b=bbsEfeK59k8sPVV41chwFVMeaqQZgtP4eqAe3M1hHsH/PeoJ79VSWuSlwKH/jeju/4057eec9+U/STaQPCgz4rlBSAdayrqKLXMPR8T1eGg+qJZcbCaINKu1fc7Hni1IWKrpZU//ZD/plj4isY+EuKeOLXgKtlt/Xo5taLHzOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723104716; c=relaxed/simple;
	bh=XcgZzonM3Zq0QilSSZPQLNCcRAf6MfPi/wZmG15XNl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekhwbqbA2ZcvfOp4H79mL62K4G8yFx0zcehOdoqJLg4a65WNocqVEntVBWzJkO5Efajf+mauUdAulYqWUL8v+zjUlwraefWEyOBxuFKaL2n8A6LnWtzBFdvFvHUa00K4MlWWknIbRS3NcG+3G1cuW6vjjqUHdlFYii1V+h1Ohcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+CzX3OQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+CzX3OQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a94478a4eso281058566b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723104713; x=1723709513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqxEVbtlJAYIU2G7koLN0SZSQulPINd9bO5ddzhKZmM=;
        b=L+CzX3OQQXx28qdRo8fS3iI9T4p5BbKM3eJPSLnxh2+JtAFdiCluJADHmLmrLnUbFL
         ywwB5VEfbrIZJG59z09MOadirqnobuA8JJWPGm2Wq+b1BJhuYrS882CECz1vU7hwBvl+
         wf9ahukQE6yk+64kygA7Unw5a/9QjdJovSuCZBLsUdRSbbKskWt7DI57Bx1i89L/tFsM
         jGUsOaYRVifYtdTpB2sUd25evbP3eOEi90ick2POG+7cp7CVzjdycTsHtf+TnPXBT3F5
         DXKnHjp8t4iYfpDVCJY/WIboAA2v8sl3QPFvIrhVtHzMiTVLOqN9Y+IUntF+AE3LLoib
         OO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723104713; x=1723709513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqxEVbtlJAYIU2G7koLN0SZSQulPINd9bO5ddzhKZmM=;
        b=jhqR3PceqY6PuyyK1uqKPexbdUmqh8b2mkzqXMTAT9IYqmlJZNV4dSAw24ZU+ZDh3T
         jfK3cwSfvDi94+2S0xmKXDwR1bZ1NHFRGsM17d8x9w+zAcuYX907hAUQFNrC11TyfXjk
         hSVnBkRFm4faVrj+/5XD/kcisNkCsQAESk9WefofSFQNmHuELkIxIUqFcM7R8MngLkZV
         pHQy4obwtdikuf8FVicxUDdXj9XefcWw92MmUKujaUSCR2ZN7zI4B+jZpy422lo8oWxq
         7hSSFyXW+bi0qYaPs5zBxaRCjekO0ETgv1ZyV7JEYowdv5DG4Yp+PWDfK5B3kls/ghdI
         X6mg==
X-Forwarded-Encrypted: i=1; AJvYcCWCQwiDnLTVg0xvwry6oiYBlmetDJBHa84dKJFM0UkHp7cfdK9MGAn6i51gqMXh6C2fRxLZTyzf3ywiBw6wn+GzyqkbfaiwAGbSmcv9B7lo3hE=
X-Gm-Message-State: AOJu0Yy5rKCfJlPedf7+ZSV+1TujGN95778qZjMZiz7E1juBib1fGun9
	xeVNdVKRY5LIa8M7TbLIqvveq1HSs1ky85HhZ2gE2fm6/xmcW+g0ol5W1M51fEk=
X-Google-Smtp-Source: AGHT+IGHGZjdFmV3eFGqC8FJHxVC9D1wSPHpGQgKUM7hRt/4kJ1eWwU/AAaASzthWd/iCBjPMuERUg==
X-Received: by 2002:a17:906:b15a:b0:a7a:b26d:fb5 with SMTP id a640c23a62f3a-a8091f1eb5dmr68212166b.19.1723104712714;
        Thu, 08 Aug 2024 01:11:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0c578sm716931166b.73.2024.08.08.01.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:11:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 09:11:52 +0100
Subject: [PATCH v3 2/2] tty: serial: samsung_tty: cast the interrupt's void
 *id just once
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-samsung-tty-cleanup-v3-2-494412f49f4b@linaro.org>
References: <20240808-samsung-tty-cleanup-v3-0-494412f49f4b@linaro.org>
In-Reply-To: <20240808-samsung-tty-cleanup-v3-0-494412f49f4b@linaro.org>
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3: undo too eager removal of 'const' where unnecessary (Jiri)

v2: fix -Wdiscarded-qualifiers, sorry
---
 drivers/tty/serial/samsung_tty.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 1c6d0ffe5649..c4f2ac9518aa 100644
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
@@ -944,17 +939,17 @@ static irqreturn_t s3c24xx_serial_tx_irq(void *id)
 /* interrupt handler for s3c64xx and later SoC's.*/
 static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 {
-	const struct s3c24xx_uart_port *ourport = id;
+	struct s3c24xx_uart_port *ourport = id;
 	const struct uart_port *port = &ourport->port;
 	u32 pend = rd_regl(port, S3C64XX_UINTP);
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
@@ -963,7 +958,7 @@ static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 /* interrupt handler for Apple SoC's.*/
 static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 {
-	const struct s3c24xx_uart_port *ourport = id;
+	struct s3c24xx_uart_port *ourport = id;
 	const struct uart_port *port = &ourport->port;
 	u32 pend = rd_regl(port, S3C2410_UTRSTAT);
 	irqreturn_t ret = IRQ_NONE;
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

