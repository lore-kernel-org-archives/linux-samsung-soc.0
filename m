From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] S3C24XX DMA resume regression fix
Date: Fri, 20 Jan 2012 12:14:02 +0000
Message-ID: <20120120121402.GM1068@n2100.arm.linux.org.uk>
References: <1326462444-10567-1-git-send-email-dron0gus@gmail.com> <4F11F911.7030609@ru.mvista.com> <20120120114902.GB22732@build.ihdev.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:36845 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950Ab2ATMOb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 07:14:31 -0500
Content-Disposition: inline
In-Reply-To: <20120120114902.GB22732@build.ihdev.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergey Lapin <slapin@ossfans.org>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, Kukjin Kim <kgene.kim@samsung.com>, Gusakov Andrey <dron0gus@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

On Fri, Jan 20, 2012 at 06:49:02AM -0500, Sergey Lapin wrote:
> On Sun, Jan 15, 2012 at 01:52:17AM +0400, Sergei Shtylyov wrote:
> > Hello.
> > 
> > On 13-01-2012 17:47, Gusakov Andrey wrote:
> > 
> > >In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b suspend/resume
> > 
> >    Please also specify that commit's summary in parens.
> 
> Could you please point me in direction of patch submission
> guide where that is explained.

It's something that's been asked for by Linus - and as Linus can refuse
to pull anything he doesn't like, it's something that we'd better satisfy
if we want patches to hit mainline.

Like everything in kernel development, what's written in documentation is
never the full story; things change through discussions on mailing lists,
new guidelines get created, and the documents become stale.  That's the
nature of this.

Anyone is free to update the documentation, so if you think it's got a
shortcoming, please feel free to send a documentation patch.

> The commit message summary is
> ARM / Samsung: Use struct syscore_ops for "core" power management
> 
> But that is not revert of that commit, so I don't really
> see a point. This is bug fix which fixes resume code path.

The point is that if you include a commit ID, then you should include
the summary, so people reading the commit message don't have to faff
around trying to find out what you're referring to.

See, for example, http://lkml.org/lkml/2010/6/1/498
