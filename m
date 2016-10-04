From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
Date: Tue, 4 Oct 2016 11:32:22 +0530
Message-ID: <CAFp+6iGrS0DTP=KUKDvk3NwWB32+1uj-irKT6fn5XTcfk572Hg@mail.gmail.com>
References: <1472414695.3845.3.camel@mniewoehner.de> <87lgzgdof3.fsf@linux.intel.com>
 <57C41582.1030604@linux.intel.com> <1472468730.4925.3.camel@mniewoehner.de> <CANAwSgQMsK8YPxR==UXtR49kiJzYhkzvSCNwn8mDJfj-3wpa2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40171 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbcJDGC0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 02:02:26 -0400
In-Reply-To: <CANAwSgQMsK8YPxR==UXtR49kiJzYhkzvSCNwn8mDJfj-3wpa2w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Michael_Niew=C3=B6hner?= <linux@mniewoehner.de>, Anand Moon <linux.amoon@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Hi Michael,


On Tue, Aug 30, 2016 at 10:32 AM, Anand Moon <linux.amoon@gmail.com> wrote:
> Hi All
>
> Adding Vivek Gautam.

Sorry for missing out this conversation. I am no longer part of Samsung.

>
> On 29 August 2016 at 16:35, Michael Niew=C3=B6hner <linux@mniewoehner.de>=
 wrote:
>> Hi Mathias,
>> On Mo, 2016-08-29 at 13:59 +0300, Mathias Nyman wrote:
>>> On 29.08.2016 10:28, Felipe Balbi wrote:
>>> >
>>> >
>>> > Hi,
>>> >
>>> > Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
>>> > >
>>> > > [1.] One line summary of the problem:
>>> > > DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
>>> > >
>>> > > [2.] Full description of the problem/report:
>>> > > No usb 3.0 devices are being detected when attached while USB 2.0
>>> > > devices work on the same port.
>>> > > USB 3.0 works after applying patches [9.1] and [9.2], but seems
>>> > > to be
>>> > > buggy. The usb hub is redetected every time an usb device is
>>> > > attached.

[snip]

>>> >
>>> > >
>>> > > [9.] Other notes, patches, fixes, workarounds:
>>> > > [9.1] https://lkml.org/lkml/2014/4/28/234
>>> > > [9.2] https://lkml.org/lkml/2015/2/2/259

These patches are required to get USB super-speed working on Exynos5420/580=
0.
But they did not make to upstream. There was resistance on adding new
phy_calibrate()
callback.

Without these patches the Exynos5420/5800 will enumerate all
super-speed capable devices
as high-speed devices.
Last time we checked with exynos542x smdk boards and peach-* boards,
we could get the
Super - speed devices working. I have not tested odroid anytime so
don't have much idea about the
its intricacies.
I guess Anand was able to use these patches to get his kernel working in pa=
st.

When you have a downstream on-board usb hub, ideally it should be able
to detect the devices
and not reset everytime you connect a new device (like you mentioned earlie=
r).
There can be two possible reasons why the hub keeps getting reset ever
after applying the above
mentioned patches:
1) the clock rates are not proper.
2) the regulator load setting is not enough to drive the hub.

Anand, can you please point Michael to an older kernel with which you
could test usb on odroid successfully ?
You can compare the clocks with an older version and see if there'a
any difference.

Any possibility of any other framework (such as, bus-freq) trimming
down the clock - rates ?


[snip]

>
> There are two dwc3 ports in the SoC : one for Gbit Ethernet another
> one for on-board GL3521 USB 3.0 hub controller.
>
> 3.10.x kernel
> odroid@odroid:~$ lsusb -t
> /:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>     |__ Port 1: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dr815=
2, 5000M
> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 5000M
> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Ds5p-ehci/3p, 480M
>
> 4.x kernel
> odroid@odroid:~$ lsusb -t
> /:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dr815=
2, 480M
> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 5000M
>         |__ Port 1: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-stora=
ge, 5000M
>         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3Dusb-stora=
ge, 5000M
> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 480M

[snip]

Michael, please paste the output of lsusb -t and/or lsusb -v as well.


Best regards
Vivek

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
