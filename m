Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887C377563
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295487; cv=none; b=DVTjvMXQ4oOcUSw+5pTkZh8pklp3iHWw982TUz+5ws02DZdIOiNHblzlvt2AQg3+OzAGbp/8waH5TPsqNwwlLyPU0TPsWKDC6b/dcZS3YkrVdFdJmAQ54KK7qYwpDpt8sgz5WCm/7a81Wmyyc1faJatjHv+FWvgS5M1+Rl+bcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295487; c=relaxed/simple;
	bh=VouvCuUd/6iJICZZJOMhr223Co3gy72m5EBeKMWsXXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r/Cy15w0oR8DOccp4eZnOxmUbdOxj3OEv9MybKylqrtv1LvrSFHwWmkAkdRYHlodcu0bq7GS65syMzCg6QSr1uANlPdRX0G7oYr1QPmzSWI4nSk3/fIYnCjl0PUUdFXf9F8Z0WbWgSv2rUquE7akOCErhnrZbI6on32f3T4+q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn2cQIxf; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn2cQIxf"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5351d76e1baso14324111cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Oct 2026 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792295485; x=1792900285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=Kn2cQIxfO64tBWXSZIr6Ui860cstgm9pqbmYzL+BJ5QiCo+QGBnmNXKYU0WvSS/KdK
         MTytpV9Z+3ZycTQ3cUDImbKfTufNLi74WmczakqOdv9ZbEjlKLjfFEfD8XWO8owCHqnb
         FIMua00NNA/+JJu82y2vCP542LIvCTq1W4Ipu9iQNNvYhxC8ALuvZ1DVwDGR4i0qLmuj
         Rm2phoHt8+8m6cd9z0TXhGvzdqkpqLWuHtZ+wORFGf6ky0YvCxDcjLsSioT34NJWdVuv
         gFh/09Hzsa+C+rezpaDRnY5/PmFCkUqLJk97nz9jyuNfBFZgVF32jHXAoJ1MEMUgytXl
         2X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295485; x=1792900285;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAlfdGBaXEKTM4aRdqODW2suuLZt+2xf1jp0Ji6ORdA=;
        b=w74dGqrY5TgR73xKiwujGGUG3dMUIXouS+xW0xbRjGqoc9Ut+7wKzApdt0AahYBSAU
         9OVS5kofhfVNl4vVIRqwj2KYFQMQB6UOEszLyRCk+ROgQCiT/eLpt8PCVoIXYsNXap7L
         RVv1nDLafRqzIcGwPwdtRRgCH5+MdPnwFKOiOTRP90jZW8ju8hO1dBx8KCnmAhDBEPDJ
         d+QcKoujYxGq+82rU1rjhhXoFRPPjA+KbYowRDGoBPVWdg6028ZYDtFxtWqma9wIJORd
         PkVkchvusdN7gUA7rvqBoa6dgom6c/eijdenhcusk4yKFa839q2yeSomuqeSs1JrZ6Zq
         10wQ==
X-Gm-Message-State: AFq9FYK4RVTqYyK9zLvhHgx+OtuofG/95M3/dsSxW7SjddO56aup+ys4
	hpKitwHXIcwLn3b7S0d2XIM40yw8FBQYCbTGhVhjzEVOR+d6au82EDA=
X-Gm-Gg: AYBFou2l2519Gc/OAXHgD5t+t8Z1pT5qDrNFCta1x9jvuJaGP9RrqftZUd4BD1pPfM1
	Eg8sDoVuQaB7dujqCSrbVHpHuwoPeSRY8U1/Xu9Q8iVlOx+oDHW3zvCg7Rbux4urFlWARmuMR0E
	YEclTeZzGbC4qQlTRoiVhoyz/cd73BPh3qelpfGVLdiwJsuGtMlMZ9RMd8OexnC26dKlwIxFawd
	VXJvWvbOJeebBbN6e+v3504GMi9vBH4R8lZEsIx5Td9x0FuSiM09DYwf999M5ALRfSUFEKJZv3N
	SmMOZXj2LRN1Ni4xMau/+g6oJ+PsBYVfCeZjBR71AtMXlN1VH7K1xYbq6x/cfYqN3/O3EYhg5aV
	A07TFCP6154r0u2i0NRs2QjGCHnZpoQnH9B0xrGH+Dazq2z6Kret/motBgoP6lVk5sGtZPq+skO
	jTqSVwQSZvg3uo/f0+IvPAFBLo6E9FJIbkernFdhlebiNYmOZ+zipzK05v7Or0bAaNDj5kyOkrc
	GuR4cl2Gl303KP+1E3hHpcXC7/m0o4sKWNUeMZ4nWpV0CrDCtb6Fv2bMN5wskWJFK9FjIAPBtaK
	7XDhQurYsPFONB5y8tr2IB3WcqEQ
X-Received: by 2002:a05:622a:1813:b0:535:2110:a9f6 with SMTP id d75a77b69052e-5364600602cmr63576021cf.18.1792295484793;
        Sat, 17 Oct 2026 20:51:24 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536660162efsm1032371cf.27.2026.10.17.20.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
Date: Sat, 17 Oct 2026 23:51:21 -0400
Message-ID: <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ handler reports transmit and receive events through
cec->adap. Adapter unregistration masks the hardware interrupts but does
not wait for this handler. With no open device-node references, it can
free the adapter while an already queued IRQ thread still uses it.
Devres also unmaps the registers before releasing the IRQ, since the
mapping was acquired after the IRQ.

Free the managed IRQ before unregistering the adapter and disabling
runtime PM. Request it only after the register mapping and adapter have
been initialized, and free it on adapter registration failure before
deleting the adapter. This also makes IRQ release precede MMIO release
on probe unwind.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 4a92d32..e83705f 100644
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
+	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
+					s5p_cec_irq_handler_thread, 0, pdev->name, cec);
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
+	devm_free_irq(dev, cec->irq, cec);
+
 err_notifier:
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 
@@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
 {
 	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
 
+	devm_free_irq(&pdev->dev, cec->irq, cec);
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
 	pm_runtime_disable(&pdev->dev);
