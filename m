From: Rajeshwari Birje <rajeshwari.birje@gmail.com>
Subject: Re: [RFC/PATCH V2] spi: s3c64xx: Enable Word transfer
Date: Fri, 11 Oct 2013 10:12:00 +0530
Message-ID: <CAPs=JDcMmCzRw04n2Ho=PH+CGnF860V3fEMQKmeAnmFo8b7+nA@mail.gmail.com>
References: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
	<CAK9yfHxt4JmBJ8A85Fz-sVv2Xv7+_1ixrFxEtO_3ezS5QS3FjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:45471 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753008Ab3JKEmB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 00:42:01 -0400
In-Reply-To: <CAK9yfHxt4JmBJ8A85Fz-sVv2Xv7+_1ixrFxEtO_3ezS5QS3FjQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Rajeshwari S Shinde <rajeshwari.s@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-spi@vger.kernel.org, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Douglas Anderson <dianders@google.com>, Tomasz Figa <t.figa@samsung.com>, Mark Brown <broonie@linaro.org>

Hi Sachin,

On Thu, Oct 10, 2013 at 5:12 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 10 October 2013 16:11, Rajeshwari S Shinde <rajeshwari.s@samsung.com> wrote:
>> +       if(sdd->cur_bpw == 32) {
>> +               /* For word transfer we need to swap bytes */
>> +               u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
>> +                               S3C64XX_SPI_SWAP_TX_HALF_WORD |
>> +                               S3C64XX_SPI_SWAP_RX_EN |
>> +                               S3C64XX_SPI_SWAP_RX_BYTE |
>> +                               S3C64XX_SPI_SWAP_RX_HALF_WORD);
>> +               writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);
>> +       } else
>> +               writel(0, regs + S3C64XX_SPI_SWAP_CFG);
>
> coding style: braces needed around else as 'if' block has it. I had
> pointed this out on v1 of this patch too.
Yes my mistake, missed correcting them, will correct in next version.
>
> [snip]
>
>> +               /*
>> +                * Enable byte tranfer if transfer length not a multiple of
>
> typo: s/tranfer/transfer
will correct this.
-- 
Regards,
Rajeshwari Shinde
>
> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
