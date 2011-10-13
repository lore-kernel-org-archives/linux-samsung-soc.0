From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RESEND][PATCH V2 0/2] Add a common macro for creating struct
	clk_lookup entries
Date: Thu, 13 Oct 2011 11:20:10 +0100
Message-ID: <20111013102010.GQ21648@n2100.arm.linux.org.uk>
References: <1318333530-7023-1-git-send-email-padma.v@samsung.com> <057301cc880c$cc7f1f50$657d5df0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42337 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab1JMKU1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 06:20:27 -0400
Content-Disposition: inline
In-Reply-To: <057301cc880c$cc7f1f50$657d5df0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de

On Tue, Oct 11, 2011 at 08:56:23PM +0900, Kukjin Kim wrote:
> Russell,
> Maybe as you know, this is required on upcoming Samsung stuff. Actually it's
> just change/consolidate on other stuff but add on Samsung stuff. So if
> you're ok, how about sending this to upstream via arm-soc or your tree in
> this merge window?

I think taking the first patch is the right thing before the merge
window opens, because that's the one which everything else will depend
upon.

The second patch probably needs splitting up between the various SoCs
and either submitted to their maintainers or to Arnd after the merge
window has closed.

I suspect that we're looking at one of:
a) a matter of days to the merge window opening - though the timing of
   it (9 days before the kernel summit) doesn't look good, unless it's
   going to be a short window.
b) -rc9 will persist for the next fortnight
c) we'll see the first 3.x-rc10 kernel.
