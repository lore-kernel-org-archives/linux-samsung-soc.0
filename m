From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Sat, 30 May 2015 19:23:24 +0530
Message-ID: <CANAwSgTk=YwH23F4981j6z9m4+=_Yrratz6BRSQU7PmPHGT0Bg@mail.gmail.com>
References: <1432803494-3516-1-git-send-email-linux.amoon@gmail.com> <5566DDA6.1080508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5566DDA6.1080508-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 28 May 2015 at 14:49, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 28.05.2015 17:58, Anand Moon wrote:
>> Enable regulator for usbdrd3_0 and usbdrd3_1
>>>From the schematic pin diagram USB3_0 and USB3_1
>> is regulated by LDO9 and LD011.
>
> Please reformat statement above to proper sentence(s) without ">" before
> "From".
>
>>
>> Fix the boot message of failed.
>> [    3.503539] exynos-dwc3 usb@12000000: Looking up vdd33-supply from device tree
>> [    3.503556] exynos-dwc3 usb@12000000: Looking up vdd33-supply property in node /usb@12000000 failed
>> [    3.503568] usb@12000000 supply vdd33 not found, using dummy regulator
>> [    3.509154] exynos-dwc3 usb@12000000: Looking up vdd10-supply from device tree
>> [    3.509170] exynos-dwc3 usb@12000000: Looking up vdd10-supply property in node /usb@12000000 failed
>> [    3.509181] usb@12000000 supply vdd10 not found, using dummy regulator
>> [    3.917548] exynos-dwc3 usb@12400000: Looking up vdd33-supply from device tree
>> [    3.917565] exynos-dwc3 usb@12400000: Looking up vdd33-supply property in node /usb@12400000 failed
>> [    3.917578] usb@12400000 supply vdd33 not found, using dummy regulator
>> [    3.922731] exynos-dwc3 usb@12400000: Looking up vdd10-supply from device tree
>> [    3.922747] exynos-dwc3 usb@12400000: Looking up vdd10-supply property in node /usb@12400000 failed
>>
>> ---
>> This patch is based on Krzysztof github branch work-next/odroid-xu3-s2mps11-irq
>> ---
>
> I mentioned this already on previous postings. Let's make an exercise.
> Please:
> 1. Save your email as mbox format (from mailer).
> 2. Go to a GIT repo with kernel and checkout base branch.
> 3. git am 0001-the-name-of-file.mbox
> 4. git show
>
> Do you see the signed-off-by in commit?
>
> The patch itself looks good, thanks for fixing this. Just please fix the
> issues with commit message.
>
> By the way:
> 1. The always-on from LDO9 could be probably removed if the ehci-exynos
> driver had regulator consumer implemented.
> 2. The Documentation/devicetree/bindings/usb/exynos-usb.txt (or dwc.txt)
> should proably mention the vdd-supply property.

Hi Krzysztof,

https://patchwork.kernel.org/patch/4420061/
https://patchwork.kernel.org/patch/4420071/

These patch are missing for this changes to make it work correctly.

Can you share you thought on this.

-Anand Moon

> Best regards,
> Krzysztof
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
