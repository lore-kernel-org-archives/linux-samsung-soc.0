From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 02/12] ARM: restart: S3C64XX: use new restart hook
Date: Tue, 3 Jan 2012 11:51:02 +0000
Message-ID: <20120103115102.GO2914@n2100.arm.linux.org.uk>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com> <1324385316-6052-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40408 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752286Ab2ACLvT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 06:51:19 -0500
Content-Disposition: inline
In-Reply-To: <1324385316-6052-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Dec 20, 2011 at 09:48:26PM +0900, Kukjin Kim wrote:
> diff --git a/arch/arm/mach-s3c64xx/include/mach/system.h b/arch/arm/mach-s3c64xx/include/mach/system.h
> index d8ca578..353ed43 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/system.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/system.h
> @@ -11,20 +11,9 @@
>  #ifndef __ASM_ARCH_SYSTEM_H
>  #define __ASM_ARCH_SYSTEM_H __FILE__
>  
> -#include <plat/watchdog-reset.h>
> -
>  static void arch_idle(void)
>  {
>  	/* nothing here yet */
>  }
>  
> -static void arch_reset(char mode, const char *cmd)
> -{
> -	if (mode != 's')
> -		arch_wdt_reset();
> -
> -	/* if all else fails, or mode was for soft, jump to 0 */
> -	soft_restart(0);
> -}
> -

I just noticed this: if this comes before "ARM: restart: remove the now
empty arch_reset()" (which it has to) then this will induce a build
error.

If you have added all the necessary .restart hooks, then this patch should
remove the _contents_ of arch_reset() but leave the function there.  The
"ARM: restart: remove the now empty arch_reset()" is the earliest point
at which arch_reset() can be safely removed from any platform (and that
can only happen _after_ platforms we care about have been converted.)

The dependency chain is:

1. Base restart changes + restart cleanups.
2. Platforms adding their .restart hooks, emptying arch_reset() as they're
   fully converted.
Then, once all platforms we care about are converted:
3. Removal of code calling arch_reset().
4. Removal of all empty arch_reset() functions and any header files left
   empty at this point.

So, a patch combining (2) and (4) really doesn't work.
