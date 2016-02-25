From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 0/2] ARM: EXYNOS: Trivial cleanup samsung mach files
Date: Thu, 25 Feb 2016 13:26:59 +0900
Message-ID: <56CE8293.2050901@samsung.com>
References: <1456373400-10633-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57002 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758181AbcBYE1I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 23:27:08 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3300L9F5P4ZC00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Feb 2016 04:27:04 +0000 (GMT)
In-reply-to: <1456373400-10633-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk

On 25.02.2016 13:09, Pankaj Dubey wrote:
> This patch series cleans up mach-exynos, mach-s3c24xx, plat-samsung include
> header files with resepct to unused header file inclusion, removes redundant
> register offset definition. Also corrects comment section at few places.
> 
> Changes since v1:
>  - Keeping back inclusion of header "platform_device.h" in exynos.c.
>  - Removing all unused instances of S3C_UART_OFFSET from mach-exynos,
>    mach-s3c24xx, and plat-samsung, in single patch.
>  - Patch 1/3 is already merged in maintainer tree so not included in v2. 

Thanks for the changes. I appreciate that!

Applied both patches.

Best regards,
Krzysztof
