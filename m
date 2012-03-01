From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] [media] s5p-g2d: Make it possible to instantiate driver
 from DT
Date: Thu, 1 Mar 2012 08:50:59 +0530
Message-ID: <CAJuYYwQ54idFZGvyujimrhhedSveK9ob8j+686D6ABdavAA_SA@mail.gmail.com>
References: <1330523672-16453-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38156 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753166Ab2CADVA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 22:21:00 -0500
Received: by vbbff1 with SMTP id ff1so130143vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 19:21:00 -0800 (PST)
In-Reply-To: <1330523672-16453-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: k.debski@samsung.com, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 29 February 2012 19:24, Karol Lewandowski <k.lewandowsk@samsung.com>=
 wrote:
> This driver requires standard properties only (address and irq)
> which are automatically marshalled into plain old resources by OF cor=
e.
>
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0drivers/media/video/s5p-g2d/g2d.c | =A0 =A09 +++++++++
> =A01 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/media/video/s5p-g2d/g2d.c b/drivers/media/video/=
s5p-g2d/g2d.c
> index febaa67..e7c0020 100644
> --- a/drivers/media/video/s5p-g2d/g2d.c
> +++ b/drivers/media/video/s5p-g2d/g2d.c
> @@ -20,6 +20,7 @@
> =A0#include <linux/interrupt.h>
>
> =A0#include <linux/platform_device.h>
> +#include <linux/of.h>
> =A0#include <media/v4l2-mem2mem.h>
> =A0#include <media/v4l2-device.h>
> =A0#include <media/v4l2-ioctl.h>
> @@ -795,12 +796,20 @@ static int g2d_remove(struct platform_device *p=
dev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +#ifdef CONFIG_OF
> +static struct of_device_id g2d_dt_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,exynos4210-g2d" },

The comment about the base version in the previous patch applies here t=
oo.

> + =A0 =A0 =A0 {},
> +};
> +#endif
> +
> =A0static struct platform_driver g2d_pdrv =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D g2d_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D g2d_remove,
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D G2D_NAME,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(g2d_dt=
_match),
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.7.8.3

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
