From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 6/7] ARM: EXYNOS4: Add save/restore for more ARM
	registers
Date: Thu, 23 Jun 2011 08:51:46 +0100
Message-ID: <20110623075146.GY23234@n2100.arm.linux.org.uk>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com> <1308732405-16664-7-git-send-email-kgene.kim@samsung.com> <20110622145452.GR23234@n2100.arm.linux.org.uk> <015801cc3170$42695800$c73c0800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46071 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753365Ab1FWHwG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 03:52:06 -0400
Content-Disposition: inline
In-Reply-To: <015801cc3170$42695800$c73c0800$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org

On Thu, Jun 23, 2011 at 03:39:02PM +0900, Kukjin Kim wrote:
> Russell King - ARM Linux wrote:
> > 
> > On Wed, Jun 22, 2011 at 05:46:44PM +0900, Kukjin Kim wrote:
> > > From: Jaecheol Lee <jc.lee@samsung.com>
> > >
> > > This patch adds save/restore for Power Control Register and
> > > Diagnostic Register.
> > 
> > NAK.  Please see my further suspend consolidation patches posted earlier.
> > I've also recently (last few days) moved these further forward and this
> > code no longer exists in this file (all it contains is the early
> > resume stuff.)
> > 
> Oops :(
> OK, will re-work based on latest rmk/for-next :)

The entire series is not in for-next yet, it's still being worked on.
That's why I posted the patches again yesterday.
