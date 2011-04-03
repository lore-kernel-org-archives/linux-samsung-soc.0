From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: Make consolidated PM sleep code depend on
	PM_SLEEP
Date: Sun, 3 Apr 2011 13:27:13 +0100
Message-ID: <20110403122713.GD4213@n2100.arm.linux.org.uk>
References: <20110402091904.GH8482@n2100.arm.linux.org.uk> <E1Q5x0g-0001Yw-Vb@rmk-PC.arm.linux.org.uk> <87ipuvr2xg.fsf@lebrac.rtp-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:60859 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab1DCMc2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2011 08:32:28 -0400
Content-Disposition: inline
In-Reply-To: <87ipuvr2xg.fsf@lebrac.rtp-net.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org

On Sun, Apr 03, 2011 at 01:26:35PM +0200, Arnaud Patard wrote:
> I've build-tested on some failing platforms theses 2 patches and the
> build are now succeeding. The only PM related zImage build error I found
> was for s5pc100:
> 
> arch/arm/plat-samsung/pm.c:32:26: fatal error: mach/pm-core.h: No such file or directory

That probably existing from before the consolidation patch, so I won't
worry about it.
