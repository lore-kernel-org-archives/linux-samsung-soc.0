From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/2] ARM: s3c64xx: Fix build for implicit serial_s3c.h
 inclusion
Date: Fri, 21 Mar 2014 02:56:36 +0900
Message-ID: <532B2BD4.7060809@samsung.com>
References: <1395143803-2032-1-git-send-email-broonie@kernel.org> <1395143803-2032-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:49614 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932885AbaCTR4s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 13:56:48 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so1277673pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 10:56:48 -0700 (PDT)
In-Reply-To: <1395143803-2032-2-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On 03/18/14 20:56, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> Some very recent change appears to have removed an implicit inclusion of
> serial_s3c.h causing build failures due to references to UART registers
> in the serial port restore code in next-20140318.  Include it explicitly
> to fix the build.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>
> ---
>   arch/arm/mach-s3c64xx/include/mach/pm-core.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
> index c0537f40a3d8..a30a1e3ffc6a 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
> @@ -15,6 +15,8 @@
>   #ifndef __MACH_S3C64XX_PM_CORE_H
>   #define __MACH_S3C64XX_PM_CORE_H __FILE__
>
> +#include<linux/serial_s3c.h>
> +
>   #include<mach/regs-gpio.h>
>
>   static inline void s3c_pm_debug_init_uart(void)

Applied, thanks.

- Kukjin
