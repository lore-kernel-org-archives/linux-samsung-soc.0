From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 1/2] phy: core: Fix of_phy_provider_lookup to return
 PHY provider for sub node
Date: Mon, 7 Jul 2014 14:43:11 +0100
Message-ID: <20140707134311.GJ6407@lee--X1>
References: <1404486474-28312-1-git-send-email-kishon@ti.com>
 <1404486474-28312-2-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:43485 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344AbaGGNnR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 09:43:17 -0400
Received: by mail-ie0-f170.google.com with SMTP id lx4so2703245iec.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2014 06:43:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1404486474-28312-2-git-send-email-kishon@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sergei.shtylyov@cogentembedded.com, antoine.tenart@free-electrons.com, kgene.kim@samsung.com, maxime.ripard@free-electrons.com

On Fri, 04 Jul 2014, Kishon Vijay Abraham I wrote:

> Fixed of_phy_provider_lookup to return 'phy_provider' if _of_phy_get
> passes the node pointer of the sub-node of phy provider node. This is
> needed when phy provider implements multiple PHYs and each PHY is
> modelled as the sub-node of PHY provider device node.
>=20
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/phy/phy-core.c |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index c64a2f3..a4a1f783 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -86,10 +86,18 @@ static struct phy *phy_lookup(struct device *devi=
ce, const char *port)
>  static struct phy_provider *of_phy_provider_lookup(struct device_nod=
e *node)
>  {
>  	struct phy_provider *phy_provider;
> +	struct device_node *child;
> =20
>  	list_for_each_entry(phy_provider, &phy_provider_list, list) {
> -		if (phy_provider->dev->of_node =3D=3D node)
> +		if (phy_provider->dev->of_node !=3D node) {
> +			for_each_child_of_node(phy_provider->dev->of_node,
> +				child) {
> +				if (child =3D=3D node)
> +					return phy_provider;
> +			}
> +		} else {
>  			return phy_provider;
> +		}
>  	}
> =20
>  	return ERR_PTR(-EPROBE_DEFER);

How about this instead:

>  	list_for_each_entry(phy_provider, &phy_provider_list, list) {
> 		if (phy_provider->dev->of_node =3D=3D node)
>  			return phy_provider;
> +
> +		for_each_child_of_node(phy_provider->dev->of_node, child)
> +			if (child =3D=3D node)
> +				return phy_provider;
>  	}

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
