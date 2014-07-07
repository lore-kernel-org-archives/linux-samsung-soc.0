From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 2/2] phy: core: the node pointer of PHY need not be
 the same as that of PHY provider
Date: Mon, 7 Jul 2014 14:12:32 +0100
Message-ID: <20140707131232.GI6407@lee--X1>
References: <1404486474-28312-1-git-send-email-kishon@ti.com>
 <1404486474-28312-3-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1404486474-28312-3-git-send-email-kishon@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sergei.shtylyov@cogentembedded.com, antoine.tenart@free-electrons.com, kgene.kim@samsung.com, maxime.ripard@free-electrons.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Jul 2014, Kishon Vijay Abraham I wrote:

> In case of multi-phy PHY providers, each PHY should be modeled as a s=
ub
> node of the PHY provider. Then each PHY will have a different node po=
inter
> (node pointer of sub node) than that of PHY provider. Added this prov=
ision
> in the PHY core.
> Also fixed all drivers to use the updated API.
>=20
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/phy.txt               |   10 ++++++----
>  drivers/phy/phy-bcm-kona-usb2.c     |    2 +-
>  drivers/phy/phy-core.c              |   25 ++++++++++++++++++-------
>  drivers/phy/phy-exynos-dp-video.c   |    2 +-
>  drivers/phy/phy-exynos-mipi-video.c |    2 +-
>  drivers/phy/phy-exynos5-usbdrd.c    |    3 ++-
>  drivers/phy/phy-exynos5250-sata.c   |    2 +-
>  drivers/phy/phy-mvebu-sata.c        |    2 +-
>  drivers/phy/phy-omap-usb2.c         |    2 +-
>  drivers/phy/phy-samsung-usb2.c      |    3 ++-
>  drivers/phy/phy-sun4i-usb.c         |    2 +-
>  drivers/phy/phy-ti-pipe3.c          |    2 +-
>  drivers/phy/phy-twl4030-usb.c       |    2 +-
>  drivers/phy/phy-xgene.c             |    2 +-
>  include/linux/phy/phy.h             |   15 ++++++++++-----
>  15 files changed, 48 insertions(+), 28 deletions(-)

I wrote a very similar patch already.  I knew I should have sent it on
=46riday. :(

Patch looks good, just a real minor point.

>  	phy->dev.class =3D phy_class;
>  	phy->dev.parent =3D dev;
> -	phy->dev.of_node =3D dev->of_node;
> +	phy->dev.of_node =3D node?node:dev->of_node;

There should be spaces either side of the '?' and ':', or you can do
this more succinctly by:

phy->dev.of_node =3D node ?: dev->of_node;

Once fixed, feel free to add my:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
