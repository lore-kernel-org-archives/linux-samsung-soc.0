From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [BUG] Regression, usb-dwc3 not working, Odroid XU3, usb 3.0
Date: Mon, 04 Jul 2016 13:39:39 +0200
Message-ID: <577A4AFB.9030006@samsung.com>
References: <577A47D3.7020900@samsung.com> <87shvpljsk.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <87shvpljsk.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 07/04/2016 01:33 PM, Felipe Balbi wrote:
> 
> Hi,
> 
> Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> writes:
> 
>> Hi,
>>
>>
>> Since three recent next releases (first on 20160630), on Odroid XU3 board
>> the USB 3.0 host port (the only one) stopped working.
>>
>> This is a "samsung,exynos5250-dwusb3" (drivers/usb/dwc3/dwc3-exynos.c).
>>
>> Two issues here:
>> 1. The port does not show up as USB 3.0 device.
>> This one device is missing:
>> 	Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>
>> 2. The port does not work even for 2.0 devices (I didn't test 1.0).
>>
>>
>> config: exynos_defconfig (ARM)
>> DTS: exynos5422-odroidxu3.dts
> 
> apply [1] and try again. That commit is already in greg/usb-testing [2]
> and it should trickle down to usb-next shortly.
> 
> [1] https://marc.info/?l=linux-usb&m=146728795330915&w=2
> [2] https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=322832f2f19e04c866a0ce4bdac8cff8e695f2b3
> 

Ahhh, indeed, fixed.

FWIW:
Tested-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
