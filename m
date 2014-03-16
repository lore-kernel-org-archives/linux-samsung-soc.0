From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [U-Boot] Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 10:26:35 +0100
Message-ID: <CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:46070 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080AbaCPJ0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 05:26:37 -0400
Received: by mail-wi0-f174.google.com with SMTP id d1so1048092wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 02:26:35 -0700 (PDT)
In-Reply-To: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi

On Fri, Mar 14, 2014 at 9:04 AM, armdev <armdev.ftm@gmail.com> wrote:
> Hi,
>
> We are trying to enable the UART3 on COM18 pins of arndale board. The UART3 RXD and TXD are on pins 2 and 4 which as per the base board specification is connected as
>
> XuRXD3 : UART_3_RXD/GPA1[4] : 2
> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>
> As per the public reference manual of exynos 5250, there is a register GPACON (0x1140_0000)
> Setting GPACON |= 0x0010_0000 should enable the pins, but I am not able to see any output on UART3.
>
> Can you please suggest what is the right procedure
>

Did you change the board console output ;)?

Michael

> -Regards
> armdev team @FTM
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> http://lists.denx.de/mailman/listinfo/u-boot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
