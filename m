From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC/PATCH] spi: s3c64xx: Enable Word transfer
Date: Tue, 24 Sep 2013 20:29:04 +0530
Message-ID: <CAK9yfHyv4QHYPXpkPz5ikfRz_OOUry56jDsJppzUvSJVWaQ5qg@mail.gmail.com>
References: <1380031235-4065-1-git-send-email-rajeshwari.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:42602 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754000Ab3IXO7F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 10:59:05 -0400
Received: by mail-oa0-f50.google.com with SMTP id j1so2296856oag.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Sep 2013 07:59:05 -0700 (PDT)
In-Reply-To: <1380031235-4065-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-spi@vger.kernel.org, sjg@chromium.org, Alim Akhtar <alim.akhtar@samsung.com>, Douglas Anderson <dianders@google.com>, Mark Brown <broonie@kernel.org>

+cc: Mark

On 24 September 2013 19:30, Rajeshwari S Shinde
<rajeshwari.s@samsung.com> wrote:
> This patch enables word transfer for s3c64xx spi driver.
> User can set bits_per_word to 32 before calling spi_setup,
> which would enable the word transfer mode.
>
> +       if(sdd->cur_bpw == 32) {

Space needed after if, else checkpatch will complain.

> +               /* For word transfer we need to swap bytes */
> +               u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
> +                               S3C64XX_SPI_SWAP_TX_HALF_WORD |
> +                               S3C64XX_SPI_SWAP_RX_EN |
> +                               S3C64XX_SPI_SWAP_RX_BYTE |
> +                               S3C64XX_SPI_SWAP_RX_HALF_WORD);
> +               writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);
> +       } else
> +               writel(0, regs + S3C64XX_SPI_SWAP_CFG);

Braces necessary around else as the if block has it.

> +               if (speed != sdd->cur_speed) {
> +                       sdd->cur_speed = speed;
>                 }

Braces are not necessary here.

-- 
With warm regards,
Sachin
