From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
Date: Mon, 20 Feb 2017 18:33:45 +0200
Message-ID: <CAJKOXPfsQBap8=3jK309Dzh7d8mpci8zc=aCs+Phexym89Ko-Q@mail.gmail.com>
References: <CAHd-4wCWykRVHfYz-kqA_bMLzYOsFcva2V6hDpvo+egO6CZ8pw@mail.gmail.com>
 <20170219174625.zct4lzglytmkd6i6@kozik-lap> <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
 <b15abed0-2119-cf5e-bc80-1adb3ba820a9@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753357AbdBTQdv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 11:33:51 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 3156120272
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2017 16:33:48 +0000 (UTC)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com [209.85.223.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D24A42025A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2017 16:33:46 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j13so29383330iod.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2017 08:33:46 -0800 (PST)
In-Reply-To: <b15abed0-2119-cf5e-bc80-1adb3ba820a9@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Leandro Santiago <leandrosansilva@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On Mon, Feb 20, 2017 at 5:44 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Leandro,
>
> On 02/19/2017 04:11 PM, Leandro Santiago wrote:
>> Thank you for the tips. I have just added linux-samsung-soc@vger.kernel.org
>> to cc, even though get_mantainer.pl did not suggested such mailing list.
>>
>> About the interrupts property, on the original chromeos-3.8, it was defined
>> as <2 0>, I just replaced the second zero by it by IRQ_TYPE_NONE as it
>> evaluates to zero anyways and is compatible with the existing trackpad
>> node. I have fixed it by setting it to IRQ_TYPE_EDGE_FALLING as you
>> suggested. I have no access to the platform data though, so could not check
>> if it's really correct or not. But still works fine on my chromebook.
>>
>> Here is the updated version of the patch:
>>
>> From 458b5b891a98e6163321396514b9d9227ae50e69 Mon Sep 17 00:00:00 2001
>> From: Leandro Santiago <leandrosansilva@gmail.com>
>> Date: Sun, 19 Feb 2017 16:50:18 +0100
>> Subject: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
>>
>> The Samsung Chromebook uses an Atmel maxTouch as trackpad.
>>
>> The keymap was based on Exynos5250-based Google Spring and most of
>> the other values were based on chromeos-3.8 branch from the ChromeOS
>> kernel.
>>
>> Signed-off-by: Leandro Santiago <leandrosansilva@gmail.com>
>> ---
>>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> index 8f3a80430748..183ff57c6455 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> @@ -434,6 +434,20 @@
>>                 interrupt-parent = <&gpx1>;
>>                 wakeup-source;
>>         };
>> +
>> +       trackpad@4b {
>> +               compatible = "atmel,atmel_mxt_tp";
>> +               reg = <0x4b>;
>> +               interrupt-parent = <&gpx1>;
>> +               interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>> +               linux,gpio-keymap = <KEY_RESERVED
>> +                                    KEY_RESERVED
>> +                                    KEY_RESERVED
>> +                                    KEY_RESERVED
>> +                                    KEY_RESERVED
>> +                                    BTN_LEFT>;
>> +               wakeup-source;
>> +       };
>>  };
>>
>
> I noticed that the downstream ChromiumOS tree does the same, but I don't
> think that's correct to add both trackpad devices under the same I2C bus.
>
> DT is a hardware description and so it should describe what the device
> truly has and not add all the possible combinations and make the driver
> fail or succeed if according to what's found on a particular board.
>
> So this is a DT hack and instead all the possible variations should be
> properly described in different DT with (possibly) common DTS snippets.
>
> I thought that all Snow variations used the Cypress cyapa chip but now
> recall a conversation on #linux-exynos about some Snow rev5 variations
> using the same Atmel chip used in the Exynos5420/5800 Peach Chromebooks.
>
> That definitely isn't the case for all Snow rev5 though since some have
> the Cypress chip like in previous revisions, according to other users.

Oh, wait, I thought that these two devices actually exist on all Snows
on this I2C bus. They have different addresses so it seemed possible
(although having many trackpads looks weird). You think this is only
for specific revisions of Snows?

Best regards,
Krzysztof
