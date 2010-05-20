From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 0/0] Add Watchdog support for Samsung SMDK6410, S5P6440
	and S5Pv210
Date: Thu, 20 May 2010 08:35:26 +0100
Message-ID: <20100520073526.GA26401@trinity.fluff.org>
References: <1274340092-10706-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47550 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750877Ab0ETHfd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 03:35:33 -0400
Content-Disposition: inline
In-Reply-To: <1274340092-10706-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, May 20, 2010 at 04:21:27PM +0900, Kukjin Kim wrote:
> This patches add Watchdog support for SMDK6410, S5P6440 and S5PV210.
> 
> - Add HAVE_S3C2410_WATCHDOG for selecting watchgog driver compile in each machine
> - Add S3C_DEV_WDT for watchdog device definitions
> - Fix freeing memory part when memory region could not be allocated s3c2410_wdt
> - Add machine dependent part for watchdog support

ok, the will look at merging the device side of this. Please orward
the drivers/watchdog patches to the relevant maintainer with

Acked-by: Ben Dooks <ben-linux@fluff.org>
 
> [PATCH 1/5] ARM: SAMSUNG: Move WDT device definitions in plat-samsung
> [PATCH 2/5] [WATCHDOG] s3c2410_wdt - Avoid freeing memory, if memory region could not be allocated
> [PATCH 3/5] ARM: SMDK6410: Add Watchdog support for SMDK6410
> [PATCH 4/5] ARM: S5P6440: Add Watchdog support for S5P6440
> [PATCH 5/5] ARM: S5PV210: Add Watchdog support for S5PV210
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
