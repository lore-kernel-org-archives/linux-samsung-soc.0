Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107720;
	b=mwZThOfDlIOl9SYawEGmfxf289f3T9RIXSb8DtQhB9p527nRNAsfBUTYOLLEbPt7Uxgb
	 8fulkkJ8s7Id3Uchgvw2+kOfWkHwmUu+8jl4shjcsCDXnqQ1pHi95hk3uWVNDyF0fvZP9
	 WdbCRTLA16zqOJdQNSPEp8e+fEH8aQfgDX50ctpGIgfx8+grmOVbHmsQpKp1yjUVy0d+y
	 5iTvWlBhNs3Crt4JB1ikuElLPfexAuFfINiQIXXyolTajWxT9OjQMNtZ/2ePTw7jSPyn9
	 Z98b0NaSwxugCLivXJjFx6qX40/8VDiurHCu9lUsPxKfL6Si8U5/PmQsrq7CF2aLTlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107720;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=nOqC9OWKjg029mBZT3JOPxVG/2VXRtzk5BAZKZpnbTE=;
	b=yV95MDBQ7bmyFfWnsBCSlqEZztq0CExLZAPzfqU1wDiVj7RhshKVv7k2REhUkqtFPOnL
	 eBTCRZki3xG87GLc4dZDpp8lAiHvmbgYJigRED2KKTNKbFxNORmUZqICDYhcrSzyjQpUF
	 im+08OIyy3B6m9NNMlcJXKPqF6bGyhQ/t7ByEmnpq53Tjsc75l3ST8nTUm+o22nqkyk97
	 P9WGoEI/fn/BY4F4nLT2HUiYH3Z/GEn+w2Pw94KCADL4RMmBb9dLU/m64XIGPork0Vdsb
	 VESwJ3MsXBAbTJkXhML+lqILY43IsBEMCRiUR2DgnsjFPPLNkz7/FgZnow+TyTdCYpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Bgr8Ixgu;
	arc=none smtp.remote-ip=154.81.10.147
Received: from mail-m10147.netease.com (mail-m10147.netease.com [154.81.10.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D19606A32F;
	Tue, 27 Oct 2026 13:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D19606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Bgr8Ixgu
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a35;
	Tue, 27 Oct 2026 21:28:25 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 09/18] drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
Date: Tue, 27 Oct 2026 21:28:01 +0800
Message-Id: <20261027132810.1746118-10-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c3f5d03a8kunm87c266213d570d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH01DVh1CGUhPSExJSE5DHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Bgr8IxguL2oGLP8lYHE48F1V1ytVyVupOgQelu7W9QGn82ieDALfa254LgRconK1AlQyBAJ7t2wsELs92fzItrFr3aw4Mf9zT6yLoI1ej5kU0BrLgQdCbztBcYEZH7ztqOH7zvJG/m1yC+e8h+Z3FKHwAqF3wXdJm1zUXAWbzv8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nOqC9OWKjg029mBZT3JOPxVG/2VXRtzk5BAZKZpnbTE=;
	h=date:mime-version:subject:message-id:from;

Simplify analogix_dp_config_interrupt() by removing the local
COMMON_INT_MASK and INT_STA_MASK macros, replacing the open-coded
writel(0) calls for COMMON_INT_MASK_1~3, and leveraging
analogix_dp_unmute_hpd_interrupt() with the full HPD_IRQ_ALL mask to
initialize the HPD interrupt state.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Simplify the commig msg.
---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 6ac03a1aa512..0f1406e4a5d3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -18,12 +18,6 @@
 #include "analogix_dp_core.h"
 #include "analogix_dp_reg.h"
 
-#define COMMON_INT_MASK_1	0
-#define COMMON_INT_MASK_2	0
-#define COMMON_INT_MASK_3	0
-#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
-#define INT_STA_MASK		INT_HPD
-
 #define HPD_IRQ_ALL		(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
 
@@ -189,23 +183,12 @@ void analogix_dp_swreset(struct analogix_dp_device *dp)
 
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 {
-	u32 reg;
-
 	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_1;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
-
-	reg = COMMON_INT_MASK_2;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
-
-	reg = COMMON_INT_MASK_3;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
-
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
 }
 
 /*
-- 
2.34.1

