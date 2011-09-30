From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Fri, 30 Sep 2011 12:03:07 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC5675B@AUSP01VMBX24.collaborationhost.net>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com>
 <1317381097-2691-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail127.messagelabs.com ([216.82.250.115]:19805 "EHLO
	mail127.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753786Ab1I3RDP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 13:03:15 -0400
In-Reply-To: <1317381097-2691-2-git-send-email-padma.v@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "padma.kvr@gmail.com" <padma.kvr@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-sams>
Cc: "khilman@ti.com" <khilman@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "rmallon@gmail.com" <rmallon@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "amit.kucheria@canonical.com" <amit.kucheria@canonical.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "hjk@hansjkoch.de" <hjk@hansjkoch.de>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>

On Friday, September 30, 2011 4:12 AM, Padmavathi Venna wrote:
>
> Added a standardized macro CLKDEV_INIT which can used across all
> the platforms to support clkdev
>
> Suggested by: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>

> ---
>  include/linux/clkdev.h |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
> index 457bcb0..f2db158 100644
> --- a/include/linux/clkdev.h
> +++ b/include/linux/clkdev.h
> @@ -14,6 +14,13 @@
>  
>  #include <asm/clkdev.h>
>  
> +#define CLKDEV_INIT(d, n, c) \
> +	{ \
> +		.dev_id = d, \
> +		.con_id = n, \
> +		.clk = &c, \
> +	},
> +
>  struct clk;
>  struct device;
