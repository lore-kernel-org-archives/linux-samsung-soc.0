From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 28 Feb 2014 15:39:31 +0200
Message-ID: <53109193.3000604@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com> <53108FA0.4040903@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="cF11C8lwJM8WMCg76f93oljBterlDBcrT"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:49296 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752831AbaB1Njv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 08:39:51 -0500
In-Reply-To: <53108FA0.4040903@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--cF11C8lwJM8WMCg76f93oljBterlDBcrT
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 28/02/14 15:31, Tomi Valkeinen wrote:

> Compared to what I've done on OMAP, you don't seem to specify the video=

> inputs for the tc358764 at all. In this case it's obvious, as the chip
> is a child of the DSI master. But the chip could as well be controlled
> via i2c, and so be placed as a child of the i2c nodes.
>=20
> So even if the driver doesn't use it, maybe it would be more future
> proof to have both input and output endpoints for the tc358764?

Oh, and one addition: how me and Laurent see the DSI case (and other
similar ones), the child/parent relationship gives the control bus path,
and the video ports give the video data path.

So both are always needed. A DSI panel may be controlled via DSI, i2c,
spi, but the video path will always go from DSI master to the panel.

Or, as a theoretical panel, you could have a DSI controlled panel, being
a child of the DSI master, but the video data would come via, say,
parallel RGB. You can actually do that with some panels/encoders, even
if the concept is silly.

 Tomi



--cF11C8lwJM8WMCg76f93oljBterlDBcrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTEJGTAAoJEPo9qoy8lh71RckP/icrlE5FJgK0Uewo3eIESEPc
oJQh3AceTcn/OcAISmD6vsN5lTzfK6n3fWakgRrJiNSGFCIiPgOqz154Qf7aQs31
iSRD4GXNMvFubcyjzfWtHpPa8kqlO5Mf9VcPdjOyzTsam7uAlmXVDpBfvLQq9fE4
B2K2A8B7vHkebe3r26rDWCJnx7WM7PqY10LqEBjgUeo8k4hcvOpLaKOen3iiIdpE
Vb0Zm/qnH1h4qBre9hEse7mjdS3qeIsyfqGRBIJXKP2K/XtDfLj/sc0ntHiMA8uI
OcbUvv9S24UT6mdZ4hvWR/hEaEnNXYPKG6ao2Q7NHekq1GotoRrE2z0fpErg895w
slvYHAUTz/PAHiX972DsfVqfCguGuP6qaTPncr2fxJ2oMunXhYSmr+DXoTt1Vt3j
KZwx+//fGVsDlB2Fs5997yTTY02wGrTApEF+JlxotoV3X9lA4So5wzo5iM4w1Mre
DxC5ADswA256EFKn0VBJRyJs+Liu4HCcIp/a8vwql/Vj6TFtUzbz7bgYQM+38HVW
dumaS0n3hAmQD95GTSx21buo0rS76iIQiGTf4/QKMFu1mUiO6NmaJ3VqNFdG1vQh
j60F/hHcSBT1/HFK5Q854oBRIo3MKcnogG9wjijVdHjE57qtTjVsAL7B/1B8Y74l
6ucxcdAMRWg/gBEQu8wJ
=LRtp
-----END PGP SIGNATURE-----

--cF11C8lwJM8WMCg76f93oljBterlDBcrT--
