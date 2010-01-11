From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v3 0/7] ARM: S5P6440: Add support for Samsung's S5P6440
	SoC
Date: Mon, 11 Jan 2010 06:44:41 +0000
Message-ID: <20100111064441.GK3738@trinity.fluff.org>
References: <000e01ca9272$9e3faa60$dabeff20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:44676 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751070Ab0AKGon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 01:44:43 -0500
Content-Disposition: inline
In-Reply-To: <000e01ca9272$9e3faa60$dabeff20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 11, 2010 at 01:00:30PM +0900, Kukjin Kim wrote:
> Hi All,
> 
> This patches add basic support for Samsung's S5P6440 SoC.
> The feature set that is added are clock, timer, uart and interrupts.
> 
> The clock changes are based on Harald Welte's patch. This patch is
> also based on Ben's plat-samsung patch.
> 
> This patch set includes the following patches.
> 
> [PATCH V3 1/7] ARM: S5P6440: Add new CPU initialization support
> [PATCH V3 2/7] ARM: S5P6440: Add Clock and PLL support
> [PATCH V3 3/7] ARM: S5P6440: Add IRQ support
> [PATCH V3 4/7] ARM: S5P6440: Add Timer support
> [PATCH V3 5/7] ARM: S5P6440: Add new Kconfig and Makefiles
> [PATCH V3 6/7] ARM: S5P6440: Add Board and configuration file
> [PATCH V3 7/7] ARM: S5P6440: Add serial port support
> 
> This patch set depends on the following patches.
> 
> 1. [PATCH 1/3] ARM: SAMSUNG: Add config option for number of additional GPIO
> pins.
> 2. [PATCH 2/3] ARM: SAMSUNG: Make clk_default_setrate and
> clk_ops_def_setrate visible to other code.
> 3. [PATCH 3/3] ARM: SAMSUNG: Add idle support.
> 
> Changes since v2:
> 
> 1. Removed unused clock module defines.
> 2. Modified PLL code to be generic.
> 3. IRQ Timer and IRQ UART code use common code.
> 4. S5P timer code is removed and common code in plat-s3c is used.
> 5. Moved some of the code from plat-s5p to plat-samsung.

An improvement, there's still a couple of things that need changing before
merging. Please see the comments in the relevant patches.
 
> Changes since v1:
> 
> 1. Corrected parent clock sources for all the clocks.
> 2. Corrected the HCLK_LOW frequency calculation issue.
> 3. Added a menuconfig option "S5P_GPIO_EXTRA" to select the number
>    of additional GPIO's required in file arch/arm/plat-s5p/Kconfig
> 4. Add PCLK_LOW and UCLK1 as clock sources for UART module.
> 5. Removed conditional inclusion of mach-s5p6440/Kconfig.
> 6. Other fixes and changes.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
