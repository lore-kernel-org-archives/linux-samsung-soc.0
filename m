Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605727;
	b=LEKIAEHIrv2lmj37/oAUcUAzNx28ph/XWmu1UocrdHqjwQkpYYhNbvhH4C4kmKBIWl0g
	 BgboLyK7ruu0Lxls32/TqYw4pkHnvyV8SSwXsB31k55zhYULMKxEg6o0iQkzxUUqCMiql
	 8K763FLu41la54VtzLBbos97NEZZxLCrV21vzyheEInqS0ATcta7FAoooZMWGyFQ5abah
	 Ids5UWYtvGO85hufKhDHsdGwHkFClq2VdI7tItzadxXCv5gDKy4q/YQZVI2IXUC7YW9bt
	 Jj/m85kikjTGl0LZtqLXOhWM6/DZNqrp6fYa5AnWyzhwB3KxbZKqY3wAbp/0fyX+43w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605727;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=XNuY/Vo6Av48O204IEijKEDS+EVPpGFz9/aSQiiHflQ=;
	b=v10GwrXd7BET7PraTudRbkfLlz3Vja4fLO/4RJjGJfXddyPWC1zfIF4jfpTqGzCDd6D5
	 IpHC6B75HmNQ5eVrD4UOiXdIv0T5vfYVFOO82fPTvrx9Pbe0DGV8fWmcFMrVD80GqKhLQ
	 bTSZT6KpRPD1Bjc6tz+RMHaOFSXZNqHUPKjcbPqcraOXK+9OWUFlKhyZMC8jkqYBwGb3r
	 tmej7y1fVJSNCr1mzi/UfKjkVR/b55G6EnfNYJAjCKEWLy2W+1cxa9bGhHkhtcz1pmh9r
	 0wqWFXKjr2/G6h++GoRxHd6JLYLSgkCtEcb167VyFHaOMOMUbCsPOIOyzDp01UeyzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dLGTcoMw;
	arc=none smtp.remote-ip=154.81.10.29
Received: from mail-m1029.netease.com (mail-m1029.netease.com [154.81.10.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55445606A31E;
	Wed, 25 Nov 2026 11:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55445606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dLGTcoMw
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816029;
	Wed, 25 Nov 2026 19:21:55 +0800 (GMT+08:00)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 01/20] drm/bridge: Select VIDEOMODE_HELPERS for DRM_OF_DISPLAY_MODE_BRIDGE
Date: Wed, 25 Nov 2026 19:21:22 +0800
Message-Id: <20261125112141.1434903-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa21270daa203a8kunm17c23050775859
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZShhPVkwYTE9CGR8ZGR1PSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dLGTcoMw9Q9WCK8L093BjBFk4DZPOcr3kS042AbNM3M6TfWvGy1yFqER81Lyd8gYz4XkB+rHLm8qKSAneuCb6SrVzG0Q47iuOPyM+y6Nrqqvhb4siFXIrx82a20R1hsisthLXpyjidqTAKNX56hydp2Aot3eZmCpmfdcX4GppX8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XNuY/Vo6Av48O204IEijKEDS+EVPpGFz9/aSQiiHflQ=;
	h=date:mime-version:subject:message-id:from;

The of-display-mode-bridge driver calls of_get_drm_display_mode(),
which is provided when VIDEOMODE_HELPERS is selected.  So far the
dependency has been satisfied by the users selecting
VIDEOMODE_HELPERS themselves (e.g. the Exynos and i.MX DRM drivers),
which breaks as soon as a user does not, resulting in undefined
references to of_get_drm_display_mode() at link time.

Select VIDEOMODE_HELPERS from DRM_OF_DISPLAY_MODE_BRIDGE, so that the
dependency is always satisfied.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6..f717523014e8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -266,6 +266,7 @@ config DRM_NXP_PTN3460
 config DRM_OF_DISPLAY_MODE_BRIDGE
 	tristate
 	depends on DRM_BRIDGE && OF
+	select VIDEOMODE_HELPERS
 	help
 	  This is a DRM bridge implementation that uses of_get_drm_display_mode
 	  to acquire display mode.
-- 
2.34.1

