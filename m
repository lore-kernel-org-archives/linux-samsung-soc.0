From: Leela Krishna Amudala <leelakrishna.a@gmail.com>
Subject: Re: [RFC/PATCH V2] spi: s3c64xx: Enable Word transfer
Date: Thu, 10 Oct 2013 17:36:26 +0530
Message-ID: <CAL1wa8dRssZ11E62X_Gw3yn_cz=5_urBypYwAJyNc4BU5MnhEw@mail.gmail.com>
References: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:46098 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab3JJMGs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 08:06:48 -0400
In-Reply-To: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-spi@vger.kernel.org, Simon Glass <sjg@chromium.org>, alim.akhtar@samsung.com, dianders@google.com, Tomasz Figa <t.figa@samsung.com>, broonie@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

Hi Rajeshwari,

On Thu, Oct 10, 2013 at 4:11 PM, Rajeshwari S Shinde
<rajeshwari.s@samsung.com> wrote:
> This patch enables word transfer for s3c64xx spi driver.
> User can set bits_per_word to 32 before calling spi_setup,
> which would enable the word transfer mode.
>
> Signed-off-by: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
> ---
> Chnages in V2:
>         - Reduced the call for s3c64xx_spi_config
>  drivers/spi/spi-s3c64xx.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 512b889..d1b0a2b 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -498,6 +498,17 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
>         chcfg = readl(regs + S3C64XX_SPI_CH_CFG);
>         chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
>
> +       if(sdd->cur_bpw == 32) {
> +               /* For word transfer we need to swap bytes */
> +               u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
> +                               S3C64XX_SPI_SWAP_TX_HALF_WORD |
> +                               S3C64XX_SPI_SWAP_RX_EN |
> +                               S3C64XX_SPI_SWAP_RX_BYTE |
> +                               S3C64XX_SPI_SWAP_RX_HALF_WORD);
> +               writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);

In s3c64xx_spi_probe() function
sdd->cur_bpw is hard coded to 8

is there any provision somehow to configure cur_bpw to 32 ?

wouldn't 16 bits per word transfers also need swapping?

Best Wishes,
Leela Krishna.

> +       } else
> +               writel(0, regs + S3C64XX_SPI_SWAP_CFG);
> +
>         if (dma_mode) {
>                 chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
>         } else {
> @@ -905,13 +916,12 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
>                 bpw = xfer->bits_per_word;
>                 speed = xfer->speed_hz ? : spi->max_speed_hz;
>
> -               if (xfer->len % (bpw / 8)) {
> -                       dev_err(&spi->dev,
> -                               "Xfer length(%u) not a multiple of word size(%u)\n",
> -                               xfer->len, bpw / 8);
> -                       status = -EIO;
> -                       goto out;
> -               }
> +               /*
> +                * Enable byte tranfer if transfer length not a multiple of
> +                * word size
> +                */
> +               if (xfer->len % (bpw / 8))
> +                       bpw = 8;
>
>                 if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
>                         sdd->cur_bpw = bpw;
> --
> 1.7.12.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
