From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Wed, 31 Aug 2016 19:47:37 +0200
Message-ID: <20160831174737.GB19969@kozik-lap>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <5366f8a4-b4fb-ec2d-eb1e-5534f24c4a07@kernel.org>
 <0da13ae1-90a8-912b-227e-0e94439953d5@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0da13ae1-90a8-912b-227e-0e94439953d5-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 31, 2016 at 03:45:24PM +0200, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 08/31/2016 02:55 PM, Krzysztof Kozlowski wrote:
> > On 08/31/2016 02:14 PM, Javier Martinez Canillas wrote:
> >> Hello Krzysztof,
> >>
> >> This series removes the usage of the skeleton.dtsi in all the Exynos dts,
> >> which allows to get rid of the DTC warnings about a mismatch between the
> >> memory nodes' unit names and reg properties.
> >>
> >> Patches are pretty trivial and shouldn't cause functional changes AFAIK,
> >> but only the Exynos5 changes have been tested. The others patches were
> >> just built tested.
> > 
> > I think this is a common problem, not only Exynos-specific, so I would
> 
> That's correct.
> 
> > prefer to stick to common pattern. Either all DTS/DTSI include skeleton
> > or none of them.
> >
> 
> The idea is to get rid of skeleton.dtsi [0], but that will of course take
> time until the dtsi is removed from all the files. So this patch is a step
> in the right direction so at least Exynos is not a blocker to remove it.

Acknowledged, thanks for pointing it.

I will start review and apply.

BR,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
