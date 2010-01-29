From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S5P: Change S5P_TIMER_IRQ based to 11 for SAMSUNG
	S5P series.
Date: Fri, 29 Jan 2010 00:41:51 +0000
Message-ID: <20100129004151.GX10014@trinity.fluff.org>
References: <1264723708-5306-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55665 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752536Ab0A2Alx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 19:41:53 -0500
Content-Disposition: inline
In-Reply-To: <1264723708-5306-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, Jan 29, 2010 at 09:08:28AM +0900, Kukjin Kim wrote:
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> Currently, S5P_TIMER_IRQ is based at the end of VICs. This patch changes
> the S5P_TIMER_IRQ base from end of VICs to 11 in ISA IRQ space.
> No of VICs varies between SOCs. This causes an exception on S5P6442.

It would have been nice to have included the extact warning it tripped,
to make the bug report clearer.

The main omission is that we no longer want to reserve the traditional
ISA space as done on previous architectures,so a note about the reuse
of this space would have been useful. I'll edit the commit message before
applying this.
 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/plat-s5p/include/plat/irqs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s5p/include/plat/irqs.h
> index 878acfe..101038d 100644
> --- a/arch/arm/plat-s5p/include/plat/irqs.h
> +++ b/arch/arm/plat-s5p/include/plat/irqs.h
> @@ -74,7 +74,7 @@
>  #define S5P_IRQ_VIC0(x)		(S5P_VIC0_BASE + (x))
>  #define S5P_IRQ_VIC1(x)		(S5P_VIC1_BASE + (x))
>  
> -#define S5P_TIMER_IRQ(x)	S5P_IRQ(64 + (x))
> +#define S5P_TIMER_IRQ(x)	S5P_IRQ(11 + (x))
>  
>  #define IRQ_TIMER0		S5P_TIMER_IRQ(0)
>  #define IRQ_TIMER1		S5P_TIMER_IRQ(1)

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
