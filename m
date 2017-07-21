From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 19:14:09 +0530
Message-ID: <CANAwSgTVZJ9L8VMjCgx7+LVO7wircrzvTHHqaVbCA7M1fH+7bw@mail.gmail.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
 <29c0eb80-f880-ce45-8dfd-0e148b278a1b@fivetechno.de> <CANAwSgR=GaE6UaC5PE1aHoVTJ-QKE6Euc-YO9+t7BKb963sUXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANAwSgR=GaE6UaC5PE1aHoVTJ-QKE6Euc-YO9+t7BKb963sUXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On 21 July 2017 at 16:10, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Markus Reichl/ Felipe/ Krzysztof / Jochen,
>
> On 21 July 2017 at 14:56, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org> wrote:
>> Hi Anand,
>>
>> the issue below is fixed with
>> 4.13.0-rc1-next-20170721.
>>
>> Gru=C3=9F,
>> --
>> Markus Reichl
>>
>> Am 19.07.2017 um 16:58 schrieb Anand Moon:
>>> Hi Krzysztof,
>>>
>>> Today I tried to compile the latest kernel for Odroid xu4.
>>> using exynos_defconfig I build and loaded the kernel.
>>> but to my surprise usb 3.0 device and missing.
>>>
>>> odroid login: root
>>> Password:
>>> Last login: Wed Jul 19 14:01:44 UTC 2017 on ttySAC2
>>> Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.13.0-rc1-xu4ml-27846-g74cbd9=
6 armv7l)
>>>
>>>  * Documentation:  https://help.ubuntu.com
>>>  * Management:     https://landscape.canonical.com
>>>  * Support:        https://ubuntu.com/advantage
>>> root@odroid:~# lsusb
>>> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>> Bus 002 Device 002: ID 0603:0002 Novatek Microelectronics Corp.
>>> Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>> root@odroid:~# lsusb -t
>>> /:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>>> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>>> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>>> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12=
M
>>>     |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 1.5M
>>>     |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 1.5M
>>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 48=
0M
>>>
>>> Full dmesg can be found on blow link.
>>> https://pastebin.com/K3xfPCPe
>>>
>>> The reason for failed is below.
>>>
>>> [    7.187096] usb usb4-port1: connect-debounce failed
>>>
>>> I tried to debug this but failed to find the root cause.
>>> Nothing is connected to the UBS 3.0 port for the failure to cause.
>>>
>>> If I load old kernel it seen to work correctly.
>>> If you provoid some input I will give this a try.
>>>
>
> Thanks for your tips and input.
>
> I was going to 'git bisect' over this weekend.
> But I will now check the 4.13.0-rc1-next-20170721
> and let you all know if this resolves the issue.
>

Just build and tested the 4.13.0-rc1-next-20170721.
so kernel is good enough to enumerate the usbdrd_dwc3_1 (usb port 6,5)
but this failed to enumerate the usbdrd_dwc3_10 (usb port 4,3).

root@odroidxu4q:~# lsusb -t
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dr8152,=
 480M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 480M

Best Regards
-Anand
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
