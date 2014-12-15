From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v3 0/2] serial: samsung: add support for early console
Date: Mon, 15 Dec 2014 15:47:40 +0900
Message-ID: <012101d01833$0547ba90$0fd72fb0$@samsung.com>
References: <1413804511-32441-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49917 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750802AbaLOGrj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Dec 2014 01:47:39 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NGM00HYY2VD8N20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Dec 2014 15:47:37 +0900 (KST)
In-reply-to: <1413804511-32441-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, thomas.ab@samsung.com, 'Alim Akhtar' <alim.akhtar@samsung.com>

Hi,

I found this patchset was not merget even 3.19 merge window. As you know,
there is no support of legacy early_printk on arm64. I need this patchset to
support exynos arm64 board properly.

Dear Kukjin,

Could you pick up this patchset in your tree?

Best Regards,
Chanho Park

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Marek Szyprowski
> Sent: Monday, October 20, 2014 8:28 PM
> To: linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: Tomasz Figa; Kyungmin Park; thomas.ab@samsung.com; Alim Akhtar;
> Marek Szyprowski
> Subject: [PATCH v3 0/2] serial: samsung: add support for early console
> 
> This patchset adds support for early console defined in device tree. As
> an example, DTS files for all Exynos4 based machines are updated with
> the correct value for common chosen/sdtout property.
> 
> To get it fully functional on ARM architecture, additional improvements
> (support for early_ioremap) are needed in early console code.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Change log:
> 
> v3:
> - rebased onto v3.18-rc1
> - removed options from documentation (they are not yet supported)
> 
> v2: http://www.spinics.net/lists/linux-samsung-soc/msg37278.html
> - added support for command line based initialization
> 
> v1: http://www.spinics.net/lists/linux-samsung-soc/msg37094.html
> - initial version
> 
> Tomasz Figa (2):
>   serial: samsung: Add support for early console
>   ARM: dts: exynos4: Add stdout-path properties
> 
>  Documentation/kernel-parameters.txt             |  12 +++
>  arch/arm/boot/dts/exynos4210-origen.dts         |   1 +
>  arch/arm/boot/dts/exynos4210-smdkv310.dts       |   1 +
>  arch/arm/boot/dts/exynos4210-trats.dts          |   1 +
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |   1 +
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   4 +
>  arch/arm/boot/dts/exynos4412-origen.dts         |   1 +
>  arch/arm/boot/dts/exynos4412-smdk4412.dts       |   1 +
>  arch/arm/boot/dts/exynos4412-tiny4412.dts       |   4 +
>  arch/arm/boot/dts/exynos4412-trats2.dts         |   1 +
>  drivers/tty/serial/Kconfig                      |   1 +
>  drivers/tty/serial/samsung.c                    | 103
> ++++++++++++++++++++++++
>  12 files changed, 131 insertions(+)
> 
> --
> 1.9.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
