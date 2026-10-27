Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107713;
	b=Uk/khCoVd/Jymgar//WAk/Inckub7iBRDoZ4KMvaYeMiK52nbq18HqdWuHKmzZFoiIwz
	 AJVsBw2USQifBQrCyBiCa8+sHDbgYex95GFsIFfphMA/aGLfDGuC/Ipkoxc/vqgllE7FW
	 D6zIPIltdkHWLxtwEYalHf0ZCtut/9tX76qr9bUcd4xTSlveDGvbk8hJY35prgOaS0+n9
	 Sgbl2HQSnAIJK2aQaGwsqZ1u6bJ4Xl7P7BxzO94dKjNNxkKIvMvNrtegqBCwfg0qRWAOx
	 TQWKKaEerO5/UB+KQjmkE2ODkE2NzcQjH8+t8Dr7EKFoNID8HO7Foo6OFhum1WoYLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107713;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=Atr7jCw5foNaUR+UTxGp65IaTqEq2+vCnCpbrDPXzlA=;
	b=rzVMEAHB/IljPGLOYWctZm/lP8OaaHx1FeI77OZQk9qqCd23yEqjH/PYCRV7ABHSOZg6
	 lSqScyHmF+yf/Zcdi5/s/S5FHEdEAeEyGI0OiP5JFOjvRqBWh4vBfut4TsxZsla8pus3v
	 IJ/v73E+D13kJFJgzfBlPOCdtbZQY4mpvEu5Bi+mvnTUmbjeFsMvF7ojg/uevvOHW/vJk
	 srbaNuvkQqZSvLD0fWm/Muwk/1h+j/MVLI+lyGh6ZEa+5cA07if17KxgZcrs3/FlswP2K
	 DKgzMWljj60prDKBNEaetKyh9tH4M/egWaFu3oWFxIk4xP4+Y0UtaDwRgLBFPVxs++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="F3FFK/8e";
	arc=none smtp.remote-ip=103.209.128.17
Received: from mail-m12817.netease.com (mail-m12817.netease.com [103.209.128.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED35F60A260F;
	Tue, 27 Oct 2026 13:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED35F60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=F3FFK/8e
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a2a;
	Tue, 27 Oct 2026 21:28:20 +0800 (GMT+08:00)
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
	Sandy Huang <hjc@rock-chips.com>
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
Subject: [PATCH v5 05/18] drm/bridge: analogix_dp: Check all negative return values for &analogix_dp_device.irq
Date: Tue, 27 Oct 2026 21:27:57 +0800
Message-Id: <20261027132810.1746118-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c2afd03a8kunm87c266213d56ef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQx5PVhgdSEwaQ0tKSh8ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=F3FFK/8e3HcpyES/ytYE8Sx+ej1iUy345GVGh2ahq2T2q+vThfjpULlUzfRYZkvRJZ0mF37Ajr11Jmqnxbx8zzd4hs5yb+iglWjGA69j39zQnMXFlOL53RleBRmu7ZC2WvRnfL5YUEB4zSSPDAIqpABMjqZ9jPbcSYAIqMVP4F4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Atr7jCw5foNaUR+UTxGp65IaTqEq2+vCnCpbrDPXzlA=;
	h=date:mime-version:subject:message-id:from;

Currently only -ENXIO is checked for dp->irq from gpiod_to_irq(),
which ignores other possible error codes like -EPROBE_DEFER, -ENOENT.

Check for any negative value instead, and propagate the actual error
code rather than hardcoding -ENODEV.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260804083307.84ECA1F000E9@smtp.kernel.org/
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Change the type of &analogix_dp_device.irq from unsigned int to int
  to fix the dead dp->irq < 0 check, which broke the probe deferral
  for the HPD GPIO. (Sashiko)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a3871f28b835..c40ab7419f08 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1519,9 +1519,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		irq_flags = IRQF_NO_AUTOEN;
 	}
 
-	if (dp->irq == -ENXIO) {
+	if (dp->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(dp->irq);
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index dc189f0b7a19..cc3466304531 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -159,7 +159,7 @@ struct analogix_dp_device {
 	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
-	unsigned int		irq;
+	int			irq;
 	void __iomem		*reg_base;
 
 	struct video_info	video_info;
-- 
2.34.1

