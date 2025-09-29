Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE51E511
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120694; cv=none; b=ldwmhwcz8AF5nKyDoJebvbpv0gzgS1SYaoRhIsJBnqVuzSHFl5jmHK+yIrrj/b170hFTXx+8s2dgfTfi3zOsJuLWIOXtTRIyFf+8Blck/63uHTt/aibvwlbvvDgvLGmiSAcJBwQlyJlBxUFoWvGNNxq2H0GB2wGh+AeetYSaW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120694; c=relaxed/simple;
	bh=AZ6DU3ilvbOOxYJWW+oCWHWJRZAnAtVHtvLx7NoNWk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=TTJvklvP+TJITLQw6WGBMuEKHvjpRxGe9DuEfS79KHId7wPMWPzDtdbt5AMyIPHeFVyil2I/zIoxpSN9bHUCoab0i8D5y7lQuOgpRSAczrNLuedUpwMATcQyhsox6IRNaXBcOnaPxBKqQIRb00nKYcWHxjv7MkFQ0UhntoH4O1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X5vFgjR2; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X5vFgjR2"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp03bd48fe0445c4309efcf02085a3b97a90~ppnbTcXmd0487504875epoutp03M
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250929042918epoutp03bd48fe0445c4309efcf02085a3b97a90~ppnbTcXmd0487504875epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=YSVaMtuyuSZZ1up/bnEVaaqJsX9Frjk4SuqMGWpTs64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5vFgjR2l4L6b7NiucO1Gnr+xHkgGl7MZYoIVi7/uLllwe5iBIprnPGKf3ll2Zguf
	 cu/LtcY53z+eZg9Xst/Aoi8cRnWVpdkmvD5DBBITb7R9hDBy8Enyynq0XV1LVBLCjD
	 2aLer6162rjBn6jLXpdKON84Mub2r+6cUmDCEtGU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p389736ec498c2e1e07be26be0e12c7636~ppna6NSXN1841018410epcas2p3d;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9p0SkJz6B9mG; Mon, 29 Sep
	2025 04:29:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7~ppnZ_6lVS1831418314epcas2p2O;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip1cd0804751a75e6720cbf5da675545d7a~ppnZ5hi7v2403224032epsmtip1i;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and drop
 manual cleanup
Date: Mon, 29 Sep 2025 13:31:09 +0900
Message-ID: <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
	<CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>

Switch mode-config initialization to drmm_mode_config_init() so that the
lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
from error and unbind paths since cleanup is now managed by DRM.

No functional change intended.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 6cc7bf77bcac..1aea71778ab1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 	drm->dev_private = (void *)private;
 
-	drm_mode_config_init(drm);
+	drmm_mode_config_init(drm);
 
 	exynos_drm_mode_config_init(drm);
 
@@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
 err_mode_config_cleanup:
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
 	dev_set_drvdata(dev, NULL);
@@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 
 	kfree(drm->dev_private);
-- 
2.34.1

