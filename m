From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/3] [media] s5p-tv: Add initial DT-support for TV mixer
Date: Thu, 1 Mar 2012 08:48:15 +0530
Message-ID: <CAJuYYwSYtSzbxjtCBbXxHp33Zo+-4=YrA+LVZvOe=X8-c+vxJQ@mail.gmail.com>
References: <1330527107-21222-1-git-send-email-k.lewandowsk@samsung.com>
	<1330527107-21222-4-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330527107-21222-4-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: t.stanislaws@samsung.com, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 29 February 2012 20:21, Karol Lewandowski <k.lewandowsk@samsung.com>=
 wrote:
> ---
> =A0drivers/media/video/s5p-tv/mixer_drv.c | =A0 =A09 +++++++++
> =A01 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/media/video/s5p-tv/mixer_drv.c b/drivers/media/v=
ideo/s5p-tv/mixer_drv.c
> index a2c0c25..6bf4a9e 100644
> --- a/drivers/media/video/s5p-tv/mixer_drv.c
> +++ b/drivers/media/video/s5p-tv/mixer_drv.c
> @@ -448,6 +448,14 @@ static int __devexit mxr_remove(struct platform_=
device *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id mxr_dt_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,exynos4210-tvmixer" },

If the tvmixer module is also available in SoC's prior to Exynos4210,
and if tvmixer in Exynos4210 is similar to tvmixer found on prior
SoC's, the base version should indicate that. For instance, if the
tvmixer started to appear from s5pv210 onwards, then the compatible
value should be "samsung,s5pv210-tvmixer". The compatible string
should indicate the base version.

> + =A0 =A0 =A0 { },
> +};
> +MODULE_DEVICE_TABLE(of, mxr_dt_match);
> +#endif
> +
> =A0static struct platform_driver mxr_driver __refdata =3D {
> =A0 =A0 =A0 =A0.probe =3D mxr_probe,
> =A0 =A0 =A0 =A0.remove =3D __devexit_p(mxr_remove),
> @@ -455,6 +463,7 @@ static struct platform_driver mxr_driver __refdat=
a =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D MXR_DRIVER_NAME,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =3D &mxr_pm_ops,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(mxr_dt=
_match),
> =A0 =A0 =A0 =A0}
> =A0};
>
> --
> 1.7.8.3
>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
