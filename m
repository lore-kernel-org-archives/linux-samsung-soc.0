From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Fri, 29 May 2015 08:57:24 +0900
Message-ID: <5567AB64.3060502@samsung.com>
References: <1432803494-3516-1-git-send-email-linux.amoon@gmail.com>
 <5566DDA6.1080508@samsung.com>
 <CANAwSgRpXxq2Y72crPd3U8f-DB=nsQ021e5MY0B7GdJrqwv=wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34087 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754736AbbE1X52 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 19:57:28 -0400
In-reply-to: <CANAwSgRpXxq2Y72crPd3U8f-DB=nsQ021e5MY0B7GdJrqwv=wA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org

On 28.05.2015 19:28, Anand Moon wrote:
> Hi Krzysztof,
> 
> I will take care of these issue in the future.

Thanks. I just found that prefix ">" was added by my email client so
never mind about that but still please write proper sentences (ending
with full stop). :)

Best regards,
Krzysztof

> 
> -Anand Moon
> 
> On 28 May 2015 at 14:49, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>> On 28.05.2015 17:58, Anand Moon wrote:
>>> Enable regulator for usbdrd3_0 and usbdrd3_1
>>> >From the schematic pin diagram USB3_0 and USB3_1
>>> is regulated by LDO9 and LD011.
>>
>> Please reformat statement above to proper sentence(s) without ">" before
>> "From".
>>
>>>
>>> Fix the boot message of failed.
>>> [    3.503539] exynos-dwc3 usb@12000000: Looking up vdd33-supply from device tree
>>> [    3.503556] exynos-dwc3 usb@12000000: Looking up vdd33-supply property in node /usb@12000000 failed
>>> [    3.503568] usb@12000000 supply vdd33 not found, using dummy regulator
>>> [    3.509154] exynos-dwc3 usb@12000000: Looking up vdd10-supply from device tree
>>> [    3.509170] exynos-dwc3 usb@12000000: Looking up vdd10-supply property in node /usb@12000000 failed
>>> [    3.509181] usb@12000000 supply vdd10 not found, using dummy regulator
>>> [    3.917548] exynos-dwc3 usb@12400000: Looking up vdd33-supply from device tree
>>> [    3.917565] exynos-dwc3 usb@12400000: Looking up vdd33-supply property in node /usb@12400000 failed
>>> [    3.917578] usb@12400000 supply vdd33 not found, using dummy regulator
>>> [    3.922731] exynos-dwc3 usb@12400000: Looking up vdd10-supply from device tree
>>> [    3.922747] exynos-dwc3 usb@12400000: Looking up vdd10-supply property in node /usb@12400000 failed
>>>
>>> ---
>>> This patch is based on Krzysztof github branch work-next/odroid-xu3-s2mps11-irq
>>> ---
>>
>> I mentioned this already on previous postings. Let's make an exercise.
>> Please:
>> 1. Save your email as mbox format (from mailer).
>> 2. Go to a GIT repo with kernel and checkout base branch.
>> 3. git am 0001-the-name-of-file.mbox
>> 4. git show
>>
>> Do you see the signed-off-by in commit?
>>
>> The patch itself looks good, thanks for fixing this. Just please fix the
>> issues with commit message.
>>
>> By the way:
>> 1. The always-on from LDO9 could be probably removed if the ehci-exynos
>> driver had regulator consumer implemented.
>> 2. The Documentation/devicetree/bindings/usb/exynos-usb.txt (or dwc.txt)
>> should proably mention the vdd-supply property.
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
