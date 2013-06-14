From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH 7/9] drm/exynos: use of_get_named_gpio to get hdmi hpd gpio
Date: Fri, 14 Jun 2013 16:17:52 +0900
Message-ID: <51BAC3A0.7000002@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
 <1370959891-8923-8-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11021 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933Ab3FNHSB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 03:18:01 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD00KXAG9NQZ60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 16:17:51 +0900 (KST)
In-reply-to: <1370959891-8923-8-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, joshi@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello Rahul,

this patch is not related with others and it looks good to me.

On 2013=EB=85=84 06=EC=9B=94 11=EC=9D=BC 23:11, Rahul Sharma wrote:
> Cleanup by removing flags variable from drm_hdmi_dt_parse_pdata
> which is not used anywhere. Swtiching to of_get_named_gpio instead
> of of_get_named_gpio_flags solved this.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 1eb5ffb..fc6a9b0 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2081,7 +2081,6 @@ static struct s5p_hdmi_platform_data *drm_hdmi_=
dt_parse_pdata
>  {
>  	struct device_node *np =3D dev->of_node;
>  	struct s5p_hdmi_platform_data *pd;
> -	enum of_gpio_flags flags;
>  	u32 value;
> =20
>  	pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> @@ -2095,7 +2094,7 @@ static struct s5p_hdmi_platform_data *drm_hdmi_=
dt_parse_pdata
>  		goto err_data;
>  	}
> =20
> -	pd->hpd_gpio =3D of_get_named_gpio_flags(np, "hpd-gpio", 0, &flags)=
;
> +	pd->hpd_gpio =3D of_get_named_gpio(np, "hpd-gpio", 0);
> =20
>  	return pd;
> =20
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
