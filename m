From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 4/8] drm: bridge: analogix_dp: correct the register bit define error in ANALOGIX_DP_PLL_REG_1
Date: Mon, 25 Apr 2016 19:34:23 +0800
Message-ID: <1461584063-6162-1-git-send-email-ykk@rock-chips.com>
References: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Mark Yao <yzq@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

There're an register define error in ANALOGIX_DP_PLL_REG_1 which introduced
by commit bcec20fd5ad6 ("drm: bridge: analogix/dp: add some rk3288 special
registers setting").

The PHY PLL input clock source is selected by ANALOGIX_DP_PLL_REG_1
BIT 0, not BIT 1.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index 337912b..88d56ad 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -163,8 +163,8 @@
 #define HSYNC_POLARITY_CFG			(0x1 << 0)
 
 /* ANALOGIX_DP_PLL_REG_1 */
-#define REF_CLK_24M				(0x1 << 1)
-#define REF_CLK_27M				(0x0 << 1)
+#define REF_CLK_24M				(0x1 << 0)
+#define REF_CLK_27M				(0x0 << 0)
 
 /* ANALOGIX_DP_LANE_MAP */
 #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
-- 
1.9.1
