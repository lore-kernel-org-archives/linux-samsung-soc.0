From: Shuah Khan <shuahkhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Mon, 8 May 2017 10:19:25 -0600
Message-ID: <CAKocOONWPT_oej+6A2AqK9CqowdHsFvLtsSav-0N=UZKSu0-Sw@mail.gmail.com>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
 <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g@mail.gmail.com>
 <CGME20170125075556epcas1p4b916a6d6acda28f8fc1959a1227520fa@epcas1p4.samsung.com>
 <CAJKOXPesCuYsK23466=6W9PPX7DtztdymZLBfNz0Dmjzwp4qBA@mail.gmail.com>
 <ef6c0d33-73d6-805e-aeab-86190e8b0aa0@samsung.com> <CAJKOXPd+CnmVG282NEVCFqS_3YEURCWx41udyQKpL21keGJOWg@mail.gmail.com>
 <4dca1d8e-f955-7791-90c0-4e73a273fe62@gmail.com> <CACQ1gAj5ebug28CJ2xiYWKohMhNbGr=tmy6mS-57CFq=K-bqyQ@mail.gmail.com>
 <20170210133439.qfiuggbuoi7hq6el@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210133439.qfiuggbuoi7hq6el@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Fri, Feb 10, 2017 at 6:34 AM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Feb 09, 2017 at 11:26:48AM +0100, Richard Genoud wrote:
>> I did some tests with XU3 and XU4, playing with USB2 and USB3 quirks
>> (snps,dis_u{2,3}_susphy_quirk)
>>
>> kernel for the tests: next-20170206
>> DTBs: exynos5422-odroidxu3-lite.dtb exynos5422-odroidxu4.dtb
>>
>> USB devices used for the tests: kingston USB3 key, Akasa sata/USB3
>> +SSD standard USB2 key
>> once recognized, a dd if=/dev/sda bs=1M count=100 of=/dev/null is done.
>>
>>
>> The results are:
>> - On XU4:
>>   - adding snps,dis_u2_susphy_quirk doesn't change anything:
>>     inserting an USB2 or USB3 device gives the error message:
>>     xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec,
>> port status = 0xc400fe3
>>   - with snps,dis_u3_susphy_quirk, USB2 and USB3 devices are recognized
>>
>> - On XU3:
>>   - Without changing XU3 dts, USB2 devices are recognized.
>>   - With or without the snps,dis_u3_susphy_quirk, USB3 devices are not
>> recognized/not working properly
>>   (never seen or disconnected, unable to enumerate, etc.)
>>   However, adding an external powered USB3 hub in between works. (with
>> or without the snps,dis_u3_susphy_quirk)
>>   Anyway, this problem doesn't seems to be related to the other since
>>   addind the quirks doesn't change anything.
>
> From this description I am missing where are you inserting the USB
> devices.
>
> Both boards have totally different USB port configuration. On XU3 the
> hub is on USB 2.0 port. On XU4 the opposite - the hub is on USB 3.0
> port.
>

I am running into this on XU4 USB 3.0 ports. Cold booting with device
present in USB 3.0 port, device is recognized.

Bus 004 Device 003: ID 8564:4000 Transcend Information, Inc. RDF8
    MaxPower              224mA

However, if I were to insert it after boot, it fails to resume the port.

[ 2936.560129] usb 4-1.2: USB disconnect, device number 3
[ 2959.249815] xhci-hcd xhci-hcd.2.auto: Port resume took longer than
20000 msec, port status = 0xc400fe3

and lsusb -v|egrep "^Bus|MaxPower" shows:

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    MaxPower                0mA

Preventing suspend with this. Looking at this more, could this be
related to GCTL.RAMCLKSEL?

The commnet block below in dwc3_gadget_conndone_interrupt() seems to
indicate a potential problem on platforms when RAMClkSel is reset to 0
after USB reset. Is that the case on Odroid-xu4 that updating
GCTL.RAMCLKSEL is necessary to USB device hotplug to work without the
the quirk?

     /*
         * RAMClkSel is reset to 0 after USB reset, so it must be reprogrammed
         * each time on Connect Done.
         *
         * Currently we always use the reset value. If any platform
         * wants to set this to a different value, we need to add a
         * setting and update GCTL.RAMCLKSEL here.
         */

I can debug this more dumping GCTL.RAMCLKSEL registers in cold boot
vs. hotplig cases to get more information.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
