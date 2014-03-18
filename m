From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] serial: s3c: Fix build of header without serial_core.h
 preinclusion
Date: Tue, 18 Mar 2014 18:30:47 +0100
Message-ID: <532882C7.8060701@samsung.com>
References: <1395143803-2032-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40962 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754517AbaCRRax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:30:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00KJG7B8HE90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:30:44 +0000 (GMT)
In-reply-to: <1395143803-2032-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On 18.03.2014 12:56, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
>
> serial_s3c.h uses upf_t which is defined in serial_core.h but does not
> include that itself meaning that users which include serial_s3c.h by
> itself don't build.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>
> This is needed together with patch 2 to fix build failures in -next, I
> didn't have the time/enthusiasm to isolate the issue.
>
>   include/linux/serial_s3c.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
> index 907d9d1d56cf..44e4a6b92ddb 100644
> --- a/include/linux/serial_s3c.h
> +++ b/include/linux/serial_s3c.h
> @@ -29,6 +29,8 @@
>   #ifndef __ASM_ARM_REGS_SERIAL_H
>   #define __ASM_ARM_REGS_SERIAL_H
>
> +#include <linux/serial_core.h>
> +
>   #define S3C2410_URXH	  (0x24)
>   #define S3C2410_UTXH	  (0x20)
>   #define S3C2410_ULCON	  (0x00)
>

Thanks for fixing this up. However due to this header ending up being 
included by arch/arm/kernel/debug.S, this breaks mach-exynos. I have 
fixed this up by moving the inclusion down the file, under #ifndef 
__ASSEMBLY__ and posted next version along with other fixups.

Best regards,
Tomasz
