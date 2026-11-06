Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971082;
	b=bHvPtaYbiB6XYrHRumRVl+nK+h9QUW2SCWQS23s5gEZ5cAHYQzCvUkwfaginMsU/mcTX
	 notmyrK4YTbuB5BNeyCxuXC4HOG4yfL4yBWv8d6yGimn0e7s2xcx9hXSFrexz/2IxS7q9
	 +gPP7Xq0u8feDDybT0+Hu/QSfKUbvmi7VpK560TjPDjDj/FkclY0SLANdhNevpZswq/bE
	 Ga/QjkwxbMJKsGEO0tC7ngXGAjqAhv56YaHSxTTP8qibS9nDdftipD0+wNekD8zm29/Hz
	 CMxSbVYRhAJfNPwzpxy0fJjyNo6VxaYSiiUXkDj3SzOmbL5gHxi07X9TSK+8KsWQPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
	b=UCh6ULIRtfhbJ1Gi+yM0WvOvpp6/2BlbGU2UFvewRw+lHQurpzL8OFmQ5DCj/75ZN97+
	 PGt+ql+Q4E+igIbQhDzuoahqcIopoQrQUEds/IID3Nyy41eXxq/gMnj5XrH33ZQ6pAC9W
	 mS27dlRXEPl37Npbf5QtRSnjO7Y8eThVxeSHhZn5Uz5kFPecTbNGKWAAfvIke2fMldMrB
	 tC95PrVOoB4F06k5cSXq4KPLW2zzllWVWo8Tq3+L608gND6Vy1aNeAufk7+iAeomNoGtq
	 xNGcT/S2cKe2fBIkLm2dUMCqgXwVrLCLOxyk7nCJ8lNmAZY0RpcrLnUf9WgStFJJz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRQTt+3H;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57D606A32D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A57D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRQTt+3H
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso292254a91.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971080; x=1794575880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
        b=eRQTt+3HAcikpyyqip2eed0SNs12Pyb+897E3wzePXTtPxRx3tqIHGG/G8Len9CQD4
         POSEb83IziCHdkZkdlc+CIvXOu4N0fZPjRFzetlotDbUC2nmtAc9aMG/RDnngQscifl2
         TPtbBc6p+Y+5KG7Xps+yBXvOsNXkBCPPvvMut448592EshEjgD4PcuVIEV/dKVcSzo6M
         PKEBTOqraLbio9bEw0QeVZliR/FzT7TRrYuYPOIQcQCMUB5el5OfdmErKVAtaVK7EkUu
         8KTpRZGdSQ5rbrhcsxf8C7GozNTjsttQmqZzmMciFOqGpb+YrqzulAGLHuaSwL0aOVmn
         GSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971080; x=1794575880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCmCUD5+cRAdCqiqdhrCpwSJ5tYiyygF2+7HyPzxiCw=;
        b=WVjuHlrAiwPT9+coMuO3nsXcxMw+0cy8WTG+xwsslv7ooih7DtcTccnb2f5pPP9tOG
         LPAHwq7TXYI7YHVIRqCGSfPFrucF8DDMhqRu1dS7bhbkaa+3Peh4QkriK1sNDgiUqa05
         TdkopiJZYk9OrhC5h3OuIMVxJc76aOEYm7l/AeepM6OxZrY1flQ2hGBaAreetPGh9hy7
         bna6Je0jzkC8kQC34UCvtzIZc69TmqQt7zhzBhnshfa4XF9hPGOqByJBKWfFKGIzhtIe
         r0RLDn1CmXhw9Wd/Wx5l20zFVMZSOa9yYnaqckIOIf56iEdEhJUcmBCa6Do7QctY+VMN
         HJ/A==
X-Forwarded-Encrypted: i=1; AL+hErE0lxw62v1vSmp4DRIjJuL5vEYxUNFWdaJ9482AYrkJ/UUA3jkWQ24o0gRIh/av0a2fGWmKooeTsuYDNUnL038hew==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GT2mVHwASHlMpxns7SDlkUquoOs1VziIslnCL7E2pVoHtJNHL
	beDpXmTIHDs0lWGV1MtRbEdT/vPmdiG5Y0h8MKj4jSjHN63EpbRtT+g4ftVVx7QL
X-Gm-Gg: AYBFou21rqJvamK5Veu/7AZPtZaGt9fPpZM5rOsnkBxLV1Z9m8eWcDKV8W1GE0srQIL
	l/g2FG1hFX7tzZ9QgmblOeh/3SolNw15XaYc8aGJJJR6hpti4Qc1awa413R630YsRhogLEwlo8P
	F9uS3AX5fmcGrEjtZB/m0yz/GISHsJjF4p0xv8dFLf5DEdZVFmyfT49gZTTDde0H1pt9K6uEEvl
	AfKfCzJmRg4XJ4vVc38x0q9wj07lUaTdBgcKNqDt1XrCo+2uBgrnJLvpdo45Y/i3bq2Jjg+/oTD
	AOJ25FVjlygvS1V7puI+xD1CwioZsRYSolZrgqPu9YbA3E6UqoSv+J1WXJF8F+t73pQfEK+Y8G+
	W38dBXjW9MMVB4hIZlYvwN8dgtr5sj0l6xX34tKXyg6Z81j9x4+W4HoQQ0EodDr9C7NhhRcItny
	4stoxNylLnqAAuX3ZiXqWBXW0i7/Y1HIkipOpxCVt+HgVMSNDKaQRRtJTWdYZqHe/waLhe9dyYH
	zoh02q2+pV+PDQJbCkBoxuhp7cHLaAlr1khFqm8HzmQ1UCz6D7zYNMLDUyn02jF85RZnzRUqzwq
	zQR+v4ao2qfRyIiz4sKfI3GirxQuosu88/ZgElx1Db1MfkZE1pD1Zp7QjPCU+CthVaD6IQ==
X-Received: by 2002:a17:90b:4a10:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b0db7109dfmr2536524a91.59.1793971080497;
        Fri, 06 Nov 2026 05:18:00 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:00 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/5] extcon: palmas: drain ID-detect work before the extcon device is freed
Date: Fri,  6 Nov 2026 22:17:27 +0900
Message-ID: <20261106131730.2633139-3-hj351016@gmail.com>
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

palmas_usb_probe() registers the GPIO ID-detect work for device-managed
cancellation before it allocates and registers the extcon device that
the work handler dereferences:

	devm_delayed_work_autocancel(&pdev->dev, &palmas_usb->wq_detectid,
				     palmas_gpio_id_detect);
	...
	palmas_usb->edev = devm_extcon_dev_allocate(&pdev->dev, ...);
	devm_extcon_dev_register(&pdev->dev, palmas_usb->edev);
	...
	devm_request_threaded_irq(..., palmas_gpio_id_irq_handler, ...);

devres releases resources in reverse registration order, so on unbind
the extcon device is torn down first and the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_delayed_work_sync(&palmas_usb->wq_detectid);	/* too late */

palmas_gpio_id_irq_handler() queues wq_detectid with a debounce delay on
every ID GPIO edge, so a work instance can be pending at unbind. The
handler palmas_gpio_id_detect() dereferences palmas_usb->edev via
extcon_set_state_sync(). Its only early-return guard tests
palmas_usb->id_gpiod (acquired before the work registration, so still
valid), not ->edev, so it does not prevent the access. If the work runs
in the window after the extcon device has been freed but before the
work is cancelled, it dereferences freed memory -> use-after-free.

Register the work for cancellation after the extcon device is allocated
and registered (and before the IRQs, which queue it), so devres (LIFO)
frees the IRQs first, then cancels the work, and only then frees the
extcon device. The ID GPIO the handler also uses is acquired earlier and
thus still outlives the work. devm_delayed_work_autocancel() still runs
INIT_DELAYED_WORK() before the work is first queued (the IRQ handler and
the explicit palmas_gpio_id_detect() call both run after it).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a Palmas/TWL6035 USB PHY).

Fixes: f94a5becabf4 ("extconn: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index d339b86..f7496e5 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -237,12 +237,6 @@ static int palmas_usb_probe(struct platform_device *pdev)
 			palmas_usb->sw_debounce_jiffies = msecs_to_jiffies(debounce);
 	}
 
-	status = devm_delayed_work_autocancel(&pdev->dev,
-					      &palmas_usb->wq_detectid,
-					      palmas_gpio_id_detect);
-	if (status)
-		return status;
-
 	palmas->usb = palmas_usb;
 	palmas_usb->palmas = palmas;
 
@@ -265,6 +259,12 @@ static int palmas_usb_probe(struct platform_device *pdev)
 		return status;
 	}
 
+	status = devm_delayed_work_autocancel(&pdev->dev,
+					      &palmas_usb->wq_detectid,
+					      palmas_gpio_id_detect);
+	if (status)
+		return status;
+
 	if (palmas_usb->enable_id_detection) {
 		palmas_usb->id_otg_irq = regmap_irq_get_virq(palmas->irq_data,
 							     PALMAS_ID_OTG_IRQ);
