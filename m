From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 16:10:12 +0530
Message-ID: <CANAwSgR=GaE6UaC5PE1aHoVTJ-QKE6Euc-YO9+t7BKb963sUXQ@mail.gmail.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
 <29c0eb80-f880-ce45-8dfd-0e148b278a1b@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:34081 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdGUKkd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 06:40:33 -0400
In-Reply-To: <29c0eb80-f880-ce45-8dfd-0e148b278a1b@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Felipe Balbi <balbi@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, jochen@sprickerhof.de

Hi Markus Reichl/ Felipe/ Krzysztof / Jochen,

On 21 July 2017 at 14:56, Markus Reichl <m.reichl@fivetechno.de> wrote:
> Hi Anand,
>
> the issue below is fixed with
> 4.13.0-rc1-next-20170721.
>
> Gru=C3=9F,
> --
> Markus Reichl
>
> Am 19.07.2017 um 16:58 schrieb Anand Moon:
>> Hi Krzysztof,
>>
>> Today I tried to compile the latest kernel for Odroid xu4.
>> using exynos_defconfig I build and loaded the kernel.
>> but to my surprise usb 3.0 device and missing.
>>
>> odroid login: root
>> Password:
>> Last login: Wed Jul 19 14:01:44 UTC 2017 on ttySAC2
>> Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.13.0-rc1-xu4ml-27846-g74cbd96=
 armv7l)
>>
>>  * Documentation:  https://help.ubuntu.com
>>  * Management:     https://landscape.canonical.com
>>  * Support:        https://ubuntu.com/advantage
>> root@odroid:~# lsusb
>> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 002 Device 002: ID 0603:0002 Novatek Microelectronics Corp.
>> Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> root@odroid:~# lsusb -t
>> /:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
>>     |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dus=
bhid, 1.5M
>>     |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device, Driver=3Dus=
bhid, 1.5M
>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 480=
M
>>
>> Full dmesg can be found on blow link.
>> https://pastebin.com/K3xfPCPe
>>
>> The reason for failed is below.
>>
>> [    7.187096] usb usb4-port1: connect-debounce failed
>>
>> I tried to debug this but failed to find the root cause.
>> Nothing is connected to the UBS 3.0 port for the failure to cause.
>>
>> If I load old kernel it seen to work correctly.
>> If you provoid some input I will give this a try.
>>

Thanks for your tips and input.

I was going to 'git bisect' over this weekend.
But I will now check the 4.13.0-rc1-next-20170721
and let you all know if this resolves the issue.

Best Regards
-Anand
