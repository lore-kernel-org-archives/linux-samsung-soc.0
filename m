From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH] drm/exynos: add mic_bypass option for exynos542x fimd
Date: Fri, 12 Feb 2016 16:39:36 +0900
Message-ID: <CAPTzV16E1KT8_QW0qrZ+aRz+7Y+43hzBHbudzDPvJTO-SSRW6w@mail.gmail.com>
References: <1454162331-23555-1-git-send-email-parkch98@gmail.com>
	<56BC645D.4070902@samsung.com>
	<CAPTzV176ssWV60TnGNPkPOA3CTxTbSKEtCCzDxCdmRf8gEd6mA@mail.gmail.com>
	<56BD65EC.5050002@samsung.com>
Reply-To: chanho61.park@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:33878 "EHLO
	mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995AbcBLHjh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 02:39:37 -0500
Received: by mail-vk0-f41.google.com with SMTP id e185so55018788vkb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Feb 2016 23:39:37 -0800 (PST)
In-Reply-To: <56BD65EC.5050002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi,

On Fri, Feb 12, 2016 at 1:56 PM, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Chanho,
>
> There was a missing one so below is my review again.
>
> 2016=EB=85=84 02=EC=9B=94 11=EC=9D=BC 22:59=EC=97=90 Chanho Park =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Hi Inki,
>>
>> On Thu, Feb 11, 2016 at 7:37 PM, Inki Dae <inki.dae@samsung.com> wro=
te:
>>> Hi Chanho,
>>>
>>> 2016=EB=85=84 01=EC=9B=94 30=EC=9D=BC 22:58=EC=97=90 Chanho Park =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>> From: Chanho Park <chanho61.park@samsung.com>
>>>>
>>>> This patch adds a mic_bypass option to bypass the mic
>>>> from display out path. The mic(Mobile image compressor) compresses
>>>> RGB data from fimd and send the compressed data to the mipi dsi.
>>>> The bypass option can be founded from system register and the bit
>>>> of the option is 11.
>>>>
>>>> Cc: Inki Dae <inki.dae@samsung.com>
>>>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
>>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>>> ---
>>>>  .../devicetree/bindings/display/exynos/samsung-fimd.txt    |  2 +=
+
>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c                   | 14 +=
+++++++++++++
>>>>  2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/exynos/sams=
ung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung=
-fimd.txt
>>>> index 27c3ce0..7f90c4a 100644
>>>> --- a/Documentation/devicetree/bindings/display/exynos/samsung-fim=
d.txt
>>>> +++ b/Documentation/devicetree/bindings/display/exynos/samsung-fim=
d.txt
>>>> @@ -45,6 +45,8 @@ Optional Properties:
>>>>               Can be used in case timings cannot be provided other=
wise
>>>>               or to override timings provided by the panel.
>>>>  - samsung,sysreg: handle to syscon used to control the system reg=
isters
>>>> +- samsung,mic-bypass: bypass mic(mobile image compressor) from di=
splay path.
>
> mic-bypass is not really common property for fimd family so it's not =
correct for fimd device node has mic-bypass property.

According to user manual of exynos, the option has been introduced
since exynos5420.
The exynos5420 and exynos5422(5800) have a fimd controller not decon
display controller.

>
>>>> +                   This option is only available since exynos5420=
=2E
>>>>  - i80-if-timings: timing configuration for lcd i80 interface supp=
ort.
>>>>    - cs-setup: clock cycles for the active period of address signa=
l is enabled
>>>>                until chip select is enabled.
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gp=
u/drm/exynos/exynos_drm_fimd.c
>>>> index 70194d0..4fb2952 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>> @@ -94,6 +94,7 @@ struct fimd_driver_data {
>>>>       unsigned int lcdblk_offset;
>>>>       unsigned int lcdblk_vt_shift;
>>>>       unsigned int lcdblk_bypass_shift;
>>>> +     unsigned int lcdblk_mic_bypass_shift;
>>>>
>>>>       unsigned int has_shadowcon:1;
>>>>       unsigned int has_clksel:1;
>>>> @@ -140,6 +141,7 @@ static struct fimd_driver_data exynos5_fimd_dr=
iver_data =3D {
>>>>       .lcdblk_offset =3D 0x214,
>>>>       .lcdblk_vt_shift =3D 24,
>>>>       .lcdblk_bypass_shift =3D 15,
>>>> +     .lcdblk_mic_bypass_shift =3D 11,
>>>>       .has_shadowcon =3D 1,
>>>>       .has_vidoutcon =3D 1,
>>>>       .has_vtsel =3D 1,
>>>> @@ -162,6 +164,7 @@ struct fimd_context {
>>>>       u32                             i80ifcon;
>>>>       bool                            i80_if;
>>>>       bool                            suspended;
>>>> +     bool                            mic_bypass;
>>>>       int                             pipe;
>>>>       wait_queue_head_t               wait_vsync_queue;
>>>>       atomic_t                        wait_vsync_event;
>>>> @@ -461,6 +464,14 @@ static void fimd_commit(struct exynos_drm_crt=
c *crtc)
>>>>               return;
>>>>       }
>>>>
>>>> +     if (ctx->mic_bypass && ctx->sysreg && regmap_update_bits(ctx=
->sysreg,
>>>> +                             driver_data->lcdblk_offset,
>>>> +                             0x1 << driver_data->lcdblk_mic_bypas=
s_shift,
>>>> +                             0x1 << driver_data->lcdblk_mic_bypas=
s_shift)) {
>>>> +             DRM_ERROR("Failed to update sysreg for bypass mic.\n=
");
>>>> +             return;
>>>> +     }
>>>
>>> It'd better to consider mic path also because mic bypass bit of lcd=
blk could be true by bootloader. In this case, fimd driver wouldn't do =
anything if mic_bypass property isn't declared but the mic_bypass bit o=
f lcdblk register is still set to 1.
>>
>> Actually, I wanted to set the bit on kernel side even though it's no=
t
>> assigned from bootloader.
>> If the bootloader already set the bit, that means mic will be by-pas=
s
>> and we don't care about it from kernel side.
>> The option is useful when I want to skip the mic on the kernel side.
>>
>>>
>>> For this, I think you could check lcdblk_mic_pypass_shift to identi=
fy whether mic path is supported or not like below,
>>> if (ctx->lcdblk_mic_bypass_shift) {
>>
>> It causes all exynos5 fimd driver skips the mic from display path.
>> How about below patch instead of this?
>>
>> +       if (of_property_read_bool(dev->of_node, "samsung,mic-bypass"=
) &&
>> +           ctx->driver_data->lcdblk_mic_bypass_shift)
>> +               ctx->mic_bypass =3D true;
>
> So let's bypass mic path in default like lcdblk_bypass,

I'm not sure why the option is default for exynos542x fimd controller.
The reset value of the bit is 0. That means the mic bypass is not a
default option on chip-level.

>         /* set mic bypass selection */
>         if (ctx->has_mic_bypass && ctx->sysreg && regmap_update_bits(=
ctx->sysreg,
>                                 driver_data->lcdblk_offset,
>                                 0x1 << driver_data->lcdblk_mic_bypass=
_shift,
>                                 0x1 << driver_data->lcdblk_mic_bypass=
_shift)) {
>                 DRM_ERROR("Failed to update sysreg for mic bypass set=
ting.\n");
>                 return;
>         }
>
> For this, I added a new member, has_mic_by_pass, which means that lcd=
blk register has mic_bypass bit like has_vtsel.
Hmm. Like lcd_blk_bypass_shift, the option is configurable because
mic_by_pass_shift is not zero.
I think we don't need the new has_mic_bypass option.

>
> We could consider display path such as mic and mDNIe later using of_g=
raph concept below,
>         Documentation/devicetree/bindings/graph.txt

Yes. To use the mic on display path, we'll define the graph in the devi=
ce tree.
In case of not using the mic, however, we'll not define any graphs in t=
he dts.

I intended this patch is just providing configurable option from
device tree to skip mic from display path.

--=20
Best Regards,
Chanho Park
