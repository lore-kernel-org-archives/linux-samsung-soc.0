From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Thu, 3 Sep 2015 10:47:37 +0200
Message-ID: <20150903084735.GB3784@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7272 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbbICIrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 04:47:48 -0400
In-Reply-To: <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists>

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2015 at 03:17:57PM -0500, Rob Herring wrote:
[...]
> Are there any eDP panels which don't have EDID and need panel details in DT?

Most panels need information other than EDID. They typically have some
requirements regarding the power up sequence that aren't to be found
anywhere in EDID or detectable by some other mechanism. A decision was
therefore made a long time ago to require panels to be listed in DT with
a specific compatible string. That way all of these details can be
stashed away in drivers that know how to deal with these kinds of
details.

Thierry

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV6AknAAoJEN0jrNd/PrOhqVMP/0f4ghiW+8HoQ0JALbS26XFA
d5U1bHzYuR3DXB6SJgPZsezuz313p6yPRANR8gScFUwd/mwKRIzdmxH/rzOpv5DK
BIOoFQl4q1xIY3vhPzIsjU/rTqXFQed7p2HO5tkVx+znLg+tYzrpcWeOz0C2VuH/
omJwf3h6AH9gduLXkEQOWxcqL/WQLFtOjMEqUi4um5uwPmVeC4w47GO6fEY+J+e2
hde8LA/fNz/+9fxz/JSGsNJgp9Pw2xp/a7E9fIe6jLnYTBOf44RZ0jvu2zBTtDVA
Itw/oBCNK4l34abEG3RjLPJUQT0harb18FN6G4SrgRCH+u+Hj3Iuh8CJGceSIuRe
z/w9/j/FWGIGm40Gj792Q82w87gARAPQz7iRZhOPGe7Ws62nFmCt2ooVFXgJRqGc
q2oCP+AWvqwU7f2LUQViDa8kTJ2+cfyyJ9BKD7+ZM2RkXjyMP5nIUhm5wYcUWJbC
NyiQ9P0vxqLZZ2Rnn5ucA7oeOxl2hFG5JGaoXeclt2Mrs36+4i9sANJT87PR2u+r
c613f1ipwCUZQSX5PdeMl3TWpiPsEZPSfOO4EpbJG3tccgBGXgAbpkunE1NYNuiu
b4yJaLVdSpLWczu8cEdH2U7tMiUnm7mEZkubSDeG4W4cM6oIbvXgRswiKQ0FtQ/u
0wTb+CsU/m7CiQ2sMhk7
=IyZq
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
