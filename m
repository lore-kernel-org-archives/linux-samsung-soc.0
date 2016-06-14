From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 09/10] drm/rockchip: analogix_dp: update the comments about why need to hardcode VOP output mode
Date: Tue, 14 Jun 2016 19:46:37 +0800
Message-ID: <1465904797-1117-1-git-send-email-ykk@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tomasz.figa@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The hardware IC designed that VOP must output the RGB10 video format to
eDP contoller, and if eDP panel only support RGB8, then eDP contoller
should cut down the video data, not via VOP contoller, that's why we need
to hardcode the VOP output mode to RGA10 here.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Acked-by: Mark Yao <mark.yao@rock-chips.com>
Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
---
Changes in v3:
- Add the reviewed flag from Tomasz.
    [https://chromium-review.googlesource.com/#/c/346853/12]
- Add the acked flag from Mark.

Changes in v2:
- new patch in v2

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 95a6f60..2ceb3f9 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -173,17 +173,11 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	int ret;
 
 	/*
-	 * FIXME(Yakir): driver should configure the CRTC output video
-	 * mode with the display information which indicated the monitor
-	 * support colorimetry.
-	 *
-	 * But don't know why the CRTC driver seems could only output the
-	 * RGBaaa rightly. For example, if connect the "innolux,n116bge"
-	 * eDP screen, EDID would indicated that screen only accepted the
-	 * 6bpc mode. But if I configure CRTC to RGB666 output, then eDP
-	 * screen would show a blue picture (RGB888 show a green picture).
-	 * But if I configure CTRC to RGBaaa, and eDP driver still keep
-	 * RGB666 input video mode, then screen would works prefect.
+	 * The hardware IC designed that VOP must output the RGB10 video
+	 * format to eDP contoller, and if eDP panel only support RGB8,
+	 * then eDP contoller should cut down the video data, not via VOP
+	 * contoller, that's why we need to hardcode the VOP output mode
+	 * to RGA10 here.
 	 */
 
 	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
-- 
1.9.1
