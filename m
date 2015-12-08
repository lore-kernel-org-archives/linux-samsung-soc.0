From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Tue, 08 Dec 2015 11:13:33 +0900
Message-ID: <56663CCD.5090207@samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <5666283A.5@samsung.com> <56663384.8060708@osg.samsung.com>
 <566636A4.1050908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32778 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754652AbbLHCNf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 21:13:35 -0500
In-reply-to: <566636A4.1050908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com



2015=EB=85=84 12=EC=9B=94 08=EC=9D=BC 10:47=EC=97=90 Krzysztof Kozlowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 08.12.2015 10:33, Javier Martinez Canillas wrote:
>> Hello Krzysztof,
>>
>> On 12/07/2015 09:45 PM, Krzysztof Kozlowski wrote:
>>> On 07.12.2015 21:52, Inki Dae wrote:
>>>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>
>>>> The DT binding for the Exynos DRM Display Port (DP) driver isn't c=
onsistent
>>>> since it uses a phandle to describe the connection between the DP =
port and
>>>> the display panel but uses the OF graph ports and endpoints to des=
cribe the
>>>> connection betwen the DP port, a bridge chip and the panel.
>>>>
>>>> The Exynos DP driver and the DT binding have been changed to allow=
 also to
>>>> describe the DP port to panel connection using ports / endpoints (=
OF graph)
>>>> so this patch changes the Exynos5800 Peach Pi DT to make it consis=
tent with
>>>> the Exynos5420 Peach Pit that has a eDP to LVDS chip and uses OF g=
raph too.
>>>>
>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>> Reviewed-by: Inki Dae <inki.dae@samsung.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 15 ++++++++++++++-
>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Looks sensible:
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>
>>> Dependencies are not mentioned, does it depend on patch 1?
>>>
>>
>> Yes, it depends on patch 1/4 so it should be merged through the Exyn=
os DRM
>> tree to maintain bisectability. Inki's patch maintains the DT ABI ba=
ckward
>> compatibility though so another option is to wait until the DRM chan=
ge hit
>> mainline and then pick $SUBJECT.
>=20
> Thanks. We could also use a tag with DRM changes for samsung-soc but
> since I already flushed my queue for v4.5 I think it would be an
> overkill. From my point of view it can safely go through exynos-drm t=
ree.

I will pick it up to exynos-drm tree. :)

Thanks,
Inki Dae

>=20
> Best regards,
> Krzysztof
>=20
>=20
