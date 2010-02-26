From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PULL] Pull request for for-rmk/samsung5
Date: Fri, 26 Feb 2010 16:09:24 +0000
Message-ID: <20100226160924.GB24864@trinity.fluff.org>
References: <20100225000919.GA28433@fluff.org.uk> <20100225205301.GG3101@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:46031 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965240Ab0BZQJc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Feb 2010 11:09:32 -0500
Content-Disposition: inline
In-Reply-To: <20100225205301.GG3101@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Thu, Feb 25, 2010 at 08:53:01PM +0000, Russell King - ARM Linux wrote:
> On Thu, Feb 25, 2010 at 12:09:19AM +0000, Ben Dooks wrote:
> > Sorry for the late request, but haven't been very well. Quite a bit of
> > this update has been on list for a while, but only just been merged
> > together into one tree.
> > 
> > This is the last of the Samsung updates that need to go via RMK, they
> > are mostly plat-s3c/plat-s3c64xx and machine squashed and the new
> > S5P6442 and S5PV210 code.
> > 
> > Included are some updates for the current code to avoid build or runtime
> > problems with other updates such as via the ASoC tree.
> > 
> > I will be doing a seperate set of updates direct to Linus once these are
> > merged to fix and outstanding problems, any updates such as S3C2443 clock
> > rewrite and anything else not directly relying on arch/arm modifications.
> > 
> > There will also be a set of documentation updates to deal with the current
> > shifts and outline anything else that needs to be done.
> > 
> > Anything urgent, please cc: me directly.
> > 
> > The following changes since commit ab5d97db1c6ced3e95c00d097931471707032b1f:
> >   Ben Dooks (1):
> >         ARM: SAMSUNG: Fix bad use of __initdata for s3c_register_clocks()
> > 
> > are available in the git repository at:
> > 
> >   git://git.fluff.org/bjdooks/linux.git for-rmk/samsung5
> 
> This gives me conflicts in arch/arm/Makefile and arch/arm/Kconfig.  I'll
> need to investigate, which I'll do over the weekend.

Very probably, this is based of the for-rmk/samsung3 branch which has
very likely diverged from your branch. Thanks for looking at it.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
