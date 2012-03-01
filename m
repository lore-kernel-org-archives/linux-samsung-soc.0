From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] [media] s5p-tv: Add initial DT-support for HDMIPHY
Date: Thu, 1 Mar 2012 08:41:33 +0530
Message-ID: <CAJuYYwSxb6kqtcdF+ifODTw+h657shEqgDuY3O70bph7GxKwwg@mail.gmail.com>
References: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
	<1330527107-21222-3-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330527107-21222-3-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: t.stanislaws@samsung.com, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 29 February 2012 20:21, Karol Lewandowski <k.lewandowsk@samsung.com>=
 wrote:
> Make it possible to instantiate driver from device tree description.
>
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0drivers/media/video/s5p-tv/hdmiphy_drv.c | =A0 10 ++++++++++
> =A01 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/media/video/s5p-tv/hdmiphy_drv.c b/drivers/media=
/video/s5p-tv/hdmiphy_drv.c
> index 6693f4a..77f5caa 100644
> --- a/drivers/media/video/s5p-tv/hdmiphy_drv.c
> +++ b/drivers/media/video/s5p-tv/hdmiphy_drv.c
> @@ -18,6 +18,7 @@
> =A0#include <linux/interrupt.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/err.h>
> +#include <linux/of.h>
>
> =A0#include <media/v4l2-subdev.h>
>
> @@ -165,10 +166,19 @@ static const struct i2c_device_id hdmiphy_id[] =
=3D {
> =A0};
> =A0MODULE_DEVICE_TABLE(i2c, hdmiphy_id);
>
> +#ifdef CONFIG_OF
> +static struct of_device_id hdmiphy_dt_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,exynos4210-hdmiphy" },
> + =A0 =A0 =A0 { },
> +};
> +MODULE_DEVICE_TABLE(of, hdmiphy_dt_match);
> +#endif
> +
> =A0static struct i2c_driver hdmiphy_driver =3D {
> =A0 =A0 =A0 =A0.driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s5p-hdmiphy",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(hdmiph=
y_dt_match),
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D hdmiphy_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(hdmiphy_remove=
),
> --
> 1.7.8.3
>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
