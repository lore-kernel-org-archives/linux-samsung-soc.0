From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 09/11] drm/bridge: analogix_dp: fix no drm hpd event when panel plug in
Date: Wed, 29 Jun 2016 17:15:47 +0800
Message-ID: <1467191747-17480-1-git-send-email-ykk@rock-chips.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The enum value of DP_IRQ_TYPE_HP_CABLE_IN is zero, but driver only
send drm hp event when the irq_type and the enum value is true.

if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN || ...)
	drm_helper_hpd_irq_event(dp->drm_dev);

So there would no drm hpd event when cable plug in, to fix that
just need to assign all hotplug enum with no-zero values.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: St=C3=A9phane Marchesin <marcheu@chromium.org>
Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
Changes in v4:
- Add reviewed flag from Sean.
- Add reviewed flag from Tomasz.

Changes in v3:
- Add reviewed flag from St=C3=A9phane.
    [https://chromium-review.googlesource.com/#/c/346319/15]
- Add tested flag from Javier

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.h
index f09275d..b456380 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -127,10 +127,10 @@ enum analog_power_block {
 };
=20
 enum dp_irq_type {
-	DP_IRQ_TYPE_HP_CABLE_IN,
-	DP_IRQ_TYPE_HP_CABLE_OUT,
-	DP_IRQ_TYPE_HP_CHANGE,
-	DP_IRQ_TYPE_UNKNOWN,
+	DP_IRQ_TYPE_HP_CABLE_IN  =3D BIT(0),
+	DP_IRQ_TYPE_HP_CABLE_OUT =3D BIT(1),
+	DP_IRQ_TYPE_HP_CHANGE    =3D BIT(2),
+	DP_IRQ_TYPE_UNKNOWN      =3D BIT(3),
 };
=20
 struct video_info {
--=20
1.9.1
