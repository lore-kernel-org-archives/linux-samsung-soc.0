From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Wed, 25 Jan 2017 09:55:34 +0200
Message-ID: <CAJKOXPesCuYsK23466=6W9PPX7DtztdymZLBfNz0Dmjzwp4qBA@mail.gmail.com>
References: <20170124134809.23315-1-richard.genoud@gmail.com> <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANAwSgRAT0-XETx=yVRgM4GfukFLLEw-hqHjYGEWs0tqAx8g2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2017 at 7:51 AM, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Richard,
>
> On 24 January 2017 at 19:18, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
>> the USB ports on odroid-XU4 don't work anymore.
>>
>> Inserting an usb key (USB2.0) on the USB3.0 port result in:
>> [   64.488264] xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec, port status = 0xc400fe3
>> [   74.568156] xhci-hcd xhci-hcd.2.auto: xHCI host not responding to stop endpoint command.
>> [   74.574806] xhci-hcd xhci-hcd.2.auto: Assuming host is dying, halting host.
>> [   74.601970] xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
>> [   74.606276] usb 3-1: USB disconnect, device number 2
>> [   74.613565] usb 4-1: USB disconnect, device number 2
>> [   74.621208] usb usb3-port1: couldn't allocate usb_device
>> NB: it's not related to USB2.0 devices, I get the same result with an USB3.0 device (SATA to USB3 for instance).
>> NB2: it doesn't happen on an odriod-XU3 board, that doesn't have the realtek RTL8153 chip.
>>
>> If the lines:
>>         if (dwc->revision > DWC3_REVISION_194A)
>>                 reg |= DWC3_GUSB3PIPECTL_SUSPHY;
>> are commented out, the USB3.0 start working.
>>
>> For a full analyse: https://lkml.org/lkml/2017/1/18/678
>>
>> Felipe suggested that suspend should be disabled temporarily while
>> what's wrong with DCW3 is figured out.
>>
>> Tested on Odroid XU4
>>
>> Suggested-by: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> Tested-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.4+
>> Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> index 2faf88627a48..f62dbd9b5ad3 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> @@ -43,6 +43,15 @@
>>         status = "okay";
>>  };
>>
>> +&usbdrd_dwc3_0 {
>> +       /*
>> +        * without that, usb devices are not recognized when
>> +        * they are plugged.
>> +        * cf: https://lkml.org/lkml/2017/1/18/678
>> +        */
>> +       snps,dis_u3_susphy_quirk;
>> +};
>> +
>>  &usbdrd_dwc3_1 {
>>         dr_mode = "host";
>>  };
>> --
>
> Thanks for this patch.
> But could you consider moving this changes as below.
>
> https://lkml.org/lkml/2015/3/18/400

The patch above (and other DTS patches from the set) was not even sent
to linux-samsung-soc nor to me... It is sad how easily one's work can
disappear. Also, it is really worthless to solve the same problem
twice.

Cc Marek and Bartlomiej,
Guys, do you want to continue with Robert's patch (linked above by
Anand)? If yes, please take the ownership (Robert's address is not
valid anymore). If not, I will take Richard's patch after
resubmission.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
