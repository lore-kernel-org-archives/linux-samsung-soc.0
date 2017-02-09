From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Thu, 9 Feb 2017 11:26:48 +0100
Message-ID: <CACQ1gAj5ebug28CJ2xiYWKohMhNbGr=tmy6mS-57CFq=K-bqyQ@mail.gmail.com>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
 <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g@mail.gmail.com>
 <CGME20170125075556epcas1p4b916a6d6acda28f8fc1959a1227520fa@epcas1p4.samsung.com>
 <CAJKOXPesCuYsK23466=6W9PPX7DtztdymZLBfNz0Dmjzwp4qBA@mail.gmail.com>
 <ef6c0d33-73d6-805e-aeab-86190e8b0aa0@samsung.com> <CAJKOXPd+CnmVG282NEVCFqS_3YEURCWx41udyQKpL21keGJOWg@mail.gmail.com>
 <4dca1d8e-f955-7791-90c0-4e73a273fe62@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4dca1d8e-f955-7791-90c0-4e73a273fe62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2017-01-27 8:29 GMT+01:00 Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On 25/01/2017 15:17, Krzysztof Kozlowski wrote:
>> On Wed, Jan 25, 2017 at 3:48 PM, Marek Szyprowski
>> <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi Krzysztof,
>>>
>>> On 2017-01-25 08:55, Krzysztof Kozlowski wrote:
>>>>
>>>> On Wed, Jan 25, 2017 at 7:51 AM, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>
>>>>> On 24 January 2017 at 19:18, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> wrote:
>>>>>>
>>>>>> Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
>>>>>> the USB ports on odroid-XU4 don't work anymore.
>>>>>>
>>>>>> Inserting an usb key (USB2.0) on the USB3.0 port result in:
>>>>>> [ 64.488264] xhci-hcd xhci-hcd.2.auto: Port resume took longer than
>>>>>> 20000 msec, port status = 0xc400fe3
>>>>>> [   74.568156] xhci-hcd xhci-hcd.2.auto: xHCI host not responding to
>>>>>> stop endpoint command.
>>>>>> [   74.574806] xhci-hcd xhci-hcd.2.auto: Assuming host is dying, halting
>>>>>> host.
>>>>>> [   74.601970] xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
>>>>>> [   74.606276] usb 3-1: USB disconnect, device number 2
>>>>>> [   74.613565] usb 4-1: USB disconnect, device number 2
>>>>>> [   74.621208] usb usb3-port1: couldn't allocate usb_device
>>>>>> NB: it's not related to USB2.0 devices, I get the same result with an
>>>>>> USB3.0 device (SATA to USB3 for instance).
>>>>>> NB2: it doesn't happen on an odriod-XU3 board, that doesn't have the
>>>>>> realtek RTL8153 chip.
>>>>>>
>>>>>> If the lines:
>>>>>>          if (dwc->revision > DWC3_REVISION_194A)
>>>>>>                  reg |= DWC3_GUSB3PIPECTL_SUSPHY;
>>>>>> are commented out, the USB3.0 start working.
>>>>>>
>>>>>> For a full analyse: https://lkml.org/lkml/2017/1/18/678
>>>>>>
>>>>>> Felipe suggested that suspend should be disabled temporarily while
>>>>>> what's wrong with DCW3 is figured out.
>>>>>>
>>>>>> Tested on Odroid XU4
>>>>>>
>>>>>> Suggested-by: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>>> Tested-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.4+
>>>>>> Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")
>>>>>> ---
>>>>>>   arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
>>>>>>   1 file changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>>> b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>>> index 2faf88627a48..f62dbd9b5ad3 100644
>>>>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>>>>>> @@ -43,6 +43,15 @@
>>>>>>          status = "okay";
>>>>>>   };
>>>>>>
>>>>>> +&usbdrd_dwc3_0 {
>>>>>> +       /*
>>>>>> +        * without that, usb devices are not recognized when
>>>>>> +        * they are plugged.
>>>>>> +        * cf: https://lkml.org/lkml/2017/1/18/678
>>>>>> +        */
>>>>>> +       snps,dis_u3_susphy_quirk;
>>>>>> +};
>>>>>> +
>>>>>>   &usbdrd_dwc3_1 {
>>>>>>          dr_mode = "host";
>>>>>>   };
>>>>>> --
>>>>>
>>>>> Thanks for this patch.
>>>>> But could you consider moving this changes as below.
>>>>>
>>>>> https://lkml.org/lkml/2015/3/18/400
>>>>
>>>> The patch above (and other DTS patches from the set) was not even sent
>>>> to linux-samsung-soc nor to me... It is sad how easily one's work can
>>>> disappear. Also, it is really worthless to solve the same problem
>>>> twice.
>>>
>>>
>>> Well, they were sent about 2 years ago... and you were also working on this
>>> topic. ;)
>>
>> Nope, I have never worked on this. That time I was in Korea so my
>> tasks were completely different. Later when I got back, I took for a
>> second U3 OTG which was not involving this thing.
>>
>>>> Cc Marek and Bartlomiej,
>>>> Guys, do you want to continue with Robert's patch (linked above by
>>>> Anand)? If yes, please take the ownership (Robert's address is not
>>>> valid anymore). If not, I will take Richard's patch after
>>>> resubmission.
>>>
>>>
>>> Take Richard's patch because it has a bit more details describing why such
>>> quirk
>>> is needed.
>>>
>>> Richard: in Roberts patch there is also a quirk for USB 2.0 mode
>>> (snps,dis_u2_susphy_quirk). Could you check if it really needed?
>>>
>>> Maybe it would make sense to set those quirks for both DWC3 controllers, as
>>> this
>>> issue with PHY suspend seems to be a Exynos specific thing.
>>
>> Okay,
>> Richard, please continue with your patch.
> Ok, I'll grab a XU3 & XU4 and do some more tests.
> But I didn't recall having problems with the XU3 board. I'll try to add
> a hub or something.
>

I did some tests with XU3 and XU4, playing with USB2 and USB3 quirks
(snps,dis_u{2,3}_susphy_quirk)

kernel for the tests: next-20170206
DTBs: exynos5422-odroidxu3-lite.dtb exynos5422-odroidxu4.dtb

USB devices used for the tests: kingston USB3 key, Akasa sata/USB3
+SSD standard USB2 key
once recognized, a dd if=/dev/sda bs=1M count=100 of=/dev/null is done.


The results are:
- On XU4:
  - adding snps,dis_u2_susphy_quirk doesn't change anything:
    inserting an USB2 or USB3 device gives the error message:
    xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec,
port status = 0xc400fe3
  - with snps,dis_u3_susphy_quirk, USB2 and USB3 devices are recognized

- On XU3:
  - Without changing XU3 dts, USB2 devices are recognized.
  - With or without the snps,dis_u3_susphy_quirk, USB3 devices are not
recognized/not working properly
  (never seen or disconnected, unable to enumerate, etc.)
  However, adding an external powered USB3 hub in between works. (with
or without the snps,dis_u3_susphy_quirk)
  Anyway, this problem doesn't seems to be related to the other since
  addind the quirks doesn't change anything.

- On XU3 USB3 device port (dr_mode = "peripheral"):
  - acting as an ethernet gadget only works with the snps,dis_u3_susphy_quirk.
    It works well as USB2 or USB3 (tested with ethernet gadget+iperf)

So, at the end, it does seem usefull to add the
snps,dis_u3_susphy_quirk at the exynos5420.dtsi level.
Adding the snps,dis_u2_susphy_quirk doesn't seems to change anything
for XU3/XU4 board,
so I don't know if it is necessary or not.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
