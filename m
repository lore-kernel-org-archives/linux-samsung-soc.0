From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: s5p64x0: Explicitly include linux/serial_s3c.h
 in mach/pm-core.h
Date: Fri, 21 Mar 2014 03:35:30 +0900
Message-ID: <532B34F2.8050804@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com> <1395162964-5916-6-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34754 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751925AbaCTSfe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 14:35:34 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so1317027pab.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 11:35:34 -0700 (PDT)
In-Reply-To: <1395162964-5916-6-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 03/19/14 02:16, Tomasz Figa wrote:
> This patch fixes compilation failure due to missing explicit inclusion
> of linux/serial_s3c.h in mach/pm-core.h, which contains definitions
> required for further code in this header.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> ---
>   arch/arm/mach-s5p64x0/include/mach/pm-core.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-s5p64x0/include/mach/pm-core.h b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
> index e52f754..1e0eb65 100644
> --- a/arch/arm/mach-s5p64x0/include/mach/pm-core.h
> +++ b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
> @@ -12,6 +12,8 @@
>    * published by the Free Software Foundation.
>    */
>
> +#include<linux/serial_s3c.h>
> +
>   #include<mach/regs-gpio.h>
>
>   static inline void s3c_pm_debug_init_uart(void)

Applied, thanks.

- Kukjin
