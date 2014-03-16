From: armdev <armdev.ftm@gmail.com>
Subject: Re: [U-Boot] Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 16:12:11 +0530
Message-ID: <5FD74073-34A9-4F1B-A272-2F79E93A2307@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com> <CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com> <0C143329-AC45-423D-99E8-AB0E6D99AEA6@gmail.com> <CAOf5uwm49dbZJ42AVvm7K0F5+-aMvEBnFQxPh4+cB+FuS9Pjbw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34635 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbaCPKmP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 06:42:15 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so4475696pab.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 03:42:15 -0700 (PDT)
In-Reply-To: <CAOf5uwm49dbZJ42AVvm7K0F5+-aMvEBnFQxPh4+cB+FuS9Pjbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Dear Michael,
Thanks for taking out time to extend help.

As per the RefManual the UART is taking the SCLK_UART Clock and as ther=
e are 4 channels (4 UARTS).

=46ollowing is from the public exynos 5250 manual (http://www.samsung.c=
om/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul=
_Public_REV100-0.pdf)

"Four independent channels with asynchronous and serial input/output po=
rts for general purpose (Channel 0 to 3), and One channel in ISP (ISP-U=
ART Channel 0)
 =85
	=95 Each UART contains a Baud-rate generator, a Transmitter, a Receive=
r and a Control Unit. The Baud-rate generator uses SCLK_UART."

-Regards
Armdev Team

On 16-Mar-2014, at 3:55 pm, Michael Trimarchi <michael@amarulasolutions=
=2Ecom> wrote:

> Hi
>=20
> On Sun, Mar 16, 2014 at 11:07 AM, armdev <armdev.ftm@gmail.com> wrote=
:
>> Dear Michael,
>> Yep didn't got any prints. So tried a hack.
>> a) Booted using uart 2
>> b) set the GPACON
>> c) Copied the config from 0x12c20000 to 0x12c30000
>> d)tried to write a char 0x41 (A) on 0x12c20020 0x12c30020, I got out=
put on UART2 but not on UART3.
>>=20
>> We would like to use both uarts.
>> Have you used UART3, did the boot to UART3 worked for you ? So you s=
ee any problem with any of our steps listed in this / pref mail.
>>=20
>=20
> Are you sure that you don't need to clock uart logic? I don't have
> such board I'm trying just to help you
>=20
> Michael
>=20
>> Thanks
>> armdev team
>>=20
>> On 16-Mar-2014, at 2:56 pm, Michael Trimarchi <michael@amarulasoluti=
ons.com> wrote:
>>=20
>>> Hi
>>>=20
>>> On Fri, Mar 14, 2014 at 9:04 AM, armdev <armdev.ftm@gmail.com> wrot=
e:
>>>> Hi,
>>>>=20
>>>> We are trying to enable the UART3 on COM18 pins of arndale board. =
The UART3 RXD and TXD are on pins 2 and 4 which as per the base board s=
pecification is connected as
>>>>=20
>>>> XuRXD3 : UART_3_RXD/GPA1[4] : 2
>>>> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>>>>=20
>>>> As per the public reference manual of exynos 5250, there is a regi=
ster GPACON (0x1140_0000)
>>>> Setting GPACON |=3D 0x0010_0000 should enable the pins, but I am n=
ot able to see any output on UART3.
>>>>=20
>>>> Can you please suggest what is the right procedure
>>>>=20
>>>=20
>>> Did you change the board console output ;)?
>>>=20
>>> Michael
>>>=20
>>>> -Regards
>>>> armdev team @FTM
>>>> _______________________________________________
>>>> U-Boot mailing list
>>>> U-Boot@lists.denx.de
>>>> http://lists.denx.de/mailman/listinfo/u-boot
>>>=20
>>>=20
>>>=20
>>> --
>>> | Michael Nazzareno Trimarchi                     Amarula Solutions=
 BV |
>>> | COO  -  Founder                                      Cruquiuskade=
 47 |
>>> | +31(0)851119172                                 Amsterdam 1018 AM=
 NL |
>>> |                  [`as] http://www.amarulasolutions.com           =
    |
>>=20
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
