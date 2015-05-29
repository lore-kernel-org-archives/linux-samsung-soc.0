From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv2] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Fri, 29 May 2015 19:55:51 +0530
Message-ID: <CANAwSgSVQWxzzCu-twDZoR8JBdd6Z3=+OQu=V3Ch_UmNo3PD1A@mail.gmail.com>
References: <1432906469-3856-1-git-send-email-linux.amoon@gmail.com> <CABxcv==n7e2x8wp0tqHzPdfF+RyqWQwkFXTB9_Epy54ZojuhdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38737 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbbE2O0N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 10:26:13 -0400
In-Reply-To: <CABxcv==n7e2x8wp0tqHzPdfF+RyqWQwkFXTB9_Epy54ZojuhdA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Javier,

Ok sorry for the mistake and not following the protocol.
Now I clearly understood my mistake. It will not be repeated.
I will resend the patch.

Is this correct format to follow.

    Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
    Signed-off-by: Anand Moon <linux.amoon@gmail.com>
   ---
    This patch is based on Krzysztof github branch
work-next/odroid-xu3-s2mps11-irq.
    v2 - Fixed the comment.

-Anand Moon

On 29 May 2015 at 19:19, Javier Martinez Canillas <javier@dowhile0.org> wrote:
> Hello Anand,
>
> On Fri, May 29, 2015 at 3:34 PM, Anand Moon <linux.amoon@gmail.com> wrote:
>> Enable regulator for usbdrd3_0 and usbdrd3_1.
>> Looking at the schematic pin diagram for MAX77802
>> USB3_0 and USB3_1 is regulated by LDO9 and LD011.
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
>> This patch is based on Krzysztof github branch work-next/odroid-xu3-s2mps11-irq.
>> v2 - Fixed the comment.
>> ---
>>
>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>
> Your commit message is again not correct. Sorry if this is a long
> explanation but I want you to understand how the git tools work.
>
> What git am and other git tools do is to strip any text that is
> between the first "---" and the actual diff. With git format-patch the
> information that is placed there by default is the file(s) diffstat
> since that is a useful information for someone reviewing your patches
> but not so to be part of the commit message, you can get it anyways
> later with git $commitId --stat.
>
> So what people do is to add information after the first "---" that is
> relevant for reviewers but don't want to end the commit message.
> Usually this is the patch change history but it can contain any other
> information like links to previous patches, dependencies posted
> previously, etc.
>
> With your current patch, that means that git am will strip your
> Signed-off-by and Krzysztof's Tested-by tags which should be part of
> the commit message.
>
> Krzysztof already mentioned but a good exercise would be to generate
> your patch with git format-patch and then apply again with git am to
> see if the end result is what you were expecting for.
>
> Hope it helps,
> Javier
