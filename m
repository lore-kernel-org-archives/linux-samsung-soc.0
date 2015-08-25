From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 11:58:19 +0200
Message-ID: <20150825095817.GC14034@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7748 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932068AbbHYJ7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 05:59:46 -0400
In-Reply-To: <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, Takashi Iwai <tiwai@suse.de>, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, dri-devel@lists.freedesktop.org

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2015 at 09:50:34AM -0500, Yakir Yang wrote:
[...]
> +	-analogix,color-space:
> +		input video data format.
> +			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2

I don't think DT is an appropriate place to set this. To my knowledge
this depends on the display and/or mode, so I don't think hard-coding
it here is the right thing to do.

Thierry

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3Dw3AAoJEN0jrNd/PrOhGrwP/jxesiLBaWdKfQFx/BVhH8BD
A6KSCSt6hKpAqQ9b2vm6//KhmWIkZElEe/dJP3+/83h0aN3fIKcO036VrJASJPuK
5+0MzPw/et+A8RfrYbgGChK1jq7DsNpJt60VV8MUkesFcAmxyUMLnMyRibHdlK6F
wuwN/66ddyl1Hj3B6p2N1Ut4E8Pl1tUaf2zzLoGbN5RtW8/cYrjbeXY89w2PLMQS
EffX825BtK0vg9bsAL+CNy4rT02ptJXtzVlhNROtubfxGpUkKD45idxT7oMcB3Fl
gzeMOjPvHgjfILJIVOunHR/EWN3kWawvKo+kcQsy7t//SKT8CbUfFQiWmqX+VlUG
3iCpAnPZYn9DxwbR8CefG+n5rZobkru30mghjdoGcl0DSMjz4ReTw3pCSb7c2RiI
WFay+e/JAQOicAkPg6b42BgHJo7C+PBhSmqnaPvM1sSAobfjbK+UQ8ik8UHiJVgf
8vaGox1wwG3mJQg4EFr1N1m6hCbWPTgqnKRO8Bh1FIJr7F7u8GdiqU7VUv0xx9Z0
NWoHwf03/Pr/+dZ9qqzYiTVw1zm6mms2Hz9dRRgFFYwQ+JhqqKgFulrobxNCJFK5
zeA2OBQE7o9uRqg8DikYLf8Gj+QBtHqMHosQBHvc7YfVw0e6gNc5hEeO+UBv46y8
ESrsRdjStmZ+ULRo//ml
=LWKC
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
