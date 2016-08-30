From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
Date: Tue, 30 Aug 2016 10:32:01 +0530
Message-ID: <CANAwSgQMsK8YPxR==UXtR49kiJzYhkzvSCNwn8mDJfj-3wpa2w@mail.gmail.com>
References: <1472414695.3845.3.camel@mniewoehner.de> <87lgzgdof3.fsf@linux.intel.com>
 <57C41582.1030604@linux.intel.com> <1472468730.4925.3.camel@mniewoehner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36458 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751804AbcH3FCX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 01:02:23 -0400
In-Reply-To: <1472468730.4925.3.camel@mniewoehner.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Michael_Niew=C3=B6hner?= <linux@mniewoehner.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Hi All

Adding Vivek Gautam.

On 29 August 2016 at 16:35, Michael Niew=C3=B6hner <linux@mniewoehner.de> w=
rote:
> Hi Mathias,
> On Mo, 2016-08-29 at 13:59 +0300, Mathias Nyman wrote:
>> On 29.08.2016 10:28, Felipe Balbi wrote:
>> >
>> >
>> > Hi,
>> >
>> > Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
>> > >
>> > > [1.] One line summary of the problem:
>> > > DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
>> > >
>> > > [2.] Full description of the problem/report:
>> > > No usb 3.0 devices are being detected when attached while USB 2.0
>> > > devices work on the same port.
>> > > USB 3.0 works after applying patches [9.1] and [9.2], but seems
>> > > to be
>> > > buggy. The usb hub is redetected every time an usb device is
>> > > attached.
>> >
>> > dwc3 is host, which means it's actually XHCI :-)
>> >
>> > Adding Mathias
>> >
>> > >
>> > > dmesg:
>> > > [  192.287080] usb 3-1.2: USB disconnect, device number 7
>> > > [  210.370699] hub 3-1:1.0: hub_ext_port_status failed (err =3D
>> > > -71)
>>
>> Looks like the hub GetPortStatus request fails with protocol error.
>>
>> Reading xhci root hub port status is mostly just register reads and
>> writes. It
>> shouldn't include any actual transfers that could return -EPROTO
>>
>> So this is not the root hub? but a external or integrated on your
>> board, right?
>>
>> The protocol error -71 is returned at transfer errors or if device
>> stalled.
>>
>> Adding more xhci debugging options could show something:
>> echo -n 'module xhci_hcd =3Dp' >
>> /sys/kernel/debug/dynamic_debug/control
>>
>> >
>> > >
>> > > [9.] Other notes, patches, fixes, workarounds:
>> > > [9.1] https://lkml.org/lkml/2014/4/28/234
>> > > [9.2] https://lkml.org/lkml/2015/2/2/259
>>
>> The additional patches that makes things somehow work involve tuning
>> the PHY,
>> this is an area I'm not familiar with
>>
>> -Mathias
>>
>
>
> I'm sorry, I should have said that this is the dmesg output with the
> patches applied. Without them there is no output at all when I attach
> an usb 3.0 device.
>
> Michael

There are two dwc3 ports in the SoC : one for Gbit Ethernet another
one for on-board GL3521 USB 3.0 hub controller.

3.10.x kernel
odroid@odroid:~$ lsusb -t
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
    |__ Port 1: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dr8152,=
 5000M
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Ds5p-ehci/3p, 480M

4.x kernel
odroid@odroid:~$ lsusb -t
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dr8152,=
 480M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 5000M
        |__ Port 1: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-storage=
, 5000M
        |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3Dusb-storage=
, 5000M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dexynos-ehci/3p, 480M

I fell that Ethernet driver r8152 is not getting registered to
xhci-hcd to bus port 06
which lead to other ports to miss configure, some time the Ethernet
port get register to bus port 04

Their is also a possibility that all the port are not getting proper
power from the S2MPS11 PMIC
and possible some reset of the phy is needed to reconfigure the exynos
USB HSIC controller.

Best Regards
-Anand Moon
