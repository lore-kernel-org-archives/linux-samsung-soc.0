From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: s3c64xx: cpuidle: Fix missing header error with
 CONFIG_CPU_IDLE enabled
Date: Wed, 09 Jan 2013 16:44:26 -0800
Message-ID: <00b801cdeecb$a5839c10$f08ad430$@samsung.com>
References: <1357778378-5278-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61979 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932225Ab3AJAok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:44:40 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD003XWWQ088C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:44:38 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD000TDWQCIQ20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:44:38 +0900 (KST)
In-reply-to: <1357778378-5278-1-git-send-email-tomasz.figa@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Tomasz Figa wrote:
> 
> Recently the regs-syscon-power.h header was moved from
> mach-s3c64xx/include/mach to mach-s3c64xx/, but cpuidle.c was not
> updated to include the header from its new location, which caused
> build error with CONFIG_CPU_IDLE enabled.
> 
> This patch fixed the problem by updating the include line with
> proper header location.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/cpuidle.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/cpuidle.c b/arch/arm/mach-
> s3c64xx/cpuidle.c
> index e3e455b..50c66fe 100644
> --- a/arch/arm/mach-s3c64xx/cpuidle.c
> +++ b/arch/arm/mach-s3c64xx/cpuidle.c
> @@ -20,8 +20,7 @@
> 
>  #include <mach/map.h>
> 
> -#include <mach/regs-syscon-power.h>
> -
> +#include "regs-syscon-power.h"
>  #include "regs-sys.h"
> 
>  static int s3c64xx_enter_idle(struct cpuidle_device *dev,
> --
> 1.8.1

Oops, yes right. Thanks for your fix :-)

Will apply. 

- Kukjin
