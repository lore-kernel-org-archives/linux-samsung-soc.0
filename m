From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: Pinctrl nodes missing for USB
Date: Wed, 26 Oct 2016 23:15:51 +0530
Message-ID: <CANAwSgSfRVDA_MXN9S+G0-u-mQNhPuPJ65FT_Y-ZH5nFpX4ptg@mail.gmail.com>
References: <CANAwSgQ=pp93tDAERQ1iaryY3_pVhTeun=RaTo9ws1UKtS1PhA@mail.gmail.com>
 <20161026165348.GA5600@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36667 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752263AbcJZRqM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 13:46:12 -0400
Received: by mail-oi0-f47.google.com with SMTP id n202so2336420oig.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Oct 2016 10:46:12 -0700 (PDT)
In-Reply-To: <20161026165348.GA5600@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Krzysztof

On 26 October 2016 at 22:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Oct 26, 2016 at 05:56:54PM +0530, Anand Moon wrote:
>> Hi All,
>>
>> I have tried to enable CONFIG_DEBUG_PINCTRL=y on Odroid XU4.
>> Just to try to understand the feature.
>> Is this feature suppoted for USB nodes.
>>
>> Below is the output of failed to pase pinctrl for USB nodes via dts.
>
> I do not see any question here...
>
> Anyway the devices not instantiated from DT will have such warning and
> USB devices are not present in DT, from obvious reasons... However what
> surprises me is why pinctrl_dt_to_map() was called for USB devices?
>
> Best regards,
> Krzysztof
>
[snip]

Sorry. I was just referring HK odroidxu3 dts for reference for dwc3 controller.

https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/boot/dts/exynos5422-odroidxu3.dts#L525

I am just trying to understand if such a configuration possible for
dwc3 controllers.

Best Regards
Anand Moon
