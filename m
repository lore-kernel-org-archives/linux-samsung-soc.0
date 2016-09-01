From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Thu, 1 Sep 2016 12:40:46 +0100
Message-ID: <20160901114046.GB4220@leverpostej>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <12377780.GCreFUiXAa@amdc1976>
 <21e643af-bff7-2563-0254-d2b6e4a9a385@osg.samsung.com>
 <11690712.d89FASKYvI@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:56326 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932589AbcIALk7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 07:40:59 -0400
Content-Disposition: inline
In-Reply-To: <11690712.d89FASKYvI@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>

On Thu, Sep 01, 2016 at 11:59:48AM +0200, Bartlomiej Zolnierkiewicz wrote:
> On Thursday, September 01, 2016 10:35:15 AM Javier Martinez Canillas wrote:
> > On 08/31/2016 07:40 PM, Bartlomiej Zolnierkiewicz wrote:
> > > On Wednesday, August 31, 2016 03:45:24 PM Javier Martinez Canillas wrote:
> > >> The idea is to get rid of skeleton.dtsi [0], but that will of course take
> > >> time until the dtsi is removed from all the files. So this patch is a step
> > >> in the right direction so at least Exynos is not a blocker to remove it.
> > > 
> > > Krzysztof's point is valid.  If you are going to convert all DTS/DTSI
> > > then it is okay to apply Exynos specific changes, otherwise the code
> > > should stay as it is currently.
> > > 
> > > Exynos won't be a blocker since we have your patches now and they can
> > > be applied when/if needed ;)..
> > 
> > Sorry but I disagree. I see no reasons to need this to be an atomic, rather
> > than incremental change. Deprecated things are usually handled by removing
> > the usage and once there are no users, finally removing them.
> 
> Yes, given that there is agreement on the direction and people are aware
> of the needed changes.  This doesn't seem to be a case yet as there is
> no comment in skeleton.dtsi about being deprecated and other platforms'
> Maintainers are not aware of the need for the change.

On the DT side we're all agreed that skeleton.dtsi should die. I'll send
a patch adding a note to skeleton.dtsi to make this more obvious, but
that shouldn't be a blocker for removing existing uses.

Thanks,
Mark.
