From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [U-Boot] Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 13:40:26 +0100
Message-ID: <53259BBA.8000100@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com> <CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com> <0C143329-AC45-423D-99E8-AB0E6D99AEA6@gmail.com> <CAOf5uwm49dbZJ42AVvm7K0F5+-aMvEBnFQxPh4+cB+FuS9Pjbw@mail.gmail.com> <5FD74073-34A9-4F1B-A272-2F79E93A2307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:61346 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbaCPMk1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 08:40:27 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so3149685eek.27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 05:40:26 -0700 (PDT)
In-Reply-To: <5FD74073-34A9-4F1B-A272-2F79E93A2307@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

On 16.03.2014 11:42, armdev wrote:
> Dear Michael,
> Thanks for taking out time to extend help.
>
> As per the RefManual the UART is taking the SCLK_UART Clock and as th=
ere are 4 channels (4 UARTS).
>
> Following is from the public exynos 5250 manual (http://www.samsung.c=
om/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul=
_Public_REV100-0.pdf)
>
> "Four independent channels with asynchronous and serial input/output =
ports for general purpose (Channel 0 to 3), and One channel in ISP (ISP=
-UART Channel 0)
>   =85
> 	=95 Each UART contains a Baud-rate generator, a Transmitter, a Recei=
ver and a Control Unit. The Baud-rate generator uses SCLK_UART."

Each UART block uses independent clock source, i.e. UART0 uses=20
SCLK_UART0 and UART3 uses SCLK_UART3.

Do you have MUX_UART3 and DIV_UART3 configured properly? Do you have th=
e=20
IP bus clock (CLK_UART3) ungated?

The public manual contains full description of clock tree and clock=20
controller registers, so you should be able to figure this out.

Best regards,
Tomasz
