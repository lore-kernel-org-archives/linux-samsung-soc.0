From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 02/14] mfd: max77686: Allow the max77686 rtc to wakeup
 the system
Date: Thu, 26 Jun 2014 11:03:59 +0200
Message-ID: <1403773439.27156.1.camel@AMDC1943>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403723019-6212-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40911 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755011AbaFZJEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:04:08 -0400
In-reply-to: <1403723019-6212-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On =C5=9Bro, 2014-06-25 at 21:03 +0200, Javier Martinez Canillas wrote:
> From: Doug Anderson <dianders@chromium.org>
>=20
> The max77686 includes an RTC that keeps power during suspend.  It's
> convenient to be able to use it as a wakeup source.
>=20
> NOTE: due to wakeup ordering problems this patch alone doesn't work s=
o
> well on exynos5250-snow.  You also need something that brings the i2c
> bus up before the max77686 wakeup runs.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> ---
>=20
> Changes since v3:
>  - Keep the note that this patch needs another change due wakeup
>    ordering problems.
>=20
>  drivers/rtc/rtc-max77686.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d20a7f0..c1c6055 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -583,6 +583,33 @@ static void max77686_rtc_shutdown(struct platfor=
m_device *pdev)
>  #endif /* MAX77686_RTC_WTSR_SMPL */
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static int max77686_rtc_suspend(struct device *dev)
> +{
> +	if (device_may_wakeup(dev)) {
> +		struct max77686_rtc_info *info =3D dev_get_drvdata(dev);
> +
> +		return enable_irq_wake(info->virq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77686_rtc_resume(struct device *dev)
> +{
> +	if (device_may_wakeup(dev)) {
> +		struct max77686_rtc_info *info =3D dev_get_drvdata(dev);
> +
> +		return disable_irq_wake(info->virq);
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(max77686_rtc_pm_ops,
> +			 max77686_rtc_suspend, max77686_rtc_resume);
> +
>  static const struct platform_device_id rtc_id[] =3D {
>  	{ "max77686-rtc", 0 },
>  	{},
> @@ -592,6 +619,7 @@ static struct platform_driver max77686_rtc_driver=
 =3D {
>  	.driver		=3D {
>  		.name	=3D "max77686-rtc",
>  		.owner	=3D THIS_MODULE,
> +		.pm	=3D &max77686_rtc_pm_ops,
>  	},
>  	.probe		=3D max77686_rtc_probe,
>  	.shutdown	=3D max77686_rtc_shutdown,
