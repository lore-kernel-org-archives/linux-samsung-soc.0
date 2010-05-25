From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: samsung merge window over
Date: Tue, 25 May 2010 08:34:54 +0100
Message-ID: <20100525073454.GF7248@trinity.fluff.org>
References: <20100525044214.GE7248@trinity.fluff.org> <004b01cafbce$7b249430$716dbc90$%kim@samsung.com> <20100525073124.GA11051@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:45280 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754130Ab0EYHe7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 03:34:59 -0400
Content-Disposition: inline
In-Reply-To: <20100525073124.GA11051@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

On Tue, May 25, 2010 at 08:31:24AM +0100, Russell King - ARM Linux wrote:
> On Tue, May 25, 2010 at 02:52:29PM +0900, Kukjin Kim wrote:
> > Ben Dooks wrote:
> > > 
> > > Thankyou to all who contributed to this round of updates, I am officially
> > > calling the end of any new development work for this merge window.
> > > 
> > > Special thanks to all at Samsung for their help.
> > > 
> > > I will now be preparing a defconfig, documentation and any other bugfixes
> > > tree to send to Linus as soon as possible.
> > > 
> > > As a note, this is the shortlog of the patches merged via my tree:
> > 
> > Thanks for your review and merging.
> > 
> > And ok, we will continue our development and submit patches for the next
> > merge window. Also, if we find any issues, we will submit patches for those
> > also.
> 
> The impression I have is that Samsung folk waited for the merge window
> before sending their patches to the mailing list - there have been
> about 320 messages attributable to 'samsung' or 's3' subjects since the
> merge window opened.
> 
> This is excessive, and isn't really practical - it swamps the mailing
> list and makes it very easy to miss more relevant stuff during the
> merge window.

Yes, agreed. I have made the point to them again that this is too late
in the development cycle. Unforunately due to the 'fun' with uk airspace
my visit here was dealyed by nearly three weeks, which has left us with
too little time.
 
> So, please send the majority of patches *before* the merge window and
> try to avoid sending anything but fixes during the merge window itself.
> The merge window is for code which has _already_ been merged and has
> been in linux-next to be merged into Linus' tree.  It's not for new
> code to be reviewed.

Next merge window, which will probably be the last I will handle for the
S5P range, will have an earlier cut-off point. It was a big rush to get
this lot reviewed and merged.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
