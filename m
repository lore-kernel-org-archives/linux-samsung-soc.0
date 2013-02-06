From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 1/3] drm/exynos: Get HDMI version from device tree
Date: Wed, 6 Feb 2013 11:01:55 -0800
Message-ID: <CAOesGMjBF0yk69BhA1ffduLNHtYiEEy5dAvrrbj0Nz4kRdQn_g@mail.gmail.com>
References: <1360107777-17490-1-git-send-email-seanpaul@chromium.org>
	<1360107777-17490-2-git-send-email-seanpaul@chromium.org>
	<5111A23F.50300@wwwdotorg.org>
	<CAOw6vb+W3phFDJXp3gCx7y0N7mF4o2DpEfTGuNT1pGdKqiCGTg@mail.gmail.com>
	<5111A6D9.7090700@wwwdotorg.org>
	<CAOw6vbKhsWp7VnqgvECd-P4e5okX6dwKn3P8+phfpG29rA+h7g@mail.gmail.com>
	<5111C67B.3060909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:55124 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754619Ab3BFTBz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 14:01:55 -0500
Received: by mail-ia0-f170.google.com with SMTP id k20so2029086iak.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 11:01:55 -0800 (PST)
In-Reply-To: <5111C67B.3060909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Sean Paul <seanpaul@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Stanislawski <t.stanislaws@samsung.com>, "kgene.kim" <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Olof Johansson <olofj@chromium.org>, linux-arm-kernel@lists.infradead.org, RAHUL SHARMA <rahul.sharma@samsung.com>

On Tue, Feb 5, 2013 at 6:56 PM, =EA=B9=80=EC=8A=B9=EC=9A=B0 <sw0312.kim=
@samsung.com> wrote:
>
>
> On 2013=EB=85=84 02=EC=9B=94 06=EC=9D=BC 09:56, Sean Paul wrote:
>> On Tue, Feb 5, 2013 at 4:42 PM, Stephen Warren <swarren@wwwdotorg.or=
g> wrote:
>>> On 02/05/2013 05:37 PM, Sean Paul wrote:
>>>> On Tue, Feb 5, 2013 at 4:22 PM, Stephen Warren <swarren@wwwdotorg.=
org> wrote:
>>>>> n 02/05/2013 04:42 PM, Sean Paul wrote:
>>>>>> Use the compatible string in the device tree to determine which
>>>>>> registers/functions to use in the HDMI driver. Also changes the
>>>>>> references from v13 to 4210 and v14 to 4212 to reflect the IP
>>>>>> block version instead of the HDMI version.
>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.t=
xt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>>>>>
>>>>> Binding looks sane to me.
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/=
drm/exynos/exynos_hdmi.c
>>>>>
>>>>>>  #ifdef CONFIG_OF
>>>>>>  static struct of_device_id hdmi_match_types[] =3D {
>>>>>>       {
>>>>>> -             .compatible =3D "samsung,exynos5-hdmi",
>>>>>> -             .data   =3D (void *)HDMI_TYPE14,
>>>>>> +             .compatible =3D "samsung,exynos4-hdmi",
>>>>>>       }, {
>>>>>>               /* end node */
>>>>>>       }
>>>>>
>>>>> Why not fill in all the "base" compatible values there (I think y=
ou need
>>>>> this anyway so that DTs don't all have to be compatible with
>>>>> samsung,exynos4-hdmi), with .data containing the HDMI_VER_EXYNOS*
>>>>> values, then ...
>>>>>
>>>>
>>>> At the moment, all DTs have to be compatible with exynos4-hdmi sin=
ce
>>>> it provides the base for the current driver. The driver uses 4210 =
and
>>>> 4212 to differentiate between different register addresses and
>>>> features, but most things are just exynos4-hdmi compatible.
>>>
>>> The DT nodes should include only the compatible values that the HW =
is
>>> actually compatible with. If the HW isn't compatible with exynos4-h=
dmi,
>>> that value shouldn't be in the compatible property, but instead wha=
tever
>>> the "base" value that the HW really is compatible with. The driver =
can
>>> support multiple "base" compatible values from this table.
>>>
>>
>> All devices that use this driver are compatible, at some level, with
>> exynos4-hdmi, so I think its usage is correct here.
>>
>>>>>> @@ -2218,17 +2217,18 @@ static int hdmi_probe(struct platform_de=
vice *pdev)
>>>>>
>>>>>> +
>>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos4=
210-hdmi"))
>>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS4210;
>>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos4=
212-hdmi"))
>>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS4212;
>>>>>> +     if (of_device_is_compatible(dev->of_node, "samsung,exynos5=
250-hdmi"))
>>>>>> +             hdata->version |=3D HDMI_VER_EXYNOS5250;
>>>>>
>>>>> Instead of that, do roughly:
>>>>>
>>>>>     match =3D of_match_device(hdmi_match_types, &pdev->dev);
>>>>>     if (match)
>>>>>         hdata->version |=3D (int)match->data;
>>>>>
>>>>> That way, it's all table-based. Any future additions to
>>>>> hdmi_match_types[] won't require another if statement to be added=
 to
>>>>> probe().
>>>>
>>>> I don't think it's that easy. of_match_device returns the first ma=
tch
>>>> from the device table, so I'd still need to iterate through the
>>>> matches. I could still break this out into a table, but I don't th=
ink
>>>> of_match_device is the right way to probe it.
>>>
>>> You shouldn't have to iterate over multiple matches. of_match_devic=
e()
>>> is supposed to return the match for the first entry in the compatib=
le
>>> property, then if there was no match, move on to looking at the nex=
t
>>> entry in the compatible property, etc. In practice, I think it's st=
ill
>>> not implemented quite correctly for this, but you can make it work =
by
>>> putting the newest compatible value first in the match table.
>>
>> I think the only way that works is if you hardcode the compatible
>> versions in the driver, like this:
>>
>> static struct of_device_id hdmi_match_types[] =3D {
>>         {
>>                 .compatible =3D "samsung,exynos5250-hdmi",
>>                 .data =3D (void *)(HDMI_VER_EXYNOS5250 | HDMI_VER_EX=
YNOS4212);
>>         }, {
>>                 .compatible =3D "samsung,exynos4212-hdmi",
>>                 .data =3D (void *)HDMI_VER_EXYNOS4212;
>>         }, {
>>                 .compatible =3D "samsung,exynos4210-hdmi",
>>                 .data =3D (void *)HDMI_VER_EXYNOS4210;
>>         }, {
>>                 /* end node */
>>         }
>> };
>
> Actually, I can't understand why there is HDMI_VER_EXYNOS5250 because=
 it
> is not used anywhere in your patch. I'm not sure I missed something f=
rom
> your v2 patch thread, but to me, just hdmi version or hdmi ip version
> can be used as data field of struct of_device_id as like your v2 patc=
h
> set. and then of_match_device() can be used without | in data field.
>
> If I have missed some point from v2 thread, please let me know.


Exactly. I think that's causing some of this confusion. It'd be easier
to just leave any 5250 reference out of this patch. The _only_ place
5250 should be used now is in the 5250 dtsi file, as the most specific
compatible field. Compatible there should be, in order:

5250, 4212, 4

(or maybe not 4 at all, if the driver can't successfully drive the
hardware in degraded mode using the HDMI 1.3 register maps, etc).

=2E.. But there's no need to reference it in the driver. It might be
useful in the future to set some quirk or feature bits, but until then
it's just there in case.


-Olof
