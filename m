From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH] ARM: dts: Remove vmmc-supply for mmc@12220000 on
 arndale-octa board
Date: Sat, 26 Apr 2014 09:13:40 +0100
Message-ID: <20140425204135.GF3027@e102654-lin.cambridge.arm.com>
References: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
 <535AC29E.8010905@gmail.com>
 <20140425203051.GD3027@e102654-lin.cambridge.arm.com>
 <535AC717.40805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:38424 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbaDZINs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 04:13:48 -0400
In-Reply-To: <535AC717.40805@gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ben Dooks <ben-linux@fluff.org>

On Fri, Apr 25, 2014 at 09:35:35PM +0100, Tomasz Figa wrote:
> On 25.04.2014 22:30, Javi Merino wrote:
> > On Fri, Apr 25, 2014 at 09:16:30PM +0100, Tomasz Figa wrote:
> >> On 25.04.2014 22:11, Javi Merino wrote:
> >>> d726ca2d3316 (ARM: dts: Add vmmc-supply to MMC on arndale-octa board)
> >>> added the vmmc-supply to nodes mmc@12200000 and mmc@12220000 of the
> >>> DT.  However, this makes the kernel fail to boot on the arndale-octa
> >>> spews:
> >>>
> >>> [    5.060000] dwmmc_exynos 12200000.mmc: num-slots property not found, assuming 1 slot is available
> >>> [    5.065000] platform 12200000.mmc: Driver dwmmc_exynos requests probe deferral
> >>> [    5.075000] dwmmc_exynos 12220000.mmc: num-slots property not found, assuming 1 slot is available
> >>> [    5.085000] platform 12220000.mmc: Driver dwmmc_exynos requests probe deferral
> >>>
> >>> And eventually hangs.  Without the vmmc-supply property in the
> >>> mmc@12220000 node, the kernel boots again.
> >>>
> >>> Signed-off-by: Javi Merino <javi.merino@arm.com>
> >>> ---
> >>>
> >>> Hi,
> >>>
> >>> Note that I don't know *why* removing the property works, all I know
> >>> is that 3.15-rc2 fails to boot on my Arndale Octa unless I apply this
> >>> patch.
> >>
> >> Are you sure you have the required PMIC driver enabled in your kernel
> >> config?
> >
> > I configured the kernel using exynos_defconfig and that gives me:
> >
> > # CONFIG_PMIC_ADP5520 is not set
> > # CONFIG_PMIC_DA903X is not set
> >
> > Should I be using other defconfig for this board?  exynos_defconfig
> > used to work in 3.14.  Cheers,
> 
> Well, unfortunately exynos_defconfig is known to be far from being 
> reasonable. Right now it should be considered just as a base to 
> configure the kernel for Exynos SoCs. Most of board specific options 
> (and many of SoC-wide ones) need to be selected manually.
> 
> Anyway, with the number of Exynos boards supported in mainline, I don't 
> think we will be ever going to enable all options for all the supported 
> boards by default in defconfig, especially considering the fact that we 
> will be moving to generic multi_v7_defconfig and likely dropping 
> exynos_defconfig completely.
> 
> As for now, I believe you should just make sure yourself that any 
> options relevant to your board are enabled.

Great.  And I assume that there isn't a list of those options in the
web.  So how do I know what options are relevant to my board?  By
sending emails to linux-samsung-soc whenever it fails to boot?

Cheers,
Javi
