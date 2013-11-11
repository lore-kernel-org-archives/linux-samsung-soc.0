From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Add enable property to power domains
Date: Mon, 11 Nov 2013 15:28:44 +0100
Message-ID: <2964665.KKjuSDVdEA@flatron>
References: <1B.DE.05666.EC070825@epcpsbgx2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:40734 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753345Ab3KKO2s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Nov 2013 09:28:48 -0500
In-Reply-To: <1B.DE.05666.EC070825@epcpsbgx2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: prathyush.k@samsung.com
Cc: Sachin Kamat <sachin.kamat@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Prathyush,

Thanks for your reply. However, please do not use HTML messages to reply
to mailing lists, as many of them filter out such.

On Monday 11 of November 2013 05:53:18 Prathyush Kalashwaram wrote:
> Hi Tomasz,
>  
> The enable values for some configuration registers are not 0x7.
> Though there is no issue observed (so far) in using 0x7, it is better to use the correct enable values.
> Thats the reason for this patch.

Well, this means that the patch does not fix or improve anything, just
introduces changes that are not needed for anything. This is especially
bad, because it introduces a change in DT binding that is not needed yet
and might turn out to be insufficient for future SoCs.

This patch will be okay, if a need for explicit mask specification shows
up in future, though.

Best regards,
Tomasz

> And you're right. Using "samsung,enable-bit-mask" makes more sense. I will change and update with v2.
>  
> Regards,
> Prathyush
>  
> ------- Original Message -------
> Sender : Tomasz Figa<tomasz.figa@gmail.com>
> Date : Nov 11, 2013 00:36 (GMT+05:30)
> Title : Re: [PATCH 1/1] ARM: EXYNOS: Add enable property to power domains
>  
> Hi Sachin,
> 
> On Thursday 07 of November 2013 12:12:55 Sachin Kamat wrote:
> > From: Prathyush K
> >
> > Different power domains of Exynos SOCs have different enable values.
> > E.g. Exynos5250:
> > ROTATOR_MEM_CONFIGURATION -> 0x3
> > GSCL_CONFIGURATION -> 0x7
> > Currently, there is no way to differentiate between these power domains
> > and we write default value of 0x7 to turn on all the power domains.
> >
> > This patch adds a new 'enable' property to the power domain structure.
> > This enable value can be set from the device tree by adding a property
> > 'enable' in the device node. If no such property is found, the default
> > value of 0x7 is used as enable value.
> 
> Is this patch really needed? Is there any problem with simply using 0x7?
> Patch description should always include rationale behind the change.
> 
> >
> > Signed-off-by: Prathyush K
> > Signed-off-by: Sachin Kamat
> > ---
> >  .../bindings/arm/exynos/power_domain.txt           |    5 +++++
> >  arch/arm/mach-exynos/pm_domains.c                  |   10 +++++++---
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> > index 5216b419016a..6b24b234617c 100644
> > --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> > +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> > @@ -9,6 +9,10 @@ Required Properties:
> >  - reg: physical base address of the controller and length of memory mapped
> >      region.
> >  
> > +Optional Properties:
> > +- enable: enable value of the register which is used to turn on the power
> > +    domain. If no enable is specificed, default value of 0x7 is used.
> 
> Vendor-specific properties should have vendor prefix added, so this one
> should be called samsung,enable instead. Also enable is not a very
> specific name.
> 
> So in the end, if it turns out that we really need such patch, I'd prefer
> something like:
> 
> - samsung,enable-bit-mask: Mask of power control register bits that need
>     to be set to enable the power domain. If omitted, it defaults to 0x7.
> 
> Best regards,
> Tomasz
> 
>  
>  
>  
> 
> 
