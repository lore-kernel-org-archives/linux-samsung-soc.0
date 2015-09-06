From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 09/16] drm: rockchip: add bpc and color mode setting
Date: Sun, 06 Sep 2015 10:06:44 +0800
Message-ID: <55EB9FB4.3020201@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441087308-25455-1-git-send-email-ykk@rock-chips.com> <120097760.HO2inCimVA@phil> <55E659AC.9000402@rock-chips.com> <20150902083445.GA24654@ulmo.nvidia.com> <55E6C931.9090306@rock-chips.com> <20150903083857.GA3784@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:41975 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbbIFCHH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Sep 2015 22:07:07 -0400
In-Reply-To: <20150903083857.GA3784@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger

Hi Thierry,

=E5=9C=A8 09/03/2015 04:38 PM, Thierry Reding =E5=86=99=E9=81=93:
> On Wed, Sep 02, 2015 at 06:02:25PM +0800, Yakir Yang wrote:
>> =E5=9C=A8 2015/9/2 16:34, Thierry Reding =E5=86=99=E9=81=93:
> [...]
>>> At the very least your code must compile when applied against a rec=
ent
>>> upstream tree. I would also expect you to make sure the code works =
at
>>> runtime, though, contrary to build testing, not everybody will be a=
ble
>>> to verify that you've actually done so. It is ultimately your platf=
orm
>>> maintainer's (i.e. Heiko's) responsibility to ensure that because t=
hey
>>> will get to deal with user complaints if people can't run an upstre=
am
>>> kernel on the devices.
>> Oh, first time to know this rule. So I should work on Heiko's github
>> kernel branch at the first time to start send upstream.
> It's usually not necessary to rebase on a specific platform tree. Mos=
t
> platform trees should feed into linux-next anyway, so linux-next woul=
d
> be the appropriate base in almost all cases.
>
> Note, though, that that's only true if you expect somebody else to me=
rge
> your code. The reason is that whoever will end up applying your patch=
es
> will likely apply to a tree that feeds into linux-next, and that way =
you
> both end up having roughly the same base.
>
> On the other hand if you are a maintainer yourself you should be keep=
ing
> a branch based on the latest -rc1. That's especially important if you=
r
> tree feeds into linux-next, because basing on linux-next will break v=
ery
> horribly that way.
>
> So for this particular case I would expect either Mark or Inki to app=
ly
> these patches when they're ready. Their trees should be based on the
> latest -rc1. At least the Exynos DRM tree feeds into linux-next, so y=
ou
> should be fine if you use linux-next as a base.

Glad to know this, thanks,
- Yakir

>
> Mark, have you ever considered having your tree added to linux-next?
>
> I'm beginning to think that we need to make that a requirement for al=
l
> DRM drivers so that we can resolve integration issues early on rather
> than Dave having to deal with them when he pulls code in.
>
> Thierry
