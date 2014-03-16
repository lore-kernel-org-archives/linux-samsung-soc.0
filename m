From: armdev <armdev.ftm@gmail.com>
Subject: Re: [U-Boot] Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 15:37:15 +0530
Message-ID: <0C143329-AC45-423D-99E8-AB0E6D99AEA6@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com> <CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:37610 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274AbaCPKHS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 06:07:18 -0400
Received: by mail-pd0-f178.google.com with SMTP id x10so4403674pdj.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 03:07:17 -0700 (PDT)
In-Reply-To: <CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Dear Michael,
Yep didn=92t got any prints. So tried a hack.
a) Booted using uart 2
b) set the GPACON
c) Copied the config from 0x12c20000 to 0x12c30000
d)tried to write a char 0x41 (A) on 0x12c20020 0x12c30020, I got output=
 on UART2 but not on UART3.

We would like to use both uarts.=20
Have you used UART3, did the boot to UART3 worked for you ? So you see =
any problem with any of our steps listed in this / pref mail.

Thanks=20
armdev team

On 16-Mar-2014, at 2:56 pm, Michael Trimarchi <michael@amarulasolutions=
=2Ecom> wrote:

> Hi
>=20
> On Fri, Mar 14, 2014 at 9:04 AM, armdev <armdev.ftm@gmail.com> wrote:
>> Hi,
>>=20
>> We are trying to enable the UART3 on COM18 pins of arndale board. Th=
e UART3 RXD and TXD are on pins 2 and 4 which as per the base board spe=
cification is connected as
>>=20
>> XuRXD3 : UART_3_RXD/GPA1[4] : 2
>> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>>=20
>> As per the public reference manual of exynos 5250, there is a regist=
er GPACON (0x1140_0000)
>> Setting GPACON |=3D 0x0010_0000 should enable the pins, but I am not=
 able to see any output on UART3.
>>=20
>> Can you please suggest what is the right procedure
>>=20
>=20
> Did you change the board console output ;)?
>=20
> Michael
>=20
>> -Regards
>> armdev team @FTM
>> _______________________________________________
>> U-Boot mailing list
>> U-Boot@lists.denx.de
>> http://lists.denx.de/mailman/listinfo/u-boot
>=20
>=20
>=20
> --=20
> | Michael Nazzareno Trimarchi                     Amarula Solutions B=
V |
> | COO  -  Founder                                      Cruquiuskade 4=
7 |
> | +31(0)851119172                                 Amsterdam 1018 AM N=
L |
> |                  [`as] http://www.amarulasolutions.com             =
  |
