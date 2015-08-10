From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Mon, 10 Aug 2015 12:00:57 +0200
Message-ID: <20150810100055.GB7850@ulmo.nvidia.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
 <1438944380-18897-1-git-send-email-ykk@rock-chips.com>
 <1730542.s7otqjtiXD@diego>
 <55C57D7E.6080800@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:19181 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932373AbbHJKCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 06:02:03 -0400
In-Reply-To: <55C57D7E.6080800@rock-chips.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynumb@gmail.com, dri-devel@lis

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 08, 2015 at 11:54:38AM +0800, Yakir Yang wrote:
[...]
>         edp: edp@ff970000 {
[...]
>                 hsync-active-high = <0>;
>                 vsync-active-high = <0>;
>                 interlaced = <0>;

These look like they should come from the display mode definition (EDID)
rather than device tree.

>                 samsung,color-space = <0>;
>                 samsung,dynamic-range = <0>;
>                 samsung,ycbcr-coeff = <0>;

I think these should also come from EDID, though I'm not sure if we
store this in internal data structures yet.

>                 samsung,color-depth = <1>;

This is probably drm_display_info.bpc.

>                 samsung,link-rate = <0x0a>;
>                 samsung,lane-count = <1>;

And these should really be derived from values in the DPCD and adjusted
(if necessary) during link training.

Why would you ever want to hard-code the above?

> >>+	dp->clk_24m = devm_clk_get(dev, "clk_dp_24m");
> >Same here, maybe "dp_24m".
> Like my previous reply. And actually as those two clocks all have
> a common prefix "SCLK" in rk3288 clock tree, I thinkt we can name
> them to "sclk_dp" & "sclk_dp_24m", is it okay ?

I don't think there's a need for these common prefixes. The names here
are identifiers in the context of the IP block, so any SoC-specific
prefixes are irrelevant. Also they do appear, in DT and in code, in the
context of clocks already, so "sclk_" or "clk_" is completely redundant
in these names.

Thierry

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVyHZUAAoJEN0jrNd/PrOhp5oP/iSeBPiHm7x7u6b+dP6VW1rz
9MLo0o6YJf/HnnwpPdv+2PPOXVfKdTUWoeaHhqvgnW7BkOo2/qFwYOzD4c/4qRUe
MNnHYDZfktMNHz40I2D1geNQRVHizI44UCixnRvU+7fFE0AgetyA1wVG8JHf/0Ja
xh3y8Jgytvy5qR9RDUlGHhS4NBn40dk0m3NKgoXQ2JD8RFDhyCNGUv12e0mjh3qx
uULsAHgCSzYa1uEmE8FuWYFmsdJKXI8NxP5It8WSLCG3qpRf/MMCL+0RSspPer7P
AgzzCjYtRqViBUcPCWyblBf3nUdQH+PovitZ9lyPBFbHV4PPaxPn1d9MKDL3jlC6
uMf1wrd7LiV0XLhlvpZOum1M0SqAkpau/2LMyrERSYz0SE88VTSf4mRi6SIvZnLK
LK6sIRldrTWCsZiVOumOcI1JfXzqXvxdfZ7YMq/c0tDCd+J/uBhi4E+fFFRjJq4b
ht20wyT9q+wDFvspmdwL2AkTC4AerqnuBPCHa3J6uBzoV6TZnuVXHS4YXz6CnyC8
wlROOfyfjIUjLk9I/MYUMdziI2Y9vPdAB6AnbpR0QAKarwSsmji8fGgg3meM2xxo
HprjWx/wyD6HRbxTWwWx+IrcU22fubC4gVy0PM5gFmdbMOdDE1CsJ/Z8fBEiGLbh
DJd3Ml19dZmrraR7gmkH
=hkRn
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
