From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Mon, 13 Feb 2012 13:54:44 -0700
Message-ID: <20120213205444.GH11077@ponder.secretlab.ca>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <201202112007.08672.arnd@arndb.de>
 <20120211201430.GB24564@sirena.org.uk>
 <201202130547.48530.arnd@arndb.de>
 <20120213110453.GA13673@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52276 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754173Ab2BMUyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 15:54:46 -0500
Received: by daed14 with SMTP id d14so4777457dae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Feb 2012 12:54:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20120213110453.GA13673@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, olof@lixom.net, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>

On Mon, Feb 13, 2012 at 11:04:53AM +0000, Russell King - ARM Linux wrote:
> On Mon, Feb 13, 2012 at 05:47:48AM +0000, Arnd Bergmann wrote:
> > On Saturday 11 February 2012, Mark Brown wrote:
> > > On Sat, Feb 11, 2012 at 08:07:08PM +0000, Arnd Bergmann wrote:
> > > > what the risk is in changing exynos4 at the same time. It would
> > > > be great if we can have all exynos use the common struct clk in 3.4,
> > > > but I'm also happy if we just get exynos5 to do it that way from the
> > > > beginning and move exynos4 over in 3.5 after you have had a chance
> > > > to make sure everything still works.
> > > 
> > > Are we likely to get the common struct clk in 3.4?  It's all been
> > > extremely quiet on that front except for complaints about the lack of
> > > progress.
> > 
> > Yes, we discussed it during the subarch maintainers meeting at Linaro
> > Connect last week and it looks like we're finally going forward on
> > this now. Maybe Grant or Mike are better at explaining the current
> > status regarding the clk implementation and bindings.
> 
> That would be good for those who weren't there to be updated with what
> was discussed.

The decision was essentially Mike would repost his series ASAP with a view
to getting it queued up for v3.4.  I think he is also going to get it into
linux-next so at least it gets testing, even if the ultimate decision is to
wait for v3.5.

I'm going to rebase my clk series on top of his patches rather that trying
to merge my temporary versatile-only code.  If his series isn't ready to go
in, I can still probably merge parts of the DT clock bindings anyway, but I'll
need to do some cherry picking to do so.

The rough notes can be found here:

https://blueprints.launchpad.net/linux-linaro/+spec/linaro-kernel-q112-maintainer-summit-1

g.
