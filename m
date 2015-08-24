From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Mon, 24 Aug 2015 13:20:02 +0900
Message-ID: <55DA9B72.1030804@samsung.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
 <55DA8486.1000803@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55DA8486.1000803-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel@lists.i>
List-Id: linux-samsung-soc@vger.kernel.org

On 24.08.2015 11:42, Yakir Yang wrote:
> Hi Krzysztof,
>=20
> =E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wr=
ote:
>>>> Analogix dp driver is split from exynos dp driver, so we just
>>>> make an copy of exynos_dp.txt, and then simplify exynos_dp.txt
>>>>
>>>> Beside update some exynos dtsi file with the latest change
>>>> according to the devicetree binding documents.
>>> You can't just change the exynos bindings and break compatibility. =
Is
>>> there some agreement with exynos folks to do this?
>> No, there is no agreement. This wasn't even sent to Exynos maintaine=
rs.
>=20
> Sorry about this one, actually I have add Exynos maintainers in versi=
on
> 1 & version 2,
> but lose some maintainers in version 3, I would fix it in bellow vers=
ions.
>=20
>> Additionally the patchset did not look interesting to me because of
>> misleading subject - Documentation instead of "ARM: dts:".
>>
>> Yakir, please:
>> 1. Provide backward compatibility. Mark old properties as deprecated
>> but still support them.
>=20
> Do you mean that I should keep the old properties declare in exynos-d=
p.txt,
> but just mark them as deprecated flag.

That is one of ways how to do this. However more important is that
driver should still support old bindings so such code:

-       if (of_property_read_u32(dp_node, "samsung,color-space",
+       if (of_property_read_u32(dp_node, "analogix,color-space",

is probably wrong. Will the driver support old DTB in the same way as i=
t
was supporting before the change?

> Let me show same examples, make
> me understand your suggest rightly.

exynos-dp already contains deprecated properties. Other ways of doing
this would be:
Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
Documentation/devicetree/bindings/rtc/s3c-rtc.txt

It depends up to you. The "touchscreen" looks good because it organizes
old properties in a common section. In case of exynos-dp.txt you can ad=
d
at beginning of file information about new bindings and mark everything
deprecated.

>=20
> 1. "samsung,ycbcr-coeff" is abandoned in latest analogix-dp driver,
> absolutely
>     I should not carry this to analogix-dp.txt document. But I should
> keep this in
>     exynos-dp.txt document, and mark them with an little "deprecated"=
 flag.
>=20
> [Documentation/devicetree/bindings/video/exynos_dp.txt]
> Required properties for dp-controller:
>    [...]
>     -samsung,ycbcr-coeff (DEPRECATED):
>         YCbCr co-efficients for input video.
>             COLOR_YCBCR601 =3D 0, COLOR_YCBCR709 =3D 1
>=20
> Is it right ?

Yes, this is right.

>=20
>> 2. Separate all DTS changes to a separate patch, unless bisectabilit=
y
>> would be hurt. Anyway you should prepare it in a such way that
>> separation would be possible without breaking bisectability.
>=20
> So I should separate this patch into two parts, one is name "Document=
:",
> the other is "ARM: dts: ".

Yes.

>=20
> Honestly, I don't understand what the "bisectability" means in this c=
ase.

I was referring to bisectability in general. The patchset should be
fully bisectable which means that it does not introduce any issues
during "git bisect". This effectively means that at each intermediate
step (after applying each patch, one by one) every existing stuff works
the same as previously without any regression. Including booting with
old DTB.

>=20
>> 3. Use proper subject for the patch changing DTS. This is not
>> documentation change!
>=20
> Hmm... when I separate this patch into two parts, I though I can keep
> "Documentation" proper subject in this patch, and the other is the "A=
RM:
> dts"
> proper subject. Am I right ?

Yes, you're right.

>=20
>> 4. Please use script get_maintainers to obtain list of valid
>> maintainers and CC-them with at least cover letter and patches
>> requiring their attention.
>=20
> Yeah, thanks.

Sure. Now I found older versions of the patchset but previously there
were no changes to the bindings. Again the prefix in subject is
important to easily filter out and find necessary emails.

BTW, I like the patchset because I like in general works which merge
code and reduce duplicate stuff.

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
