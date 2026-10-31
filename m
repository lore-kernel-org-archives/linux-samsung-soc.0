Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407352;
	b=AICVwvU2PeMKnPqubwaYKgA2qzSo6Ifjdu1I7xe7obqrWr+0kY4pW5RBOcoWbaoe+nhT
	 ATpScze4ENjivEScw9qfj9tJWmdrgbQHtjRVYbLMl/BQr+G0drMQdHaQcz3drPpt+yCIL
	 vCahr6Jjjyir3Caj9iM7oFDu9nglRdkFvVzMZ6LMtHJc/3s68MYA1UYCWkqrT95UogsoP
	 5SVg/cEBxelENLrrxEsEFxt1lXjNaAslISD6yQ9Ma+Q4YOQVuLUHDU8+M8jS+7kSZGgn+
	 pkIPe2/jmqtlEQJOj5voKMMXBJeBXNXrdSX9FmsvDx06ilLH1pmTsw/vzr2FXdzv55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
	b=HjsTDntl+tEl60ARTEiM0wO8Ohm21AySAEJR+wDgLxXvlzRyAU3wGoJGHu4W2VH/iYbY
	 DiS0y4hrR8bnK8pWofA7VO86nAQO33bu2hz7PZ0PxUj1cUeY7FJ8JeLj7TBZ+JTibj8Jg
	 0TOOQW/YXsGmxQ7nc4gQU1vDQBmwBQUmV7V0S0nFt9KHW2FG8ZLpRcQfkZHON9xYKKmF1
	 TqckgYpzjkihtXGgln4mUJrHMxWYTpHWXBzGF8Xdln9hui/f4edcNDF/hjYerPoBxjiJH
	 VM9rR7Bk0+4c1mNNTpP76rlydjmO8YS/3DeeFGsO7WBWvYSeGYvKT+8QJ6pMzz9dwRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xowMI382;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B4606A326
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 00:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xowMI382
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2191365eec.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 17:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407351; x=1794012151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
        b=xowMI382kXt0JlNAaISc4k7doxpJc4H7KqK3RcQHXxYwEPuaDmuCdCeT8vjQ0/BkuI
         rAGBmDV0aq8uU9ciZbt51HiIhebAZpONrCz0ycnsD2n/FAruk1wsdYr9QZAHlM40WEiw
         AOO+g26kPqVQVJzYFfmKcf+TmD0uT7t1a0OiUcEK9RJEDlQ/Dd+Yj8Bsm2NTRIOnT7v9
         KieBeewfJq3qPm0h3+SXz5ixZ5B0EJbUI9iF6siVi1Lk/2nTrrWdlEqeRFqQSoq9LlBC
         B68Y5T9aNMJuWXzNr5eX+37IFP4bQwZZ9qN5735AQ2v/IgkudPDP2sA6NGtRS9caYy92
         mXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407351; x=1794012151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
        b=b26eTPPbQRqxsgOpIyFjGRKy7hy+6jNKY7vApeIpJ4RQIaey2B5xieEvKtoeLGBqvQ
         kNljTjFA2aJUxZQLDTUouo+HWufSVj0wf1y0Zkz4wkONrH05ZaDlRzO59i2uufXv7hwo
         zYPO2V/eS+RN87DYLKa5N6GNb9WoroDsSQp5YNI7tOXC/4OubJ/re/fAqjL4eL1uV/9s
         zmlQJCUKl1yy4pSz6k2+m+ZfqdrH7mV1VMMIgN4RvB3P18yQEmymSeRrVMQyxtsuxoHt
         NZIz80G+Oxbyp10PTg+2UMgs4Ux6LvLtcLzTBiCvZhpNl/Mg73l9seFk5AFqIAXT4gOA
         GT+w==
X-Forwarded-Encrypted: i=1; AKwUvBy0W7LCrAzCdqckz9FdVyuw0CnDuxispOlwKr8Lo3NYiB4brsoUJyHjyaVSEKp7y9i5K5y5ZA47lDE8VEIMLKh22w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKW2Mw5uosJI8Fz4aWZhdUCh/mMFHHXrbs4yEyRzSUPlTjta4om
	hudOnAmpSFWCPvyLoojS1/qnppsxG+6Yn2Qv3hxYqz+bvwl6xDNYsHPz
X-Gm-Gg: AYBFou1QJ2rR7SG4wyrbZh2d+Tp3EHu1Zu6K8iO78Ud/QTGTIHtwnFdOSE0ZntbHem+
	QroOT9p5qh3jZYzSQscETVRxIiiL9qL8p4FHNZh8mSexD5Qi1r9z0T4WMAusD/HEmYJrPCXQHk6
	WMV7MVUOO4Ec3CDI/vut0pw6vgIVeSiECb1Q1VdL8Dn8ftFKJfnKNWAEs7AL81T6p2JcHRMvEVN
	K+w6OZkz7+RnjGm5QKUwoFIIzEtw0kUN98FmDDfkuia0Vliqh1UuxcVHU7yoRis6OI28PyWZ8Eo
	BRODC3PDaRF0T9GhLaZ7qgJB2mOInP6BG/1LN/2liGXZVKuh97P7LhVbTa/MhRKn1hmCzmYkdac
	dXkCke3mcYwCCF+czfPWjjXNDgBDy3y9d/XRuw14pW1cdwyhEdBCvv1calq4xNW/JZZMlPkr1g7
	H1P0XxPRKg9vjutJQ4/b9MWfWXU24lJaWpajj68hy4yBC6KviFZcsLkIWz9esN1q4qs803IE3bA
	OVQcpIjT04ZwzkGJ5tyQAiv6JCCNo+oBthc3a3zTivtmm0a5cJebv5QVPP/dHuCEYOeFfQ3zebK
	BkwZSRIK7C2oL/rkKEGk9PC+TFtgI+/lMK3qMiQzS93ylf1p+QzJXXgz+WKQlpvuL/Y2PrhPfRO
	Xrkl2E5XJZW9gWKRCm5SYRGilhjrBTxSdxlISSAtZ0oIuQJn3B6jAddKN7pQrxrPnzUZtsC2cT1
	XvCZJ9QFqmLR6EP0o=
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr7287000eec.11.1793407350704;
        Fri, 30 Oct 2026 17:42:30 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:30 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 2/2] tty: serial: samsung: do not re-arm RX DMA once RX has been stopped
Date: Sat, 31 Oct 2026 00:42:17 +0000
Message-Id: <20261031004217.3340610-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004217.3340610-1-samarth.colleges@gmail.com>
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s3c24xx_serial_rx_dma_complete() unconditionally submits a new RX
descriptor after each completion, even when reception has been stopped
or the port is shutting down. A completion racing with
s3c24xx_serial_stop_rx() or shutdown may therefore restart DMA after the
channel has been terminated, potentially allowing it to access the RX
buffer after s3c24xx_serial_release_dma() has unmapped and freed it.

Only re-arm RX DMA while rx_enabled is set, and clear the flag under the
port lock during shutdown, since the hangup path can reach
s3c64xx_serial_shutdown() without calling stop_rx(). Because the
completion callback also holds the port lock, any descriptor submitted
before rx_enabled is cleared will be covered by the subsequent channel
termination.

Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2f6c69bec..3f2346f4f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -622,7 +622,8 @@ static void s3c24xx_serial_rx_dma_complete(void *args)
 		tty_kref_put(tty);
 	}
 
-	s3c64xx_start_rx_dma(ourport);
+	if (ourport->rx_enabled)
+		s3c64xx_start_rx_dma(ourport);
 
 	uart_port_unlock_irqrestore(port, flags);
 }
@@ -1165,10 +1166,13 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 static void s3c64xx_serial_shutdown(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(port, &flags);
 	ourport->tx_enabled = 0;
 	ourport->tx_mode = 0;
 	ourport->rx_enabled = 0;
+	uart_port_unlock_irqrestore(port, flags);
 
 	free_irq(port->irq, ourport);
 
-- 
2.34.1

