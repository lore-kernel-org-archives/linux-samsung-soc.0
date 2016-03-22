From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix Core Display Port Driver]
Date: Tue, 22 Mar 2016 23:52:47 +0100
Message-ID: <8949624.HmxDpZAlt2@diego>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com> <1919945.Y1tg0YzXlm@diego> <56F1CAEB.3080701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54795 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752551AbcCVWxC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2016 18:53:02 -0400
In-Reply-To: <56F1CAEB.3080701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, emil.l.velikov@gmail.com

Am Mittwoch, 23. M=C3=A4rz 2016, 07:44:59 schrieb Inki Dae:
> + Ajay kumar with Samsung email
>=20
> Hi,
>=20
> 2016=EB=85=84 03=EC=9B=94 23=EC=9D=BC 07:12=EC=97=90 Heiko St=C3=BCbn=
er =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > Hi,
> >=20
> > Am Dienstag, 22. M=C3=A4rz 2016, 16:19:37 schrieb Javier Martinez C=
anillas:
> >> On 03/18/2016 07:53 PM, Doug Anderson wrote:
> >>> On Thu, Mar 17, 2016 at 11:41 PM, Caesar Wang
> >>> <caesar.upstream@gmail.com>
> >=20
> > wrote:
> >> Same here, this is the second time I tested this series (first tim=
e was
> >> v6 on October 25 [2]) and I think that has been out there for too =
long.
> >>=20
> >>> Tested-by: Douglas Anderson <dianders@chromium.org>
> >>=20
> >> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> >=20
> > So we have 3 tests (Doug, Caesar and me) for the Rockchip side as w=
ell as
> > Javier for the Exynos side based on the most recent drm state.
> >=20
> > As said by a lot of people it would be cool to get this merged soon=
 -
> > hopefully directly after -rc1. The only remaining question is throu=
gh
> > which
> > tree it should go.
> >=20
> > I guess there are two basic options:
> > - Inki takes the series - we could see the Rockchip-Ack being impli=
ed but
> > maybe Mark can provide an explicit one
> > - Mark takes the series with an Ack from Inki for the shared parts
> >=20
> > Inki, Mark do you have a preference?
>=20
> The problem would be that there is no drm bridge maintainer. I think =
the
> most suitable person as the maintainer would be Ajay Kumar who is an =
author
> of drm bridge framework. Of course, I could take them and have pull-r=
equest
> again. But it seems a little late. Dave had already pull-request.

I really meant that for 4.7, not for the current merge window. I just w=
ant to=20
make sure it goes into a maintainer tree shortly after v4.6-rc1, before=
=20
something else changes the exynos-dp again :-) .


> To Ajay,
> How about adding you as a drm bridge maintainer? DRM SoC driver maint=
ainers
> would need a person who can manage the drm bridge relevant pathes.

The previous example (dw_hdmi generalization between imx and rockchip) =
did=20
just go through the imx tree. So either the Samsung or Rockchip drm-tre=
es=20
might be enough?


Heiko
