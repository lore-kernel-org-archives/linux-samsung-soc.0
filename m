Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605739;
	b=ZYxB49Zsg+/9NHEBNOloIv/s0CxS3EbvZyt+o2li1z9tGyNWr67bDFxIr0DhTSJfiQ6N
	 URoyREbmpx1Ep4YNr4OTL+z6YkgUP/uOV3rjeaE7kidIzrRoG8xm+lYi80ZXMaUZBm5kA
	 5i2iK3t1+VZ/OblITLGppxujslxHRAXzFr+ueLlzUa3Y1LixPVnn2YgpxZ7RtkD21RQR5
	 i2LlQl35qnt3V6Cy8NOPgnPQRI1o4DUXObnG4zpoY+fJ8QzOyxJBBRUMiBnYrHY+xH1Kk
	 T+ekbl44+Bt7V4dwNRk7d6/cH/OTLgpM5bA2pshttBcvHTx0shFLRRqnXkDc87A60AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605739;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ybHIHgPqplEUJRoppMm7glS9jAlf6L3WssQnCO+s3Qc=;
	b=sS/kd2FWI7MTuGFeaWxBxIezsNiXFKP1cW+HJ9sHolahd45g3bcgfR28+foI/FCynGMf
	 2tgA2CDfDEMratb41uHgg9CLp53Kxzvhc+a1ashP2Fy+rocTWmn0/jgevAanIfC2y7fBc
	 McFc1pyhGj+6UB8e3MpGa1MtyuJaiFJBhn9PXcmHvFh5LrgaSsoTTWfcbnZp9AiJtpHY+
	 swdBGAmQMfoAs8oHTswXjOap/31jQBglDkFQY3dSDx9Nwf4a00XlqYE+MbzszTtWbPYUZ
	 Wdjx+Wxp+/HrO0un+X1yzF4Sc+E3IeIPHfmt5HM5VtOSopMn2fFXgEzzOO83Omcz9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZyzKmEQ5;
	arc=none smtp.remote-ip=156.224.81.213
Received: from mail-m81213.xmail.ntesmail.com (mail-m81213.xmail.ntesmail.com [156.224.81.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80672606A6A4;
	Wed, 25 Nov 2026 11:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80672606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZyzKmEQ5
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f81605c;
	Wed, 25 Nov 2026 19:22:08 +0800 (GMT+08:00)
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
Subject: [PATCH v7 11/20] drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
Date: Wed, 25 Nov 2026 19:21:32 +0800
Message-Id: <20261125112141.1434903-12-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa212710edd03a8kunm17c230507758b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHxpOVklCSkxPQk9ITh9PTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZyzKmEQ5dTZ/f7GiSnv9b5lgMJ++sN4FUiLOr4HbX2mht8Z1cHJaKtGPjMvhYwhbydoZalfFo66J3NryGjfMsCJ3tCaQN1D06H1ZAlwc6YMKGIrggWqhejjoGGU8XWA3RAEPbXH+OWtMSIsbnveH7HBIJ8tlNLNZKcOzriah+jY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ybHIHgPqplEUJRoppMm7glS9jAlf6L3WssQnCO+s3Qc=;
	h=date:mime-version:subject:message-id:from;

Simplify analogix_dp_config_interrupt() by removing the local
COMMON_INT_MASK and INT_STA_MASK macros, replacing the open-coded
writel(0) calls for COMMON_INT_MASK_1~3, and leveraging
analogix_dp_unmute_hpd_interrupt() with the full HPD_IRQ_ALL mask to
initialize the HPD interrupt state.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Simplify the commig msg.

Changes in v6:
- Add Tested-by tag.
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

