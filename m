From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm:irqchip: IRQCHIP_DECLARE macro is now accessible
Date: Sun, 6 Sep 2015 08:45:31 +0800
Message-ID: <20150906004531.GA30746@tiger>
References: <1436299411-12329-1-git-send-email-joel@porquet.org>
 <20150713152035.GD26642@tiger>
 <7212409.q6uiaM0l3x@joel-zenbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46313 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750749AbbIFApu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Sep 2015 20:45:50 -0400
Content-Disposition: inline
In-Reply-To: <7212409.q6uiaM0l3x@joel-zenbook>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joel Porquet <joel@porquet.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 04, 2015 at 04:54:21PM -0400, Joel Porquet wrote:
> On Monday, July 13, 2015 11:20:35 PM Shawn Guo wrote:
> > On Tue, Jul 07, 2015 at 04:02:53PM -0400, Joel Porquet wrote:
> > > The IRQCHIP_DECLARE macro migrated to 'include/linux/irqchip.h', making it
> > > globally accessible.
> > > 
> > > See commit 91e20b5040c67c51aad88cf87db4305c5bd7f79d
> > > ("irqchip: Move IRQCHIP_DECLARE macro to include/linux/irqchip.h").
> > > 
> > > This patch adds inclusions of 'include/linux/irqchip.h' and replaces uses
> > > of macro OF_DECLARE_2 with IRQCHIP_DECLARE.
> > > 
> > > Signed-off-by: Joel Porquet <joel@porquet.org>
> > > ---
> > 
> > ...
> > 
> > >  arch/arm/mach-imx/gpc.c              | 7 ++-----
> > 
> > Acked-by: Shawn Guo <shawnguo@kernel.org>
> > 
> > How will this patch be sent to upstream?
> 
> If it's more convenient for the different maintainers affected by this patch, 
> I can probably resubmit it into a series of patches that modify each file 
> separately... Let me know quickly so we don't miss the merge window!

We had sent out the materials for this merge window.  So if you have a
path to upstream, you'd better send this patch through that.  You've
already got the ACKs from maintainers of affected platform.

Shawn
