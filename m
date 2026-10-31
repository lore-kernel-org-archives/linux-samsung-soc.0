Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460435;
	b=JWQTRDWdi7VZGFuejScaMI9NXkNJPePeiqwiCYlOZ4iVv3B3Frk6WRpw5/B4VExsNp8Y
	 ciz5c1wvyJ1WlPKAnOJSZSkOnR65RnAPLxfRA7HIFNmQAQXHkNv52dk1rvBFCpioWXLCa
	 BQ6oHWNB3KhqMJ65M+9s3pqpsunR5UwId4pQyQt9CVH/7WuWknW04w20VISg00ihUZjxU
	 ZeIL343ILJ5CZGC745+ySg7DwEfHuMxcT3xYM5mupmnOPu8EBqTtcQR6txbc5d6e9kD5t
	 XSB2YjXVuFX5NRGOIoBvv/njZNn/ptYQ1OAY9/KQRNCoy5RoOxHuWZovdR3tRsKCTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
	b=kS7LtFET2SSP301OI1ykG9CA32fJUtOlNW8Sbd5uk5OKsTGMNPsngoH4y2ragvEJTfCo
	 OyAmM7pwgyrOsHCqHiotrtK+At5Yk+sXdDb8Rr3q4gTwT30V+s9l7TRJVfyb8gdyux5sJ
	 Ok8iwOgUhdZhgcPiNS49avLvAdIFG42FBxG6c3Be4eFWaE4zQFfKyiu8XbioSoi0HOLXx
	 LPkvtb0CkuHAAvytPDdsMmqxlFQP0SMNpuNP8sqemQB9LVHHmAk5J9VsgfKfXmXDQ/t9L
	 rKUhdC/3zpekQ6orAmKriySr8YsnkQG8snuKz94Il2/ykjR/yNRFNYxJwPgWA5LVdYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxKt9e0N;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5422606A320
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 15:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5422606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxKt9e0N
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd65a511e43so919086a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460434; x=1794065234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=xxKt9e0NpDf3tVGVMS6wABgShbLvUu1jspoSSPdQR+jrZURTsAUlFjFIUbaa+zldue
         BH9Q2YVj/MhQi17vot9q4bxY+OgPjR93EO4U/n2JdlDzmd3jONUECn7mMK4+NWPOJKOn
         CZ8OwCL1ud1Ux8ShHqn1BWX9Kct1BdM5w1EHu0/NuVMZGDeco7HRAjwnrvuugCPwdkE5
         pC1dHjy68JWDh21fbmodKPKtC9Ll9YrERB/aYMaK6ZLn5+eTmvLscCsZLsAkpTivuWve
         OF/OmyNhWECuTIhr0RePHZiKrER11pXgxqnJkKFItyYqiktMFEKB6P5GQzeInHxmkwCS
         ttqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460434; x=1794065234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=2KzBml5GVh6l+4ihZH3Of3i5Cqx5/weefIxnEQnSH+r7D8uFdKQVEe1XUJtdcJ5Dx1
         8yJIVngGaHH0o6G4wLxiM9ql7To2I5GpUsDza5KfYPtFjtOjQpTphgIHlkGvLgCvkSor
         Z4/3W6n/nbbye6yzWxAE6JG2R3jy2Acw/MmehmgLx81n1Pa+n3sZNPZhIOrsYwnqWdmx
         S92iNsW2LKSAe8YPacFBEKNt3O5ML7RUfrZ8z+ifBXfL1RQTfeMr8Bs1Fsbk+Og84ho7
         AQXF7wGeeiDUR0wLeDenOKrjCyWzWB0TmdYvBEjHhhSpGtCSdbyUDYMiXJ1n4qAEEvOY
         rGAg==
X-Forwarded-Encrypted: i=1; AKwUvBw7z46NyUyfVnkS8tShe/wi/INFmzuKsNtFZdETCRFxJTuKju1GP8vGbGDtNNKiDWBo09tilzA0ZXYMcnQMzQdLiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAaoeVWpiOARIL14ceUMOtZ6jP27zHbpaHZzcN6++NPzATdui8
	euGT9+IprmEQ816kIybmI8p5bclGx1BabY7VHqdDP63NW/7K/TKS44IT
X-Gm-Gg: AYBFou1vLc4plmg+NALUBvlOOrIZQ4TDHfurEYWc6jPngRTDqSuNb/qnpVy3iENRuNN
	LI+0pgqOiuZIEUPyS42vJUfYpFwotL1TdpVIm6k2+Ghbeih1Lg/rILz9tgq113sw+Ghbcww+lsw
	v0wVPiVoSSABr66rJy0+Lhkxfe94BLi+fQRhSp3RjNML8E8286V03lFIQsq4JcczfIxFX9awoyf
	gcjKBuDD2lse3RduvG/sPnCxX7Hzkx8c8IQy5qUuDsyWXd7Ou5tvUYusd/sCK/F94485mTAlsbv
	HRC5YMJIN2SkJPITnHkJlr1OWeq1nqGdRq3HOWmd8XctRqdmS54afqTKv5Lbfin3jzJrg2JiPfN
	na3rcL7fCbwUcY5ZMBcyVbxisq3pRq82z80YNbh3ZC+8+Q7Hk/cFKRihkeJ+4xzBJnE5NKAvmxI
	paO5bjZ6iC3BlyREU/JLjBD5jEFFmEyzySSSEw3eI+YkyPqL4cA3Xo3vtUwEqtknZhUm/TbduTm
	6j/MnHj/1CTJE36Mjq1cxPscn0eU3Zq2BWddEk81blSlF6O35hIPu17zNuzJnaXZqytGCqwe5v6
	ey//FijhrekEY/ozFGmAQspe5P5EvQE=
X-Received: by 2002:a05:6a21:6b8c:b0:3de:b120:bba0 with SMTP id adf61e73a8af0-3e928cd25a1mr4531768637.36.1793460433856;
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:56 +0800
Message-ID: <20261031152656.1422-2-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20261031152656.1422-1-xiex16070@gmail.com>
References: <2026103122-repurpose-cost-2da7@gregkh>
 <20261031152656.1422-1-xiex16070@gmail.com>
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

uart_flush_buffer() resets the xmit kfifo and then calls ->flush_buffer()
with the port lock held.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops implements that callback, and
s3c24xx_serial_tx_dma_complete() computes the transferred byte count from
dma->tx_bytes_requested before it takes the port lock.

A completion that has already sampled that count can therefore run after
a TCOFLUSH has reset the kfifo, and advance the freshly reset kfifo by
the byte count of the discarded transfer.  kfifo_skip_count() does not
clamp, so ->out moves past ->in and kfifo_len() wraps to a huge value.
The driver then keeps transmitting stale buffer contents, and a later
close can wait in tty_wait_until_sent() until it times out.

Handle this the way 8250 does in 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush"):

 - add s3c24xx_serial_flush_buffer(), which clears the outstanding byte
   count and terminates the TX channel asynchronously.  The port lock is
   held here, so dmaengine_terminate_sync() cannot be used;

 - sample dma->tx_bytes_requested under the port lock, so that a
   completion racing with the flush observes the cleared value and
   advances by zero.

The callback may still run after dmaengine_terminate_async(); for the
fifo it is then a no-op, but it does clear tx_in_progress so that a new
transfer can be started.  As in 8250, this assumes that a terminated
descriptor is retired before the next one is queued.

Reported-by: Samarth Narang <samarth.colleges@gmail.com>
Link: https://lore.kernel.org/all/20261031004733.3345841-1-samarth.colleges@gmail.com/
Fixes: 29bef7990845 ("serial: samsung: add DMA support for TX")
Signed-off-by: tianci xie <xiex16070@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e..e955b7e 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -330,7 +330,6 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 	int count;
 
 	dmaengine_tx_status(dma->tx_chan, dma->tx_cookie, &state);
-	count = dma->tx_bytes_requested - state.residue;
 	async_tx_ack(dma->tx_desc);
 
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->tx_chan),
@@ -339,6 +338,17 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 	uart_port_lock_irqsave(port, &flags);
 
+	/*
+	 * uart_flush_buffer() resets the xmit fifo and then calls
+	 * ->flush_buffer(), which clears tx_bytes_requested.  Sample the byte
+	 * count under the port lock so that a completion which raced with a
+	 * flush cannot advance the already reset fifo past its write index.
+	 */
+	if (dma->tx_bytes_requested)
+		count = dma->tx_bytes_requested - state.residue;
+	else
+		count = 0;
+
 	uart_xmit_advance(port, count);
 	ourport->tx_in_progress = 0;
 
@@ -1162,6 +1172,32 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 }
 
+/*
+ * Called from uart_flush_buffer() with the port lock held, after the xmit fifo
+ * has already been reset.  A TX DMA transfer still in flight carries data that
+ * no longer exists, so drop its byte count before terminating it: the
+ * completion callback may still run and must not advance the reset fifo.
+ */
+static void s3c24xx_serial_flush_buffer(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_dma *dma = ourport->dma;
+
+	if (!dma || !dma->tx_chan || ourport->tx_in_progress != S3C24XX_TX_DMA)
+		return;
+
+	dma->tx_bytes_requested = 0;
+
+	/*
+	 * dmaengine_terminate_sync() cannot be used here because the port
+	 * lock is held.  The callback may or may not run afterwards; either
+	 * way it is a no-op for the fifo because tx_bytes_requested is zero.
+	 */
+	dmaengine_terminate_async(dma->tx_chan);
+
+	ourport->tx_in_progress = 0;
+}
+
 static void s3c64xx_serial_shutdown(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
@@ -1684,6 +1720,7 @@ static const struct uart_ops s3c64xx_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= s3c64xx_serial_startup,
 	.shutdown	= s3c64xx_serial_shutdown,
@@ -1705,6 +1742,7 @@ static const struct uart_ops apple_s5l_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= apple_s5l_serial_startup,
 	.shutdown	= apple_s5l_serial_shutdown,
