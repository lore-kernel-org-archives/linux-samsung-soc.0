From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/6] ARM: S5P64X0: Add Framebuffer support
Date: Fri, 15 Jul 2011 11:42:30 +0530
Message-ID: <4E1FDA4E.9010800@linaro.org>
References: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:55768 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964790Ab1GOGMh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 02:12:37 -0400
Received: by fxd18 with SMTP id 18so2272447fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 23:12:36 -0700 (PDT)
In-Reply-To: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com

On Thursday 14 July 2011 06:57 PM, Ajay Kumar wrote:
> 	The patches are created against "for-next" branch of Kukjin Kim's tree at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> 	Patch [1/6]
> 	-- add "s5p64x0-fb" type driver_data(s3c_fb_driverdata).
> 	-- Display controller in S5P64X0 supports 3 windows.
>
> 	Patch [2/6]
> 	-- Resource definitions(_MEM, _IRQ).
>
> 	Patch [3/6]
> 	-- Set s3c_device_fb name as "s5p64x0-fb"
> 	   for S5P6440 and S5P6450.
>
> 	Patch [4/6]
> 	-- GPIO settings for LCD in S5P6440 and S5P6450.
> 	-- Select LCD interface type (RGB/i80)
>
> 	Patch [5/6]
> 	-- Add support for LCD-LTE480 platform device in SMDK6440.
> 	-- Platform data for FB and a basic window definition.
> 	-- Enables FB support and platform-lcd support.
> 	-- Add support for window 0 with 24 BPP.
>
> 	Patch [6/6]
> 	-- Add support for LCD-LTE480 platform device in SMDK6450.
> 	-- Platform data for FB and a basic window definition.
> 	-- Enables FB support and platform-lcd support.
> 	-- Add support for window 0 with 24 BPP.
>
Some of the patches have got some coding syntax (DOS LINE ending etc.). 
Consider running scripts/checkpatch.pl on the patches before sending the 
next version.

scripts/cleanpatch can help you in fixing many of the style problems.

>   o To Paul Mundt, Jingoo Han
>     [Patch 1/6] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata
>
>   o To Kukjin Kim
>     [Patch 2/6] ARM: S5P64X0: Add register base and IRQ for Framebuffer
>     [Patch 3/6] ARM: S5P64X0: Set s3c_device_fb name
>     [Patch 4/6] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
>     [Patch 5/6] ARM: S5P6440: Add LCD-LTE480 and enable Framebuffer support
>     [Patch 6/6] ARM: S5P6450: Add LCD-LTE480 and enable Framebuffer support
>
>
>   arch/arm/mach-s5p64x0/Kconfig                  |   10 ++++
>   arch/arm/mach-s5p64x0/Makefile                 |    1 +
>   arch/arm/mach-s5p64x0/cpu.c                    |    3 +
>   arch/arm/mach-s5p64x0/include/mach/irqs.h      |    4 ++
>   arch/arm/mach-s5p64x0/include/mach/map.h       |    3 +
>   arch/arm/mach-s5p64x0/include/mach/regs-fb.h   |   19 +++++++
>   arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 ++
>   arch/arm/mach-s5p64x0/mach-smdk6440.c          |   63 +++++++++++++++++++++++
>   arch/arm/mach-s5p64x0/mach-smdk6450.c          |   63 +++++++++++++++++++++++
>   arch/arm/mach-s5p64x0/setup-fb.c               |   48 ++++++++++++++++++
>   arch/arm/plat-samsung/include/plat/fb.h        |   14 +++++
>   drivers/video/s3c-fb.c                         |   64 ++++++++++++++++++++++++
>   12 files changed, 296 insertions(+), 0 deletions(-)
>   create mode 100644 arch/arm/mach-s5p64x0/include/mach/regs-fb.h
>   create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Tushar Behera
