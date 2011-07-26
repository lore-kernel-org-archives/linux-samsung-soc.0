From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
	[PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Tue, 26 Jul 2011 18:20:27 +0100
Message-ID: <20110726172027.GD1655@n2100.arm.linux.org.uk>
References: <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com> <20110725103629.GF9653@n2100.arm.linux.org.uk> <1311590884.29703.2.camel@vkoul-mobl4> <20110725105754.GG9653@n2100.arm.linux.org.uk> <1311591717.29703.7.camel@vkoul-mobl4> <20110725113926.GH9653@n2100.arm.linux.org.uk> <1311595303.29703.31.camel@vkoul-mobl4> <20110726075720.GL9653@n2100.arm.linux.org.uk> <1311672933.24316.1.camel@vkoul-mobl4> <CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59769 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337Ab1GZRUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 13:20:46 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Vinod Koul <vkoul@infradead.org>, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 08:07:44PM +0530, Jassi Brar wrote:
> Dear Vinod,
> 
>  Since it came from the RMK, most probably it'll be the best.
> 
> But applying patches upon personal timeout seems very dangerous.

Ehh what?  Is there any contention over this documentation patch?

It's not adding anything new, it's just documenting the facts as they
stand today about the API and its use.

> People not responding doesn't mean only either people agree completely
> or they don't care. Some might be interested but too busy with current tasks
> that they need time to check... please make some policy for such cases.
> 
> It already happened with the patch from Rob, which you probably have to
> revert.
> 
> IMHO, if nobody replied, maybe you could first ack the patch and wait
> for, say a week, before applying?
> That way people will know they have to hurry if they care otherwise
> the patch is going upstream as such.

A week is far too long.  That's how patches get lost and missed.
