From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 1/2] drm/panel: simple-panel: add the delay timing for Sharp LQ123P1JX31
Date: Thu, 21 Jul 2016 21:14:34 +0800
Message-ID: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:52503 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430AbcGUNOq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 09:14:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

According to page 16 of Sharp LQ123P1JX31 datasheet, we need to add the
missing delay timing. Panel prepare time should be t1 (0.5ms~10ms) plus
t3 (0ms~100ms), and panel enable time should equal to t7 (0ms~50ms), and
panel unprepare time should be t11 (1ms~50ms) plus t12 (500ms~).

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 85143d1..f178998 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1384,6 +1384,11 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 		.width = 259,
 		.height = 173,
 	},
+	.delay = {
+		.prepare = 110,
+		.enable = 50,
+		.unprepare = 550,
+	},
 };
 
 static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
-- 
1.9.1
