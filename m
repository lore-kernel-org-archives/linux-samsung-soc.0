From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: add mic_bypass option for exynos542x fimd
Date: Fri, 12 Feb 2016 17:04:13 +0900
Message-ID: <56BD91FD.8010702@samsung.com>
References: <1454162331-23555-1-git-send-email-parkch98@gmail.com>
 <56BC645D.4070902@samsung.com>
 <CAPTzV176ssWV60TnGNPkPOA3CTxTbSKEtCCzDxCdmRf8gEd6mA@mail.gmail.com>
 <56BD65EC.5050002@samsung.com>
 <CAPTzV16E1KT8_QW0qrZ+aRz+7Y+43hzBHbudzDPvJTO-SSRW6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43386 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbcBLIEU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 03:04:20 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2F00IRWD365U20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 17:04:18 +0900 (KST)
In-reply-to: <CAPTzV16E1KT8_QW0qrZ+aRz+7Y+43hzBHbudzDPvJTO-SSRW6w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: chanho61.park@samsung.com
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Chanho,

2016=EB=85=84 02=EC=9B=94 12=EC=9D=BC 16:39=EC=97=90 Chanho Park =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hi,
>=20
> On Fri, Feb 12, 2016 at 1:56 PM, Inki Dae <inki.dae@samsung.com> wrot=
e:
>> Hi Chanho,
>>
>> There was a missing one so below is my review again.
>>
>> 2016=EB=85=84 02=EC=9B=94 11=EC=9D=BC 22:59=EC=97=90 Chanho Park =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hi Inki,
>>>
>>> On Thu, Feb 11, 2016 at 7:37 PM, Inki Dae <inki.dae@samsung.com> wr=
ote:
>>>> Hi Chanho,
>>>>
>>>> 2016=EB=85=84 01=EC=9B=94 30=EC=9D=BC 22:58=EC=97=90 Chanho Park =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>>> From: Chanho Park <chanho61.park@samsung.com>
>>>>>
>>>>> This patch adds a mic_bypass option to bypass the mic
>>>>> from display out path. The mic(Mobile image compressor) compresse=
s
>>>>> RGB data from fimd and send the compressed data to the mipi dsi.
>>>>> The bypass option can be founded from system register and the bit
>>>>> of the option is 11.
>>>>>
>>>>> Cc: Inki Dae <inki.dae@samsung.com>
>>>>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
>>>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>>>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>>>> ---
>>>>>  .../devicetree/bindings/display/exynos/samsung-fimd.txt    |  2 =
++
>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c                   | 14 =
++++++++++++++
>>>>>  2 files changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/exynos/sam=
sung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsun=
g-fimd.txt
>>>>> index 27c3ce0..7f90c4a 100644
>>>>> --- a/Documentation/devicetree/bindings/display/exynos/samsung-fi=
md.txt
>>>>> +++ b/Documentation/devicetree/bindings/display/exynos/samsung-fi=
md.txt
>>>>> @@ -45,6 +45,8 @@ Optional Properties:
>>>>>               Can be used in case timings cannot be provided othe=
rwise
>>>>>               or to override timings provided by the panel.
>>>>>  - samsung,sysreg: handle to syscon used to control the system re=
gisters
>>>>> +- samsung,mic-bypass: bypass mic(mobile image compressor) from d=
isplay path.
>>
>> mic-bypass is not really common property for fimd family so it's not=
 correct for fimd device node has mic-bypass property.
>=20
> According to user manual of exynos, the option has been introduced
> since exynos5420.

That is why samsung-fimd.txt is not correct place. samsung-fimd.txt des=
cribes hardware information for s3c24xx, s3c64xx also, which don't have=
 mic ip.

> The exynos5420 and exynos5422(5800) have a fimd controller not decon
> display controller.
>=20
>>
>>>>> +                   This option is only available since exynos542=
0.
>>>>>  - i80-if-timings: timing configuration for lcd i80 interface sup=
port.
>>>>>    - cs-setup: clock cycles for the active period of address sign=
al is enabled
>>>>>                until chip select is enabled.
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/g=
pu/drm/exynos/exynos_drm_fimd.c
>>>>> index 70194d0..4fb2952 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> @@ -94,6 +94,7 @@ struct fimd_driver_data {
>>>>>       unsigned int lcdblk_offset;
>>>>>       unsigned int lcdblk_vt_shift;
>>>>>       unsigned int lcdblk_bypass_shift;
>>>>> +     unsigned int lcdblk_mic_bypass_shift;
>>>>>
>>>>>       unsigned int has_shadowcon:1;
>>>>>       unsigned int has_clksel:1;
>>>>> @@ -140,6 +141,7 @@ static struct fimd_driver_data exynos5_fimd_d=
river_data =3D {
>>>>>       .lcdblk_offset =3D 0x214,
>>>>>       .lcdblk_vt_shift =3D 24,
>>>>>       .lcdblk_bypass_shift =3D 15,
>>>>> +     .lcdblk_mic_bypass_shift =3D 11,
>>>>>       .has_shadowcon =3D 1,
>>>>>       .has_vidoutcon =3D 1,
>>>>>       .has_vtsel =3D 1,
>>>>> @@ -162,6 +164,7 @@ struct fimd_context {
>>>>>       u32                             i80ifcon;
>>>>>       bool                            i80_if;
>>>>>       bool                            suspended;
>>>>> +     bool                            mic_bypass;
>>>>>       int                             pipe;
>>>>>       wait_queue_head_t               wait_vsync_queue;
>>>>>       atomic_t                        wait_vsync_event;
>>>>> @@ -461,6 +464,14 @@ static void fimd_commit(struct exynos_drm_cr=
tc *crtc)
>>>>>               return;
>>>>>       }
>>>>>
>>>>> +     if (ctx->mic_bypass && ctx->sysreg && regmap_update_bits(ct=
x->sysreg,
>>>>> +                             driver_data->lcdblk_offset,
>>>>> +                             0x1 << driver_data->lcdblk_mic_bypa=
ss_shift,
>>>>> +                             0x1 << driver_data->lcdblk_mic_bypa=
ss_shift)) {
>>>>> +             DRM_ERROR("Failed to update sysreg for bypass mic.\=
n");
>>>>> +             return;
>>>>> +     }
>>>>
>>>> It'd better to consider mic path also because mic bypass bit of lc=
dblk could be true by bootloader. In this case, fimd driver wouldn't do=
 anything if mic_bypass property isn't declared but the mic_bypass bit =
of lcdblk register is still set to 1.
>>>
>>> Actually, I wanted to set the bit on kernel side even though it's n=
ot
>>> assigned from bootloader.
>>> If the bootloader already set the bit, that means mic will be by-pa=
ss
>>> and we don't care about it from kernel side.
>>> The option is useful when I want to skip the mic on the kernel side=
=2E
>>>
>>>>
>>>> For this, I think you could check lcdblk_mic_pypass_shift to ident=
ify whether mic path is supported or not like below,
>>>> if (ctx->lcdblk_mic_bypass_shift) {
>>>
>>> It causes all exynos5 fimd driver skips the mic from display path.
>>> How about below patch instead of this?
>>>
>>> +       if (of_property_read_bool(dev->of_node, "samsung,mic-bypass=
") &&
>>> +           ctx->driver_data->lcdblk_mic_bypass_shift)
>>> +               ctx->mic_bypass =3D true;
>>
>> So let's bypass mic path in default like lcdblk_bypass,
>=20
> I'm not sure why the option is default for exynos542x fimd controller=
=2E
> The reset value of the bit is 0. That means the mic bypass is not a
> default option on chip-level.

That is because Exynos drm is not ready for mic support fully. As of no=
w, Exynos drm uses mic driver only for Exynos5433 SoC but not other SoC=
=2E
Do you know that? FIMDBYPASS bit of lcdblk register has 0 - Reserved no=
t FIMD bypass(in case of Exynos5422) in default.

>=20
>>         /* set mic bypass selection */
>>         if (ctx->has_mic_bypass && ctx->sysreg && regmap_update_bits=
(ctx->sysreg,
>>                                 driver_data->lcdblk_offset,
>>                                 0x1 << driver_data->lcdblk_mic_bypas=
s_shift,
>>                                 0x1 << driver_data->lcdblk_mic_bypas=
s_shift)) {
>>                 DRM_ERROR("Failed to update sysreg for mic bypass se=
tting.\n");
>>                 return;
>>         }
>>
>> For this, I added a new member, has_mic_by_pass, which means that lc=
dblk register has mic_bypass bit like has_vtsel.
> Hmm. Like lcd_blk_bypass_shift, the option is configurable because
> mic_by_pass_shift is not zero.
> I think we don't need the new has_mic_bypass option.

=46irst of all, it seems that adding mic_bypass property to fimd device=
 node is really wrong. If so, how can you let fimd driver know whether =
now SoC has mic bypass bit?

>=20
>>
>> We could consider display path such as mic and mDNIe later using of_=
graph concept below,
>>         Documentation/devicetree/bindings/graph.txt
>=20
> Yes. To use the mic on display path, we'll define the graph in the de=
vice tree.
> In case of not using the mic, however, we'll not define any graphs in=
 the dts.

However, fimd driver should know whether now SoC has mic bypass bit bec=
ause fimd driver is used for other SoC also, which have no mic ip.

Thanks,
Inki Dae

>=20
> I intended this patch is just providing configurable option from
> device tree to skip mic from display path.
>=20
