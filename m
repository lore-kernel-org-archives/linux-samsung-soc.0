From: Inki Dae <inki.dae@samsung.com>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 07:44:59 +0900
Message-ID: <56F1CAEB.3080701@samsung.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <CAD=FV=XXESzA6n6MNEGH1Kbh7CeL8xWX8CifFLVf91+0JyFcJQ@mail.gmail.com>
 <56F19AC9.5060507@osg.samsung.com> <1919945.Y1tg0YzXlm@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37379 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322AbcCVWpF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2016 18:45:05 -0400
In-reply-to: <1919945.Y1tg0YzXlm@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, emil.l.velikov@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Kishon

+ Ajay kumar with Samsung email

Hi,

2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 07:12=EC=97=90 Heiko St=C3=BCbner=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hi,
>=20
> Am Dienstag, 22. M=C3=A4rz 2016, 16:19:37 schrieb Javier Martinez Can=
illas:
>> On 03/18/2016 07:53 PM, Doug Anderson wrote:
>>> On Thu, Mar 17, 2016 at 11:41 PM, Caesar Wang <caesar.upstream@gmai=
l.com>=20
> wrote:
>> Same here, this is the second time I tested this series (first time =
was
>> v6 on October 25 [2]) and I think that has been out there for too lo=
ng.
>>
>>> Tested-by: Douglas Anderson <dianders@chromium.org>
>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> So we have 3 tests (Doug, Caesar and me) for the Rockchip side as wel=
l as=20
> Javier for the Exynos side based on the most recent drm state.
>=20
> As said by a lot of people it would be cool to get this merged soon -=
=20
> hopefully directly after -rc1. The only remaining question is through=
 which=20
> tree it should go.
>=20
> I guess there are two basic options:
> - Inki takes the series - we could see the Rockchip-Ack being implied=
 but=20
> maybe Mark can provide an explicit one
> - Mark takes the series with an Ack from Inki for the shared parts
>=20
> Inki, Mark do you have a preference?

The problem would be that there is no drm bridge maintainer. I think th=
e most suitable person as the maintainer would be Ajay Kumar who is an =
author of drm bridge framework.
Of course, I could take them and have pull-request again. But it seems =
a little late. Dave had already pull-request.

To Ajay,
How about adding you as a drm bridge maintainer? DRM SoC driver maintai=
ners would need a person who can manage the drm bridge relevant pathes.

Thanks,
Inki Dae
=20
>=20
> Thanks
> Heiko
>=20
>=20
