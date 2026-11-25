Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=8.221.36.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605733;
	b=B3+wBlk2GoNWmYDiS8/bTp88rcjSg5pG2hgFOeQo8LdqpyM9nXXED/tTylZQA+JbearV
	 pfupaVTCt0pVGvCMNAKy1bzUUysPwkvq8pp+TPAhdeAVy2x37Uc2TwtFg5HpeIpOmXIAo
	 rh127mpoKkwH1jY47XMHdEgtW/T4txUr7wVZFW3xw+T6T4rRU7y+gDYOhufxrquSiqE1t
	 XT3/JDDHqcTEnU2blUirt/TSe2wPQ+dikF35v4CDp9oA/S43+0PiUbEAxN7tw1LHuL2km
	 clMA2jJWb8Y+UKI/w0m2oHfu+QFNAOTlyxSdp1h4I6GHe/1dmOx9GKESWlH4XnY74pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605733;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=Z53XmwzIfWNDI57WVKpOPzyROVqB2sBaHiSyG5zofnk=;
	b=JFqxFiwne6SNchFDzGcuVacFBQXA0moJ53FihvpEGNxq411PLEb0baDcMlAMd532TV9j
	 isOnXXBUBVE/nBj2dwwrfmto/7n8L33v4dxxZ90Zf145OvoLH+EJ+noaFAh6hkD+mhaoQ
	 nJxVGsmosghxP/oB/zmvd2BrU1PT5IVumy7VxuzBkwPWofJY6coDB1k0Y0xLPYIoW9AU3
	 b59sUvMCVnmqBnOQ/niZwb79KOCFJn194DLjV8pQeYXAv/dfol7ri/agTElERDHGriJDT
	 oNGP938lghaPO9UU5mvochcBTlfCxV0nBGy3gh7DEVWv2t9UslioeDjBQ6HHTFSmfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=R4ec0tIw;
	arc=none smtp.remote-ip=8.221.36.245
Received: from mail-m822136245.xmail.ntesmail.com (mail-m822136245.xmail.ntesmail.com [8.221.36.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB923606A695;
	Wed, 25 Nov 2026 11:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB923606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=R4ec0tIw
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816034;
	Wed, 25 Nov 2026 19:22:00 +0800 (GMT+08:00)
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
Subject: [PATCH v7 05/20] drm/bridge: analogix_dp: Take a runtime PM reference in bridge detect
Date: Wed, 25 Nov 2026 19:21:26 +0800
Message-Id: <20261125112141.1434903-6-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa21270ef0a03a8kunm17c23050775874
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkhOVkNITE5ISEtNSxkfHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=R4ec0tIwlRkqHxRkqfOX5au00NmjTlwsoP2PRcpm7JNc3ZKGSuog77dhoHoJJq1Vbtt0ldyOzwgca1eicGhEXJMdIoE8ur04j77AXIUx26XflG7vx5cjtmfQh1g0xJ/WJOaGaIqzxhg1ELXuLzC5Ey6beo+HdsOoSFWyK61uVWU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Z53XmwzIfWNDI57WVKpOPzyROVqB2sBaHiSyG5zofnk=;
	h=date:mime-version:subject:message-id:from;

The analogix_dp_bridge_detect() calls analogix_dp_detect_hpd(), which
reads the controller registers and may write them for the force HPD
fallback. The connector is polled and can be queried by userspace at
any time, so this runs while the device is runtime suspended when the
display is disabled.

Take a runtime PM reference around the HPD check, and report the
connector status as unknown when the device cannot be resumed.

Fixes: 2b77a2918c5d ("drm: bridge: analogix/dp: move hpd detect to connector detect function")
CC: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v7:
- Add this patch to take a runtime PM reference in
  analogix_dp_bridge_detect(), as the register accesses behind it may
  run while the device is runtime suspended.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 46d4dd9d7cd7..b9f4e5757fc5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -908,9 +908,14 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	if (dp->force_connected_mode)
 		return connector_status_connected;
 
+	if (pm_runtime_resume_and_get(dp->dev) < 0)
+		return connector_status_unknown;
+
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
+	pm_runtime_put_autosuspend(dp->dev);
+
 	return status;
 }
 
-- 
2.34.1

