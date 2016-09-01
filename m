From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Thu, 01 Sep 2016 11:59:48 +0200
Message-ID: <11690712.d89FASKYvI@amdc1976>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <12377780.GCreFUiXAa@amdc1976>
 <21e643af-bff7-2563-0254-d2b6e4a9a385@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56714 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751099AbcIAJ7z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 05:59:55 -0400
In-reply-to: <21e643af-bff7-2563-0254-d2b6e4a9a385@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>


Hi,

On Thursday, September 01, 2016 10:35:15 AM Javier Martinez Canillas wrote:
> Hello Bartlomiej,
> 
> On 08/31/2016 07:40 PM, Bartlomiej Zolnierkiewicz wrote:
> > 
> > Hi,
> > 
> > On Wednesday, August 31, 2016 03:45:24 PM Javier Martinez Canillas wrote:
> >> Hello Krzysztof,
> >>
> >> On 08/31/2016 02:55 PM, Krzysztof Kozlowski wrote:
> >>> On 08/31/2016 02:14 PM, Javier Martinez Canillas wrote:
> >>>> Hello Krzysztof,
> >>>>
> >>>> This series removes the usage of the skeleton.dtsi in all the Exynos dts,
> >>>> which allows to get rid of the DTC warnings about a mismatch between the
> >>>> memory nodes' unit names and reg properties.
> >>>>
> >>>> Patches are pretty trivial and shouldn't cause functional changes AFAIK,
> >>>> but only the Exynos5 changes have been tested. The others patches were
> >>>> just built tested.
> >>>
> >>> I think this is a common problem, not only Exynos-specific, so I would
> >>
> >> That's correct.
> >>
> >>> prefer to stick to common pattern. Either all DTS/DTSI include skeleton
> >>> or none of them.
> >>>
> >>
> >> The idea is to get rid of skeleton.dtsi [0], but that will of course take
> >> time until the dtsi is removed from all the files. So this patch is a step
> >> in the right direction so at least Exynos is not a blocker to remove it.
> > 
> > Krzysztof's point is valid.  If you are going to convert all DTS/DTSI
> > then it is okay to apply Exynos specific changes, otherwise the code
> > should stay as it is currently.
> > 
> > Exynos won't be a blocker since we have your patches now and they can
> > be applied when/if needed ;)..
> >
> 
> Sorry but I disagree. I see no reasons to need this to be an atomic, rather
> than incremental change. Deprecated things are usually handled by removing
> the usage and once there are no users, finally removing them.

Yes, given that there is agreement on the direction and people are aware
of the needed changes.  This doesn't seem to be a case yet as there is
no comment in skeleton.dtsi about being deprecated and other platforms'
Maintainers are not aware of the need for the change.

> Also, each subsystem maintainer should carry the patches for their platform
> so it can't be a kernel wide change anyways and most likely split by kernel
> releases.

Yep.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
