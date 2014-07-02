From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCHv2 1/3] of: Split early_init_dt_scan into two parts
Date: Wed, 02 Jul 2014 11:30:33 +0530
Message-ID: <53B3A001.1090909@gmail.com>
References: <1404266608-3274-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:47556 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbaGBGAi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 02:00:38 -0400
In-Reply-To: <1404266608-3274-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, afaerber@suse.de, devicetree@vger.kernel.org

On 07/02/2014 07:33 AM, Laura Abbott wrote:
> Currently, early_init_dt_scan validates the header, sets the
> boot params, and scans for chosen/memory all in one function.
> Split this up into two separate functions (validation/setting
> boot params in one, scanning in another) to allow for
> additional setup between boot params and scanning the memory.
> 
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
> ---

Tested the patchset on top of Linus' tree.

Verified after enabling following debug message.
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -865,7 +865,7 @@ int __init early_init_dt_scan_memory(unsigned long
node, const char *uname,

        endp = reg + (l / sizeof(__be32));

-       pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
+       pr_err("memory scan node %s, reg size %d, data: %x %x %x %x,\n",


Output before:
memory scan node memory, reg size 96, data: 20 10 30 10,

Output after:
memory scan node memory, reg size 64, data: 20 10 30 10,

Tested-by: Tushar Behera <trblinux@gmail.com>

One minor nit below ...

>  drivers/of/fdt.c       | 18 +++++++++++++++++-
>  include/linux/of_fdt.h |  2 ++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c4cddf0..55bfca9 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -922,7 +922,7 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
>  }
>  #endif
>  
> -bool __init early_init_dt_scan(void *params)
> +bool __init early_init_dt_verify(void *params)
>  {
>  	if (!params)
>  		return false;
> @@ -936,6 +936,12 @@ bool __init early_init_dt_scan(void *params)
>  		return false;
>  	}
>  
> +	return true;
> +}
> +
> +

Extra blank line here. Can be removed.

-- 
Tushar Behera
