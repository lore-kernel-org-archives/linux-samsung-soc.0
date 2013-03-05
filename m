From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Wed, 6 Mar 2013 05:19:47 +0530
Message-ID: <CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:57099 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752888Ab3CEXtr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 18:49:47 -0500
Received: by mail-ie0-f179.google.com with SMTP id k11so8538322iea.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 15:49:47 -0800 (PST)
In-Reply-To: <CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

On 6 March 2013 04:59, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> Thanks for your response.
>
>
> On Sat, Mar 2, 2013 at 3:48 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>
>> The 4 patches above are already merged in Kgene's for-next-next (for 3.10)
>> branch.
>
> Excellent.  I see them now.  I haven't yet seen them show up in
> linux-next (which is where I tend to look first), though...
>
>>> ARM: dts: add pinctrl nodes for Exynos5250 SoC
>>> - https://patchwork.kernel.org/patch/1871991/
>>
>> This one is not merged yet. Since I do not know much about Exynos 5250, I
>> could not verify any hardware-specific details in the patch, just the
>> general correctness of the patch.
>
> OK, good.  That means you guys came to the same conclusions that I did.  :)
>
>>> IMHO that means we've got the following work ahead of us:
>>> 1. Add pinctrl support to dw_mmc-exynos (with backward compability for
>>> GPIO specifier)
>>> 2. Add pinctrl support to spi-s3c64xx.c (with backward compability for
>>> GPIO specifier)
>>
>> There is a patch that should be already merged that makes the driver core
>> set default pinctrl state for a device before entering driver's probe
>> callback.
>>
>> In case when the driver doesn't require more states than just the default
>> one you don't have to add pinctrl support to the driver at all, just
>> specify appropriate pinctrl properties in device tree (with only one state
>> listed in pinctrl-names called "default").
>>
>> However in some drivers this might be prevented by legacy pin
>> configuration code which would fail.
>
> Nice to know about.  In the very least I'm pretty sure that we'll need
> a patch to make the GPIO settings optional.  Looking at
> dw_mci_exynos_setup_bus it's a fatal error if the GPIOs are missing.
> The dw_mmc stuff will also be interesting since we'll need to figure
> out if the muxing needs to be specified on a per-slot level.  I think
> that most of the automatic stuff won't work in that case.
>
> It sounds like Thomas is planning on taking this on?

Hi Doug,

Yes, I am currently held up with supporting default pin states at slot
level. One option that could be considered is to list out the default
pin states for all slots in the parent node of the slots. So it would
be something like below as an example.

        dwmmc2@12220000 {
               <....>

                pinctrl-names = "slot0-default", "slot1-default";
                pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
                pinctrl-1 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4 &sd2_bus8>;

                slot@0 {
                        reg = <0>;
                        bus-width = <4>;
                        disable-wp;
                };

                slot@1 {
                        reg = <0>;
                        bus-width = <8>;
                        disable-wp;
                };
        };

Then, during the initial slot setup stage, the driver, knowing the
current slot number that is being setup, can setup the pin state for
the particular slot using the devm_pinctrl_get_select API. pinctrl
subsystem would not setup the default pin state in this case.

Does this look like a hack? For now, I have prepared patches without
this approach, since Exynos5250 has just one slot, I have just listed
only one default pin state, which the pinctrl framework helps to setup
during driver bind.

Thanks,
Thomas.

>
> -Doug
