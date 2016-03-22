From: Inki Dae <inki.dae@samsung.com>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 08:54:15 +0900
Message-ID: <56F1DB27.4040001@samsung.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <1919945.Y1tg0YzXlm@diego> <56F1CAEB.3080701@samsung.com>
 <8949624.HmxDpZAlt2@diego> <56F1D0AD.8030905@samsung.com>
 <20160322233906.GP19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35360 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858AbcCVXyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2016 19:54:19 -0400
In-reply-to: <20160322233906.GP19428@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, emil.l.velikov@



2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 08:39=EC=97=90 Russell King - ARM=
 Linux =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On Wed, Mar 23, 2016 at 08:09:33AM +0900, Inki Dae wrote:
>> In this case, someone else may send an email again like you "who is =
going to merge?"
>> That would be why we need a maintainer.
>>
>> drm panel is already managed well by Thierry Reding without such con=
fusion.=20
>=20
> You don't need a maintainer for every subdirectory just because it's
> a subdirectory...
>=20
> Sometimes, having too many maintainers adds beaurocracy which becomes

Yes, but... if there is no someone who is responsible for maintainershi=
p, then we would receive such emails like Heiko sent "who is going to m=
erge"=20
I don't also want adding many maintainers unnecessary but drm bridge - =
although the framework is a thin and small - is used *over the ARM SoC*=
 so that many confusions may happen for upstream.

So although it's small framework or just subdirectory, we would need so=
meone who can manage the framework to avoid further confusion if necess=
ary.

Thanks,
Inki Dae

> counter-productive.  dw_hdmi seems to be adequately managed so far
> without there needing to be a "DRM bridge maintainer".
>=20
