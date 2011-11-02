From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 0/4] Add SPI clkdev support
Date: Wed, 2 Nov 2011 13:00:24 +0000
Message-ID: <20111102130024.GC19187@n2100.arm.linux.org.uk>
References: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38165 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375Ab1KBNA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 09:00:56 -0400
Content-Disposition: inline
In-Reply-To: <1320268004-4545-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Wed, Nov 02, 2011 at 05:06:40PM -0400, Padmavathi Venna wrote:
> This patchset modifies the existing clkdev to make SPI driver
> independent of the clock names send from platform data.

No it does not.  It modifies the clkdev lookup tables.

When I read this I thought 'why are you modifying the clkdev stuff'.  Only
when I read the diffstat did it become clear that this was not the case.

Please be more careful about describing your changes.
