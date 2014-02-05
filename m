From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 0/3] exynos: arch: add support for exynos5260 SoC
Date: Wed, 05 Feb 2014 14:31:50 +0900
Message-ID: <000301cf2233$92224670$b666d350$%han@samsung.com>
References: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17298 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbaBEFbw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 00:31:52 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0I00EGFCP25760@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Feb 2014 14:31:50 +0900 (KST)
In-reply-to: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sunil Joshi' <joshi@samsung.com>, 'Rahul Sharma' <r.sh.open@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, February 05, 2014 2:16 PM, Rahul Sharma wrote:
> 
> This is re-spin of V2 which add arch-side support for exynos5260 SoC.
> 
> V2:
>   1) Split up DT patch into SoC and Board patch.
> 
> This series is based on Kukjin's for-next branch at
> http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git
> 
> Pankaj Dubey (1):
>   ARM: EXYNOS: initial board support for exynos5260 SoC
> 
> Rahul Sharma (2):
>   ARM: dts: add dts files for exynos5260 SoC
>   ARM: dts: add dts files for xyref5260 board
> 
>  arch/arm/boot/dts/Makefile                      |    1 +
>  arch/arm/boot/dts/exynos5260-pinctrl.dtsi       |  572 +++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts |  105 +++++
>  arch/arm/boot/dts/exynos5260.dtsi               |  317 +++++++++++++
>  arch/arm/mach-exynos/Kconfig                    |    9 +
>  arch/arm/mach-exynos/common.c                   |   18 +
>  arch/arm/mach-exynos/include/mach/map.h         |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c          |    1 +
>  arch/arm/plat-samsung/include/plat/cpu.h        |    8 +
>  arch/arm/plat-samsung/include/plat/map-s5p.h    |    1 +
>  10 files changed, 1033 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
>  create mode 100644 arch/arm/boot/dts/exynos5260.dtsi
>  mode change 100644 => 100755 arch/arm/mach-exynos/include/mach/map.h
>  mode change 100644 => 100755 arch/arm/mach-exynos/mach-exynos5-dt.c
>  mode change 100644 => 100755 arch/arm/plat-samsung/include/plat/cpu.h

The mode of these three files should NOT be changed to 100755.
Please fix it.

Best regards,
Jingoo Han
