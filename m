From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: WARNING about next merge window (Re: samsung merge window over)
Date: Tue, 25 May 2010 09:00:31 +0100
Message-ID: <20100525080031.GA11543@n2100.arm.linux.org.uk>
References: <20100525044214.GE7248@trinity.fluff.org> <004b01cafbce$7b249430$716dbc90$%kim@samsung.com> <20100525073124.GA11051@n2100.arm.linux.org.uk> <20100525073454.GF7248@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52126 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751015Ab0EYIA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 04:00:56 -0400
Content-Disposition: inline
In-Reply-To: <20100525073454.GF7248@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Tue, May 25, 2010 at 08:34:54AM +0100, Ben Dooks wrote:
> On Tue, May 25, 2010 at 08:31:24AM +0100, Russell King - ARM Linux wrote:
> > On Tue, May 25, 2010 at 02:52:29PM +0900, Kukjin Kim wrote:
> > > Ben Dooks wrote:
> > > > 
> > > > Thankyou to all who contributed to this round of updates, I am officially
> > > > calling the end of any new development work for this merge window.
> > > > 
> > > > Special thanks to all at Samsung for their help.
> > > > 
> > > > I will now be preparing a defconfig, documentation and any other bugfixes
> > > > tree to send to Linus as soon as possible.
> > > > 
> > > > As a note, this is the shortlog of the patches merged via my tree:
> > > 
> > > Thanks for your review and merging.
> > > 
> > > And ok, we will continue our development and submit patches for the next
> > > merge window. Also, if we find any issues, we will submit patches for those
> > > also.
> > 
> > The impression I have is that Samsung folk waited for the merge window
> > before sending their patches to the mailing list - there have been
> > about 320 messages attributable to 'samsung' or 's3' subjects since the
> > merge window opened.
> > 
> > This is excessive, and isn't really practical - it swamps the mailing
> > list and makes it very easy to miss more relevant stuff during the
> > merge window.
> 
> Yes, agreed. I have made the point to them again that this is too late
> in the development cycle. Unforunately due to the 'fun' with uk airspace
> my visit here was dealyed by nearly three weeks, which has left us with
> too little time.

Volcanic ash doesn't stop email working - or patches being reviewed.

> > So, please send the majority of patches *before* the merge window and
> > try to avoid sending anything but fixes during the merge window itself.
> > The merge window is for code which has _already_ been merged and has
> > been in linux-next to be merged into Linus' tree.  It's not for new
> > code to be reviewed.
> 
> Next merge window, which will probably be the last I will handle for the
> S5P range, will have an earlier cut-off point. It was a big rush to get
> this lot reviewed and merged.

It also means that *NONE* of the stuff in your second pull request was
in linux-next for *any* time.  It also conflicted with my tree.  The
result of that is I'm expecting mainline to be dead for all ARM with:

arch/arm/Kconfig:883: can't open file "arch/arm/plat-s5pc1xx/Kconfig"

because of a mis-merge - and since that conflict was not picked up by
linux-next, it could not have been previously published.

For the next merge window, I will avoid reading email for the duration
of the window - which means those who are late for the merge window will
simply not have their patches and trees pulled.  This means we _will_
have time to resolve conflicts and find problems _before_ the merge
window.
