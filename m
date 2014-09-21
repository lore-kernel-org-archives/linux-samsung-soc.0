From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] tty/serial: samsung: Add earlycon support
Date: Mon, 22 Sep 2014 01:19:46 +0200
Message-ID: <541F5D12.6080605@gmail.com>
References: <1410867163-27962-1-git-send-email-alim.akhtar@samsung.com> <541D83AE.1050006@gmail.com> <CAGOxZ52HY0eEukbWdt0OnUzcfrLi3Y726om+GQAQ_Q0vmwk-=Q@mail.gmail.com> <541F09B4.6050907@gmail.com> <CAGOxZ504AXRJ4gYdD1NdvomLeBX4oeLT+XDeDxrS6swYCm4rog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:38683 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbaIUXTu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Sep 2014 19:19:50 -0400
In-Reply-To: <CAGOxZ504AXRJ4gYdD1NdvomLeBX4oeLT+XDeDxrS6swYCm4rog@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 22.09.2014 01:10, Alim Akhtar wrote:

[snip]

>>> As you said there is no support for ioremap on ARM, so this is not
>>> tested on ARM.
>>
>> Don't forget that this driver is primarily targeted for ARM platforms
>> (versus just one ARM64-based Exynos7), so either this feature should be
>> clearly added as ARM64-specific (and compiled in conditionally) or made
>> work for all supported platforms.
>>
> Well, this will work on every platform which uses
> "samsung,exynos4210-uart" as a UART controller.
> Exynos7 also use same, there is nothing special about ARM64 bit here.
> please see[1].
> For "s3c24xx-uart", this has to be implemented separably as that is a
> bit different.

For this feature, they differ only in locations and lengths of
FIFO-related bit fields. We had this already implemented for all
hardware variants and so my recommendation to reuse that code.

>>>>
>>>>>               smh     Use ARM semihosting calls for early console.
>>>>>
>>>>>       earlyprintk=    [X86,SH,BLACKFIN,ARM,M68k]

[snip]

> Tomasz/Marek,
> Do you think something like below make sense here?
> 
> +static void exynos4210_serial_console_putc(struct uart_port *port, int ch)
> +{
> +       while (!(readl(port->membase + S3C2410_UFCON) & S3C2410_UFCON_FIFOMODE))
> +               ;

Waiting in a loop for a software-writable FIFO mode enable bit doesn't
look reasonable to me. Probably a typo?

> +
> +       wr_regb(port, S3C2410_UTXH, ch);
> +
> +       while ((readl(port->membase + S3C2410_UFSTAT) & S5PV210_UFSTAT_TXFULL))
> +               ;

I wonder if you need to wait for the character to be sent. If you ensure
before writing a character that there is no previous one in the buffer
or there is space in FIFO then I believe you should be fine.

> +}
> 
> and call exynos4210_serial_console_putc() in samsung_early_write()?
> Anyway functions names need to be changes accordingly.

Yes, this is exactly what we had implemented in the patch I mentioned,
except that the putc function was generic for all hardware variants.

Best regards,
Tomasz
