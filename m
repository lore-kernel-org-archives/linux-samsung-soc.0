From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] ARM: SAMSUNG: Add SPI clock definitions for
	SAMSUNG SoCs
Date: Thu, 30 Jun 2011 10:30:24 +0100
Message-ID: <20110630093024.GT21898@n2100.arm.linux.org.uk>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com> <1309436723-662-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50922 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754954Ab1F3Jai (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 05:30:38 -0400
Content-Disposition: inline
In-Reply-To: <1309436723-662-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 30, 2011 at 08:25:19AM -0400, Padmavathi Venna wrote:
> SPI Clocks were defined in dev-spi.c of machine specific folder.
> To make SPI devices common across all SoCs,dev-spi.c is moved
> from machine specific folder to plat-samsung. So SPI clock
> definitions has been moved from dev-spi.c to SoC specific machine
> folder for S3C64XX,S5P64X0,S5PC100 and S5PV210

This just shows how sick the Samsung code is by abusing the clk API.
If it stopped that abuse and switched over to clkdev none of this would
be necessary.

So I'm going to NAK this until the Samsung clk code moves over to clkdev.
Sorry, I've made enough requests of Samsung people to do this, and its
time for more effective persuasion by standing in the way of other patches
to make it happen.
