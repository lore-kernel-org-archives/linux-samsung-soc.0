From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS5: Add bus clock and set parent clock for FIMD
Date: Wed, 12 Sep 2012 10:58:53 +0900
Message-ID: <002001cd908a$29540070$7bfc0150$%han@samsung.com>
References: <1347307866-30641-1-git-send-email-l.krishna@samsung.com>
 <000101cd8fb3$90d10db0$b2732910$%han@samsung.com>
 <CAL1wa8f1=hVMYrw2qdnQK5wFh8CtLxjP79+8POOG7HHqOBU5yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17056 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613Ab2ILB6z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Sep 2012 21:58:55 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA7006I3S46O4A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Sep 2012 10:58:53 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA700GXLS65FP90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Sep 2012 10:58:53 +0900 (KST)
In-reply-to: <CAL1wa8f1=hVMYrw2qdnQK5wFh8CtLxjP79+8POOG7HHqOBU5yA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, September 11, 2012 6:20 PM Leela Krishna Amudala wrote
> 
> Hello Jingoo Han,
> 
> On Tue, Sep 11, 2012 at 5:52 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Tuesday, September 11, 2012 5:11 AM Leela Krishna Amudala wrote
> >>
> >> This patch adds the bus clock for FIMD and changes the device name for lcd clock
> >> also sets mout_mpll_user as parent clock to fimd
> >>
> >> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> >> ---
> >>  arch/arm/mach-exynos/clock-exynos5.c       |   34 +++++++++++++++++++--------
> >>  arch/arm/plat-samsung/include/plat/clock.h |    2 +
> >>  2 files changed, 26 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> >> index 774533c..f1281cf 100644
> >> --- a/arch/arm/mach-exynos/clock-exynos5.c
> >> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> >> @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
> >>       .ctrlbit        = (1 << 4),
> >>  };
> >>
> >> +static struct clk exynos5_clk_fimd = {
> >> +     .name           = "fimd",
> >> +     .devname        = "exynos5-fb",
> >
> >
> > Replace 'exynos5-fb' with 'exynos5-fb.1', as exynos4 fimd uses exynos4-fb.0
> > as devname. Exynos5 can use fimd0 or fimd1. Also, Exynos5250 uses fimd1.
> >
> >
> Currently s3c-fb driver using "exynos5-fb" as device name, hence used
> the same name in the clock.
> This code is tested with both drm-fimd and s3c-fb fimd and it is
> working fine showing the display on LCD.
> If I change the device name in clock file then I have to change it in
> s3c-fb driver also.
> So I feel it is better to keep the name as "exynos5-fb" in clock file
> instead of changing in the driver.

No, there is no need to change the device name in s3c-fb driver.
Please refer to the patch that I sent 3 months ago.
	http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11002.html

Now, Exynos5250 has only 1 FIMD IP; however, other Exynos5 SoCs
have 2 FIMD IPs. These SoCs have two different clock paths for
2 FIMD IPs. Therefore, we need to consider it.


> 
> Thanks,
> Leela Krishna Amudala.
> 
> >> +     .enable         = exynos5_clk_ip_disp1_ctrl,
> >> +     .ctrlbit        = (1 << 0),
> >> +};
> >> +
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
