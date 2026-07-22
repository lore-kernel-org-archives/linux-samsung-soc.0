Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71E45D5D9;
	Wed, 22 Jul 2026 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746775; cv=none; b=pRY2jRlfMeLCaBMI+2p0SzR88zJgV7BFcSGXW46Dg/GA2O1xgOkXiNeGLTQpL7jMUrUlDCtVmtWFed/JC8xGhmJlYpMVywxWplT+w06e4imeeHu16FYY31MZmsJeGpfsMagpONZ/1LhUIq1iNSXP5vYYZ0vucl4Abu5bMApFBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746775; c=relaxed/simple;
	bh=1YohDgTSOkkTpl+65u26bbQhosd/+AGS22C8onQsxPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmL57DiesB/ybyk34DzOd3P2n1wrJ9d8IRNca1JobVA6g86NEQVXGZMg1aQrgMFu0id9pdQHyEWhF1OsJH+B0OPpP7rGlbL9noH1w2/AT++WGBYTBP5HO6o3OS/BJMGG+/wxb9k7Q9hFpyYs4CR8RBrWaS/+lDOBjge62pFjKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=akPUmchE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="akPUmchE"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 509AE83F7A;
	Wed, 22 Jul 2026 20:59:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MN0pYQ004ibo; Wed, 22 Jul 2026 20:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784746770; bh=1YohDgTSOkkTpl+65u26bbQhosd/+AGS22C8onQsxPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=akPUmchE2iIdGt7B3MdYhifPqGY3yW16Vqxr/8pilsgaFQC4fTNhWFS2WNtzYnwQO
	 CrKrhyDmPgHR2Wnq7BJoF0oB47EFPr/3kRjveb0eFz4hx3EEUC/fGY8naLSXGiXrXt
	 V247SGp06E8Qa4wBijyAF5OCi8qlhlfpWe9OIYgDNvweWwtc7GnbaNbNWMP3HVhRED
	 bQtCugGy+SV5KUplFHQpd4UZPGweK3mYr3hO6HX+V4WYKVicApyC5IO6F1ZMwZrl3I
	 RPEXA4lZgUiFb3/1KZffFLY9ML8IrR1APABc7sJBUpqg7oGHdyEI8Ufir7eZGED6ev
	 mpdKxJWpJO5Sw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 23 Jul 2026 00:28:34 +0530
Subject: [PATCH v3 3/3] drm/exynos: remove simplefb nodes before init
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos-dsim-fixes-v3-3-0c31ae1dbecc@disroot.org>
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
In-Reply-To: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>

The simple-framebuffer uses the framebuffer region initialized by the
boot loader for display. However, with Linux the DSI and FIMD/DECON
stack is initialized from scratch.

However, both are destined use the same memory region, so both cannot
co-exist. For a seamless display transition during boot, the framebuffer
must be destroyed, which releases the memory region, followed by proper
IP re-initialization. Achieve it using
aperture_remove_all_conflicting_devices(). This is also implemented in
other similar systems such as in Qualcomm's msm_kms driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9ee30086879f..7657f86a9d19 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -7,6 +7,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
@@ -273,6 +274,11 @@ static int exynos_drm_bind(struct device *dev)
 	if (ret)
 		goto err_mode_config_cleanup;
 
+	/* Remove existing devices which own the framebuffer memory. */
+	ret = aperture_remove_all_conflicting_devices(exynos_drm_driver.name);
+	if (ret)
+		goto err_unbind_all;
+
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret)
 		goto err_unbind_all;

-- 
2.54.0

