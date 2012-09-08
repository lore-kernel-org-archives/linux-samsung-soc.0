From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: dts: Exynos4 dts reorganization
Date: Sat, 08 Sep 2012 12:03:29 +0900
Message-ID: <24de01cd8d6e$860fe500$922faf00$%kim@samsung.com>
References: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
 <CAJuYYwRWqvzw_MdLa7NfE9ppbPiz8=HTXUW+-mXedvu2GPQWBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17035 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949Ab2IHDDc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 23:03:32 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA000E9AGHQRQ30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 12:03:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA0002S0GHU3030@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 12:03:30 +0900 (KST)
In-reply-to: <CAJuYYwRWqvzw_MdLa7NfE9ppbPiz8=HTXUW+-mXedvu2GPQWBg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, 'Dongjin Kim' <tobetter@gmail.com>

Thomas Abraham wrote:
> 
> On 3 September 2012 18:04, Tomasz Figa <t.figa@samsung.com> wrote:
> > This patch series prepares existing Exynos4210 DT infrastructure to be
> > further extended for new SoCs from Exynos4 line and new boards.
> >
> > Tomasz Figa (3):
> >   ARM: dts: Move parts common to Exynos4 from Exynos4210.dtsi to
> >     Exynos4.dtsi
> >   ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead of exynos4210
> >   ARM: dts: exynos4: Assume status of all optional nodes as disabled
> >
> >  arch/arm/boot/dts/exynos4.dtsi            | 232
> ++++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4210-origen.dts   |  58 +-------
> >  arch/arm/boot/dts/exynos4210-smdkv310.dts |  52 +------
> >  arch/arm/boot/dts/exynos4210.dtsi         | 181 +----------------------
> >  arch/arm/mach-exynos/mach-exynos4-dt.c    |  18 +--
> >  5 files changed, 248 insertions(+), 293 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/exynos4.dtsi
> >
> 
> Thanks, we can build Exynos4412 device tree support on top of this series.
> 
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

Thomas, thanks for your ack on this series and I'm OK on this series.

But you know, Donjin Kim submitted almost same patch except gpio stuff one
month before this series but needs to update something though. So would be
nice if either Tomasz or Dongjin could ack on the other patch?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
