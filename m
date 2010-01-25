From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: too much memory for node
Date: Mon, 25 Jan 2010 11:58:13 +0000
Message-ID: <20100125115813.GT26562@trinity.fluff.org>
References: <20100120153411.GG26562@trinity.fluff.org> <20100120155510.GB27507@n2100.arm.linux.org.uk> <20100120160525.GW10014@trinity.fluff.org> <20100120161053.GD27507@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47781 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752471Ab0AYL6V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 06:58:21 -0500
Content-Disposition: inline
In-Reply-To: <20100120161053.GD27507@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Wed, Jan 20, 2010 at 04:10:53PM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 20, 2010 at 04:05:25PM +0000, Ben Dooks wrote:
> > On Wed, Jan 20, 2010 at 03:55:10PM +0000, Russell King - ARM Linux wrote:
> > > On Wed, Jan 20, 2010 at 03:34:11PM +0000, Ben Dooks wrote:
> > > > I've been looking at support for a new machine type where the
> > > > current system is using DISCONTIGMEM as the 1G memory map has
> > > > 4x256M RAM ranges which may not all be filled.
> > > 
> > > Firstly, use sparsemem, unless you intentionally want to spend more
> > > cycles in the kernel.
> > 
> > Ok, any idea if that will fix the problem in this case?
> 
> It _may_ do, because it doesn't have the concept of NUMA nodes (which
> is what discontigmem is all about.)
> 
> > Should I send a patch to detect bad DISCONTIGMEM setup? I think that
> > a check of PHYS_TO_PFN((start+end) != PHYS_TO_PFN(start)) should be
> > safe in all cases?
> 
> Just move away from discontigmem completely.  Sparsemem can do everything
> we need on ARM at a lesser cost.  As I say above, discontigmem is really
> for NUMA platforms, and ARM is not a NUMA platform.  No one on ARM should
> be going anywhere near discontigmem.

Thanks, we seem to have working sparsemem support now so I will try and
ensure that is what gets sumitted.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
