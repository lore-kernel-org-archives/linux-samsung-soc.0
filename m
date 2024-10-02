Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB9517BC9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847228; cv=none; b=afZD/IN60/z/w5bDXBCMRo0EToseGAEmANojikB9rf65RBbI9mgYbQbIt+X0FvOkikx+/dNrJfh9Bg48PCh6wa/1zrcO/4Z5DCCbvMbTMMzvbrRbxi56KkSd3VPzD25YlTuYlqn+GxKhw2OH3w3cnWVw88JSCk5kp0Q1+Qev1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847228; c=relaxed/simple;
	bh=AYt9HbnMlVAkAH9Ou4f44/1bT4rEBIZnxNJUcVxyBqs=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Ebb9EqM1CSS2KuxCM/8P2FRcGVCiZHMMhhOooeCgm/Wm8psIWl4XxTqzevPHKxFy2BrOPfmhyk8l/oxQdqHWzsEi4pF4D41nfbcIYmVHN5gC03aOCO6tMLiaxRZImN95bA2GPQURzPQv6rwTurg5TFAs+vCmL6cMjK6XEGjwR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Sf+FpBEf; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Sf+FpBEf"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241002053343epoutp01a738fcf9b9b4f4f17ce70a2a01b14f7d~6i_UqWejf2683926839epoutp01c
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241002053343epoutp01a738fcf9b9b4f4f17ce70a2a01b14f7d~6i_UqWejf2683926839epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847223;
	bh=efV7gYOkc1545B/kHNDZCPpG9+JtazR+zlGrOLL/G6Q=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Sf+FpBEfp/HpyW/zBYjYEs6UyuPM8tHyE17b6afiVMtcLIe67jkCzvhP1SGa/rY9y
	 HfKDLs9QLkWM5udk2O1KlrmAkpZDcL+eWSC+dFKi0INxTimvGXPaCGvzaKwxr2MdJM
	 hA0Kna66Rzxisz45BzB4AqPP7BYRezNyXU2W/nwQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20241002053343epcas1p43de84711d51812919f990beed389c76f~6i_UXelDz1369013690epcas1p4_;
	Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.232]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XJNlB3B0zz4x9QF; Wed,  2 Oct
	2024 05:33:42 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	86.46.19363.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epcas1p3acd53584280abe264a8b90a743279ff2~6i_TX7xUi3203832038epcas1p3f;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241002053342epsmtrp1322d9adbfba079862952ae38953b9133~6i_TXIAzr1554915549epsmtrp1Z;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
X-AuditID: b6c32a4c-02dff70000004ba3-a5-66fcdb36d950
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CF.84.08229.53BDCF66; Wed,  2 Oct 2024 14:33:41 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epsmtip11da2f932f130140931c413515ccd5271~6i_TJfBSQ2184921849epsmtip14;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:23 +0900
Subject: [PATCH WIP 3/7] drm/exynos: Add drivers on drv.c
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-3-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTV9fs9p80g/OrRC0ezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hpJC
	WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAh
	O2PV7l62gkkCFZ+nODUwvuLtYuTkkBAwkVi44AZbFyMXh5DAHkaJz7tOM0E4nxglNjVMYoRw
	vjFKTN66gh2mpevaSWaIxF5Gie/df6CqXjFKLFi3mBWkik1AXWJJ21qgDg4OFgFVid3z9UDC
	wgKWEpcnXmQCsXkFBCVOznzCAmIzC8hLbH87hxkibiXxY/plRhCbU8BaYtWtp2C2iMBpRon/
	cxUh6j0kZjxbB3WQsMTn3WvAfpAQ+MsuMfdZIyNEwkXi7YO7zDBFr45vgWqQknjZ3wZlZ0sc
	/biXDcIukbg+axErhG0ssX/pZCaQ+5kFNCXW79KH2Msn8e5rDytIWEKAV6KjTQjClJe41VkO
	0SgqcebpR6iBHhKzts+CBlUfo8TKKTfZJjDKz0Ly/Swk389CWLaAkXkVo1RqQXFuemqyYYGh
	bl5qOTxek/NzNzGCE6OWzw7G7+v/6h1iZOJgPMQowcGsJMJ779DPNCHelMTKqtSi/Pii0pzU
	4kOMpsBomMgsJZqcD0zNeSXxhiaWBiZmRsYmFoZmhkrivGeulKUKCaQnlqRmp6YWpBbB9DFx
	cEo1MNVNnMBZ6PRt50bDo6sPxd962dtSuPJ2yewINRmJcjMFxpY/6b9OzPv2p/PL/UfhTy+p
	z3x9b2tO3ZntX9dmtvxaF2Ap+iuD+dI2338yx6+I+H6xudz74unOZhlf0+JI1RVCobtb2x8u
	vP/27U+h5o8zN3qFr16h/Tln4v+li7hVgjlXeF5/wpUlfYopduoTz/kxLEKb/t3nkj0h/3+v
	P8PS5/sebly0TPfMHbs9ylqpV/UsL/7/2fna/rGAV/OSwA09qfLKNxzrah9cX95we+aElZW6
	gktCpzReNf3oaXtX8Gqt6QUGxeZY/4TMn7deC5fH2l8RjA37dbRGM4ijK4ttYQKrxcqTLuua
	JkvyTsxQYinOSDTUYi4qTgQAwwOxOBUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWy7bCSnK7p7T9pBg/7LCwezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GsVlk5Kak1mWWqRvl8CVsWp3L1vBJIGKz1OcGhhf8XYxcnJICJhIdF07ydzFyMUhJLCbUeL4
	tg1sEAlRiY7LjYxdjBxAtrDE4cPFEDUvGCXa9nxhAalhE1CXWNK2lh2khkVAVWL3fD2QsLCA
	pcTliReZQGxeAUGJkzOfsICUMAtoSqzfpQ8SZhaQl9j+dg4zRImVxI/plxlBbCEge+3ON6wg
	NqeAtcSqW08ZQdaKCJxjlLj2Zy87RLOHxIxn69ghzhSW+Lx7DdsERsFZSNbNQlg3C8m6BYzM
	qxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgsNfS3MH4/ZVH/QOMTJxMB5ilOBgVhLh
	vXfoZ5oQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJvtZ
	0ZNk5ziEKxsUM4TVs1ZfOSXjJpjVuW6y2B6nn1/WLu7h515gFvTmzs2WxxX5124zMrCz/1c+
	GNl49PObkESxOiNm30C5r+vu56VO2xsYU/CBKcYjhf+2qvrZupXnr4f+FVGM81WdcsXaznNF
	S6W65etS449VbHsyZETuH+fgt+HW7F58g7n37hpn197JdZNmW/08nvpOdGe7vk3uxo1Z0aZu
	oTLHfnzdHL5L6HjszTb+o9s/eiR4VVzSXbq267LgjEmMRnfUuqrYo7ZsuSz81In970K2vsLo
	9bmnPB8e/neQ/0qG18aJy759ift6SPb1NOeVb1pmHWzP6wibqSe+d+1Pnmd3eMU5kjf+UGIp
	zkg01GIuKk4EACi57K3uAgAA
X-CMS-MailID: 20241002053342epcas1p3acd53584280abe264a8b90a743279ff2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053342epcas1p3acd53584280abe264a8b90a743279ff2
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053342epcas1p3acd53584280abe264a8b90a743279ff2@epcas1p3.samsung.com>

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 ++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 7c59e1164a48..3071b85e4c18 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -160,6 +160,15 @@ struct exynos_drm_driver_info {
  */
 static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 	{
+		DRV_PTR(dpp_driver, CONFIG_DRM_EXYNOS9_DECON),
+		DRM_COMPONENT_DRIVER
+	}, {
+		DRV_PTR(dpu_dma_driver, CONFIG_DRM_EXYNOS9_DECON),
+		DRM_COMPONENT_DRIVER
+	}, {
+		DRV_PTR(decon_driver, CONFIG_DRM_EXYNOS9_DECON),
+		DRM_COMPONENT_DRIVER
+	}, {
 		DRV_PTR(fimd_driver, CONFIG_DRM_EXYNOS_FIMD),
 		DRM_COMPONENT_DRIVER
 	}, {
@@ -172,7 +181,7 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 		DRV_PTR(mixer_driver, CONFIG_DRM_EXYNOS_MIXER),
 		DRM_COMPONENT_DRIVER
 	}, {
-		DRV_PTR(dp_driver, CONFIG_DRM_EXYNOS_DP),
+		DRV_PTR(dp_driver, CONFIG_DRM_EXYNOS9_DP),
 		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(dsi_driver, CONFIG_DRM_EXYNOS_DSI),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..6a1129b69b97 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *dpp_dev;
 	void *mapping;
 
 	/* for atomic commit */
@@ -254,6 +255,8 @@ static inline int exynos_drm_check_fimc_device(struct device *dev)
 }
 #endif
 
+extern struct platform_driver dpp_driver;
+extern struct platform_driver dpu_dma_driver;
 extern struct platform_driver fimd_driver;
 extern struct platform_driver exynos5433_decon_driver;
 extern struct platform_driver decon_driver;

-- 
2.39.2

