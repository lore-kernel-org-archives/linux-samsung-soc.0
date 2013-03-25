From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 7/7] irqchip: s3c24xx: add devicetree support
Date: Mon, 25 Mar 2013 22:00:46 +0000
Message-ID: <201303252200.46258.arnd@arndb.de>
References: <201303252226.21402.heiko@sntech.de> <201303252234.21314.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:59106 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758663Ab3CYWBH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 18:01:07 -0400
In-Reply-To: <201303252234.21314.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 25 March 2013, Heiko St=FCbner wrote:
> Add the necessary code to initialize the interrupt controller
> thru devicetree data using the irqchip infrastructure.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

The binding looks fine now. I have a few detail comments but am happy
with the series otherwise.

> +Required properties:
> +- compatible: Compatible property value should be "samsung,s3c24xx-i=
rq"
> +  for non s3c2416 machines and "samsung,s3c2416-irq" for s3c2416 mac=
hines

We try to avoid wildcards in the "compatible" properties. Better use
the name of the first SoC that had this controller, and let the other
ones mark themselves as compatible with that one.

I guess "samsung,s3c2410-irq" would be the right identifier here.

> +- #interrupt-cells : Specifies the number of cells needed to encode =
an
> +  interrupt source. The value shall be 4 and interrupt descriptor sh=
all
> +  have the following format:
> +      <ctrl_num ctrl_irq parent_irq type>
> +
> +  ctrl_num contains the controller to use:
> +      - 0 ... main controller
> +      - 1 ... sub controller
> +      - 2 ... second main controller on s3c2416 and s3c2450
> +  ctrl_irq contains the interrupt bit of the controller
> +  parent_irq contains the parent bit in the main controller and will=
 be
> +             ignored in main controllers

I expected the second and third cell to be in the opposite order, so
the meaning of the second cell is always the same.

> +	/* we're using individual domains for the non-dt case
> +	 * and one big domain for the dt case where the subintc
> +	 * starts at hwirq number 32.
> +	 */
> +	offset =3D (intc->domain->of_node) ? 32 : 0;

Wouldn't it be easier to always use the same setup for the domains here=
?

	Arnd
