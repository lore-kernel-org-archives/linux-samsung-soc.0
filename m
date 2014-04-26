From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Remove vmmc-supply for mmc@12220000 on
 arndale-octa board
Date: Sat, 26 Apr 2014 20:19:37 +0900
Message-ID: <0b5c01cf6141$687f5ea0$397e1be0$@samsung.com>
References: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
 <535AC29E.8010905@gmail.com>
 <20140425203051.GD3027@e102654-lin.cambridge.arm.com>
 <535AC717.40805@gmail.com>
 <20140425204135.GF3027@e102654-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19356 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbaDZLTj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 07:19:39 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4M00G0HY4PD1D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Apr 2014 20:19:37 +0900 (KST)
In-reply-to: <20140425204135.GF3027@e102654-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javi Merino' <javi.merino@arm.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Javi Merino wrote:
> 
> On Fri, Apr 25, 2014 at 09:35:35PM +0100, Tomasz Figa wrote:
> > On 25.04.2014 22:30, Javi Merino wrote:
> > > On Fri, Apr 25, 2014 at 09:16:30PM +0100, Tomasz Figa wrote:
> > >> On 25.04.2014 22:11, Javi Merino wrote:
> > >>> d726ca2d3316 (ARM: dts: Add vmmc-supply to MMC on arndale-octa board)
> > >>> added the vmmc-supply to nodes mmc@12200000 and mmc@12220000 of the
> > >>> DT.  However, this makes the kernel fail to boot on the arndale-octa
> > >>> spews:
> > >>>
> > >>> [    5.060000] dwmmc_exynos 12200000.mmc: num-slots property not
> found, assuming 1 slot is available
> > >>> [    5.065000] platform 12200000.mmc: Driver dwmmc_exynos requests
> probe deferral
> > >>> [    5.075000] dwmmc_exynos 12220000.mmc: num-slots property not
> found, assuming 1 slot is available
> > >>> [    5.085000] platform 12220000.mmc: Driver dwmmc_exynos requests
> probe deferral
> > >>>
> > >>> And eventually hangs.  Without the vmmc-supply property in the
> > >>> mmc@12220000 node, the kernel boots again.
> > >>>
> > >>> Signed-off-by: Javi Merino <javi.merino@arm.com>
> > >>> ---
> > >>>
> > >>> Hi,
> > >>>
> > >>> Note that I don't know *why* removing the property works, all I know
> > >>> is that 3.15-rc2 fails to boot on my Arndale Octa unless I apply
> this
> > >>> patch.
> > >>
> > >> Are you sure you have the required PMIC driver enabled in your kernel
> > >> config?
> > >
> > > I configured the kernel using exynos_defconfig and that gives me:
> > >
> > > # CONFIG_PMIC_ADP5520 is not set
> > > # CONFIG_PMIC_DA903X is not set
> > >
> > > Should I be using other defconfig for this board?  exynos_defconfig
> > > used to work in 3.14.  Cheers,
> >
> > Well, unfortunately exynos_defconfig is known to be far from being
> > reasonable. Right now it should be considered just as a base to
> > configure the kernel for Exynos SoCs. Most of board specific options
> > (and many of SoC-wide ones) need to be selected manually.
> >
> > Anyway, with the number of Exynos boards supported in mainline, I don't
> > think we will be ever going to enable all options for all the supported
> > boards by default in defconfig, especially considering the fact that we
> > will be moving to generic multi_v7_defconfig and likely dropping
> > exynos_defconfig completely.

Well, keeping exynos_defconfig would be helpful even if exynos multiplatform is available. Please see the case of omap2plus_defconfig?

> >
> > As for now, I believe you should just make sure yourself that any
> > options relevant to your board are enabled.
> 
> Great.  And I assume that there isn't a list of those options in the
> web.  So how do I know what options are relevant to my board?  By
> sending emails to linux-samsung-soc whenever it fails to boot?
> 
I think, we need to enable all of regarding configs for each exynos boards so that exynos_defconfig can cover whenever.

Thanks,
Kukjin
