From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] video: treat signal like timeout as failure
Date: Tue, 10 Mar 2015 15:26:22 +0000
Message-ID: <20150310152622.GN8656@n2100.arm.linux.org.uk>
References: <1421731430-13207-1-git-send-email-der.herr@hofr.at>
 <54FEE70D.3010307@ti.com>
 <20150310125116.GA26020@opentech.at>
 <20150310141511.GL8656@n2100.arm.linux.org.uk>
 <20150310143928.GA19501@opentech.at>
 <20150310144640.GM8656@n2100.arm.linux.org.uk>
 <54FF05FC.5030704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:35517 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753632AbbCJP0b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 11:26:31 -0400
Content-Disposition: inline
In-Reply-To: <54FF05FC.5030704@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, Ajay Kumar <ajaykumar.rs@samsung.com>

On Tue, Mar 10, 2015 at 04:55:56PM +0200, Tomi Valkeinen wrote:
> On 10/03/15 16:46, Russell King - ARM Linux wrote:
> 
> > In which case, let me propose that the exynos fbdev driver needs to be
> > moved to drivers/staging, and stay there until this stuff gets fixed.
> > drivers/staging is supposed to be for stuff which isn't up to the mark,
> > and which is potentially unstable.  And that's what this driver exactly
> > is.
> 
> There is drivers/gpu/drm/exynos/ which is getting a lot of updates. So...
> 
> I'd propose removing the exynos fbdev driver if the exynos drm driver
> offers the same functionality. I don't know if that's the case. Does the
> drm driver support all the devices the fbdev supports?
> 
> Also, I'm not sure if and how we can remove drivers. If exynos fbdev
> driver is dropped, that would perhaps break boards that have exynos
> fbdev in their .dts file. And if the drm driver doesn't offer the exact
> same /dev/fbX interface, it would break the userspace.
> 
> So I don't know if that's possible. But that's what I'd like to do,
> eventually, for all the fbdev drivers. Implement drm driver, remove the
> fbdev one.

That's why I suggested moving it to drivers/staging - it's a hint that
the driver needs a serious amount of work, and when built as a module,
it also provides users with the hint that the module they're loading is
of questionable quality (which is definitely the case here.)

Others have done that kind of thing before - we've had drivers which
have fallen by the way side, and at some point the decision has been
made to move them to drivers/staging, and if nothing happens to fix
them up (showing that no one cares about them), they've eventually
been dropped.

Of course, us talking about this might be enough to spur some effort
to get the thing properly fixed. :)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
