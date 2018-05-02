From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] drm/sti: do not remove the drm_bridge that was never added
Date: Wed,  2 May 2018 09:40:23 +0200
Message-ID: <20180502074025.12421-2-peda@axentia.se>
References: <20180502074025.12421-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502074025.12421-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The more natural approach would perhaps be to add an drm_bridge_add,
but there are several other bridges that never call drm_bridge_add.
Just removing the drm_bridge_remove is the easier fix.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/sti/sti_hda.c  | 1 -
 drivers/gpu/drm/sti/sti_hdmi.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 67bbdb49fffc..199db13f565c 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -721,7 +721,6 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_sysfs:
-	drm_bridge_remove(bridge);
 	return -EINVAL;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 58f431102512..932724784942 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1315,7 +1315,6 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_sysfs:
-	drm_bridge_remove(bridge);
 	hdmi->drm_connector = NULL;
 	return -EINVAL;
 }
-- 
2.11.0
