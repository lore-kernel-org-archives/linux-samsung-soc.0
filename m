From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] DT: if dt is available don't use s3c_arch_init
Date: Mon, 23 Sep 2013 14:37:22 +0200
Message-ID: <2025079.MVbFYJdokX@amdc1227>
References: <1379931289-29384-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23882 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753444Ab3IWMhf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 08:37:35 -0400
In-reply-to: <1379931289-29384-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Hi Mateusz,

On Monday 23 of September 2013 12:14:49 Mateusz Krawczuk wrote:
> It prevents from executing platform code, when booting from device tree.
> 
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
> index aa9511b..0ace02d 100644
> --- a/arch/arm/plat-samsung/init.c
> +++ b/arch/arm/plat-samsung/init.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
> +#include <linux/of.h>
>  #include <linux/serial_core.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> @@ -152,6 +153,8 @@ static int __init s3c_arch_init(void)
>  {
>  	int ret;
> 
> +	if (of_have_populated_dt())
> +		return 0;

I'm not sure if this is the correct thing to do here (note platforms that 
still want this initialization to be handled, even when booting with DT).

The DT case is already handled several lines below in if (cpu == NULL) 
check and if your platform requires this initialization not to happen you 
should assure it has cpu == NULL.

Best regards,
Tomasz
