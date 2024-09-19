Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1491A38FD;
	Thu, 19 Sep 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758736; cv=none; b=ba4+Fzy1x+H/agKoKtKu8BKUtfYTey0Gu+LJ1ePnvIFnkgFOXBxa8B0OQIB0qbD+X5CgyNqCqU5TKWnEcZMh3BXtuAcnauoCE6Nxn5HVlYbxVBVbnJrN8zrPEou9WAR9jQF12eS5rTQySb+mRrzP+jXbAUxqG3T836R+XUtSP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758736; c=relaxed/simple;
	bh=vtqJW4WoUdJcxU3RW65FntLJKHSrz+r77iQWDTkRUAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsZfD76ARn51Zm2T3l34obrZdhgGNPdxFdQCqhXWuAjeCp5cMRh7pQUu54kYsHJ9Ok6+rHJ+QF4cI7v+P6oyVt+y8z4EkRQeFD2IDG9yfxsIUq+Xl3mn7ejuVbtaU8WsuKNkOiT/nIHaDKpnj5lVtUsGzJbIdSZAvpe43SQTyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Z8QZNb6p; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Z8QZNb6p"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5E2BA23C84;
	Thu, 19 Sep 2024 17:11:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C22g_44K2jCi; Thu, 19 Sep 2024 17:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726758688; bh=vtqJW4WoUdJcxU3RW65FntLJKHSrz+r77iQWDTkRUAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z8QZNb6p6RID89WXQnJeGWWbD9a9lgxAaXxrg3vO+S9gRVFSvO1j88l+7OTuvqBNa
	 leX1+EguSnOiHgsB2G/SxQAd5kx/eVtcwLPKJxwVfQ0x/qs/d4GiHj2eui1r/cb/tQ
	 2H7foP02Jy0PRTUqkLrrDCN3pFs4uqehqt5Nwqt40clxUghJy1gFvI8h0O5lgxCVyj
	 WznF6VnhNUEBCd/V572JzsGzB6HqsDJ8MiUNIr3pEsWqFl8jyjLq0+gDpP6ahvwbV3
	 UdlhQVwMOp2dH2RmBM/gVs9LgZ+jbHDI87yEF9hhtJIZGMMyyONYl7L7xqUIe96/Zi
	 PNl777QQ66hpQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 19 Sep 2024 20:41:00 +0530
Subject: [PATCH 1/6] drm/exynos: exynos7_drm_decon: fix uninitialized crtc
 reference in functions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-exynosdrm-decon-v1-1-6c5861c1cb04@disroot.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>

decon_clear_channels() and decon_wait_for_vblank() accept a pointer to
struct exynos_drm_crtc. However, these functions are called when the
crtc is still uninitialized. Moreover, both functions use the pointer to
retrieve and use struct decon_context, which is initialized.

Modify the functions to accept a pointer to struct decon_context
instead.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 0d185c0564b9..e994779694f0 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -81,10 +81,8 @@ static const enum drm_plane_type decon_win_types[WINDOWS_NR] = {
 	DRM_PLANE_TYPE_CURSOR,
 };
 
-static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
+static void decon_wait_for_vblank(struct decon_context *ctx)
 {
-	struct decon_context *ctx = crtc->ctx;
-
 	if (ctx->suspended)
 		return;
 
@@ -100,9 +98,8 @@ static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
 		DRM_DEV_DEBUG_KMS(ctx->dev, "vblank wait timed out.\n");
 }
 
-static void decon_clear_channels(struct exynos_drm_crtc *crtc)
+static void decon_clear_channels(struct decon_context *ctx)
 {
-	struct decon_context *ctx = crtc->ctx;
 	unsigned int win, ch_enabled = 0;
 
 	/* Check if any channel is enabled. */
@@ -118,7 +115,7 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 
 	/* Wait for vsync, as disable channel takes effect at next vsync */
 	if (ch_enabled)
-		decon_wait_for_vblank(ctx->crtc);
+		decon_wait_for_vblank(ctx);
 }
 
 static int decon_ctx_initialize(struct decon_context *ctx,
@@ -126,7 +123,7 @@ static int decon_ctx_initialize(struct decon_context *ctx,
 {
 	ctx->drm_dev = drm_dev;
 
-	decon_clear_channels(ctx->crtc);
+	decon_clear_channels(ctx);
 
 	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
 }

-- 
2.46.1

