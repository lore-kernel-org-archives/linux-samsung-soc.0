From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCHv2 5/5] ARM: dts: Add dt binding documentation for exynos
 rotator
Date: Fri, 09 Aug 2013 19:22:25 +0900
Message-ID: <011001ce94ea$579258f0$06b70ad0$@samsusng.com>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
 <1376034053-31910-6-git-send-email-chanho61.park@samsung.com>
 <CAK9yfHzQ+vfsdYU-HZrmW5LbU7+ME-qF-xqZk+dx6AS_CKkgzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53714 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965879Ab3HIKW1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 06:22:27 -0400
In-reply-to: <CAK9yfHzQ+vfsdYU-HZrmW5LbU7+ME-qF-xqZk+dx6AS_CKkgzQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Hi Sachin,

> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Friday, August 09, 2013 6:40 PM
> To: Chanho Park
> Cc: inki.dae@samsung.com; kgene.kim@samsung.com; dri-
> devel@lists.freedesktop.org; kyungmin.park@samsung.com;
> mark.rutland@arm.com; l.stach@pengutronix.de; s.nawrocki@samsung.com;
> tomasz.figa@gmail.com; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; Thomas Abraham
> Subject: Re: [PATCHv2 5/5] ARM: dts: Add dt binding documentation for
> exynos rotator
> 
> Hi Chanho,
> 
> On 9 August 2013 13:10, Chanho Park <chanho61.park@samsung.com> wrote:
> > This patch describes each nodes of rotator and specifies a example how
> > to bind it.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  .../devicetree/bindings/gpu/samsung-rotator.txt    |   26
> ++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > new file mode 100644
> > index 0000000..31ee7b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > @@ -0,0 +1,26 @@
> > +* Samsung Image Rotator
> > +
> > +Required properties:
> > +  - compatible : value should be following:
> 
> This should be "should be one of the following:"

I left out while I changed it to select multiple choices.
Thanks.

> 
> > +       (a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
> > +       (b) "samsung,exynos4212-rotator" for Rotator IP in
> Exynos4212/4412
> > +       (c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
> > +
> > +  - reg : Physical base address of the IP registers and length of
> memory
> > +         mapped region.
> > +
> > +  - interrupts : Interrupt number of Rotator
> > +
> > +  - clocks : Clock number described in
> Documentations/devicetree/binding/clock.
> 
> The path has several typos. Instead you can simply mention clocks : from
> common clock binding: handle to rotator clock.

Oh, it has many typos. I'll change it.
Thanks for your review.

Best Regards,
Chanho Park
