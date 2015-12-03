From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/exynos: dp: add of_graph dt binding support for
 panel
Date: Thu, 03 Dec 2015 11:11:20 +0900
Message-ID: <565FA4C8.4080502@samsung.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
 <565F0871.6080109@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35922 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757927AbbLCCLX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 21:11:23 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYR0165GFEXO820@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Dec 2015 11:11:21 +0900 (KST)
In-reply-to: <565F0871.6080109@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hi Javier,

2015=EB=85=84 12=EC=9B=94 03=EC=9D=BC 00:04=EC=97=90 Javier Martinez Ca=
nillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello Inki,
>=20
> On 12/02/2015 08:57 AM, Inki Dae wrote:
>> This patch adds of_graph dt binding support for panel device
>> and also keeps the backward compatibility.
>>
>=20
> You have to also update the DT binding doc which seems to be
> outdated already:
>=20
> Documentation/devicetree/bindings/display/exynos/exynos_dp.txt

Right. It should be updated.

>=20
>> i.e.,
>> The dts file for Exynos5800 based peach pi board
>> has a panel property so we need to keep the backward compatibility.
>>
>=20
> How did you test this patch?

I thought you will test it and give me tested-by because you commented =
like below,
" Assuming you can make a distinction if the endpoint is a panel or a b=
ridge,
then yes, I agree with the idea of the patch. Please feel free to cc me=
 if
you post such a patch and I'll gladly test it on my Exynos5800 Peach Pi=
=2E"

That is why I cced you. I really have no any Exynos5800 Peach Pi board.

Thanks,
Inki Dae

> =20
> Best regards,
>=20
