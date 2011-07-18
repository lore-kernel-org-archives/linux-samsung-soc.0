From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/5] ARM: EXYNOS4: Add SPDIF for SMDKV310
Date: Mon, 18 Jul 2011 15:23:39 +0900
Message-ID: <048701cc4513$3e4d72e0$bae858a0$%kim@samsung.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
 <1307687667-9127-5-git-send-email-ch.naveen@samsung.com>
 <BANLkTi=NPaw37BPadkA79uwsZkjjASFMrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43802 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710Ab1GRGXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 02:23:45 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOI004BPN30FGJ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 15:23:44 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOI008DGN3J7P@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 15:23:44 +0900 (KST)
In-reply-to: <BANLkTi=NPaw37BPadkA79uwsZkjjASFMrA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>
Cc: broonie@opensource.wolfsonmicro.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Jassi Brar wrote:
> 
> On Fri, Jun 10, 2011 at 12:04 PM, Naveen Krishna Chatradhi
> <ch.naveen@samsung.com> wrote:
> > This patch adds spdif to the machine supported device list for
> > SMDKV310.
> >
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> > ---
> >  arch/arm/mach-exynos4/mach-smdkv310.c |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> > index 7e3ee6c..966c6f2 100644
> > --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> > +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> > @@ -190,6 +190,7 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
> >        &exynos4_device_pd[PD_CAM],
> >        &exynos4_device_pd[PD_TV],
> >        &exynos4_device_pd[PD_GPS],
> > +       &exynos4_device_spdif,
> >        &exynos4_device_sysmmu,
> >        &exynos4_device_pcm0,
> >        &samsung_asoc_dma,
> 
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
