Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E044B66A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848887; cv=none; b=NTITpVWgrmzA3yZtPgNzr1J0jRETZW3hIVsPKMTHlXk2WyIBWmEz1OT5SV6J+6RAg3Sjnn4aKPmwC0TYDM7GQEsRqHmAFHjfUaaGSIkV3cS8kl29zP+XT4YVoSD0zikwirIP2TaBkvI3cy3Dv/q8GClWVYSaT5mPHaXdvAYsmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848887; c=relaxed/simple;
	bh=7TZ5vcA+GLdk6E7fGnm5v0lehUpocwQ4ZVzCnZFOHkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RMHUzQN3sm6g+8RqovluM3UTk7y/Wb8zKGUZMxBty1eg5Lhy4oHe4mOeMjjj1MyFihWxKq4vhgFmaFp0P0CSWkMxyEogQhXcCflGCWlvPk2Xwhyu5uyGhH79cUzCyb1tlTkXKwXsMc855rvhPEgcTX6gtmyDfHg1Zh3oEUVL5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGFycZSK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGFycZSK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso97489265e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778848884; x=1779453684; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFHLfFog5+tJEOD6z3uXuJEqumNcdwRPWU/fZudPyJE=;
        b=sGFycZSK/yj9Ii47pbKAxiJsXnlz0zISKj5li3Qr0KJnBPVc8qVGTcRmnms051ZMfL
         xQe0eIux31D5e4lPG/ab9DWOCTUutJud16sFMFeAw2FGAil8X5c1azQLaN3GEtqVtGEz
         mTYoZhnLbQ+fJHVb7SR1B4PgjJudK2JDVC5PVFOhP3vmXDrXOKhJpb1BwL9rZEXaBt3F
         gg98IIim+FHn8ZFNbFzaNK0co9KNvvsVWYBTAAQ8wMsUu/gDdcIwZnzynRnQyPEC6sPF
         Db7Wm7d3ZNuopSiPkcFHHYrRT/rPRrZZMakywjnnVbZTQWzSbfWO78zLb3WA5YVJXLpK
         8VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848884; x=1779453684;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFHLfFog5+tJEOD6z3uXuJEqumNcdwRPWU/fZudPyJE=;
        b=hyWIp6u2b01jWe2/1sEYI945AUHn1GIrZZ3NZJey5bSBC0OKsq5ZHfRYRfSGHtssMC
         fiHFpEVdgqW7y26De43eWF9SKv5GGvTZ+fAdTlsDUE5kZH6B+kUQzpTD9JPFhthnrrDp
         3I8T1RSeuif4totS8vl9VS9FVqBlms/VBotHHRh5u8Hsdz83AplTVz0k9nqaIDwC0KKX
         C2jLSpZivLCScOlDAiZvhl1uhDDuVDJJ0wgZ+tY7mFIkJ6pKyvddX5UX9B3UkJtVsUs2
         xAeG/UPIXpxafBAVf1RzK+g1J6sO0ZmTZWRT8d/pcczFW0Q8PkYiJWOw9LTOdrUvwcYX
         HjCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DrDMBXDSi5COnyqwo4N8E422fB2vfmkd9Vr+j0wOmP9LJKOf45XFirwEfxTXljr74oZrSTK61KpPnvVauhzGTbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfGhIlwXt+mSfjeNkbslxU1dJ60kAxLniYVQbVaOkGU30QEcN
	pb+ctRxjr/qA4myax0u7zDuGv5LbQJ5CyTf75PVs8Xbz3J/+Dr8MfMnSI6knrvGWnjL3GHSXi1k
	sH4H17M4=
X-Gm-Gg: Acq92OGJaULKhglwVv4duRuSr1PIGsvsv0DlE6JYoQTMeepYLZbjwrD6xDT688MASkQ
	x4zktDOGS35aoyKDL2R7j7P+8GM74VVo0d9qFff+etxmfBiSlYjv+5KM8XKdy8r808v343JY/q7
	3d5b71hRTRj35nO5MrKOc77Chiib6XOFjypEdyZpITY5E5ecUHbNiS6pQzJ1O/nXz+dgxZ3O3SO
	CV+ovTvmUazfloJAiAXRsDkXlTEqngvwrFPfU5mjRKW0aSJOIJSJ/PkeQ7+3W8lu2qvazGslBmn
	0n7I7lcCQ1SB0rzU5428AWQLW0hrbWzXoRg1OD/3d1nwM9Kh9AsVCiT/Toyy6+bTOwgzeFN5Iq7
	4FCnz8ihfJCqnXM6XLRHiNPJpvSkIdNirGs7lBEtz+fuApBcTOmfJf9uBAfZWiBvUApobHJMMBu
	PiBpmG6xFEu5Gddp0aBA8eZI561VOUw+qj/pUSgQGhIsKOTKKkwZBlcAi8T81qJ5is3yDrGk6bB
	RHfLZHQqDxdvpDx9g==
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr44622645e9.15.1778848883620;
        Fri, 15 May 2026 05:41:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm15154969f8f.35.2026.05.15.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:41:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 12:41:21 +0000
Subject: [PATCH] tty: serial: samsung: Remove redundant port lock
 acquisition in rx helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-samsung-tty-flow-control-deadlock-v1-1-93255edbc9bc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHAUB2oC/x3NQQrCMBBA0auUWTvQCW0FryIuYjKpwZiRTKqW0
 rs3uHyb/zdQLpEVLt0GhT9Ro+QGOnXgHjbPjNE3g+nN1I80otqXLnnGWlcMSb7oJNciCT1bn8Q
 9kfxgJjrTPQwErfMuHOLv/7je9v0Am3DCl3MAAAA=
X-Change-ID: 20260515-samsung-tty-flow-control-deadlock-1d426171bf41
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 john.ogness@linutronix.d, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 stable@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848883; l=2912;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7TZ5vcA+GLdk6E7fGnm5v0lehUpocwQ4ZVzCnZFOHkU=;
 b=HSB610k4svdM7RKtaunGgLw3+2VSD01p4S4EygS9OUnKmnC03b2/KyWCaywVndUgAybnnLZpV
 Iy911zmNlEdB3AXvSJIjtzoXHQPpTK2gU4xSiY6C6ROJ3/zU5kryg5R
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a deadlock when the console flow is engaged [1].

When console flow control is enabled (UPF_CONS_FLOW),
s3c24xx_serial_stop_tx() calls s3c24xx_serial_rx_enable() and
s3c24xx_serial_start_tx() calls s3c24xx_serial_rx_disable().

The serial core framework invokes the .stop_tx() and .start_tx()
callbacks with the port->lock spinlock already held. Furthermore, all
internal driver paths that invoke stop_tx (such as the DMA TX
completion handler s3c24xx_serial_tx_dma_complete() or the PIO TX IRQ
handler s3c24xx_serial_tx_irq()) also acquire port->lock prior to
calling it. (Note that s3c24xx_serial_start_tx() is only invoked by the
serial core).

However, s3c24xx_serial_rx_enable() and s3c24xx_serial_rx_disable()
unconditionally attempt to acquire port->lock again using
uart_port_lock_irqsave(). Since spinlocks are not recursive, this
causes a deadlock on the same CPU when console flow control is engaged.

Remove the redundant lock acquisition from both rx helper functions.

Cc: stable@vger.kernel.org
Fixes: b497549a035c ("[ARM] S3C24XX: Split serial driver into core and per-cpu drivers")
Reported-by: John Ogness <john.ogness@linutronix.de>
Closes: https://sashiko.dev/#/patchset/20260506121606.5805-1-john.ogness%40linutronix.de [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2f94fc798cff..63d0232dffc2 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -245,12 +245,9 @@ static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 static void s3c24xx_serial_rx_enable(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	unsigned long flags;
 	int count = 10000;
 	u32 ucon, ufcon;
 
-	uart_port_lock_irqsave(port, &flags);
-
 	while (--count && !s3c24xx_serial_txempty_nofifo(port))
 		udelay(100);
 
@@ -263,23 +260,18 @@ static void s3c24xx_serial_rx_enable(struct uart_port *port)
 	wr_regl(port, S3C2410_UCON, ucon);
 
 	ourport->rx_enabled = 1;
-	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_rx_disable(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	unsigned long flags;
 	u32 ucon;
 
-	uart_port_lock_irqsave(port, &flags);
-
 	ucon = rd_regl(port, S3C2410_UCON);
 	ucon &= ~S3C2410_UCON_RXIRQMODE;
 	wr_regl(port, S3C2410_UCON, ucon);
 
 	ourport->rx_enabled = 0;
-	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_stop_tx(struct uart_port *port)

---
base-commit: 16e95bfb79b5d9d01dc7651d98caf3c2ace331cd
change-id: 20260515-samsung-tty-flow-control-deadlock-1d426171bf41

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

