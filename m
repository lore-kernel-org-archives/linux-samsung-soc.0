Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09D1A4E9D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248415; cv=none; b=Tz8gvwugvmMctssrC6UCmFc26+4hzeN8jN0ZUCG9E0dT8zNa3nhnxirpomR5vcGej5ewzuUG68F8OQqA76CulVUYfijK3zr/7lgeLuUfPYzLQRSGR7CM4ALkcHBPqIFLYmEPEjns9FEnaXcyrx+I2ssyaFhpB9t884tbWJdhbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248415; c=relaxed/simple;
	bh=DQaYXNvGAAPbiRuJgNdR4bxs0FLlR60CFote54UL7Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=irh1PRg5waBdeIJTp+gamlmmcrv3pBYGewfGqxojQkKBAOeX5pMGg1mO+264SxwGUPEbEvHVL4LmQ2feeyV1jz0Tm/LyzshKcnC85bB+1Vtyig6GK6abOrysSFs4aZdTbE683ZcKNxCftlFAjB9cfcPuE4V3aELPqmYgLLEMgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=emchsm24; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="emchsm24"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250618120644euoutp025252239bfa495c1e896edd60d4c3d51a~KIaaZx8Sq1789417894euoutp02P
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 12:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250618120644euoutp025252239bfa495c1e896edd60d4c3d51a~KIaaZx8Sq1789417894euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750248404;
	bh=yQbhjxMIcIlV1dZtVoeXZ7q10XHOAKpTxTLfeQOo+Qc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=emchsm24EvFl+Az3l0FTyqM0bpxcXb4XnIRfwpHIxQYrhKxQraB6OzPqY0uOg5fRC
	 qGGwMaAdyC4VVPE8FvePk3vNBuQRc4jE0NnWmEpsQpIQXU37BT6cqyQ9zQdWcRiUmp
	 gPUXJwm/y5sYbY+dO74PhCvl/u2rteaOjnK1iGbs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618120644eucas1p2b084977540772f3623f3f9e834604668~KIaZ2DC0k1376113761eucas1p2z;
	Wed, 18 Jun 2025 12:06:44 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618120643eusmtip1fb0873e8da0a3c3ece182a135dbfd763~KIaZPP5Zf1185511855eusmtip1y;
	Wed, 18 Jun 2025 12:06:43 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia
	<aradhya.bhatia@linux.dev>, Inki Dae <inki.dae@samsung.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>
Subject: [PATCH] drm/exynos: fimd: Guard display clock control with runtime
 PM calls
Date: Wed, 18 Jun 2025 14:06:26 +0200
Message-Id: <20250618120626.217023-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-EPHeader: CA
X-CMS-RootMailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>

Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable") changed the call sequence to the CRTC enable/disable
and bridge pre_enable/post_disable methods, so those bridge methods are
now called when CRTC is not yet enabled.

This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
source of this lockup is a call to fimd_dp_clock_enable() function, when
FIMD device is not yet runtime resumed. It worked before the mentioned
commit only because the CRTC implemented by the FIMD driver was always
enabled what guaranteed the FIMD device to be runtime resumed.

This patch adds runtime PM guards to the fimd_dp_clock_enable() function
to enable its proper operation also when the CRTC implemented by FIMD is
not yet enabled.

Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback to pipeline clock")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index c394cc702d7d..205c238cc73a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -187,6 +187,7 @@ struct fimd_context {
 	u32				i80ifcon;
 	bool				i80_if;
 	bool				suspended;
+	bool				dp_clk_enabled;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
 	atomic_t			win_updated;
@@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 	struct fimd_context *ctx = container_of(clk, struct fimd_context,
 						dp_clk);
 	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
+
+	if (enable == ctx->dp_clk_enabled)
+		return;
+
+	if (enable)
+		pm_runtime_resume_and_get(ctx->dev);
+
+	ctx->dp_clk_enabled = enable;
 	writel(val, ctx->regs + DP_MIE_CLKCON);
+
+	if (!enable)
+		pm_runtime_put(ctx->dev);
 }
 
 static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
-- 
2.34.1

