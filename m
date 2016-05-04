From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFT PATCH 1/3] usb: misc: usb3503: Fix HUB mode after bootloader
 initialization
Date: Wed, 04 May 2016 14:01:57 +0200
Message-ID: <5729E4B5.2090702@samsung.com>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
 <20160429113059.GX3217@sirena.org.uk> <57234BA2.6020304@samsung.com>
 <20160429164448.GY3217@sirena.org.uk> <57272298.50701@samsung.com>
 <20160502105501.GE6292@sirena.org.uk> <20160503180022.GA3008@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160503180022.GA3008@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/03/2016 08:00 PM, Rob Herring wrote:
> On Mon, May 02, 2016 at 11:55:01AM +0100, Mark Brown wrote:
>> On Mon, May 02, 2016 at 11:49:12AM +0200, Krzysztof Kozlowski wrote:
>>
>>> This VDD regulator supply actually is not a usb3503 USB HUB regulator
>>> supply... but a supply to the LAN attached to this HUB. Regulator off/on
>>> is needed for LAN to show up. The hub will show up with typical reset
>>> (which is also missing before my patchset btw).
>>
>>> The LAN, as a USB device, is auto-probed so it cannot take the regulator
>>> and play with it. The simplest idea I have is to add it as "external
>>> supply"  to the parent: usb3503.
>>
>> This is common enough that that just isn't going to scale well I fear
>> without some generic handling, either walking child devices at the bus
>> level or at the device level with a pre-probe() callback to get the
>> device to power on.  The latter is more appropriate to things like
>> Slimbus where the device is more likely to do active management at
>> runtime, it's not clear people are building USB devices like that.
> 
> There's a new binding and support in -next (.../usb/usb-device.txt) for 
> USB devices that should help here. Though, how to handle a hub on USB 
> and I2C buses would need to be worked out.

This binding might help, especially with other idea we have - usage of
pwrseq for the USB hub.

The USB hub, without toggling the regulator off/on, appears as USB
device only sometimes. Apparently there is some timing or other
behavior. not yet known to me.

When playing with regulator, the USB hub and child USB device (LAN) will
appear correctly.

This looks like pwrseq for MMC devices so the idea is to:
1. Move drivers/mmc/core/pwrseq* to separate directory
(drivers/power/pwrseq ?)
2. Add support for pwrseq to USB core,
3. Add new pwrseq driver (or extend existing one): toggling the regulator.
4. Add pwrseq phandle to the DT node of USB hub (to the binding
mentioned by Rob?).


Does it look sensible?

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
