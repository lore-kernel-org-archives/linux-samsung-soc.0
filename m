From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: samsung merge window over
Date: Tue, 25 May 2010 08:31:24 +0100
Message-ID: <20100525073124.GA11051@n2100.arm.linux.org.uk>
References: <20100525044214.GE7248@trinity.fluff.org> <004b01cafbce$7b249430$716dbc90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57783 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753885Ab0EYHbr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 03:31:47 -0400
Content-Disposition: inline
In-Reply-To: <004b01cafbce$7b249430$716dbc90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>

On Tue, May 25, 2010 at 02:52:29PM +0900, Kukjin Kim wrote:
> Ben Dooks wrote:
> > 
> > Thankyou to all who contributed to this round of updates, I am officially
> > calling the end of any new development work for this merge window.
> > 
> > Special thanks to all at Samsung for their help.
> > 
> > I will now be preparing a defconfig, documentation and any other bugfixes
> > tree to send to Linus as soon as possible.
> > 
> > As a note, this is the shortlog of the patches merged via my tree:
> 
> Thanks for your review and merging.
> 
> And ok, we will continue our development and submit patches for the next
> merge window. Also, if we find any issues, we will submit patches for those
> also.

The impression I have is that Samsung folk waited for the merge window
before sending their patches to the mailing list - there have been
about 320 messages attributable to 'samsung' or 's3' subjects since the
merge window opened.

This is excessive, and isn't really practical - it swamps the mailing
list and makes it very easy to miss more relevant stuff during the
merge window.

So, please send the majority of patches *before* the merge window and
try to avoid sending anything but fixes during the merge window itself.
The merge window is for code which has _already_ been merged and has
been in linux-next to be merged into Linus' tree.  It's not for new
code to be reviewed.
