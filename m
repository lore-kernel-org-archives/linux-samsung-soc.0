From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: s3c64xx: Correct spi bus clock hookups
Date: Wed, 16 Oct 2013 11:10:59 +0200
Message-ID: <1625192.kcLGqB93c8@amdc1227>
References: <1381839982-3026-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1785136.Xbc2LARBDy@flatron>
 <20131016081035.GD20219@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49677 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760044Ab3JPJLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 05:11:03 -0400
In-reply-to: <20131016081035.GD20219@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org

On Wednesday 16 of October 2013 09:10:35 Charles Keepax wrote:
> + samsung soc mailing list
> 
> On Wed, Oct 16, 2013 at 12:52:42AM +0200, Tomasz Figa wrote:
> > Hi Charles,
> > 
> > On Tuesday 15 of October 2013 13:26:22 Charles Keepax wrote:
> > >  	ALIAS(SCLK_MMC1, "s3c-sdhci.1", "mmc_busclk.2"),
> > >  	ALIAS(SCLK_MMC0, "s3c-sdhci.0", "mmc_busclk.2"),
> > > -	ALIAS(SCLK_SPI1, "s3c6410-spi.1", "spi-bus"),
> > > -	ALIAS(SCLK_SPI0, "s3c6410-spi.0", "spi-bus"),
> > > +	ALIAS(PCLK_SPI1, "s3c6410-spi.1", "spi_busclk0"),
> > > +	ALIAS(SCLK_SPI1, "s3c6410-spi.1", "spi_busclk1"),
> > > +	ALIAS(SCLK_SPI1_48, "s3c6410-spi.1", "spi_busclk2"),
> > 
> > ...according to the documentation, the order is different. The SPI_CLKSEL 
> > field of CLK_CFG register of the SPI block can have following values:
> > 0 - PCLK (aka PCLK_SPIx)
> > 1 - USBCLK (aka SCLK_SPIx_48)
> > 2 - Epll clock (aka SCLK_SPIx)
> > 
> > The index after spi_busclk corresponds to the value written to SPI_CLKSEL 
> > field, so your patch should be adjusted accordingly.
> 
> Hmm... will probably need to test this to see what happens the
> old clock setup was this:
> 
> 	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
> 	CLKDEV_INIT("s3c6410-spi.0", "spi_busclk1", &clk_sclk_spi0.clk),
> 	CLKDEV_INIT("s3c6410-spi.0", "spi_busclk2", &clk_48m_spi0),
> 	CLKDEV_INIT("s3c6410-spi.1", "spi_busclk1", &clk_sclk_spi1.clk),
> 	CLKDEV_INIT("s3c6410-spi.1", "spi_busclk2", &clk_48m_spi1),
> 
> Which appears to differ from the documentation, that said though
> I would wager that only the first of those has really had much
> testing.

I believe in 90% cases the driver simply used first available clock,
which would be the PCLK, so I wouldn't be really surprised if operation
on other clock sources weren't even tested.

If you have hardware to test this, especially with possibility of checking
the SPI frequency I would really appreciate this, as I unfortunately don't
have such.

Best regards,
Tomasz
