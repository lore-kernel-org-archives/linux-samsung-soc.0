From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 2/2] dt-bindings: analogix_dp: rockchip: correct the wrong compatible name
Date: Thu, 23 Jun 2016 09:47:04 +0800
Message-ID: <1466646424-10583-1-git-send-email-ykk@rock-chips.com>
References: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:36613 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709AbcFWBrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 21:47:19 -0400
In-Reply-To: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

The document about rockchip platform make a mistaken in available
compatible name of "rk3288-edp", we should correct it to "rk3288-dp"
which correspond to the compatible name in driver.

This mistaken was introduced in commit be91c36247089 ("dt-bindings:
add document for rockchip variant of analogix_dp").

Reported-by: Tomasz Figa <tfiga@chromium.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Hi all,

This is an external patch for analogix_dp misc cleanup thread [0]
[0]: https://patchwork.kernel.org/patch/9175613/

BR,
- Yakir

Changes in v4: None
Changes in v3:
- Add this patch in v3

 .../devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
index 0b39256..01cced1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -2,7 +2,7 @@ Rockchip RK3288 specific extensions to the Analogix Display Port
 ================================
 
 Required properties:
-- compatible: "rockchip,rk3288-edp",
+- compatible: "rockchip,rk3288-dp",
 	      "rockchip,rk3399-edp";
 
 - reg: physical base address of the controller and length
-- 
1.9.1
