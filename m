From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [U-Boot] Enabling uart 3 in arndale
Date: Sun, 16 Mar 2014 11:25:48 +0100
Message-ID: <CAOf5uwm49dbZJ42AVvm7K0F5+-aMvEBnFQxPh4+cB+FuS9Pjbw@mail.gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
	<CAOf5uwn3B7H1gnGpJ=iG0T18sEPLDCsYpiAYr1NASJs0CTsTwg@mail.gmail.com>
	<0C143329-AC45-423D-99E8-AB0E6D99AEA6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:41123 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274AbaCPKZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 06:25:49 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so197108wib.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 03:25:48 -0700 (PDT)
In-Reply-To: <0C143329-AC45-423D-99E8-AB0E6D99AEA6@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: armdev <armdev.ftm@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi

On Sun, Mar 16, 2014 at 11:07 AM, armdev <armdev.ftm@gmail.com> wrote:
> Dear Michael,
> Yep didn't got any prints. So tried a hack.
> a) Booted using uart 2
> b) set the GPACON
> c) Copied the config from 0x12c20000 to 0x12c30000
> d)tried to write a char 0x41 (A) on 0x12c20020 0x12c30020, I got output on UART2 but not on UART3.
>
> We would like to use both uarts.
> Have you used UART3, did the boot to UART3 worked for you ? So you see any problem with any of our steps listed in this / pref mail.
>

Are you sure that you don't need to clock uart logic? I don't have
such board I'm trying just to help you

Michael

> Thanks
> armdev team
>
> On 16-Mar-2014, at 2:56 pm, Michael Trimarchi <michael@amarulasolutions.com> wrote:
>
>> Hi
>>
>> On Fri, Mar 14, 2014 at 9:04 AM, armdev <armdev.ftm@gmail.com> wrote:
>>> Hi,
>>>
>>> We are trying to enable the UART3 on COM18 pins of arndale board. The UART3 RXD and TXD are on pins 2 and 4 which as per the base board specification is connected as
>>>
>>> XuRXD3 : UART_3_RXD/GPA1[4] : 2
>>> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>>>
>>> As per the public reference manual of exynos 5250, there is a register GPACON (0x1140_0000)
>>> Setting GPACON |= 0x0010_0000 should enable the pins, but I am not able to see any output on UART3.
>>>
>>> Can you please suggest what is the right procedure
>>>
>>
>> Did you change the board console output ;)?
>>
>> Michael
>>
>>> -Regards
>>> armdev team @FTM
>>> _______________________________________________
>>> U-Boot mailing list
>>> U-Boot@lists.denx.de
>>> http://lists.denx.de/mailman/listinfo/u-boot
>>
>>
>>
>> --
>> | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
>> | COO  -  Founder                                      Cruquiuskade 47 |
>> | +31(0)851119172                                 Amsterdam 1018 AM NL |
>> |                  [`as] http://www.amarulasolutions.com               |
>



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
