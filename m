From: Rajeshwari Birje <rajeshwari.birje@gmail.com>
Subject: Re: [RFC/PATCH] spi: s3c64xx: Enable Word transfer
Date: Mon, 30 Sep 2013 13:32:43 +0530
Message-ID: <CAPs=JDe1zwqpcTVaq2ZrQCAOAstQBy-4XnjnghGhqTz=9Zfwdg@mail.gmail.com>
References: <1380031235-4065-1-git-send-email-rajeshwari.s@samsung.com>
	<1555800.vSI857jMHi@amdc1227>
	<CAPs=JDe6XoyqM=iJWgAZF+tU0p_4K=9K4Kx6ANpCcUV9rBd82Q@mail.gmail.com>
	<CAPs=JDeYaE4RZxCpttgrC+9hWbj6pbaNqx7KGtc9di+6OMNTOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:43555 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562Ab3I3ICp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 04:02:45 -0400
In-Reply-To: <CAPs=JDeYaE4RZxCpttgrC+9hWbj6pbaNqx7KGtc9di+6OMNTOg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@linaro.org>
Cc: Rajeshwari S Shinde <rajeshwari.s@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, dianders@google.com, Tomasz Figa <t.figa@samsung.com>

Hi Mark Brown,

Please do let me know if you have any comments on this patch.

Regards,
Rajeshwari  Shinde.

On Wed, Sep 25, 2013 at 4:59 PM, Rajeshwari Birje
<rajeshwari.birje@gmail.com> wrote:
> Hi Tomasz
>
> Sorry for the previous mail with incomplete comments, sent the same by mistake.
>
>
> On Wed, Sep 25, 2013 at 4:33 PM, Rajeshwari Birje
> <rajeshwari.birje@gmail.com> wrote:
>>
>> Hi Tomasz
>>
>>
>> On Tue, Sep 24, 2013 at 8:29 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>>>
>>> Hi Rajeshwari,
>>>
>>> [Ccing Mark Brown]
>>>
>>> On Tuesday 24 of September 2013 19:30:35 Rajeshwari S Shinde wrote:
>>> > This patch enables word transfer for s3c64xx spi driver.
>>> > User can set bits_per_word to 32 before calling spi_setup,
>>> > which would enable the word transfer mode.
>>> >
>>> > Signed-off-by: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
>>> > ---
>>> >  drivers/spi/spi-s3c64xx.c | 28 ++++++++++++++++++----------
>>> >  1 file changed, 18 insertions(+), 10 deletions(-)
>>> >
>>> > diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>>> > index 512b889..893361b 100644
>>> > --- a/drivers/spi/spi-s3c64xx.c
>>> > +++ b/drivers/spi/spi-s3c64xx.c
>>> > @@ -498,6 +498,17 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
>>> >       chcfg = readl(regs + S3C64XX_SPI_CH_CFG);
>>> >       chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
>>> >
>>> > +     if(sdd->cur_bpw == 32) {
>>> > +             /* For word transfer we need to swap bytes */
>>> > +             u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
>>> > +                             S3C64XX_SPI_SWAP_TX_HALF_WORD |
>>> > +                             S3C64XX_SPI_SWAP_RX_EN |
>>> > +                             S3C64XX_SPI_SWAP_RX_BYTE |
>>> > +                             S3C64XX_SPI_SWAP_RX_HALF_WORD);
>>> > +             writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);
>>>
>>> Wasn't this driver already supposed to support 16 and 32 bits per word
>>> transfers? I fail to see any mention in the documentation about the need
>>> to enable these swaps in these cases.
>
> I get errors when I try 32 bits per word transfers.
> There is no clear documentation for this swap config register but without this
> word transfer is not working fine.
>>
>>
>>>
>>> In this case, wouldn't 16 bits per word transfers also need swapping?
>
> Yes it would need, have not tested for half word transfer.
>>>
>>>
>>> > +     } else
>>> > +             writel(0, regs + S3C64XX_SPI_SWAP_CFG);
>>>
>>> nit: Coding style. If you use braces for one branch, then you should use
>>> them for the other one as well.
>>
>  will correct this.
>>>
>>>
>>> > +
>>> >       if (dma_mode) {
>>> >               chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
>>> >       } else {
>>> > @@ -905,19 +916,16 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
>>> >               bpw = xfer->bits_per_word;
>>> >               speed = xfer->speed_hz ? : spi->max_speed_hz;
>>> >
>>> > -             if (xfer->len % (bpw / 8)) {
>>> > -                     dev_err(&spi->dev,
>>> > -                             "Xfer length(%u) not a multiple of word size(%u)\n",
>>> > -                             xfer->len, bpw / 8);
>>> > -                     status = -EIO;
>>> > -                     goto out;
>>>
>>> Why is this check removed in this patch?
>
> I get "Xfer length(%u) not a multiple of word size(%u)\n" error for
> word transfer
> ex: when if bpw is 32 and len 74 the above condition fails
>>
>>
>>>
>>> > +             if (speed != sdd->cur_speed) {
>>> > +                     sdd->cur_speed = speed;
>>>
>>> This change does not seem to be related to $subject.
>
> have split the if condition to accommodate the above error condition.
>>>
>>>
>>> >               }
>>> >
>>> > -             if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
>>> > +             if (xfer->len % (bpw / 8))
>>> > +                     sdd->cur_bpw = 8;
>>> > +             else
>>> >                       sdd->cur_bpw = bpw;
>>> > -                     sdd->cur_speed = speed;
>>> > -                     s3c64xx_spi_config(sdd);
>>> > -             }
>>> > +
>>> > +             s3c64xx_spi_config(sdd);
>>>
>>> Why s3c64xx_spi_config() can't be called only if one of the parameters
>>> changed, as it was before this patch?
>
> Will correct this.
>>>
>>>
>>> Best regards,
>>> Tomasz
>>>
>>> P.S. Please remember to always add respective maintainers on Cc. You can
>>> use scripts/get_maintainer.pl script to quickly get a list of people
>>> potentially interested in a patch.
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> Regards,
> Rajeshwari Shinde



-- 
Regards,
Rajeshwari Shinde
