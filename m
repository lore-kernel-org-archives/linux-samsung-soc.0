Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895743B635F;
	Sun,  9 Aug 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265835; cv=none; b=tC5Vs6zxAQ2QVUwJnSEVEyqkbVccEL6IYoTNXjiul5LmjTUEVL3fQ8BMHQsnGoqdClJl4Z8J4SnXJf4hAy8b7sfwJzromtyAjKvtuhV5Qi199fPKRDNTr9u7LUGiaM8Dvr3MUjQC/Zfgpo8KEj6+v9uJXrcNlJ0pcJXZ22smE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265835; c=relaxed/simple;
	bh=sSdMlVv4KPv7PSTWKJG/U2qBKfr06yN4H3Mqo+2KEPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMVb8aSvwydj/CUTA6YHDlgBYHRWtzzfVKxa3FfxQCfL4YMMib8M9SzGW9Y0xZclNNHawqb3ghPzfSq9cTvOt+i7JH9leFGRZsYY2HtlnT/FmxSyFzlRBHJY+Xhxcc3E30nSZE8+Xl5JrsAk3YSKvzpn/tREi2F1+SDwFejHp8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lftYWenW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lftYWenW"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E78B642C2F;
	Sun, 09 Aug 2026 10:57:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7Ek0Z2ZZo3d; Sun,  9 Aug 2026 10:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786265831; bh=sSdMlVv4KPv7PSTWKJG/U2qBKfr06yN4H3Mqo+2KEPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lftYWenWAOn2suYR7aHNnjqqaQ2KzoDiknnCEA8FfoxP0/1hPIZDYUXMVXA456hfu
	 68U+eTB8OFFHgViT4ri/ZgYKGwpzKAn67IO4ku+vqPKv439G5O6Jl7vGDV49YOTAJQ
	 axrzQBzeW6jO9txjC+VFA8VlCYtJJ3lp2xmN3uQCg83tvB0V/ILf3JVoy6rmmE9gJM
	 wqFXr9awuEkfm+YJtMaNNwK4bKCWj+AT4Wg+PTg5xceSqfr17sCgNB4hSlp8AERweU
	 fv85F8xxvIakFgPyDjiKafCeMPISVuzzAzwYXaJAyGzVNQLqqwtxm+JvlDfk0NR3HK
	 55tQ+3zMuWwgQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 09 Aug 2026 14:26:01 +0530
Subject: [PATCH v5 3/3] drm/exynos: remove simplefb nodes before init
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-exynos-dsim-fixes-v5-3-6e63dc6c238f@disroot.org>
References: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
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
index 9ee30086879f..62eeacbc2180 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -7,6 +7,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
@@ -268,6 +269,11 @@ static int exynos_drm_bind(struct device *dev)
 	list_for_each_entry(encoder, &drm->mode_config.encoder_list, head)
 		encoder->possible_clones = clone_mask;
 
+	/* Remove existing devices which own the framebuffer memory. */
+	ret = aperture_remove_all_conflicting_devices(exynos_drm_driver.name);
+	if (ret)
+		goto err_mode_config_cleanup;
+
 	/* Try to bind all sub drivers. */
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)

-- 
2.54.0

