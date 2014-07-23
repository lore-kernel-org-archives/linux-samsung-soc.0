From: "Tobias Jakobi" <Liquid.Acid@gmx.net>
Subject: Aw: [PATCH] drm/exynos: g2d: let exynos_g2d_get_ver_ioctl fail
Date: Wed, 23 Jul 2014 16:28:16 +0200
Message-ID: <trinity-fc385b5f-a6bf-4ab5-848d-417afbbe3004-1406125696839@3capp-gmx-bs69>
References: <1406123832-7026-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:49523 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757725AbaGWO2U convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jul 2014 10:28:20 -0400
In-Reply-To: <1406123832-7026-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, t.figa@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Sorry for the noise! Please disregard the patch for now, it causes more=
 trouble than it solves!

- Tobias
=C2=A0

Gesendet:=C2=A0Mittwoch, 23. Juli 2014 um 15:57 Uhr
Von:=C2=A0"Tobias Jakobi" <tjakobi@math.uni-bielefeld.de>
An:=C2=A0linux-samsung-soc@vger.kernel.org
Cc:=C2=A0dri-devel@lists.freedesktop.org, t.figa@samsung.com, inki.dae@=
samsung.com, "Tobias Jakobi" <tjakobi@math.uni-bielefeld.de>
Betreff:=C2=A0[PATCH] drm/exynos: g2d: let exynos_g2d_get_ver_ioctl fai=
l
Currently the DRM_IOCTL_EXYNOS_G2D_GET_VER ioctl always succeeds, even
if no G2D support is available. Let the ioctl fail when this is the
case, so that userspace can accurately probe for G2D support.

This also fixes the exynos tests in libdrm. There 'g2d_init' doesn't
fail when G2D is absent, leading to a segfault later.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 +++++++++++
1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.c
index 5fa1bb6..cde8a89 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1042,8 +1042,19 @@ err:
int exynos_g2d_get_ver_ioctl(struct drm_device *drm_dev, void *data,
struct drm_file *file)
{
+ struct drm_exynos_file_private *file_priv =3D file->driver_priv;
+ struct exynos_drm_g2d_private *g2d_priv =3D file_priv->g2d_priv;
+ struct device *dev =3D g2d_priv->dev;
+ struct g2d_data *g2d;
struct drm_exynos_g2d_get_ver *ver =3D data;

+ if (!dev)
+ return -ENODEV;
+
+ g2d =3D dev_get_drvdata(dev);
+ if (!g2d)
+ return -EFAULT;
+
ver->major =3D G2D_HW_MAJOR_VER;
ver->minor =3D G2D_HW_MINOR_VER;

--
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
