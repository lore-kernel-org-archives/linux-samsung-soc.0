From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix on build warning regarding VMALLOC_END
 type
Date: Sat, 21 Aug 2010 17:12:51 +0400
Message-ID: <4C6FD0D3.6020406@ru.mvista.com>
References: <1282349227-2581-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:39865 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab0HUNO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Aug 2010 09:14:26 -0400
Received: by eyg5 with SMTP id 5so2694974eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2010 06:14:25 -0700 (PDT)
In-Reply-To: <1282349227-2581-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hello.

Kukjin Kim wrote:

> Fix this warning:

> arch/arm/mm/init.c: In function 'mem_init':
> arch/arm/mm/init.c:644: warning: format '%08lx' expects type
> 'long unsigned int', but argument 12 has type 'unsigned int'

> Reported-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>

[...]

> diff --git a/arch/arm/mach-s3c2410/include/mach/vmalloc.h b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
> index 315b007..dc3b34c 100644
> --- a/arch/arm/mach-s3c2410/include/mach/vmalloc.h
> +++ b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
> @@ -15,6 +15,6 @@
>  #ifndef __ASM_ARCH_VMALLOC_H
>  #define __ASM_ARCH_VMALLOC_H
>  
> -#define VMALLOC_END	  (0xE0000000)
> +#define VMALLOC_END	(0xE0000000UL)
>  
>  #endif /* __ASM_ARCH_VMALLOC_H */
> diff --git a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
> index 7411ef3..f0a0fa2 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
> @@ -15,6 +15,6 @@
>  #ifndef __ASM_ARCH_VMALLOC_H
>  #define __ASM_ARCH_VMALLOC_H
>  
> -#define VMALLOC_END	  (0xE0000000)
> +#define VMALLOC_END	(0xE0000000UL)
>  
>  #endif /* __ASM_ARCH_VMALLOC_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/vmalloc.h b/arch/arm/mach-s5p6440/include/mach/vmalloc.h
> index 16df257..8217b99 100644
> --- a/arch/arm/mach-s5p6440/include/mach/vmalloc.h
> +++ b/arch/arm/mach-s5p6440/include/mach/vmalloc.h
> @@ -12,6 +12,6 @@
>  #ifndef __ASM_ARCH_VMALLOC_H
>  #define __ASM_ARCH_VMALLOC_H
>  
> -#define VMALLOC_END	  (0xE0000000)
> +#define VMALLOC_END	(0xE0000000UL)
>  
>  #endif /* __ASM_ARCH_VMALLOC_H */
> diff --git a/arch/arm/mach-s5p6442/include/mach/vmalloc.h b/arch/arm/mach-s5p6442/include/mach/vmalloc.h
> index be33336..b9fd9aa 100644
> --- a/arch/arm/mach-s5p6442/include/mach/vmalloc.h
> +++ b/arch/arm/mach-s5p6442/include/mach/vmalloc.h
> @@ -12,6 +12,6 @@
>  #ifndef __ASM_ARCH_VMALLOC_H
>  #define __ASM_ARCH_VMALLOC_H
>  
> -#define VMALLOC_END	  (0xE0000000)
> +#define VMALLOC_END	(0xE0000000UL)
>  
>  #endif /* __ASM_ARCH_VMALLOC_H */

    Could eliminate the useless parens while at it...

WBR, Sergei
