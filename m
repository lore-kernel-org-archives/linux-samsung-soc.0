From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC/PATCH V2] spi: s3c64xx: Enable Word transfer
Date: Thu, 10 Oct 2013 17:12:05 +0530
Message-ID: <CAK9yfHxt4JmBJ8A85Fz-sVv2Xv7+_1ixrFxEtO_3ezS5QS3FjQ@mail.gmail.com>
References: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:65273 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752443Ab3JJLmG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 07:42:06 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz1so2566948pad.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2013 04:42:05 -0700 (PDT)
In-Reply-To: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-spi@vger.kernel.org, sjg@chromium.org, Alim Akhtar <alim.akhtar@samsung.com>, Douglas Anderson <dianders@google.com>, Tomasz Figa <t.figa@samsung.com>, Mark Brown <broonie@linaro.org>

On 10 October 2013 16:11, Rajeshwari S Shinde <rajeshwari.s@samsung.com> wrote:
> +       if(sdd->cur_bpw == 32) {
> +               /* For word transfer we need to swap bytes */
> +               u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
> +                               S3C64XX_SPI_SWAP_TX_HALF_WORD |
> +                               S3C64XX_SPI_SWAP_RX_EN |
> +                               S3C64XX_SPI_SWAP_RX_BYTE |
> +                               S3C64XX_SPI_SWAP_RX_HALF_WORD);
> +               writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);
> +       } else
> +               writel(0, regs + S3C64XX_SPI_SWAP_CFG);

coding style: braces needed around else as 'if' block has it. I had
pointed this out on v1 of this patch too.

[snip]

> +               /*
> +                * Enable byte tranfer if transfer length not a multiple of

typo: s/tranfer/transfer

-- 
With warm regards,
Sachin
