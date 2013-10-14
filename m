From: ysh <youshenghui0322@163.com>
Subject: Re:Re: Re:Ask for help on SPI slave side driver support
Date: Mon, 14 Oct 2013 15:27:20 +0800
Message-ID: <525B9CD8.1030508@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m12-13.163.com ([220.181.12.13]:35975 "EHLO m12-13.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751452Ab3JNH0z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Oct 2013 03:26:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Ok, I have one question when reading drivers/spi/spi-s3c64xx.c
In s3c64xx_spi_setup, cs->line(S3C64XX_GPC(3)) is set to
GPIOF_OUT_INIT_HIGH, that means an general output pin.
But the other three(clk, mosi, miso) was set to 2 by
s3c64xx_spi0_cfg_gpio. This is just what is needed by SPI.
My question is why wasn't cs->line also set to 2 to use SPI CS0?
When I want to use spi as slave side, should I set S3C64XX_GPC(3)'s cfg
of  to 0(input) or 2?
In enable_cs, cs->line and SLAVE_SEL register were both actived, but
which one really take effect?
static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
                                                struct spi_device *spi)
{
        struct s3c64xx_spi_csinfo *cs;
        if (sdd->tgl_spi != NULL) { /* If last device toggled after mssg */
                if (sdd->tgl_spi != spi) { /* if last mssg on diff device */
                        /* Deselect the last toggled device */
                        cs = sdd->tgl_spi->controller_data;
                        if (sdd->cs_gpio)
                                gpio_set_value(cs->line,
                                        spi->mode & SPI_CS_HIGH ? 0 : 1);
                }
                sdd->tgl_spi = NULL;
        }
        cs = spi->controller_data;
        if (sdd->cs_gpio)
                gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
        /* Start the signals */
        writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
}


thanks
ysh
