From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Wed, 19 Aug 2015 17:44:02 +0900
Message-ID: <55D441D2.4070506@samsung.com>
References: <55D30313.7080107@osg.samsung.com>
 <1439972377-22683-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21796 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752144AbbHSIoF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 04:44:05 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTB00DUHMXETK20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Aug 2015 09:44:02 +0100 (BST)
In-reply-to: <1439972377-22683-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

On 19.08.2015 17:19, Marek Szyprowski wrote:
> DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
> so enable DWC2 driver as well as the most common USB Ethernet gadget.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> Changes since v1: build DWC2 and USB gadget as modules
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Thanks Marek for the patch.
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
