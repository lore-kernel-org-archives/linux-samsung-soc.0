From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 1/2] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Mon, 7 Dec 2015 09:17:16 -0300
Message-ID: <566578CC.2040304@osg.samsung.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
 <565F0871.6080109@osg.samsung.com> <565FA4C8.4080502@samsung.com>
 <56603E2C.2090005@osg.samsung.com>
 <CAAQKjZP5oK3o6LLbTb2UERXw+x0E=ZjWB+E-yUrthHd3VzTd2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:40919 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932224AbbLGMRW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 07:17:22 -0500
In-Reply-To: <CAAQKjZP5oK3o6LLbTb2UERXw+x0E=ZjWB+E-yUrthHd3VzTd2g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

[adding Krzysztof and Kukjin to cc list]

Hello Inki,

On 12/06/2015 01:25 PM, Inki Dae wrote:
> Hi Javier,
>=20
> 2015-12-03 22:05 GMT+09:00 Javier Martinez Canillas <javier@osg.samsu=
ng.com>:
>>
>> Hello Inki,
>>
>> On 12/02/2015 11:11 PM, Inki Dae wrote:
>>> Hi Javier,
>>>
>>> 2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 00:04=EC=97=90 Javier Martine=
z Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>> Hello Inki,
>>>>
>>>> On 12/02/2015 08:57 AM, Inki Dae wrote:
>>>>> This patch adds of_graph dt binding support for panel device
>>>>> and also keeps the backward compatibility.
>>>>>
>>>>
>>>> You have to also update the DT binding doc which seems to be
>>>> outdated already:
>>>>
>>>> Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>>>
>>> Right. It should be updated.
>>>
>>
>> Great, I see you already posted that.
>>
>>>>
>>>>> i.e.,
>>>>> The dts file for Exynos5800 based peach pi board
>>>>> has a panel property so we need to keep the backward compatibilit=
y.
>>>>>
>>>>
>>>> How did you test this patch?
>>>
>>> I thought you will test it and give me tested-by because you commen=
ted like below,
>>> " Assuming you can make a distinction if the endpoint is a panel or=
 a bridge,
>>> then yes, I agree with the idea of the patch. Please feel free to c=
c me if
>>> you post such a patch and I'll gladly test it on my Exynos5800 Peac=
h Pi."
>>>
>>> That is why I cced you. I really have no any Exynos5800 Peach Pi bo=
ard.
>>>
>>
>> Yes, but if you didn't test a patch, then it should be marked with a=
 RFT
>> prefix in the subject line or at least mention that needs testing si=
nce
>> you lack the HW to test. I've no way to know if you have another boa=
rd
>> with a similar design :)
>>
>> But what I meant is how the patch is supposed to be tested since the=
re
>> ins't a change in the Exynos5800 Peach Pi DTS? We can of course test
>> that doesn't break backward compatibility but we don't have a way to
>> test the actual change.
>>
>> So I tested with the patch following patch [0] and things are workin=
g
>> correctly. Please include that patch in your series.
>=20
> Will pick it up. And  I commented on below your patch.
>

Ok, you need an ack from Krzysztof / Kukjin before picking the patch
though and cc them if you are planning to repost the whole series.

Another option is to wait until your Exynos DRM patches hit mainline
and then the DTS change can be posted separately.
=20
>>
>> I've some comments on your patch though but I'll comment on your las=
test
>> version.
>>
>>> Thanks,
>>> Inki Dae
>>>
>>>>
>>>> Best regards,
>>>>
>>
>> Best regards,
>> --
>> Javier Martinez Canillas
>> Open Source Group
>> Samsung Research America
>>
>> [0]:
>> From 644bab7949ac17a8d42ca0cf36cd55d61bc88928 Mon Sep 17 00:00:00 20=
01
>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>> Date: Thu, 3 Dec 2015 09:32:17 -0300
>> Subject: [PATCH 1/1] ARM: dts: Use OF graph for DP to panel connecti=
on in
>>  exynos5800-peach-pi
>>
>> The DT binding for the Exynos DRM Display Port (DP) driver isn't con=
sistent
>> since it uses a phandle to describe the connection between the DP po=
rt and
>> the display panel but uses the OF graph ports and endpoints to descr=
ibe the
>> connection betwen the DP port, a bridge chip and the panel.
>>
>> The Exynos DP driver and the DT binding have been changed to allow a=
lso to
>> describe the DP port to panel connection using ports / endpoints (OF=
 graph)
>> so this patch changes the Exynos5800 Peach Pi DT to make it consiste=
nt with
>> the Exynos5420 Peach Pit that has a eDP to LVDS chip and uses OF gra=
ph too.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/bo=
ot/dts/exynos5800-peach-pi.dts
>> index 7b018e451880..9c6fd7314ee0 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -122,6 +122,12 @@
>>                 compatible =3D "auo,b133htn01";
>>                 power-supply =3D <&tps65090_fet6>;
>>                 backlight =3D <&backlight>;
>> +
>> +               port {
>> +                       panel_in: endpoint {
>> +                               remote-endpoint =3D <&dp_out>;
>> +                       };
>> +               };
>>         };
>>
>>         mmc1_pwrseq: mmc1_pwrseq {
>> @@ -148,7 +154,14 @@
>>         samsung,link-rate =3D <0x0a>;
>>         samsung,lane-count =3D <2>;
>>         samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
>> -       panel =3D <&panel>;
>> +
>> +       ports {
>> +               port@0 {
>=20
> As Rob commented before, I will pick it up removing @0 if you are ok.
>

Ok, it is true that there isn't an #address-cells, #size-cells and reg
properties since there is a single port so I guess the @0 is arbitrary
here so it doesn't represent a proper unit-address and can be removed.
=20
> Thanks,
> Inki Dae
>=20
>> +                       dp_out: endpoint {
>> +                               remote-endpoint =3D <&panel_in>;
>> +                       };
>> +               };
>> +       };
>>  };
>>
>>  &fimd {
>> --
>> 2.4.3
>>

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
