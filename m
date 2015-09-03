From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 09/16] drm: rockchip: add bpc and color mode setting
Date: Thu, 3 Sep 2015 10:38:59 +0200
Message-ID: <20150903083857.GA3784@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087308-25455-1-git-send-email-ykk@rock-chips.com>
 <120097760.HO2inCimVA@phil>
 <55E659AC.9000402@rock-chips.com>
 <20150902083445.GA24654@ulmo.nvidia.com>
 <55E6C931.9090306@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8096 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904AbbICIjM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 04:39:12 -0400
In-Reply-To: <55E6C931.9090306@rock-chips.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.or

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 06:02:25PM +0800, Yakir Yang wrote:
> =E5=9C=A8 2015/9/2 16:34, Thierry Reding =E5=86=99=E9=81=93:
[...]
> >At the very least your code must compile when applied against a recent
> >upstream tree. I would also expect you to make sure the code works at
> >runtime, though, contrary to build testing, not everybody will be able
> >to verify that you've actually done so. It is ultimately your platform
> >maintainer's (i.e. Heiko's) responsibility to ensure that because they
> >will get to deal with user complaints if people can't run an upstream
> >kernel on the devices.
>=20
> Oh, first time to know this rule. So I should work on Heiko's github
> kernel branch at the first time to start send upstream.

It's usually not necessary to rebase on a specific platform tree. Most
platform trees should feed into linux-next anyway, so linux-next would
be the appropriate base in almost all cases.

Note, though, that that's only true if you expect somebody else to merge
your code. The reason is that whoever will end up applying your patches
will likely apply to a tree that feeds into linux-next, and that way you
both end up having roughly the same base.

On the other hand if you are a maintainer yourself you should be keeping
a branch based on the latest -rc1. That's especially important if your
tree feeds into linux-next, because basing on linux-next will break very
horribly that way.

So for this particular case I would expect either Mark or Inki to apply
these patches when they're ready. Their trees should be based on the
latest -rc1. At least the Exynos DRM tree feeds into linux-next, so you
should be fine if you use linux-next as a base.

Mark, have you ever considered having your tree added to linux-next?

I'm beginning to think that we need to make that a requirement for all
DRM drivers so that we can resolve integration issues early on rather
than Dave having to deal with them when he pulls code in.

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV6AcfAAoJEN0jrNd/PrOhVv0QAKs9UaQSTvlCqKRmYqZ3EXEc
IkR8+srSNYi9GaxcpeigYN76MM/1D9iUyWsiLChpZVoiaC2SGR2Eclq5cmHKH2Kb
ULcCLtkUOQ0cLq8G25NK4fo8vucLD2v0j31rCpmacrClrctcJYXJs03jyr5ASV0e
gEUHgoXNmMhdePSPWd9IywDzXRfxnW1Cx6oCXGzF997Tgu1mU6jpRebcdhcDIqEP
5DKfdNnrmkrQU9NXeSOwaVL9R5JGvPFyePSuQb39Xxop7szHvDRJ9WDj3IXqdAo1
4cr+wmnnJMy9VCmD7cDP07rECT9oRINyXztAbgDGE/xkWU88CcexHieStl3VvIi2
5Fnxo7oX47JWDyrhHXyKCddavXfsl2TBXs+4q6NuxApVznhAgsfim9/Gc8rnFIAk
Fh3nLwd8mUAMGAsSXb9rZDrefhtw9q6q9aV2eAkvnt+WPZkhdMy4Q/tBT00v52sf
vYyIwHIF6TexDrevFizzNSo6VfjhsJ54mzuqyp7jeHO8nBgUwazJuGfM9GN2s9UW
hNndXHSlm4feF4qLBsXUp/QyD1vd9S8hij0CRBwQmgQj8nnJ5yO5pPmz4q5rIQm9
tpoVgdxHy3DAvhHnV3jGhAaziquYbfhEeAUwx6o7VKVJ1KfxpK/E/EsYANXUgeTz
OEitKzNqydgJCx7B3eW0
=ckUH
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
