From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Default machine include placements
Date: Mon, 25 Jan 2010 11:01:16 +0000
Message-ID: <20100125110116.GB16340@n2100.arm.linux.org.uk>
References: <20100125040255.GN26562@trinity.fluff.org> <20100125104956.GP26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56786 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab0AYLBl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 06:01:41 -0500
Content-Disposition: inline
In-Reply-To: <20100125104956.GP26562@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Mon, Jan 25, 2010 at 10:49:56AM +0000, Ben Dooks wrote:
> On Mon, Jan 25, 2010 at 04:02:56AM +0000, Ben Dooks wrote:
> > Currently in the s3c/s5p familt we're seeing quite a number of the
> > same things being repeated for items like entry-macro.S, hardware.h
> > and so on.
> > 
> > The first question is about adding include/mach directories to
> > eitehr plat-s5p or plat-samsung to mop up the files that keep
> > getting repeated (since the plat-* directories are processed after
> > the machine directory includes the mach-xxx are still free to overide
> > these as necessary)
> 
> As context, this is part of the work that I am currently doing with
> Samsung to improve the mainlining of the newer SoC series. Part of this
> is to try and cut down on the amount of repetition that gets done by
> some of the porting teams. This is generally to stop things like the
> replication of the serial drivers or ending up with complete new copies
> of the SDHCI core simply because they could.

Changing the policy wrt include files isn't going to stop drivers
and core code being copy-n-edited.

The copy-n-edit is a culture thing - it's something that people
needlessly do because that's how they've worked in the past and don't
know any better.  The solution to that is education, not changing the
way we layout files in the kernel tree.
