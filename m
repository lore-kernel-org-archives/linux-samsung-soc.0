From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Wed, 25 Jan 2017 09:34:03 +0100
Message-ID: <691f2c7b-dbef-9c01-9deb-a0f62944f91b@gmail.com>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
 <20170124182237.kwixpqc3wkutxbsj@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124182237.kwixpqc3wkutxbsj@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 24/01/2017 19:22, Krzysztof Kozlowski wrote:
> On Tue, Jan 24, 2017 at 02:48:09PM +0100, Richard Genoud wrote:
>> Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
>> the USB ports on odroid-XU4 don't work anymore.
> 
> Hi,
> 
> Thanks for the patch. Please:
> 1. Use recent kernel to test it, which could be one of: mainline
>    (Linus'), recent linux-next or my for-next branch. Why am I thinking
>    that you did not test it on thse? Because you sent the patch to
>    k.kozlowski-Sze3O3UU22LowKkBSvOlow@public.gmane.org The guy disappeared four months ago and
>    recent kernel has all addresses updated (including mailmap).
My bad, I took the email from the commit 6658356014cb ("ARM: dts: Add
support Odroid XU4 board for exynos5422-odroidxu4") instead of taking it
from get_maintainer (That was clearly a bad idea).
I actually ran my tests on 4.4.44 / 4.8.5 / 4.9.5 4.10-rc4
I'll also run them on -next

> 2. Fix the title to match subsystem (git log --oneline arch/arm/boot/dts/exynos*).
Ok

> 
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
> 
> Odroid-XU3
> s/realtek/Realtek/
> However I do not think that Realtek matters here. The USB3 ports are
> directly accessible on XU3. On XU4 on the other hand, the port USB3-0 is
> connected to USB hub. I think the sentence about Realtek is then
> misleading, so just mention the XU3.
Ok

> 
>>
>> If the lines:
>> 	if (dwc->revision > DWC3_REVISION_194A)
>> 		reg |= DWC3_GUSB3PIPECTL_SUSPHY;
>> are commented out, the USB3.0 start working.
> 
> s/start/starts/
Ok

>>
>> For a full analyse: https://lkml.org/lkml/2017/1/18/678
> 
> Documentation/process/submitting-patches.rst
> Instead of this above (lkml.org is highly discouraged) use proper
> https://lkml.kernel.org/ in "Link:" put next to other tags (look at
> recent commits), however I do not find this link as necessary.  Just
> describe here what is wrong and how you are going to fix it.
Ok

>>
>> Felipe suggested that suspend should be disabled temporarily while
>> what's wrong with DCW3 is figured out.
>>
>> Tested on Odroid XU4
>>
>> Suggested-by: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> Tested-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Being an author implies testing. Please remove the tag.
Ok

>> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.4+
> 
> Malformed tag - missing <>.
Ok

>> Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")
> 
> No need for such long hash (2164a405762c).
> 
> I wonder about pointing the commit which introduced the issue. Usually
> the fixes directly indicates how far we want the patch to be backported.
> In this case this should be backported to kernel bringing XU4 DTS. The
> commit which was not valid, was the commit adding DTS without this
> property. 2164a476205c was innocent for XU4 because XU4 did not exist
> that time.
> 
> Definitely something is wrong if Fixes tag does not match indicated
> backport version.

Yes, I see what you mean. We can't say that 2164a476205ccc ("usb: dwc3:
set SUSPHY bit for all cores") broke XU4 because it predates it !
I'll simply remove that.

>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> index 2faf88627a48..f62dbd9b5ad3 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
>> @@ -43,6 +43,15 @@
>>  	status = "okay";
>>  };
>>  
>> +&usbdrd_dwc3_0 {
>> +	/*
>> +	 * without that, usb devices are not recognized when
>> +	 * they are plugged.
> 
> s/without/Without/
> s/usb/USB.
> 
>> +	 * cf: https://lkml.org/lkml/2017/1/18/678
> 
> No external resources. You can extend a little bit the sentence above to
> two sentences. Combined with "git log" this would be sufficient.

Ok
> Best regards,
> Krzysztof

Thanks !

>> +	 */
>> +	snps,dis_u3_susphy_quirk;
>> +};
>> +
>>  &usbdrd_dwc3_1 {
>>  	dr_mode = "host";
>>  };
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
