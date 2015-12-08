From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Tue, 08 Dec 2015 11:09:09 +0900
Message-ID: <56663BC5.3070505@samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <56658C78.8090509@osg.samsung.com>
 <CAAQKjZMgse2n0TcjLiBxDn6ddTNSaRKMxoBqU7u8u002W=hRWQ@mail.gmail.com>
 <566628EF.5090202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35482 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932193AbbLHCJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 21:09:14 -0500
In-reply-to: <566628EF.5090202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <daeinki@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>



2015=EB=85=84 12=EC=9B=94 08=EC=9D=BC 09:48=EC=97=90 Krzysztof Kozlowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 08.12.2015 00:36, Inki Dae wrote:
>> Hi Javier,
>>
>> 2015-12-07 22:41 GMT+09:00 Javier Martinez Canillas <javier@osg.sams=
ung.com>:
>>> Hello Inki,
>>>
>>> On 12/07/2015 09:52 AM, Inki Dae wrote:
>>>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>
>>>
>>> Thanks a lot for posting this patch.
>>>
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
>>>
>>> This tag was not in my original patch, it's true that I tested
>>> it but will someone believe me? ;)
>>
>> Oops. I confused you spread Reviewed-by and Tested-by here and there=
=2E
>> Don't worry about that. Will remove it if you don't give me Tested-b=
y.
>> :)
>=20
> Actually authorship (the "From") in this case means Tested-by. Author
> always tests the patch so it would look weird if we start adding
> tested-by to our own patches, right?
>=20
> Dear Inki,
> However the patch misses your SoB. You touched and sent it so please
> extend the SoB chain-of-blame.

Right. Missed.

Thanks,
Inki Dae

>=20
> Best regards,
> Krzysztof
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
