From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: Get HDMI version from device tree
Date: Wed, 06 Feb 2013 11:56:59 +0900
Message-ID: <5111C67B.3060909@samsung.com>
References: <1360107777-17490-1-git-send-email-seanpaul@chromium.org>
 <1360107777-17490-2-git-send-email-seanpaul@chromium.org>
 <5111A23F.50300@wwwdotorg.org>
 <CAOw6vb+W3phFDJXp3gCx7y0N7mF4o2DpEfTGuNT1pGdKqiCGTg@mail.gmail.com>
 <5111A6D9.7090700@wwwdotorg.org>
 <CAOw6vbKhsWp7VnqgvECd-P4e5okX6dwKn3P8+phfpG29rA+h7g@mail.gmail.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39348 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753390Ab3BFC4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 21:56:47 -0500
In-reply-to: <CAOw6vbKhsWp7VnqgvECd-P4e5okX6dwKn3P8+phfpG29rA+h7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Tomasz Stanislawski <t.stanislaws@samsung.com>, "kgene.kim" <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Olof Johansson <olofj@chromium.org>, linux-arm-kernel@lists.infradead.org, RAHUL SHARMA <rahul.sharma@samsung.com>, sw0312.kim@samsung.com



On 2013=EB=85=84 02=EC=9B=94 06=EC=9D=BC 09:56, Sean Paul wrote:
> On Tue, Feb 5, 2013 at 4:42 PM, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
>> On 02/05/2013 05:37 PM, Sean Paul wrote:
>>> On Tue, Feb 5, 2013 at 4:22 PM, Stephen Warren <swarren@wwwdotorg.o=
rg> wrote:
>>>> n 02/05/2013 04:42 PM, Sean Paul wrote:
>>>>> Use the compatible string in the device tree to determine which
>>>>> registers/functions to use in the HDMI driver. Also changes the
>>>>> references from v13 to 4210 and v14 to 4212 to reflect the IP
>>>>> block version instead of the HDMI version.
>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.tx=
t b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>>>>
>>>> Binding looks sane to me.
>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/d=
rm/exynos/exynos_hdmi.c
>>>>
>>>>>  #ifdef CONFIG_OF
>>>>>  static struct of_device_id hdmi_match_types[] =3D {
>>>>>       {
>>>>> -             .compatible =3D "samsung,exynos5-hdmi",
>>>>> -             .data   =3D (void *)HDMI_TYPE14,
>>>>> +             .compatible =3D "samsung,exynos4-hdmi",
>>>>>       }, {
>>>>>               /* end node */
>>>>>       }
>>>>
>>>> Why not fill in all the "base" compatible values there (I think yo=
u need
>>>> this anyway so that DTs don't all have to be compatible with
>>>> samsung,exynos4-hdmi), with .data containing the HDMI_VER_EXYNOS*
>>>> values, then ...
>>>>
>>>
>>> At the moment, all DTs have to be compatible with exynos4-hdmi sinc=
e
>>> it provides the base for the current driver. The driver uses 4210 a=
nd
>>> 4212 to differentiate between different register addresses and
>>> features, but most things are just exynos4-hdmi compatible.
>>
>> The DT nodes should include only the compatible values that the HW i=
s
>> actually compatible with. If the HW isn't compatible with exynos4-hd=
mi,
>> that value shouldn't be in the compatible property, but instead what=
ever
>> the "base" value that the HW really is compatible with. The driver c=
an
>> support multiple "base" compatible values from this table.
>>
>=20
> All devices that use this driver are compatible, at some level, with
> exynos4-hdmi, so I think its usage is correct here.
>=20
>>>>> @@ -2218,17 +2217,18 @@ static int hdmi_probe(struct platform_dev=
ice *pdev)
>>>>
>>>>> +
>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos42=
10-hdmi"))
>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS4210;
>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos42=
12-hdmi"))
>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS4212;
>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos52=
50-hdmi"))
>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS5250;
>>>>
>>>> Instead of that, do roughly:
>>>>
>>>>     match =3D of_match_device(hdmi_match_types, &pdev->dev);
>>>>     if (match)
>>>>         hdata->version |=3D (int)match->data;
>>>>
>>>> That way, it's all table-based. Any future additions to
>>>> hdmi_match_types[] won't require another if statement to be added =
to
>>>> probe().
>>>
>>> I don't think it's that easy. of_match_device returns the first mat=
ch
>>> from the device table, so I'd still need to iterate through the
>>> matches. I could still break this out into a table, but I don't thi=
nk
>>> of_match_device is the right way to probe it.
>>
>> You shouldn't have to iterate over multiple matches. of_match_device=
()
>> is supposed to return the match for the first entry in the compatibl=
e
>> property, then if there was no match, move on to looking at the next
>> entry in the compatible property, etc. In practice, I think it's sti=
ll
>> not implemented quite correctly for this, but you can make it work b=
y
>> putting the newest compatible value first in the match table.
>=20
> I think the only way that works is if you hardcode the compatible
> versions in the driver, like this:
>=20
> static struct of_device_id hdmi_match_types[] =3D {
>         {
>                 .compatible =3D "samsung,exynos5250-hdmi",
>                 .data =3D (void *)(HDMI_VER_EXYNOS5250 | HDMI_VER_EXY=
NOS4212);
>         }, {
>                 .compatible =3D "samsung,exynos4212-hdmi",
>                 .data =3D (void *)HDMI_VER_EXYNOS4212;
>         }, {
>                 .compatible =3D "samsung,exynos4210-hdmi",
>                 .data =3D (void *)HDMI_VER_EXYNOS4210;
>         }, {
>                 /* end node */
>         }
> };

Actually, I can't understand why there is HDMI_VER_EXYNOS5250 because i=
t
is not used anywhere in your patch. I'm not sure I missed something fro=
m
your v2 patch thread, but to me, just hdmi version or hdmi ip version
can be used as data field of struct of_device_id as like your v2 patch
set. and then of_match_device() can be used without | in data field.

If I have missed some point from v2 thread, please let me know.

Best Regards,
- Seung-Woo Kim

>=20
> In that case, it eliminates the benefit of using device tree to
> determine the compatible bits. I hope I'm just being thick and missin=
g
> something.
>=20
> Sean
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
