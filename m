Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451218;
	b=0iUNwJamK2Q1vW1ysUJfM9q4Y1KM+3VHtkSrZLksLkNcATt/tZ+W9Xm/TmWFCsJU5HKZ
	 QlQNRcf5Dmf9OGpyyTQuUCNfNbfyP7PRbivReyF5y/1s/Vtp4BORXyS6PEWH+ERY9yFxJ
	 DptKNKv8xajpZhPh3MWSG5huemUMPrvW2pJl0V7+sLVHLe/GWFd6gDTpAzCUE6XZZV+Uj
	 LZAgnHEpypt8hbq6qBeyuBuTJbFYME2W2NUcGHeRG/z90CfOv+QLZToB5p9z+N1h+QSic
	 ukl0Wy0L+87tHQq6Rl+KmfwcicjBHadbzhkf25R7gObAMIWCz5ng7MLoD7MOw4gJ5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
	b=3lhw/jESV/5+1GI8WKslkT/bFGx5lvYlcaTvKGj7S5IjlEqmS2mVGdWrZ1aGaBkiZMfX
	 SGduPJw/sqoQwqu6DSYzxlKCt/3Lf81sQG70aWwoc4cHKNwANBzh264Ddn5tXtTkxZv7h
	 bFHeM3rgXEKKemCUJ2KZGC9+jj0YYM58ikr85OfST31xLZ+7XNzOzAYQPzoFymfRwjBbT
	 GiX8m0WdOE2LM/jPtDiLedApHUWjl4BVGRDI7/QrH2amRGsCweqxyMBWORI7CybM8nDrE
	 vjJO5kfoUbP/Zg0qNBc2OfzM1wbLJ1hj1h708+TOfAp+mbe2pYnI5Ghywhv/0K4F3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hm4hnAXq;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F9606A324
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 23:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hm4hnAXq
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9178d514951so21973146d6.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451217; x=1793056017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
        b=Hm4hnAXqJAQgYrXqOeGc9+8J+aE1I+TL+SalozRMx9/bYz1NuT8So1KGmSqpI4j3xc
         YMrwm5M5SlISJroNW/pxWs7gZc/lKhkorZJxAssgOREVyzkGvMzy82jRffq/fdxsiDuf
         r5SMYHSLevO+6YRrAYtdjydDi/dATxxsxAkAd7c4eSHSUhuR9MWYaSzaqw6gu+mhNuHz
         CmN6m2dGNwZjLv9YUOhrNTbABhOx6/wEEvmQs4xQfNOjHtM2jxDANeIHfL2hfgMLDad7
         cXoMzKiOGZeov8AHi1a8/zjRvewPcDGHPy4tdlKXV2+nJIlyKKALqSZqaPi6szgdgQU9
         ywBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451217; x=1793056017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI+3DKitrdejqomr4uOZhFHbSbiOklqRvcG3ea3JJEA=;
        b=EcYCOhu+Xipgfw5Z+jrRlSx44lNpXFiEUJs75+gsjRkqnUdESmHhUtjPjQBjEXjZbK
         EMJqykCPDWvi3otqUVYPYFV36MYBEpkvSbCOz+tawbusQWbNVelgPiKKM4PYQc11AiWg
         3JszzYOdpSHLpex0TSbKvOtBC4hCbd5KpxOfhapDKz5JY76DE0A6WQnjoxGiWERpDXlb
         YvvTSTaV3Z+QXFHUoUGkl8KJD64KjNG75I/Mkqr5dUSU3/PJf/nzZzjcg3pkGZbFrEqq
         Frv/gmBdeV+Oy2ptNUu85PpY52OPRxS7CRnvNa5AYbe9sNeUt1Li8QAF8HrSdpY98RwW
         VGsQ==
X-Gm-Message-State: AFq9FYLcI1fCWNH/OoJbxiK6fHve1ILYTpU8Lju5jiHQxfA2pIjaEvaz
	+7iPuUgpOJXRKJwq23/sTvf8szht1WXbfGqZSzOIg2i42UOuyP4YZVY=
X-Gm-Gg: AYBFou3Tehy3d29y7w2aQiXj2iFU8tTomDiNBmJAzbkBk/EChUd+VvFywsEToiGj6rk
	YnZkL8/ezIudfsqXCveipZ/fNeLTUw2TAzMv/uDmqkeZ4uXThEr4io5JPchAWGkW/2/jxM6c75D
	phFqXjUJICxbdMjsmnEtezm7t9QfFq6qE2orqJ1MRyg493ZIGuPirNUtHU6ZL+7kHmGUUCRj5Vk
	h4BlMjhFuA0VKOnyVrrQmlvfw9IM0u8bFXkfEj+XZfCay4bRs542JVJxU12P/3J0b9V3QiOYkv/
	Ek3ELo+Kk++6ass1Sm9uCqJmQYaR7vdcieWukEUecr5a92mrO9gtcfqR2hql1DFxuSse/q+A7cz
	RYjjX5zwSB3uosN1QzYTxRvEMiSyDCyQzsbj6JYsmwaY3gZGflIgOBt3BhRPkudlVw6/cuoNCeV
	QZH3hhLg6q4jDVOWgJ7XrGfmlIFhA679VXcG+lisq8VzzD/DPIHVR8hGemrP2erZLI/xt2KIHOp
	yAs+obiPG00/ij4+NidUz4idRsPP8cqNKC+j4wAGU9ZsjcwHm0S5dRYPGxMpKERFhq+L4it/cjV
	gUz/5d6Q2fblOk0EW8814RJbGnWB
X-Received: by 2002:a05:6214:468b:b0:917:a8ae:26d6 with SMTP id 6a1803df08f44-91bdf199a1fmr163819196d6.34.1792451216575;
        Mon, 19 Oct 2026 16:06:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c04a5791asm6822066d6.2.2026.10.19.16.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:06:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] media: s5p_cec: release IRQ before deleting the adapter
Date: Mon, 19 Oct 2026 19:06:53 -0400
Message-ID: <179245120580.760232.1413226255768013894.s5p-cec-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
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

cec_unregister_adapter() can free cec->adap while a queued IRQ thread
still reports transmit or receive events through it. The managed IRQ
remains registered until devres cleanup, which also unmaps the registers
before releasing the IRQ.

Use request_threaded_irq() and free_irq() to release the IRQ before
unregistering the adapter. Request it after the register mapping and
adapter initialization, and free it on adapter registration failure.

Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1.
No hardware runtime testing.

Changes in v2:
- Use request_threaded_irq() and free_irq() instead of the managed IRQ
  API, as suggested by Marek Szyprowski.
- Preserve notifier teardown before releasing the IRQ in remove.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

 drivers/media/cec/platform/s5p/s5p_cec.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 4a92d3230f661e5f33137eaf81418d5fa529f812..9ce37f2c9ea87b2d385c7eea86bdcd7bf9d642f6 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (cec->irq < 0)
 		return cec->irq;
 
-	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
-		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
-	if (ret)
-		return ret;
-
 	cec->clk = devm_clk_get(dev, "hdmicec");
 	if (IS_ERR(cec->clk))
 		return PTR_ERR(cec->clk);
@@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		goto err_delete_adapter;
 	}
 
-	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	ret = request_threaded_irq(cec->irq, s5p_cec_irq_handler,
+				   s5p_cec_irq_handler_thread, 0, pdev->name, cec);
 	if (ret)
 		goto err_notifier;
 
+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto err_free_irq;
+
 	platform_set_drvdata(pdev, cec);
 	pm_runtime_enable(dev);
 
 	dev_dbg(dev, "successfully probed\n");
 	return 0;
 
+err_free_irq:
+	free_irq(cec->irq, cec);
+
 err_notifier:
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 
@@ -254,6 +257,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
+	free_irq(cec->irq, cec);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
 }
