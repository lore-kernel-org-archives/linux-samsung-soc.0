From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: fix check on array index
Date: Mon, 12 May 2014 17:07:23 +0200
Message-ID: <5370E3AB.7090306@samsung.com>
References: <1399899388-13101-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37464 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754881AbaELPHa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 11:07:30 -0400
In-reply-to: <1399899388-13101-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>
Cc: kgene.kim@samsung.com, kishon@ti.com, sylvester.nawrocki@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/05/14 14:56, Antoine T=C3=A9nart wrote:
> The phys array is of size EXYNOS_MIPI_PHYS_NUM. Trying to access the
> index EXYNOS_MIPI_PHYS_NUM should return an error.
>=20
> Fixes: 069d2e26e9d6 "phy: Add driver for Exynos MIPI CSIS/DSIM DPHYs"
>=20
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>

Thanks for the fix,

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>  drivers/phy/phy-exynos-mipi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-ex=
ynos-mipi-video.c
> index 7f139326a642..ff026689358c 100644
> --- a/drivers/phy/phy-exynos-mipi-video.c
> +++ b/drivers/phy/phy-exynos-mipi-video.c
> @@ -101,7 +101,7 @@ static struct phy *exynos_mipi_video_phy_xlate(st=
ruct device *dev,
>  {
>  	struct exynos_mipi_video_phy *state =3D dev_get_drvdata(dev);
> =20
> -	if (WARN_ON(args->args[0] > EXYNOS_MIPI_PHYS_NUM))
> +	if (WARN_ON(args->args[0] >=3D EXYNOS_MIPI_PHYS_NUM))
>  		return ERR_PTR(-ENODEV);
> =20
>  	return state->phys[args->args[0]].phy;
