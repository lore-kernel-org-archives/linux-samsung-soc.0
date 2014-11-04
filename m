From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 08/14] mfd: max77686/802: Remove support for board
 files
Date: Tue, 4 Nov 2014 08:07:50 +0000
Message-ID: <20141104080750.GB17577@x1>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-9-git-send-email-k.kozlowski@samsung.com>
 <20141103170128.GD12011@x1>
 <1415087510.2389.4.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:51797 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaKDIH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 03:07:57 -0500
Received: by mail-ie0-f176.google.com with SMTP id rd18so6941715iec.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2014 00:07:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1415087510.2389.4.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, 04 Nov 2014, Krzysztof Kozlowski wrote:

> On pon, 2014-11-03 at 17:01 +0000, Lee Jones wrote:
> > On Thu, 30 Oct 2014, Krzysztof Kozlowski wrote:
> >=20
> > > The driver is used only on Exynos based boards with DTS support.
> > > Convert the driver to DTS-only version. This simplifies a little =
the
> > > code:
> > > 1. No dead (unused) entries in platform_data structure.
> > > 2. More code removed.
> > > 3. Regulator driver does not depend on allocated memory
> > >    from MFD driver.
> > > 4. It makes also easier extending the regulator driver.
> > >=20
> > > Add to the max77686 MFD driver dependency on CONFIG_OF because wi=
thout
> > > DTS the regulator drivers won't bind.
> > >=20
> > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.=
co.uk>
> > > ---
> > >  drivers/mfd/Kconfig                  |  1 +
> > >  drivers/mfd/max77686.c               | 23 ----------------------=
-
> > >  include/linux/mfd/max77686-private.h |  1 -
> > >  include/linux/mfd/max77686.h         | 28 ----------------------=
------
> > >  4 files changed, 1 insertion(+), 52 deletions(-)
> >=20
> > Applied, thanks.
>=20
>=20
> Noooo, don't apply it. It depends on previous patches removing the bo=
ard
> file support from regulators.
>=20
> If the patch looks OK, please only ack it. I would like to push
> everything through regulator tree.

Very well, patch dropped.

As long as Mark puts it on a succinct tagged branch it can go in
through his tree:

Acked-by: Lee Jones <lee.jones@linaro.org>

Mark,
  Please send me the tag to pull from once applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
