From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Add MODULE_DEVICE_TABLE entry
Date: Sat, 23 Aug 2014 18:23:15 +0200
Message-ID: <53F8BFF3.8020001@suse.de>
References: <1408715892-27728-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49753 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326AbaHWQXV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Aug 2014 12:23:21 -0400
In-Reply-To: <1408715892-27728-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org

Hi,

Am 22.08.2014 15:58, schrieb Sjoerd Simons:
> Add a MODULE_DEVICE_TABLE call for OF match tables. This allows the
> module to be autoloaded based on devicetree information.
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  drivers/phy/phy-exynos5-usbdrd.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exyno=
s5-usbdrd.c
> index b05302b..e9a0f54 100644
> --- a/drivers/phy/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/phy-exynos5-usbdrd.c
> @@ -542,6 +542,7 @@ static const struct of_device_id exynos5_usbdrd_p=
hy_of_match[] =3D {
>  	},
>  	{ },
>  };
> +MODULE_DEVICE_TABLE (of, exynos5_usbdrd_phy_of_match);

Nit: Probably there should be no space before '('?

> =20
>  static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>  {

Otherwise certainly sensible. I ran into another such case myself.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
