From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add l2x0 device node for Exynos4-based boards
Date: Thu, 23 Jan 2014 19:15:03 +0100
Message-ID: <52E15C27.3020104@samsung.com>
References: <1389084826-19827-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13538 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753816AbaAWSPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:15:20 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZV0000W9DI2G60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jan 2014 18:15:18 +0000 (GMT)
In-reply-to: <1389084826-19827-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, tomasz.figa@gmail.com

Hi,

On 07.01.2014 09:53, Tushar Behera wrote:
> For Exynos4 platform, L2 cache initialization is done only if
> a device node for l2x0 device exists.
>
> L2 cache initialization path is different when a board boots with
> secure firmware. Since there are many Exynos4 based SoCs that boot
> in secure mode, enabling this only for boards that don't boot with
> secure firmware.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>
> Tested on Exynos4210-Origen board.
>
>   arch/arm/boot/dts/exynos4.dtsi                  |    8 ++++++++
>   arch/arm/boot/dts/exynos4210-origen.dts         |    4 ++++
>   arch/arm/boot/dts/exynos4210-smdkv310.dts       |    4 ++++
>   arch/arm/boot/dts/exynos4210-trats.dts          |    4 ++++
>   arch/arm/boot/dts/exynos4210-universal_c210.dts |    4 ++++
>   arch/arm/boot/dts/exynos4412-odroidx.dts        |    4 ++++
>   arch/arm/boot/dts/exynos4412-smdk4412.dts       |    4 ++++
>   arch/arm/boot/dts/exynos4412-tiny4412.dts       |    4 ++++
>   8 files changed, 36 insertions(+)

Looks good. Unfortunately this is still going to break secure firmware 
enabled boards, because l2x0_of_init() does not check if the node is 
enabled.

Best regards,
Tomasz
