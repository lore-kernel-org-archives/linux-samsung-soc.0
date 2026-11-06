Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971089;
	b=47D2CY9WVbh9tp89D6FRk5iRijDNYlDujMbGrF66OLPxasdKPA5dreQB5Ey26b3ht7bC
	 +cXitPglnWN5FQuBpHUsVwvKWKyd+hS9SeCTC7rhjp9jz/t80CEfSITU9YapHc0ktgWfD
	 pjgTrGNnSne1PUwiGOVpwwzrwPQy/aB78PdRPx1senmzIFtecOAo+d6zg4LK7vwXMdoUR
	 Cmz5P/MkKPKqse06vyZ000mP0bPHhqvfCf+hoqUuSiWLcfjdbkQrbpW5dZt5Vku7wOM10
	 7en7Y11mITitkJbycq2Gr6XGDf22HWIkm+R1M2zH6VQVcrTXFfJBPknhHv9XC12ueUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
	b=MK3Dj7ez8wO9MiAfGxvU6J31t7AobmHfNyH/Oy9JS3HiSxgf/hLi1LS+1TC+24Cz5I/T
	 88oA8eEWtalRG1ifabHwVw3Zbvs/3SN04OHFjAPPYdlndAyVxL+loGXJJHGEocLDfThK9
	 NkRI6GKY7tqCwbjPyPFr9Dir1yrg3TAdnVqug/yKqlIYRDhTe+6uT/sOWD1AyINPNPR3y
	 chYoeqM3aNLML5yggCTyvajNQ9gP8qeizpoz9eSCJr4t/7TK9kR5vg1oG4BvHexs4mb3K
	 bnb+g9DwoJFvgdhMPrDo01U7b+2rXU+edRIJNlb0p4MielFFWWKLb6reoOjOq/JhP/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cdtb/odZ";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869E606A32C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E869E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdtb/odZ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so340820a91.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971088; x=1794575888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
        b=cdtb/odZNYPZvberehssdAp4j1PHi0Ykb+E1KuZluoXkDGqVL+KLjecettJ/jp6MTH
         g32DMbDG8ltUzJlxXitp0Uwo3aBQaw6PbodLg7XCOjpObfcsZBErr4KqKOXySnhpItMo
         Gjh2qHVPMhXT3YjyGc6/yVItgFbAsPRj2wLtt+zgNFwQU9k50RixcQXz6SdW7b4UbXWc
         4i+oRJAhpQFVRaV0Rw8xIg7t+AUo69IqotbQHbV7Abiu+ApQbTWAeyiJsBMZXLqZkgc0
         3cnqHd3ePQ7jTmXpsA6bJhy9Yxj+9WOkyB3PpYEm5pui1Jc+1taeYgbUGVl4ebtZLUUG
         QjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971088; x=1794575888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSnpNaaEOoXXG2VcIJ6KvgGQC8uNyedzDQWKO1AUfXU=;
        b=zFuWEFfB/cWpJGOFuQ6zA0BxtlPRLOZXOYnkJISCkclEPEHCV0JDDJSg8VHf4E4aun
         cOrkH1ZTFGBqaKMkojOeTeybbyhs+hWOiG2LrZHK2KIZ7BGRDPSLPK40mIkBS+Z2jbvm
         yCgkfDsBxA3exfXnsbfg1mK8gUZSfQZLsVOwLAmSD4O8izLcCCx3ZNPAnf8vsgwgeEKc
         KpnQFbsOMlM0G9YT3KtCrE6VnmZq8Ttz/cIRSaXGZW7zJ5DXADbfhqilMeuysf6IHzrI
         yt6jn+T6T9tVrd9qV43PC88OI+bZVSIyhMB8BwBos6OmtIfhBjwfa43trdsdHUDWFoJg
         Csww==
X-Forwarded-Encrypted: i=1; AL+hErFEvOne8f+OoRfr6ybO9T/WgCqmbdaMJcpQtVk9S5ZvptLgMN3MdAjbOYOt0XWg0JzLnhQGSEr86TlLQTlPCDaYEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8q7AtJ7PCMJ5ebnJ3JG64Qa/tlZlipuQj6mH+YTgc4Y9tY764T
	VvOVFJvxdaJDTe8HzD0gWFgtWyLHRqj1FwhA3kMt6w3kI+qVY93ICmqK
X-Gm-Gg: AYBFou3uV2FCaxpnDmH13PR4rkaXz9Hu5d7fxH9LQrszdB68gsLfBy/BQcW1hEgmkX2
	rnvSlrLFYfPkg+zoWGOzLoSFK70kCUui8+jyNelaoy2gndn3n0Mvk/vuB5MzjObIxL79ne+H+y3
	geA6HyKA0mEiChh2yHD08E0cWuNoNE+kwN3E5uxVTdWjLKkHD6DgNgxHabu7+ABDBH5OjMONfMs
	DVDw5j3oA41xGptWHhKAXswEVcKGdRSwwC9biMQWrqP+8J9AKaVy5gbLnmHgpMlw9E4XqpAXwIg
	7HScNBV3lNsf4CA2VLFRSrU+oB2eowSi1Mbt0RnOf4AhiiA9jHcAopbum+UkGNZm4kW9IckJn9B
	kE6zsDWXOKc0khfGpT0OwFfdt4FnjgYwvUHT4bUkAZAiHbi3wyEaHF2jXs5Yfb2RzJxEoVEMSj4
	DbnZWvKwFIBWG8EVc2fh6jUuvFQRyhpy+QaSYt0JgB+rZnbBt7w07NdehfCF7fPgsmhj/iAK7WY
	42qF4fhnkquQRrpwIEmlj1HAcgJimfX07E9FiF8ifHNzOkW667MdPO/IT9U8TQzokGjWuBPovXc
	OgnJR02vCDnJ3vp123VrMqzw7g+kIixMumu8hZwMMwjN/moP
X-Received: by 2002:a17:90b:580b:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b0db609a2emr2299339a91.1.1793971088077;
        Fri, 06 Nov 2026 05:18:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:07 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/5] extcon: max14577: drain MUIC IRQ work before extcon device is freed
Date: Fri,  6 Nov 2026 22:17:29 +0900
Message-ID: <20261106131730.2633139-5-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106131730.2633139-1-hj351016@gmail.com>
References: <20261106131730.2633139-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

max14577_muic_probe() registers the MUIC interrupt work for device-managed
cancellation before it allocates and registers the extcon device that the
work handler dereferences:

	devm_work_autocancel(&pdev->dev, &info->irq_work, ...);
	...
	devm_request_threaded_irq(&pdev->dev, virq, ...);	/* arms work */
	...
	info->edev = devm_extcon_dev_allocate(&pdev->dev, ...);
	devm_extcon_dev_register(&pdev->dev, info->edev);

devres releases resources in reverse registration order, so on unbind the
extcon device is torn down first and the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_work_sync(&info->irq_work);		/* too late */

max14577_muic_irq_handler() queues irq_work with schedule_work() on every
MUIC interrupt, so a work instance can be pending or running at unbind.
The handler max14577_muic_irq_work() dereferences info->edev via
extcon_set_state_sync(). Its only early-return guard tests info->edev, but
info is itself devm-allocated and freed last, so in the teardown window
info->edev is a dangling (non-NULL) pointer rather than NULL and the guard
does not fire. If the work runs after the extcon device has been freed but
before the work is cancelled, it dereferences freed memory, i.e. a
use-after-free.

Allocate and register the extcon device before registering the work for
cancellation, so devres (LIFO) frees the IRQs first, then cancels the
work, and only then frees the extcon device. devm_work_autocancel() still
performs INIT_WORK() before the work is first queued (the IRQ handler,
requested below, is the only queuing site).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a MAX14577/MAX77836 MUIC).

Fixes: 14ad76825f00 ("extcon: extcon-max14577: Fix potential work-queue cancellation race")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 5476f48..1267769 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -674,6 +674,20 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* Initialize extcon device */
+	info->edev = devm_extcon_dev_allocate(&pdev->dev,
+					      max14577_extcon_cable);
+	if (IS_ERR(info->edev)) {
+		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
+		return PTR_ERR(info->edev);
+	}
+
+	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register extcon device\n");
+		return ret;
+	}
+
 	ret = devm_work_autocancel(&pdev->dev, &info->irq_work,
 				   max14577_muic_irq_work);
 	if (ret)
@@ -712,20 +726,6 @@ static int max14577_muic_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Initialize extcon device */
-	info->edev = devm_extcon_dev_allocate(&pdev->dev,
-					      max14577_extcon_cable);
-	if (IS_ERR(info->edev)) {
-		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
-		return PTR_ERR(info->edev);
-	}
-
-	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register extcon device\n");
-		return ret;
-	}
-
 	/* Default h/w line path */
 	info->path_usb = CTRL1_SW_USB;
 	info->path_uart = CTRL1_SW_UART;
