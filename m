Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733E83CD3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Jun 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406937; cv=none; b=ofgaOt5cltkMONHkcqrgMDXTeQ03DLmW5L5BkdELsjXb5igukoOO6Ddd3CYTqyG/70vHSneCnDzE5psJNPDg6mKV0c9iN1FHiSPda3QzLZW5tMY3HF760+/e2Wffrjv1IQFK6ZC5Yycczx8ZeXooIFv+IYvmtlH6dQfp5gggSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406937; c=relaxed/simple;
	bh=cXNr8lvilFqgnUnNUc6PKltH1qdIyJCwlrLCI0cyV1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNixWpceU4ZtxbSuFLKswG3lNhmd/70+vvqExb71cpQgKhgcTRAHCrs+DOKCTvmTo886Fc50Y/xelExuYLcwaxEfKfd6PUTLbcAU+Zv2IKU+Bhiwx+fx/Az6QB+kGhAYsu+zvfYvvNxajZu0VEQUq7JerXEPsLM8SDKzgNONzQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ui6X3A16; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ui6X3A16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zB4c4eCfnz+o1bXx+7F5PGzh74D33KxHOsl6JG4Vi7Q=; b=Ui6X3A
	16IW+rxfswIUoOxPQdNpXJb1qt3Ej/swGYi6cEelNUy/BktzD+4Tpu7wJwctJTNZ
	ItJTxPDmyhlfxRD4fstRaD5jZooxNJcLWCqTNaSTX4PBsYJCqZlV1AqXbAD3icee
	lsCQyGA3knPCwkO75kFOVX0+UIPFAhzwOa9pz/zG9KmMuRzxI2TWUHE6X1nKzONJ
	uv5pxs7ovC83bXEGAdmEomI5n5gYKO9VpyifUCNlqOVoLa9N6AFM+/fn2Htl4lxU
	xwRnPPwCRdoOum2yV5w7b/k7ODs2L8BgriX+kYIyCS1uxEtR3Z+kLN9CrsV0Yn5A
	nhe8Xl1j2VQdAtDA==
Received: (qmail 1903230 invoked from network); 3 Jun 2024 11:28:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:50 +0200
X-UD-Smtp-Session: l3s3148p1@LNQF9vgZPJEgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/8] media: platform: exynos-gsc: use 'time_left' variable with wait_event_timeout()
Date: Mon,  3 Jun 2024 11:28:36 +0200
Message-ID: <20240603092841.9500-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_event_timeout() causing patterns like:

	timeout = wait_event_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
index 618ae55fe396..f45f5c8612a6 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
@@ -1225,7 +1225,7 @@ static void gsc_remove(struct platform_device *pdev)
 static int gsc_m2m_suspend(struct gsc_dev *gsc)
 {
 	unsigned long flags;
-	int timeout;
+	long time_left;
 
 	spin_lock_irqsave(&gsc->slock, flags);
 	if (!gsc_m2m_pending(gsc)) {
@@ -1236,12 +1236,12 @@ static int gsc_m2m_suspend(struct gsc_dev *gsc)
 	set_bit(ST_M2M_SUSPENDING, &gsc->state);
 	spin_unlock_irqrestore(&gsc->slock, flags);
 
-	timeout = wait_event_timeout(gsc->irq_queue,
-			     test_bit(ST_M2M_SUSPENDED, &gsc->state),
-			     GSC_SHUTDOWN_TIMEOUT);
+	time_left = wait_event_timeout(gsc->irq_queue,
+				       test_bit(ST_M2M_SUSPENDED, &gsc->state),
+				       GSC_SHUTDOWN_TIMEOUT);
 
 	clear_bit(ST_M2M_SUSPENDING, &gsc->state);
-	return timeout == 0 ? -EAGAIN : 0;
+	return time_left == 0 ? -EAGAIN : 0;
 }
 
 static void gsc_m2m_resume(struct gsc_dev *gsc)
-- 
2.43.0

