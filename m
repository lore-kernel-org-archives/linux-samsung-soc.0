From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFT 0/3] usb: usb3503: Fix probing on Arndale board (missing phy)
Date: Thu, 08 Oct 2015 11:58:12 +0200
Message-ID: <56163E34.8040706@samsung.com>
References: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
 <56152BB2.4020202@samsung.com> <561606FE.2090007@samsung.com>
 <56160BFD.4050702@samsung.com> <561638ED.1060503@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <561638ED.1060503-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ben Gamari <ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 2015-10-08 11:35, Javier Martinez Canillas wrote:
> Hello,
>
> On 10/08/2015 08:23 AM, Marek Szyprowski wrote:
>> Hello,
>>
>> On 2015-10-08 08:02, Krzysztof Kozlowski wrote:
>>> On 07.10.2015 23:26, Marek Szyprowski wrote:
>>>> Hello,
>>>>
>>>> On 2015-10-07 02:30, Krzysztof Kozlowski wrote:
>>>>> Introduction
>>>>> ============
>>>>> This patchset tries to fix probing of usb3503 on Arndale board
>>>>> if the Samsung PHY driver is probed later (or built as a module).
>>>>>
>>>>> *The patchset was not tested on Arndale board.*
>>>>> I don't have that board. Please test it and say if the usb3503
>>>>> deferred probe
>>>>> works fine and the issue is solved.
>>>>>
>>>>> The patchset was tested on Odroid U3 board (which is different!)
>>>>> in a simulated environment. It is not sufficient testing.
>>>>>
>>>>>
>>>>> Difference
>>>>> ==========
>>>>> The usb3503 device driver can be used as a I2C device (on Odroid U3)
>>>>> or as a platform device connected through phy (on Arndale). In the second
>>>>> case the necessary phy reference has to be obtained and enabled.
>>>>>
>>>>> For some details please look also at thread [0][1].
>>>>>
>>>>> [0]
>>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348524.html
>>>>>
>>>>> [1]
>>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/348875.html
>>>>>
>>>>>
>>>> I'm not sure that this is the correct approach. usb3503 chip is simply
>>>> connected
>>>> to Exynos USB2 phy, so it visible on the USB bus. The real driver that
>>>> controls USB2
>>>> PHY is Exynos EHCI driver and USB3503 should not mess around it.
>>> The ehci node (usb@12110000) has one port configured and it takes one
>>> PHY reference (phy of id 1 - USB host). I can't see driver taking
>>> reference to HSIC0 or HSIC1 phys... Since I cannot diagnose the error I
>>> don't know what is really expected here.
>> It looks that EHCI in Exynos 5250 and 5420 still use old phy bindings. For
>> the reference, see Exynos4 dts and exynos4412-odroidu3.dts to check how to enable
>> more than one USB port (Odroid U3 has both HSIC ports enabled).
>>
>>>> In my opinion all that is needed in case of Arndale board is forcing
>>>> reset of
>>>> usb3503 chip after successful EHCI and USB2 PHY initialization (for some
>>>> reason
>>>> initialization of usb3503 chip must be done after usb host initialization).
>>>> However I have no idea which driver should trigger this reset. Right now
>>>> I didn't
>>>> find any good solution for additional control for devices which are on
>>>> autoprobed
>>>> bus like usb.
>>> The reset is done at the end of usb3503's probe. The question "why
>>> usb3503 has to be initialized after EHCI and USB PHY" is still valid...
>> I remember that I saw some code to reset HSIC device after phy power on in case
>> of HSIC-connected modem chip, so maybe this is somehow common for HSIC chips
>> (which are some special case of 'embedded usb').
>>
> I also don't have an Arndale board and haven't followed the thread to closely
> but I just wanted to mention that the ChromiumOS 3.8 tree has a workaround to
> reset the HSIC phys:
>
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/81685c447954a29d1098268776582457258dd98f%5E%21/
>
> and later a "supports-hsicphy-reset" DT property was added to force the reset
> per board instead of unconditionally:
>
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/a4d1c1a223ffa1ed38a4257d0378ca70c6667be0%5E%21/

I didn't check this approach, but for me it looks that the problem is caused
by the lack of resetting the chip connected to hsic phy not the lack of
resetting the phy itself. However this is pure speculation and one should
check it with the real hardware.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
