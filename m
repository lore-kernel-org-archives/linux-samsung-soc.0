Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4C1C9DD6
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031901; cv=none; b=Ki3b44dnG84xpfwl6hwBnJN4jh+GeaiU/Q7+A63eTwJoYURMGKwMzY6eyEYDym1kInaO5guEtMmrV5emCp8r1FisSJwPHMvfjIAGA+LMB+dOjiTn6LBe7OeD82kj/8VwGDhltPZlTgZwDlG5cXjT/DFsPloc94PHBs1lkdgp8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031901; c=relaxed/simple;
	bh=C0WfsFjQ+8vm0W8joRCkaLKnopigm0TpDNtG9k6jpMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWPUaP0xEQFA1MK70xo7Th8kHnXz+c3kl3cIL3w4wDVbgB6ZRYBT3kdOSm917rbFLIuP9GLC0K44ZEO1iVEm/xVebMjqAuzPmmdCQJ4xQc8rzZ9NBY998I3XqR31B4fzo4jP0kmAdjM5jkFmDhIXc0Pj9USfyXkE0lopmvuN9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2eSwrGT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2eSwrGT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a728f74c23dso202229366b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2024 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723031899; x=1723636699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMjvgficlM8E7OFHsCNQI4tsZ98VKn4/e3uEzM8rqJg=;
        b=k2eSwrGT4N10qW1QpzRMc4fNJ+UOskao7bA0kjY4HGQynu6b4FfP9Y/pCdZ9vejS3n
         UhZSueJakcbj9bE5EZYA3ZZ1S0c6B4xPsuLI0WySCC3wp5JaCLgzXNELHzcFW15pKE+2
         /dugAdewdcCbuOI9A5awbaWyxbhmuoA/bpAw0ZDs/szv/meJL5WtrkK60IJwSPJWciHM
         pu+CduJsxt3RGbnNUhMHP8dMK6TyxECk+xxei8nT/cq58QArjnn+MmcrLXo/MSbN07Da
         dh5ZOqxBabsm/rXLxhanXBQHJfsy5EmqG898G4ZKT+u8ZYKHFVdj7nnbUCK2YT3QG2Ps
         CxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031899; x=1723636699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMjvgficlM8E7OFHsCNQI4tsZ98VKn4/e3uEzM8rqJg=;
        b=se2DuypwHlbKTWi1cAnedMUuNeZGaf6sLtG7A2t84YYeynDyFgPfFRmpsGG2ci9cCS
         nlmnNX6+7uPB8gSD+D2221fVj8s9oyMQfgbd55orYtgTdjq2PRy0QwxjtJKDRyPWBjpX
         7dPeDHuUX7au+19HKZQQwsnPU6IRnD31Nc16A3KlfSwtTGDsW5PZ7aOPKUN1SwTHRIST
         oF2z+00waoZ37XsM9/JBRwPJGrVKt/L9SdQd/3wXALC0mgOpc1nR+poa4LAcclJzId31
         QmWPp3fVl0xpFZfJjGEldC9L1Afyug+rjsj4zm0+V+0XeKTwoCkI/vxUXqYzhi/lh8P6
         yTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZPGclAZ9caPM5906FbpBmeZGwmcK9dHLEAR8iNL6kDBDBeiMRBK0LkMacxSu8H4ZskT2Z9McxDLWkSKUCvukO+Z/SsFf16Yh7wCzXE6kNvM=
X-Gm-Message-State: AOJu0YzZGcW9euqHN1nK89bb580pyxtlWhHzbTIytH6BGBFmSza3H7uy
	9PICbJHFdP9sl+MaXQohipaUvqxDDL9xjTzNYkUX0oXjVasbIAe8vW8d1lggz+o=
X-Google-Smtp-Source: AGHT+IFX/mnj8z/gOU4S/Qjsm2FR4qQxyCrhiZEmvGKW7LyZfNdC7JaX0Q3SxwF74ucLtHDokfAeBQ==
X-Received: by 2002:a17:907:1c19:b0:a6f:4fc8:2666 with SMTP id a640c23a62f3a-a7dc506ce86mr1394858366b.44.1723031898724;
        Wed, 07 Aug 2024 04:58:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d45239sm631017466b.119.2024.08.07.04.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:58:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 07 Aug 2024 12:58:18 +0100
Subject: [PATCH v2 1/2] tty: serial: samsung_tty: drop unused argument to
 irq handlers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240807-samsung-tty-cleanup-v2-1-1db5afc9d41b@linaro.org>
References: <20240807-samsung-tty-cleanup-v2-0-1db5afc9d41b@linaro.org>
In-Reply-To: <20240807-samsung-tty-cleanup-v2-0-1db5afc9d41b@linaro.org>
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

The 'irq' argument is not used in any of the callees, we can just drop
it and simplify the code.

No functional changes.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index dc35eb77d2ef..1c6d0ffe5649 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -855,7 +855,7 @@ static irqreturn_t s3c24xx_serial_rx_chars_pio(void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t s3c24xx_serial_rx_irq(int irq, void *dev_id)
+static irqreturn_t s3c24xx_serial_rx_irq(void *dev_id)
 {
 	struct s3c24xx_uart_port *ourport = dev_id;
 
@@ -928,7 +928,7 @@ static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport)
 		s3c24xx_serial_stop_tx(port);
 }
 
-static irqreturn_t s3c24xx_serial_tx_irq(int irq, void *id)
+static irqreturn_t s3c24xx_serial_tx_irq(void *id)
 {
 	struct s3c24xx_uart_port *ourport = id;
 	struct uart_port *port = &ourport->port;
@@ -950,11 +950,11 @@ static irqreturn_t s3c64xx_serial_handle_irq(int irq, void *id)
 	irqreturn_t ret = IRQ_HANDLED;
 
 	if (pend & S3C64XX_UINTM_RXD_MSK) {
-		ret = s3c24xx_serial_rx_irq(irq, id);
+		ret = s3c24xx_serial_rx_irq(id);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_RXD_MSK);
 	}
 	if (pend & S3C64XX_UINTM_TXD_MSK) {
-		ret = s3c24xx_serial_tx_irq(irq, id);
+		ret = s3c24xx_serial_tx_irq(id);
 		wr_regl(port, S3C64XX_UINTP, S3C64XX_UINTM_TXD_MSK);
 	}
 	return ret;
@@ -971,11 +971,11 @@ static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 	if (pend & (APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO)) {
 		wr_regl(port, S3C2410_UTRSTAT,
 			APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO);
-		ret = s3c24xx_serial_rx_irq(irq, id);
+		ret = s3c24xx_serial_rx_irq(id);
 	}
 	if (pend & APPLE_S5L_UTRSTAT_TXTHRESH) {
 		wr_regl(port, S3C2410_UTRSTAT, APPLE_S5L_UTRSTAT_TXTHRESH);
-		ret = s3c24xx_serial_tx_irq(irq, id);
+		ret = s3c24xx_serial_tx_irq(id);
 	}
 
 	return ret;

-- 
2.46.0.rc2.264.g509ed76dc8-goog

