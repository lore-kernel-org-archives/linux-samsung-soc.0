Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971094;
	b=G9SYdkFZaNjriwtvpGD2okQOqrbH35D3Yr5PlnhFD5WMcq+YJqMEUQbNiMLYj88N/lhL
	 5jaaeUW0NYK/JuCEq7RHu3jhg/OPeRh/M5b3OhG1o79AvpjL3WzfMN1eSpy+xYhLKQVNu
	 UGUiutn93OuMPeAMj76R2mBMEA0DO3Jn2mMnSDFFzvjGZLonjNsOJk+i+Tu4qJjyviQd0
	 fnyY3MhPbTxvkwcURS8Stm4rUImQy8QqxKODVshp37aqNa/ysX8Z1F4Dsmvk36r37Yf/s
	 klOZDj8lBpDnNspQxS/9R2xVVG8rTrEcB6E8svEbatIircIHLKnVW5e10uGJVxcPbGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lyVXxhqVdS/iGnj6NynJN3xUIHVLrLvXHKOHq+9pwkU=;
	b=25xHderTt3gjpte8q9lnvw5GsWpe/d4BdSuHiRSMS73tkUfuuJ7fXU1j+ghMrgcZyTJP
	 GQ5t2dPASfAAxoAGQrXU0JFhlB1GYE/RvXOZxuYH5K71FMwRz/MnpyMAxPJSJYeHDqWsd
	 Ev2mPh+sElgpoIzSqii2ooRoZS+iexHCOr1fDjjWoO/Aq9dWk7fY3U46B2YwIfeZgO6Kr
	 03oh+q6Xp4cuYrtKVA+nyKg67WFtMtDWXGIngMmuJI3REtm0o2ivTo04vXkxYXCdx1eod
	 xETaxNTuCdWa6jMk/bFmvlRdnyeb3JeHfnno06eXcQVeNsad9J87bOyu9AAfM7hZBkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j7Dn4nS2;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C9606A330
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7C9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j7Dn4nS2
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2382bf051so243889b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971094; x=1794575894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyVXxhqVdS/iGnj6NynJN3xUIHVLrLvXHKOHq+9pwkU=;
        b=j7Dn4nS2FlTDkjtWUWwow620dude761rH0HztMU08Ws7MnpuJgtahTKaGW+wxQa6Xi
         t8Bw9fPSFTvs3qnx01Yrmo8pvJZloKokkDFR/hMUJkb5Hj8nUadMOspNIAhtVhccdjhT
         3dlFxzhw2IabHdEp7i9bUqZ7AHYMgQAqy97E5WPoQqO6YA9Ol4x7kthmSxUOfDJMpHUy
         H8LFV/D8/ViViNYVEHiZ//WcpfY+F6aF6gp/fCPXHD2dssuwGgLgV4uKehiHxeCzaVyF
         EOMCZb0QlFJ3qFLPUIOjamEAOn7Npd26BFz1RbMHN7GnKFhYyCPGb8Og3ZUILArCcQpo
         7YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971094; x=1794575894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyVXxhqVdS/iGnj6NynJN3xUIHVLrLvXHKOHq+9pwkU=;
        b=UozCCZI1tI3uMC8EYOs+HrcE4O0L8XGPqhuLWXLQZiwDIo6fL2LuvgN9fjjuD9Q9by
         VQHsXr5v9Ia0MbaUbA1+C2iWut5u6YF5qqJHtNmYEBTlVfhJvYnoysXH6DgduZPPSa7M
         RVy27JwxN/8xpvtcyD0AU9mA9Zc3biRxIHjbUBlAs5DiKxX0HBo9MEBJTvO4F5dx0MVY
         nlyhtO2fe6f29ym9NwQrRzhFGcuSl//+tiz8upcmai+JJOP3PSdQ7CC2DvktPL4TNcwz
         qYAc0cVxC7PtGfv89qt1+yNvia/F5V6XNk/iDlUl20anRjilKEtcLl3ra5Kh+CqUKZsv
         97ZA==
X-Forwarded-Encrypted: i=1; AL+hErE8lt2CZGrqk+13UDjlnpdF/oqFT2xQNuF4q1BkiKqqN6Wqh2B5Vr43XTbu7P1sXxcsa6F1iWhRzhF6iLsLKEkPDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CpOMsmpVSQLVvcm3hv4YGVTRyzkfdFBk9LNE61VH56YCF+kUU
	fdlyx3dkuIDVjXt9ugpZzybiolWH3+GGE554Jn+3z68nlZ6WXMnHP/WZ
X-Gm-Gg: AYBFou3sRRCVmiS9stVFQIA13pSaVl+QWJL7HtAxULZV3hssx4FdF8noXTg2k3wbCbR
	gJlRcuxyZ8S8BGyMTF6iCcIgcYH6SddSkyY3FXFwkadIgiA5xPRHzC0/J2sqdtGWEUDH8zF1F4i
	pIKcQGcPKkxTRpBzAG7hNO8zR9VSO44W+EqHeDeCh0ZyasrYCYv9wZd5NoJXhLTHluWMICIufXp
	iOAalgNZfLsxWFnn8G6EWzZqal7KKYK1+dAgDLP43pcmTIldPPrMryEP4d3PnIeDp1T3+Ft8+f+
	eiqB31xqcQ89GvH+HjdX0HF423kiz1nrwLW0+GuRlPJfREXqx9gecSvc5H0clIBYPUk+dTTOZGR
	cz/3SdOlcVFJy52Ne9anf6but3xZF4MFfL4ffxm1q8q/vbtDEtwwsb4yzL4sVbwkMrifcTyRm0g
	ZGJ0bPIhbezunT1DqS6q04qhUXgbJwMDpvjkrW3/LBgw/GmoPz+j94YAk9OfBSgTkwpbzXb0rAp
	xgRfBGdCulTrKBT2Sf4XZYsG7MlcTXg+FNPyT1aQE/rs90qMyoRB+x4S/GY+xck33irNz0cNyBc
	QVDigLknkchp+X6Vb4I5sL9quShJz9LtGQ==
X-Received: by 2002:a17:90b:1fc7:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3b0db6ed2f0mr2460315a91.60.1793971093785;
        Fri, 06 Nov 2026 05:18:13 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:13 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/5] extcon: max77693: drain MUIC IRQ work before extcon device is freed
Date: Fri,  6 Nov 2026 22:17:30 +0900
Message-ID: <20261106131730.2633139-6-hj351016@gmail.com>
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

max77693_muic_probe() registers the MUIC interrupt work for device-managed
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

max77693_muic_irq_handler() queues irq_work with schedule_work() on every
MUIC interrupt, so a work instance can be pending or running at unbind.
The handler max77693_muic_irq_work() dereferences info->edev via
extcon_set_state_sync(). Its only early-return guard tests info->edev, but
info is itself devm-allocated and freed last, so in the teardown window
info->edev is a dangling (non-NULL) pointer rather than NULL and the guard
does not fire. If the work runs after the extcon device has been freed but
before the work is cancelled, it dereferences freed memory, i.e. a
use-after-free.

Allocate and register the extcon device before registering the work for
cancellation, so devres (LIFO) frees the IRQs first, then cancels the
work, and only then frees the extcon device. The dock input device the
handler also uses is registered earlier and thus still outlives the work.
devm_work_autocancel() still performs INIT_WORK() before the work is first
queued (the IRQ handler, requested below, is the only queuing site).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a MAX77693 MUIC).

Fixes: 74047eaa2281 ("extcon: extcon-max77693.c: Fix potential work-queue cancellation race")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index 2c567e0..f151787 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -1128,6 +1128,20 @@ static int max77693_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* Initialize extcon device */
+	info->edev = devm_extcon_dev_allocate(&pdev->dev,
+					      max77693_extcon_cable);
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
 				   max77693_muic_irq_work);
 	if (ret)
@@ -1156,20 +1170,6 @@ static int max77693_muic_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Initialize extcon device */
-	info->edev = devm_extcon_dev_allocate(&pdev->dev,
-					      max77693_extcon_cable);
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
 	/* Initialize MUIC register by using platform data or default data */
 	if (pdata && pdata->muic_data) {
 		init_data = pdata->muic_data->init_data;
