From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 2/2] phy: core: the node pointer of PHY need not be
 the same as that of PHY provider
Date: Mon, 7 Jul 2014 15:59:10 +0100
Message-ID: <20140707145910.GK6407@lee--X1>
References: <1404486474-28312-1-git-send-email-kishon@ti.com>
 <1404486474-28312-3-git-send-email-kishon@ti.com>
 <20140707131232.GI6407@lee--X1>
 <53BAAA19.9050106@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:46315 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753217AbaGGO7Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 10:59:16 -0400
Received: by mail-ie0-f170.google.com with SMTP id lx4so2803213iec.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2014 07:59:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53BAAA19.9050106@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sergei.shtylyov@cogentembedded.com, antoine.tenart@free-electrons.com, kgene.kim@samsung.com, maxime.ripard@free-electrons.com

On Mon, 07 Jul 2014, Kishon Vijay Abraham I wrote:

> Hi,
>=20
> On Monday 07 July 2014 06:42 PM, Lee Jones wrote:
> > On Fri, 04 Jul 2014, Kishon Vijay Abraham I wrote:
> >=20
> >> In case of multi-phy PHY providers, each PHY should be modeled as =
a sub
> >> node of the PHY provider. Then each PHY will have a different node=
 pointer
> >> (node pointer of sub node) than that of PHY provider. Added this p=
rovision
> >> in the PHY core.
> >> Also fixed all drivers to use the updated API.
> >>
> >> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> >> ---
> >>  Documentation/phy.txt               |   10 ++++++----
> >>  drivers/phy/phy-bcm-kona-usb2.c     |    2 +-
> >>  drivers/phy/phy-core.c              |   25 ++++++++++++++++++----=
---
> >>  drivers/phy/phy-exynos-dp-video.c   |    2 +-
> >>  drivers/phy/phy-exynos-mipi-video.c |    2 +-
> >>  drivers/phy/phy-exynos5-usbdrd.c    |    3 ++-
> >>  drivers/phy/phy-exynos5250-sata.c   |    2 +-
> >>  drivers/phy/phy-mvebu-sata.c        |    2 +-
> >>  drivers/phy/phy-omap-usb2.c         |    2 +-
> >>  drivers/phy/phy-samsung-usb2.c      |    3 ++-
> >>  drivers/phy/phy-sun4i-usb.c         |    2 +-
> >>  drivers/phy/phy-ti-pipe3.c          |    2 +-
> >>  drivers/phy/phy-twl4030-usb.c       |    2 +-
> >>  drivers/phy/phy-xgene.c             |    2 +-
> >>  include/linux/phy/phy.h             |   15 ++++++++++-----
> >>  15 files changed, 48 insertions(+), 28 deletions(-)
> >=20
> > I wrote a very similar patch already.  I knew I should have sent it=
 on
> > Friday. :(
>=20
> No problem! you can send your patch along with the MiPHY series.

That's okay.  It's silly for us both to submit the same patch and
yours hit the MLs first & looks good so, the honour is yours.

> > Patch looks good, just a real minor point.
> >=20
> >>  	phy->dev.class =3D phy_class;
> >>  	phy->dev.parent =3D dev;
> >> -	phy->dev.of_node =3D dev->of_node;
> >> +	phy->dev.of_node =3D node?node:dev->of_node;
> >=20
> > There should be spaces either side of the '?' and ':', or you can d=
o
> > this more succinctly by:
> >=20
> > phy->dev.of_node =3D node ?: dev->of_node;
> >=20
> > Once fixed, feel free to add my:
> >=20
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
