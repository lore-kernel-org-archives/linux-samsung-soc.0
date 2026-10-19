Received: from mail-m127173.xmail.ntesmail.com (mail-m127173.xmail.ntesmail.com [115.236.127.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A8F392C32;
	Mon, 19 Oct 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400680; cv=none; b=psIZ/CzZXZkmx2QEoUme1G05BLvrRbM2Y8jQt6727NETuHoRF9IO+UAtV/fmaq5cjVgOUgtOg7orOkfl8YnDDI5YcnbzBO9G7De/tq8PHmWHxWpSD14Tl221TWYpOyhZ7PCvIircE1pd/PzFmWh6ZGWNtaNBwDpVNTPZpUm5r2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400680; c=relaxed/simple;
	bh=b8J1D/ds98oZw+FdwRF2AjJohnVXj6QTYoo4I3FSxE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HHDSmW+gSGnHibTAW8TpkHjBxw82e1nW1dXUeMDYM1qGyMggtICkEKh6rkI2T+Uc3fdw6uHIxBeaLmaHjaMjM4DsRzRjBwT40/OXdEe5tKAXWZiAuyoSz58YX6WPYAVu711ea6CKjXFWaBKJiAxs6TV+7BKH0GPF9/Phq6UWltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fE+r9H21; arc=none smtp.client-ip=115.236.127.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fE+r9H21"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5189b863d;
	Mon, 19 Oct 2026 16:59:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 14/14] MAINTAINERS: Add entry for Analogix DP controller bridge
Date: Mon, 19 Oct 2026 16:58:36 +0800
Message-Id: <20261019085836.3065008-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085836.3065008-1-damon.ding@rock-chips.com>
References: <20261019085836.3065008-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15362faa303a8kunm6ee755052eac91
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHk9KVktLSh0fSh5KGEMfGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=fE+r9H21RqBWhClUz0GSOjilrCJHV3Ej56qWSERb3oSqTddT4ubw/zm5cWhxFJq787kHkG3bBwcr34Rw43jKgiHpNWf3ghORP6XVDxVYqL+aiUkiuUtGfKTqrogTQYNd3+7oFcos6fTdJhR3Aimga+H8jJ86ZzNlBakTBSsPnNA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PfFndZaVFmyUrI+kd6bT8WqUeL7pyt32bXHtU/pq9QY=;
	h=date:mime-version:subject:message-id:from;

Add a MAINTAINERS entry for the Analogix DP controller bridge, covering
the core bridge driver, its register helpers, the public header and the
DT binding, so that get_maintainer.pl routes related patches correctly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..6518cbbd578c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8037,6 +8037,17 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
+DRM DRIVER FOR ANALOGIX DISPLAYPORT BRIDGE
+M:	Damon Ding <damon.ding@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+F:	drivers/gpu/drm/bridge/analogix/Kconfig
+F:	drivers/gpu/drm/bridge/analogix/Makefile
+F:	drivers/gpu/drm/bridge/analogix/analogix_dp_*
+F:	include/drm/bridge/analogix_dp.h
+
 DRM DRIVER FOR APPLE TOUCH BARS
 M:	Aun-Ali Zaidi <admin@kodeit.net>
 M:	Aditya Garg <aditya.garg@linux.dev>
-- 
2.34.1

