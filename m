Received: from mail-m121160.qiye.163.com (mail-m121160.qiye.163.com [115.236.121.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BA349CD1;
	Mon, 28 Sep 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.121.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583624; cv=none; b=Z4KU6857DUd4dULH36e3MDfSukM/N4vBUxEKG0151cZ5ctqiNd0fNZXH6gYEMbHoa4YAr0ac8rvcFRNTJdt3G0+eQjt2EECm7ohXaJQ2iWcsLObQeRekoYXKU4pNy4d9/8J/YaL+rTOdwXn5sH4fnpgV15isGGb6qI9LM3U/IrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583624; c=relaxed/simple;
	bh=YGKSRyjUQMjIHH+H14eJyY43GLqzetdydIJbuwiKpn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gcjpTEjNBfD86/iD69GXbvj2OVRJw6/uhMZJNQWObOrhD7eMu/MQaNBx/HdtOn0um1eA23z/NEus1HuWC4UBg4p6I+R+rentDPETd3PDiOGIJhgec8dykkVkT+lcOWgKAuXgAgVawMKAgPPz7mGnAsWMTE3NknaYCybZIuCeSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GVEoTm0n; arc=none smtp.client-ip=115.236.121.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GVEoTm0n"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5398e50;
	Mon, 28 Sep 2026 16:15:04 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 02/14] drm/bridge: analogix_dp: Check all negative return values for &analogix_dp_device.irq
Date: Mon, 28 Sep 2026 16:14:06 +0800
Message-Id: <20260928081418.3605775-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e714efb803a8kunm323e2b5437cf11
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx8eVh4ZSR5CTEIeSEoaSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GVEoTm0niGiCpErUv1BiE3AwAKiCnomyyogm5KnAx/EelFq0P8nbkxorN9hP+U9AIlQzsN9JrbpwkpCYd9Em2GSzu3US2dIny9+3iWqLKp0x953A2OGmEOQjs4Y0iZUcKKcmz/z/8frjgY8F5V0zJ4j1kOKm41FSLE73nUc5hnM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kq36aaWmtxNis0gWuJ3e4zUh00Bu1KsR9hnzmqki5yE=;
	h=date:mime-version:subject:message-id:from;

Currently only -ENXIO is checked for dp->irq from gpiod_to_irq(),
which ignores other possible error codes like -EPROBE_DEFER, -ENOENT.

Check for any negative value instead, and propagate the actual error
code rather than hardcoding -ENODEV.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260804083307.84ECA1F000E9@smtp.kernel.org/
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 079f2f01f33b..27c9a764e25f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1480,9 +1480,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		irq_flags = IRQF_NO_AUTOEN;
 	}
 
-	if (dp->irq == -ENXIO) {
+	if (dp->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(dp->irq);
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
-- 
2.34.1

