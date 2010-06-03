From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Make WDT driver dependency SoC specific
	instead of machine specific
Date: Thu, 3 Jun 2010 01:49:05 +0100
Message-ID: <20100603004905.GE30276@trinity.fluff.org>
References: <1275462611-21657-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37779 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932590Ab0FCAtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jun 2010 20:49:15 -0400
Content-Disposition: inline
In-Reply-To: <1275462611-21657-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Banajit Goswami <banajit.g@samsung.com>

On Wed, Jun 02, 2010 at 04:10:11PM +0900, Kukjin Kim wrote:
> From: Banajit Goswami <banajit.g@samsung.com>
> 
> This patch moves the dependency of watchdog timer driver from
> MACH_XXX(board) to ARCH_XXX(SoC). This will enable all machines
> using Samsung S3C64XX, S5P6440 and S5PV210/S5PC110 SoCs to use
> the WDT driver by default.
> 
> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig              |    3 +++

you'll be better off changing the arch/arm/mach-xxx/Kconfig files to avoid
having to change arch/arm/Kconfig and thus make the merge dependant on
Russell.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
