From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 0/5] DT/ARCH updates for MFC
Date: Wed, 14 Aug 2013 19:30:11 +0900
Message-ID: <115b01ce98d9$41c185d0$c5449170$@org>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54979 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759534Ab3HNKaQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 06:30:16 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00EHMNTTWTL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 19:30:15 +0900 (KST)
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com

Arun Kumar K wrote:
> 
> The patch series updates the DT nodes of MFC in Exynos4,
> Exynos 5250 and creates node in 5420. Also updates the
> memory reserve in exynos5 for mfc-v7.
> 
> Changes from v1:
> - Made status disabled in dtsi and enable in dts
>   as suggested by Sachin Kamat.
> - Moved common properties to exynos5.dtsi as
>   suggested by Chander.
> - Updated binding documentation for special clk removal
> - Updated exynos4 dtsi
> 
> Arun Kumar K (5):
>   ARM: dts: Update clocks entry in MFC binding documentation
>   ARM: dts: Remove unsused MFC clock from exynos4
>   ARM: dts: Update 5250 MFC node
>   ARM: dts: Add MFC node for exynos 5420
>   ARM: EXYNOS: Add mfc-v7 to memory reserve
> 
>  .../devicetree/bindings/media/s5p-mfc.txt          |   10 +++++-----
>  arch/arm/boot/dts/exynos4.dtsi                     |    4 ++--
>  arch/arm/boot/dts/exynos5.dtsi                     |    5 +++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++--
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |    6 ++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |    7 +++++++
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |   14 +++++++++-----
>  7 files changed, 36 insertions(+), 14 deletions(-)
> 
> --
> 1.7.9.5

Basically, looks good to me except making common stuff into the
exynos5.dtsi. Because as I commented on another thread, upcoming exynos5 has
different address and IRQ# for mfc. So please respin so that this could be
merged for v3.12.

Thanks,
Kukjin
