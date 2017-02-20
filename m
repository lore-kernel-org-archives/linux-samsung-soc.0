From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
Date: Mon, 20 Feb 2017 16:11:17 -0300
Message-ID: <ad94d12e-7121-f3ff-4738-70f7b7f08be0@osg.samsung.com>
References: <CAHd-4wCWykRVHfYz-kqA_bMLzYOsFcva2V6hDpvo+egO6CZ8pw@mail.gmail.com>
 <20170219174625.zct4lzglytmkd6i6@kozik-lap>
 <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
 <b15abed0-2119-cf5e-bc80-1adb3ba820a9@osg.samsung.com>
 <CAJKOXPfsQBap8=3jK309Dzh7d8mpci8zc=aCs+Phexym89Ko-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:36074
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750935AbdBTTLl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 14:11:41 -0500
In-Reply-To: <CAJKOXPfsQBap8=3jK309Dzh7d8mpci8zc=aCs+Phexym89Ko-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leandro Santiago <leandrosansilva@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 02/20/2017 01:33 PM, Krzysztof Kozlowski wrote:

[snip]

>>> +
>>> +       trackpad@4b {
>>> +               compatible = "atmel,atmel_mxt_tp";
>>> +               reg = <0x4b>;
>>> +               interrupt-parent = <&gpx1>;
>>> +               interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>>> +               linux,gpio-keymap = <KEY_RESERVED
>>> +                                    KEY_RESERVED
>>> +                                    KEY_RESERVED
>>> +                                    KEY_RESERVED
>>> +                                    KEY_RESERVED
>>> +                                    BTN_LEFT>;
>>> +               wakeup-source;
>>> +       };
>>>  };
>>>
>>
>> I noticed that the downstream ChromiumOS tree does the same, but I don't
>> think that's correct to add both trackpad devices under the same I2C bus.
>>
>> DT is a hardware description and so it should describe what the device
>> truly has and not add all the possible combinations and make the driver
>> fail or succeed if according to what's found on a particular board.
>>
>> So this is a DT hack and instead all the possible variations should be
>> properly described in different DT with (possibly) common DTS snippets.
>>
>> I thought that all Snow variations used the Cypress cyapa chip but now
>> recall a conversation on #linux-exynos about some Snow rev5 variations
>> using the same Atmel chip used in the Exynos5420/5800 Peach Chromebooks.
>>
>> That definitely isn't the case for all Snow rev5 though since some have
>> the Cypress chip like in previous revisions, according to other users.
> 
> Oh, wait, I thought that these two devices actually exist on all Snows
> on this I2C bus. They have different addresses so it seemed possible

No, they don't. As mentioned, most Snows revs use the Cypress trackpad and
the Spring (another Exynos5250 Chromebook) uses the Atmel trackpad instead.

Also the Exynos5420/5800 Chromebooks use the Atmel trackpad too, but turns
out that some Snow revisions use the Atmel trackpad as well.

> (although having many trackpads looks weird). You think this is only
> for specific revisions of Snows?
>

Yes, all Chromebooks have only one trackpad and it varies between revisions.

The reason the downstream ChromiumOS tree have both I2C devices in the same
I2C bus was to have a common DTSI file to be used for all Exynos5250 boards.

This is the downstream commit in the ChromiumOS tree that added both devices
to the common DTSI file and you can see the intention in the commit [0]:

"Since we'd now like both defined for exynos5250-snow, move the definition
up to the cros5250-common device tree file.  This allows snow to work with
_either_ the cyapa or atmel touch pad dynamically."

So in the downstream tree both cyapa and atmel_mxt_ts drivers are probed and
only one succeeds. Obviously that's not the correct approach for doing this.

> Best regards,
> Krzysztof
> 

[0]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/0838b43f82908a3f67fea67303ebba1bebfc497a

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
