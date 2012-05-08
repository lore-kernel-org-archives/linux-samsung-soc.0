From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: EXYNOS: Add DRM device to Origen and SMDKV310
Date: Tue, 08 May 2012 14:47:35 +0900
Message-ID: <018301cd2cde$11d0c970$35725c50$%kim@samsung.com>
References: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHw8bfnrmw5yw66C2v162vr6h3eW6SOAU-0=vqVVzFYiWg@mail.gmail.com>
 <CAK9yfHx6sez0hMyMvqmYZ=OaNpBbPa-mTZe_3_Fq4hj_sohDbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52033 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834Ab2EHFri (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 01:47:38 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3O00CWTW389YP0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:47:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3O00BMDW3BSBS0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:47:37 +0900 (KST)
In-reply-to: <CAK9yfHx6sez0hMyMvqmYZ=OaNpBbPa-mTZe_3_Fq4hj_sohDbA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org, "'aditya.ps'" <aditya.ps@samsung.com>

Sachin Kamat wrote:
> 
> Hi Kukjin,
> 
> Can you please review these patches and let me know your comments.
> 
Yes I have. Basically, I won't update board file for EXYNOS SoCs from now on
if it is not a fix.

I think, if any changes for each machine(board), we need to update its
regarding dt.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> On 11/04/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > ping...
> >
> > On 27/03/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> >> This patch series adds DRM core device and FIMD DRM platform device
> >> support
> >> to Origen and SMDKV310 boards.
> >>
> >> This series depends on the following patch:
> >> http://www.spinics.net/lists/arm-kernel/msg164762.html
> >>
> >> Sachin Kamat (2):
> >>   ARM: EXYNOS: Add DRM device to Origen
> >>   ARM: EXYNOS: Add DRM device to SMDKV310
> >>
> >>  arch/arm/mach-exynos/Kconfig         |    2 ++
> >>  arch/arm/mach-exynos/mach-origen.c   |   31
> >> +++++++++++++++++++++++++++++++
> >>  arch/arm/mach-exynos/mach-smdkv310.c |   30
> >> ++++++++++++++++++++++++++++++
> >>  3 files changed, 63 insertions(+), 0 deletions(-)
