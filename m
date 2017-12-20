From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/4] ARM: dts: split trats2 DTS in preparation for
 midas boards
Date: Wed, 20 Dec 2017 12:19:08 -0600
Message-ID: <20171220181908.vl7jmcyrt7ow6rni@rob-hp-laptop>
References: <20171218123805.26345-1-simon@lineageos.org>
 <20171218123805.26345-3-simon@lineageos.org>
 <CAJKOXPdzAvsaAOo6P+UA8VWYd7YjmtSqtkyKtNaz7jNdUXUH4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPdzAvsaAOo6P+UA8VWYd7YjmtSqtkyKtNaz7jNdUXUH4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 20, 2017 at 03:05:18PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 18, 2017 at 1:38 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
> > The midas boards share a lot with trats2. Split the common parts
> > out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
> >
> > Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  145 ++
> >  ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  117 +-
> >  arch/arm/boot/dts/exynos4412-trats2.dts            | 1446 +-------------------
> >  3 files changed, 184 insertions(+), 1524 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> >  copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (92%)
> >  rewrite arch/arm/boot/dts/exynos4412-trats2.dts (97%)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > new file mode 100644
> > index 000000000000..2806236484a6
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> > @@ -0,0 +1,145 @@
> > +/*
> > + * Samsung's Exynos4412 based Galaxy S3 board device tree source
> > + *
> > + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> > + *             http://www.samsung.com
> > + *
> > + * Device tree source file for Samsung's Galaxy S3 boards which are based on
> > + * Samsung's Exynos4412 SoC.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> 
> One new line to make it consistent with others.

If you're going to change it, use an SPDX tag.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
