From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Sat, 1 Oct 2011 16:29:38 +0100
Message-ID: <20111001152938.GD11710@n2100.arm.linux.org.uk>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com> <1317381097-2691-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55705 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782Ab1JAP3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Oct 2011 11:29:53 -0400
Content-Disposition: inline
In-Reply-To: <1317381097-2691-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de

On Fri, Sep 30, 2011 at 04:41:36PM +0530, Padmavathi Venna wrote:
> +#define CLKDEV_INIT(d, n, c) \
> +	{ \
> +		.dev_id = d, \
> +		.con_id = n, \
> +		.clk = &c, \
> +	},
> +

As Heartley says, the trailing , and the end should not be there - it
should be with each use of CLKDEV_INIT().  The reasoning is that it
makes the use of macros much more conventional and consistent throughout
the kernel:

struct cl_lookup foo_lookups[] = {
	CLKDEV_INIT(...),
	CLKDEV_INIT(...),
};

struct cl_lookup bar_lookup = CLKDEV_INIT(...);

Could you re-spin with that change please?

Thanks.
