From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on S5PV210/S5PC110.
Date: Tue, 06 Jul 2010 14:44:38 +0400
Message-ID: <4C330916.1070201@ru.mvista.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:54098 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab0GFKpo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 06:45:44 -0400
Received: by ewy23 with SMTP id 23so1814328ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jul 2010 03:45:43 -0700 (PDT)
In-Reply-To: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hello.

Kukjin Kim wrote:

> This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC110.
> Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16MB.
> So each section's maximum size should be 16MB.

> Reported-by: Kyongho Cho <pullip.cho@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/memory.h |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)

> diff --git a/arch/arm/mach-s5pv210/include/mach/memory.h b/arch/arm/mach-s5pv210/include/mach/memory.h
> index 379117e..4a372d8 100644
> --- a/arch/arm/mach-s5pv210/include/mach/memory.h
> +++ b/arch/arm/mach-s5pv210/include/mach/memory.h
> @@ -16,8 +16,12 @@
>  #define PHYS_OFFSET		UL(0x20000000)
>  #define CONSISTENT_DMA_SIZE	(SZ_8M + SZ_4M + SZ_2M)
>  
> -/* Maximum of 256MiB in one bank */
> +/* Sparsemem support. Each section is a maximum of 16MB.
> + * Because there are many different memory type on S5PC110(MCP),
> + * and there is a case that having 80MB, 128MB or 256MB in one
> + * bank.
> +*/

    According to CodingStyle, the prefrerrable format for multi-line comments 
is this:

/*
  * bla
  * bla
  */

WBR, Sergei
