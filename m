Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605744;
	b=XaAJN2Ogrl5DJaXgv+gZ+uO24/o5H5yWesi4gzl/gOAPhYUrV1PEPrMZmwMd93ZxeRRt
	 Fg/ztvsAf4++IEO8Qm76IY9gnOVd5Xfwc8jCSfIFHEmSZonAJOoVTmVKVf8ZqoKypEpLs
	 5tFdTiJRWe7vp02K2rLuHq4eSk6FdrhnCw09oLQZFKaeq42AI2fZneY/nT7p7qb/vSWIG
	 AlgBpJH7KpQimb2pnbYS85iTpGesL3NFSp32yFJk8QLZmL3tilxzpIia07g4PaMBYGQOq
	 MlR3tvTFx3/d5o1VvC+SoIkYrLH8uJMLx3r0jjgSGnWPI7M58SoW/FBujPd9cX/VSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605744;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=9gh/UpO+Wvvgm7K+uV/Ct8m+sSQrCKGW9teRlFKULo4=;
	b=HPL4osImHia6qezH6DBx+mQX9q3ZjBZPnZrHSXrQK7ItSd4Ob9DvZMIv/U2ECohjr0a9
	 YHe83iKKxkduNlD/lRFjj55NCltIaCxQcDn82oEO2YCSrPdgftg/Y3v4aMDwxKOlCb6aa
	 7uBthfaf3MX1oI323NwvQMoNDMMzOmB6s/5B9SN5yJ0h6L/QkEu4sxh7N7sPbpA8NbQ7/
	 sTaz4chrMRqg7TM72nA0Jc4YrwqdyQA9ucWm1SKhtdllWsjYzCk6YbDOEnmihgdXAXOo7
	 mNcDRBsp2Df8GbZT4ST28kDQP03LdZu2Ix2fAR5o+aN6UQH1UNLvuBc64q1ivStX+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CNsdv3Fx;
	arc=none smtp.remote-ip=160.236.52.129
Received: from mail-m16023652129.xmail.ntesmail.com (mail-m16023652129.xmail.ntesmail.com [160.236.52.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E660A3812;
	Wed, 25 Nov 2026 11:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6E660A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CNsdv3Fx
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816061;
	Wed, 25 Nov 2026 19:22:11 +0800 (GMT+08:00)
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
Subject: [PATCH v7 13/20] drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
Date: Wed, 25 Nov 2026 19:21:34 +0800
Message-Id: <20261125112141.1434903-14-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa2127118ef03a8kunm17c230507758c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhlPVk5PGRoZT0lOGBpCSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CNsdv3FxA3ZNunHAlvUBCnoukURFBeNWYgL8KBTkfIFfy2r4G9gESBFrXCFDzxSWxDMop2ZXVDLmSdEBNWt3Mxw1LehzOPmoLKwYEz1xPa0ZwOrz6DZ/Pby/UtMdZrTRQHyYMz4Ipkf9swewKWCqk9BccEg9+Lmdy5Tz8tJ1JxU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=9gh/UpO+Wvvgm7K+uV/Ct8m+sSQrCKGW9teRlFKULo4=;
	h=date:mime-version:subject:message-id:from;

GPIO HPD does not rely on DP controller internal native HPD interrupts.
Skip native HPD register manipulations to avoid irrelevant operations.

Move the hpd_gpiod guard to its caller so the helper operates purely on
the given bitmask, and mute all native HPD interrupts for GPIO mode.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Adapt to the newly added IRQF_ONESHOT related commit and expand the
  commit msg.

Changes in v3:
- Reorganize the branch layout for hpd_gpiod check.
- Simplify the commit msg.

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f2ffa30e335f..af855f33cf6f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -720,7 +720,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type)
+	if (!dp->hpd_gpiod && irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
 	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 025da25463a8..af5e5a8ec88d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -193,6 +193,11 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
+	if (dp->hpd_gpiod) {
+		analogix_dp_mute_hpd_interrupt(dp, HPD_IRQ_ALL);
+		return;
+	}
+
 	/*
 	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
 	 * pair can be used to implement hotplug detection.
@@ -415,7 +420,7 @@ void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq
 {
 	u32 reg;
 
-	if (dp->hpd_gpiod || !irq_type)
+	if (!irq_type)
 		return;
 
 	reg = analogix_dp_irq_type_to_common_int_sta4(irq_type);
-- 
2.34.1

