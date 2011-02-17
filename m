From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC 2/5] ARM: P2V: avoid initializers and assembly using
 PHYS_OFFSET
Date: Thu, 17 Feb 2011 14:36:19 +0900
Message-ID: <015d01cbce64$9dbf1bf0$d93d53d0$%kim@samsung.com>
References: <20110104202052.GE24935@n2100.arm.linux.org.uk>
 <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43522 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751300Ab1BQFg0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 00:36:26 -0500
In-reply-to: <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Nicolas Pitre' <nico@fluxnic.net>
Cc: 'David Brown' <davidb@codeaurora.org>, 'Daniel Walker' <dwalker@codeaurora.org>, 'Bryan Huntsman' <bryanh@codeaurora.org>, 'Amit Kucheria' <amit.kucheria@canonical.com>, 'Sascha Hauer' <kernel@pengutronix.de>, 'Eric Miao' <eric.y.miao@gmail.com>, "'Hans J. Koch'" <hjk@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux wrote:
> 
> As PHYS_OFFSET will be becoming a variable, we can't have it used in
> initializers nor assembly code.  Replace those in generic code with
> a run-time initialization.  Replace those in platform code using the
> individual platform specific PLAT_PHYS_OFFSET.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  arch/arm/kernel/setup.c                  |    4 +++-
>  arch/arm/mach-msm/board-msm7x27.c        |    8 ++++----
>  arch/arm/mach-msm/board-msm7x30.c        |    6 +++---
>  arch/arm/mach-msm/board-qsd8x50.c        |    4 ++--
>  arch/arm/mach-msm/board-sapphire.c       |    2 +-
>  arch/arm/mach-mx5/board-cpuimx51.c       |    2 +-
>  arch/arm/mach-mx5/board-cpuimx51sd.c     |    2 +-
>  arch/arm/mach-mx5/board-mx51_3ds.c       |    2 +-
>  arch/arm/mach-pxa/balloon3.c             |    2 +-
>  arch/arm/mach-realview/realview_eb.c     |    2 +-
>  arch/arm/mach-realview/realview_pb1176.c |    2 +-
>  arch/arm/mach-realview/realview_pb11mp.c |    2 +-
>  arch/arm/mach-realview/realview_pba8.c   |    2 +-
>  arch/arm/mach-realview/realview_pbx.c    |    2 +-
>  arch/arm/mach-s5pv210/sleep.S            |    2 +-
>  arch/arm/mach-tcc8k/board-tcc8000-sdk.c  |    2 +-
>  arch/arm/mach-vexpress/ct-ca9x4.c        |    2 +-
>  17 files changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 3455ad3..f67e682 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -705,7 +705,7 @@ static struct init_tags {
>  	{ tag_size(tag_core), ATAG_CORE },
>  	{ 1, PAGE_SIZE, 0xff },
>  	{ tag_size(tag_mem32), ATAG_MEM },
> -	{ MEM_SIZE, PHYS_OFFSET },
> +	{ MEM_SIZE },
>  	{ 0, ATAG_NONE }
>  };
> 
> @@ -804,6 +804,8 @@ void __init setup_arch(char **cmdline_p)
>  	struct machine_desc *mdesc;
>  	char *from = default_command_line;
> 
> +	tags->mem.start = PHYS_OFFSET;
> +
>  	unwind_init();
> 
>  	setup_processor();

(snip)

> diff --git a/arch/arm/mach-s5pv210/sleep.S b/arch/arm/mach-s5pv210/sleep.S
> index d4d222b..2737622 100644
> --- a/arch/arm/mach-s5pv210/sleep.S
> +++ b/arch/arm/mach-s5pv210/sleep.S
> @@ -65,7 +65,7 @@ resume_with_mmu:
>  	/*
>  	 * After MMU is turned on, restore the previous MMU table.
>  	 */
> -	ldr	r9 , =(PAGE_OFFSET - PHYS_OFFSET)
> +	ldr	r9 , =(PAGE_OFFSET - PLAT_PHYS_OFFSET)
>  	add	r4, r4, r9
>  	str	r12, [r4]
> 

(snip)

> --
> 1.6.2.5

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
