From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Add atmel trackpad node to 5250 cros
Date: Wed, 7 May 2014 14:14:44 -0700
Message-ID: <CAD=FV=WMq+X_EvOoa9wTJgRqS6C9K_8M1Bz88hhHpKga-M1dBA@mail.gmail.com>
References: <1397457325-5054-1-git-send-email-arun.kk@samsung.com>
	<53594277.50401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:53792 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751913AbaEGVOq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 17:14:46 -0400
Received: by mail-ve0-f182.google.com with SMTP id sa20so2073224veb.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 May 2014 14:14:45 -0700 (PDT)
In-Reply-To: <53594277.50401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Arun Kumar <arunkk.samsung@gmail.com>, Benson Leung <bleung@chromium.org>

Tomasz,

On Thu, Apr 24, 2014 at 9:57 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Arun,
>
>
> On 14.04.2014 08:35, Arun Kumar K wrote:
>>
>> The newer versions of exynos5250 based Snow boards have
>> atmel trackpad. Updating relevant nodes for the same.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5250-cros-common.dtsi |   24
>> ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
>> b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
>> index 2c1560d..658f086 100644
>> --- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
>> @@ -28,6 +28,13 @@
>>                         samsung,pin-pud = <0>;
>>                 };
>>
>> +               trackpad_irq: trackpad-irq {
>> +                       samsung,pins = "gpx1-2";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>>                 max77686_irq: max77686-irq {
>>                         samsung,pins = "gpx3-2";
>>                         samsung,pin-function = <0>;
>> @@ -191,6 +198,9 @@
>>                 samsung,i2c-sda-delay = <100>;
>>                 samsung,i2c-max-bus-freq = <378000>;
>>
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&i2c1_bus &trackpad_irq>;
>
>
> Please add &trackpad_irq to trackpad node instead. Pinctrl properties of i2c
> node should contain only i2c-related pins.

This was a workaround for a limitation of the i2c subsystem which need
to be fixed before atmel support can land upstream.

The problem is that there are two sources for the trackpad on this
hardware.  They are pin compatible, so some boards may have one
trackpad and other (mostly newer) boards may have the other.

The i2c bus is probable, so the theory is that you can just specify
both of trackpads and one will fail to be found.  The problem (at
least on 3.8) was that the pinctrl subsystem held onto the pins.  :(


I just tried now to see if I could reproduce this on ToT.  ...and it
turns out that the atmel_mxt_ts doesn't support device tree upstream.
Right at the top of mxt_probe I see:

if (!pdata)
  return -EINVAL;

I actually find a patch (from you!) that adds some device tree support
at <https://patchwork.kernel.org/patch/2393631/>.  ...though
interestingly enough our current tree somehow gets by without
specifying all of those properties.  +Benson may be able to give more
details?


Until atmel device tree support lands, though, I think this patch is stalled.

>> +                       reg = <0x25>;
>> +                       compatible = "atmel,atmel_mxt_tp";
>> +                       interrupts = <2 0>;
>> +                       interrupt-parent = <&gpx1>;
>> +                       wakeup-source;
>> +               };
>
>
> Hmm, why are there 3 different nodes here? Could you explain what one by one
> for what hardware they are?

cyapa: the Cypress trackpad that shipped with original exynos5250-snow

atmel: some newer exynos5250-snow ship with this

atmel-bootloader: appears to be a hack to get around the fact that you
can only specify one i2c address through the device tree.  I'm told
that sometimes this device shows up at a different address.  On x86
machines with this they use "i2c_new_probed_device" which allows you
to pass in a list of addresses, it seems.  I'm not sure how this
should really translate to the device tree.


-Doug
