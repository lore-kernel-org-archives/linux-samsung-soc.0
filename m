From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Mon, 4 Mar 2013 19:34:49 +0530
Message-ID: <CAJuYYwRSHYHs=0qOaWq7_U8+ARz-SYLQM5UAGTd8jTA_4x2wow@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:38922 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756683Ab3CDOEu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 09:04:50 -0500
Received: by mail-ia0-f182.google.com with SMTP id w21so2846672iac.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Mar 2013 06:04:49 -0800 (PST)
In-Reply-To: <1534249.MsU3ROUVJz@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Doug,

On 2 March 2013 17:18, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hello Doug,
>
> On Friday 01 of March 2013 16:19:39 Doug Anderson wrote:
>> Thomas and Tomasz,
>>
>> I'm trying to get my head wrapped around the state of pinctrl for
>> exynos5250.  I see various patches that have floated around at times
>> but it doesn't look like anything has landed.  It would be really nice
>> to get this resolved since I think it blocks getting eint support
>> landed for exynos5250 and that blocks getting many peripherals working
>> on the ARM Chromebook.
>
> It's great that finally someone noticed the problem (despite my comments
> to patches adding more and more cruft using the GPIO specifier hack).
>
>> I'm still a little new to the world on pinctrl so hopefully nothing
>> below is too stupidly wrong...
>
> It's always better to ask than to get something completely wrong.
>
>> Patches that seem to be relevant (NOTE: all of these need
>> "pinctrl-exynos5250" fixed to "exynos5250-pinctrl"):
>
>> pinctrl: exynos: add exynos5250 SoC specific data
>> - https://patchwork.kernel.org/patch/1871901/
>>
>> gpio: samsung: skip gpiolib registration if pinctrl support is enabled
>> for exynos5250
>> - https://patchwork.kernel.org/patch/1871911/
>>
>> arm: exynos: skip wakeup interrupt registration for exynos5250 if
>> pinctrl is enabled
>> - https://patchwork.kernel.org/patch/1871921/
>
> The 4 patches above are already merged in Kgene's for-next-next (for 3.10)
> branch.
>
>> ARM: dts: add pinctrl nodes for Exynos5250 SoC
>> - https://patchwork.kernel.org/patch/1871991/
>
> This one is not merged yet. Since I do not know much about Exynos 5250, I
> could not verify any hardware-specific details in the patch, just the
> general correctness of the patch.

This patch was not merged since individual drivers needed modification
without which it would break existing Exynos5250 based platforms.

>
>> --> NOTE: Appears to be missing pinctrl_1 and pinctrl_2.  That
>> prevents me from compiling with i2c arbitration patches landed since I
>> need gpf0.
>
> Indeed. I would prefer adding all of them at once.

Ok. I will repost this patch again with pinctrl_1 and pinctrl_2
included. I had not included this in the earlier patch since I was not
sure of the best pin grouping for the camera and c2c interface.

>
>> --> NOTE: Appears (IIRC) to have incorrect interrupt for pinctrl_3.  I
>> believe that 45 is pinctrl_1.  Maybe 3 is 47?
>
> I can't verify this, unfortunately.

The documentation does not state this clearly. I will recheck on this
and correct as needed.

>
>> --> NIT NOTE: It appears sd0_busN is strangely specified.
>> Specifically sd0_bus4 includes the pins for sd0_bus1 but sd0_bus8
>> doesn't.
>
> Yes, it is at least somewhat inconsitent. For now this is not really a
> problem, but eventually it will have to be sanitized. However, note that
> although sd0_bus8 has the same samsung,pin-function as sd0_bus4, this is
> no longer the case for sd2_bus8 and sd2_bus4.
>
> I would suggest making all the three separate from each other, so 1-bit
> bus node would just specify sd0_bus1, 4-bit would specify sd0_bus1 and
> sd0_bus4 and 8-bit all the three.

Ok. I will do this change in the next version of the patch.

>
>> ---
>>
>> I've got all of the above patches "fixed up" in my local tree
>> (including adding really basic support for pinctrl_1 and pinctrl_2).
>> ...but my machine doesn't boot all the way.  I think that's because
>> many of the peripherals don't yet understand pinctrl.  Specifically I
>> get delightful looking error messages at bootup that look like:
>>
>> [    0.440000] _gpio_request: gpio-36 (i2c-bus) status -16
>> [    0.445000] s3c-i2c s3c2440-i2c.0: gpio [36] request failed
>>
>> I then replaced some of the "muxing via GPIO" with "muxing via
>> pinctrl" for i2c parts, like:
>> -               gpios = <&gpb3 0 2 3 0>,
>> -                       <&gpb3 1 2 3 0>;
>> +               pinctrl-0 = <&i2c0_bus>;
>> +               pinctrl-names = "default";
>>
>> ...and I got rid of those errors, but it looks like we're missing
>> pinctrl support for the ever-important "dw_mmc".
>>
>> [    0.910000] Synopsys Designware Multimedia Card Interface Driver
>> [    0.915000] dwmmc_exynos dw_mmc.0: Using internal DMA controller.
>> [    0.920000] dwmmc_exynos dw_mmc.0: DW MMC controller at irq 107, 32
>> bit host data width, 128 deep fifo
>> [    0.930000] of_get_named_gpio_flags exited with status 40
>> [    0.935000] of_get_named_gpio_flags: can't parse gpios property
>> [    0.940000] dwmmc_exynos dw_mmc.0: invalid gpio: -2
>> [    0.945000] dwmmc_exynos: probe of dw_mmc.0 failed with error -22
>>
>> We also need it for "spi-s3c64xx.c" but that's less of a critical
>> component. [    0.405000] of_get_named_gpio_flags exited with status 18
>> [    0.410000] /spi@12d30000: could not get #gpio-cells for
>> /pinctrl@11400000/i2c0-bus
>> [    0.415000] of_get_named_gpio_flags: can't parse gpios property
>> [    0.420000] s3c64xx-spi exynos4210-spi.1: invalid gpio[1]: -22
>> [    0.425000] s3c64xx-spi: probe of exynos4210-spi.1 failed with error
>> -16
>>
>> Those are the drivers that have their muxing state defined using the
>> old hacky samsung gpio descriptor.
>>
>>
>> Hmmm, it also looks like I need to update other "gpio" references too
>> (gpio-keys, i2c-arbitrator, hpd-gpio) since the GPIO specifier has
>> changed now that it's based on pinmux.  I guess you either need to
>> move a whole architecture (all of exynos5250) at once since you can't
>> mix and match.
>
> Correct.
>
>>
>> IMHO that means we've got the following work ahead of us:
>> 1. Add pinctrl support to dw_mmc-exynos (with backward compability for
>> GPIO specifier)
>> 2. Add pinctrl support to spi-s3c64xx.c (with backward compability for
>> GPIO specifier)
>
> There is a patch that should be already merged that makes the driver core
> set default pinctrl state for a device before entering driver's probe
> callback.
>
> In case when the driver doesn't require more states than just the default
> one you don't have to add pinctrl support to the driver at all, just
> specify appropriate pinctrl properties in device tree (with only one state
> listed in pinctrl-names called "default").
>
> However in some drivers this might be prevented by legacy pin
> configuration code which would fail.
>
>> 3. In one fell swoop convert all exynos5 dts / dtsi files over to use
>> pinctrl since things will be broken with a "half" conversion.
>>
>> Assuming I'm understanding #3 above, I guess that means that I "NAK"
>> the "ARM: dts: add pinctrl nodes for Exynos5250 SoC" patch since it
>> doesn't include fixup for all of the exynos5250 platforms (smdk5250
>> and snow) out there.
>
> Yes, this seems reasonable.
>
>>
>> ---
>>
>> I'd appreciate any thoughts that you have.  I'd also appreciate a
>> timeframe for when this work will be picked back up, since the old
>> patches are 2.5 months old now...  I may be able to help a little
>> (especially with bits relevant to the ARM Chromebook) but I'm not sure
>> I can do all of the heavy lifting...  ...and I'd hate to rebase/repost
>> Thomas's patches myself without checking...
>
> AFAIK, Thomas had been doing something in this matter, but I haven't seen
> any progress since the discussion by the way of the patches you linked.

I have posted i2c pinctrl support patch based on LinusW's pin grab by
device core patch. If that is acceptable, I can post pinctrl support
patches for other other controllers as well.

>
>> NOTE: I've actually hacked something together that seems to get dw_mmc
>> happy with pinmuxing and I can boot the system, so I guess that proves
>> that the above can't all be wrong.  ;)
>
> Good. It would be great if we could finally move all the DT-enabled
> Samsung architectures to pin control and drop the hacky GPIO DT support.
>
> Best regards,
> Tomasz
>

Thanks,
Thomas.
