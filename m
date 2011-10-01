From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] ARM: Switch to using CLKDEV_INIT macro for
	creating clk_lookup instance
Date: Sat, 1 Oct 2011 16:31:24 +0100
Message-ID: <20111001153123.GE11710@n2100.arm.linux.org.uk>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com> <1317381097-2691-3-git-send-email-padma.v@samsung.com> <20110930112633.GB9046@local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55719 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782Ab1JAPbg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Oct 2011 11:31:36 -0400
Content-Disposition: inline
In-Reply-To: <20110930112633.GB9046@local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de

On Fri, Sep 30, 2011 at 01:26:33PM +0200, Hans J. Koch wrote:
> On Fri, Sep 30, 2011 at 04:41:37PM +0530, Padmavathi Venna wrote:
> > Replace platform specific macros that creates struct clk_lookup
> > instance with the new common CLKDEV_INIT macro
> 
> Well, for mach-tcc8k, it only saves 7 lines, but it's surely a good idea to
> have one common macro for all arm subarchs.

The savings are of course likely to be small, but it had two advantages:

1. We're not having one initializer per platform or SoC
2. We have something common which can be grepped for, or sed'd (or whatever
   your favourite in-place editing program) should it need to be changed.
