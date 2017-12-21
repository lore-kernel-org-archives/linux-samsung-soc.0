From: Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH v3 2/4] ARM: dts: split trats2 DTS in preparation for
 midas boards
Date: Thu, 21 Dec 2017 12:54:15 +1100
Message-ID: <20171221015415.GB23568@lineageos.org>
References: <20171218123805.26345-1-simon@lineageos.org>
 <20171218123805.26345-3-simon@lineageos.org>
 <CAJKOXPdzAvsaAOo6P+UA8VWYd7YjmtSqtkyKtNaz7jNdUXUH4A@mail.gmail.com>
 <20171220181908.vl7jmcyrt7ow6rni@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:36351 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755834AbdLUByY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 20:54:24 -0500
Content-Disposition: inline
In-Reply-To: <20171220181908.vl7jmcyrt7ow6rni@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

Hi Rob,

On Wed, Dec 20, 2017 at 12:19:08PM -0600, Rob Herring wrote:
> On Wed, Dec 20, 2017 at 03:05:18PM +0100, Krzysztof Kozlowski wrote:
> > On Mon, Dec 18, 2017 at 1:38 PM, Simon Shields <simon@lineageos.org> wrote:
> > > The midas boards share a lot with trats2. Split the common parts
> > > out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
> > >
> > > Signed-off-by: Simon Shields <simon@lineageos.org>
> > > ---
> > >  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  145 ++
> > >  ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  117 +-
> > >  arch/arm/boot/dts/exynos4412-trats2.dts            | 1446 +-------------------
> > >  3 files changed, 184 insertions(+), 1524 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > >  copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (92%)
> > >  rewrite arch/arm/boot/dts/exynos4412-trats2.dts (97%)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > > new file mode 100644
> > > index 000000000000..2806236484a6
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > > @@ -0,0 +1,145 @@
> > > +/*
> > > + * Samsung's Exynos4412 based Galaxy S3 board device tree source
> > > + *
> > > + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> > > + *             http://www.samsung.com
> > > + *
> > > + * Device tree source file for Samsung's Galaxy S3 boards which are based on
> > > + * Samsung's Exynos4412 SoC.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License version 2 as
> > > + * published by the Free Software Foundation.
> > > + */
> > 
> > One new line to make it consistent with others.
> 
> If you're going to change it, use an SPDX tag.
> 

I initially did this in v2[1], but Krzysztof said to keep
the trats2 copyright header, since the galaxy-s3 dts is a
subset of the old trats2 DTS. Is adding the SPDX tag and
keeping the Samsung copyright stanza the preferred approach
here?

[1]: https://patchwork.kernel.org/patch/10111971/
> Rob

Cheers,
Simon
