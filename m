From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] ARM: S5PC110: add support for MMC regulators on
 Goni board
Date: Fri, 10 Sep 2010 10:58:28 +0100
Message-ID: <20100910095828.GE3068@rakim.wolfsonmicro.main>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
 <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
 <000501cb50ce$5c606f60$15214e20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47185 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751686Ab0IJJ6a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 05:58:30 -0400
Content-Disposition: inline
In-Reply-To: <000501cb50ce$5c606f60$15214e20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org

On Fri, Sep 10, 2010 at 06:55:50PM +0900, Kukjin Kim wrote:
> > +static struct fixed_voltage_config mmc2_fixed_voltage_config = {
> > +	.supply_name		= "T_FLASH_EN",
> > +	.microvolts		= 2800000,
> > +	.gpio			= S5PV210_MP05(4),	/* XM0ADDR_12 */

...

> >  static void goni_setup_sdhci(void)
> >  {
> > -	gpio_request(GONI_EXT_FLASH_EN, "FLASH_EN");
> > -	gpio_direction_output(GONI_EXT_FLASH_EN, 1);
> > -

> Why need above changes in this patch?
> Others, looks ok.

It looks like ownership of this GPIO has been transferred to the fixed
voltage regulator added in the patch (though using the #define in the
fixed voltage regulator platform data might be a good idea).
