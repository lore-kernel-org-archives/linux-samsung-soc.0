From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ODROID-X: hkdk4412: Add new hardware based on
 Exynos4412
Date: Mon, 6 Aug 2012 15:57:03 +0100
Message-ID: <20120806145702.GB29272@sirena.org.uk>
References: <1344262254-14648-1-git-send-email-dongjin.kim@agreeyamobility.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1344262254-14648-1-git-send-email-dongjin.kim@agreeyamobility.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Jon Medhurst <tixy@yxit.co.uk>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Dongjin Kim <dongjin.kim@agreeyamobility.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Aug 06, 2012 at 11:10:51PM +0900, Dongjin Kim wrote:

> +static struct regulator_consumer_supply __initdata max77686_buck4_consumer[] = {
> +	REGULATOR_SUPPLY("vdd_g3d", NULL),
> +};

Not that it matters much since new board drivers won't get merged but
all your regulator setup here is problematic.  These look like names
from the board schematic as opposed to mappings of the supplies onto the
consumer devices.

> +static struct regulator_init_data __initdata max77686_buck1_data = {
> +	.constraints = {
> +		.name		= "vdd_mif range",

This would normally just be the name of the supply for display purposes.
