From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Wed, 30 Jul 2014 16:44:21 +0300
Message-ID: <53D8F6B5.4090903@ti.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com> <1405587689-1466-11-git-send-email-yj44.cho@samsung.com> <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com> <53CCD5A8.6090406@samsung.com> <20140721091917.GK8843@ulmo> <53CCF70A.5010403@samsung.com> <53CDDD61.6000005@samsung.com> <20140722074935.GC18258@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="B0EEds8a3xERofK0fIM8t0rQtppQBeHVn"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37420 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751292AbaG3Nos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 09:44:48 -0400
In-Reply-To: <20140722074935.GC18258@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, YoungJun Cho <yj44.cho@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mundt <paul.mundt@gmail.com>, Imre Deak <imre.deak@intel.com>

--B0EEds8a3xERofK0fIM8t0rQtppQBeHVn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/07/14 10:49, Thierry Reding wrote:

> But what I was trying to say is that if the Read IDs command isn't an
> official DCS command, maybe it would be a better idea to use the DDB
> instead. I assume that even if it isn't the same information it would
> at least be a superset and therefore a suitable replacement.

Only if DDB commands work on that panel =3D). Even if a panel supports
DCS, it doesn't mean it supports all the commands.

Also, does it really matter which one to use inside a panel driver? I
don't really see any pros nor cons with either option. Except, of
course, if using one of those makes the driver's code simpler.

 Tomi



--B0EEds8a3xERofK0fIM8t0rQtppQBeHVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2Pa1AAoJEPo9qoy8lh71Ei0P/0u7TZ5DRKYTKy3VFSA2/DSY
SiR7StXFy+qmQVYqxYvTz5uruQmoF5YLDMZZP9gm9zy5BC/cf5ASeK79XCpFU3BA
Xn8YN0zJmvpLesu5AWf2+7yxB+9Fhhtlp/o2WmfatT9eQ+k+w8GCq0a7AXHDrz1f
wKXCfTMticjlam2eCRUMSQhcf1ejt0r9rV996gQU9tQoJL2cKi9ELwixZdo1OfK/
5oAZl2tNVtanDetunCWGWZcRv2nC1K6710ja+qJWxLKbfqe7WktR9AbUmhN96P63
Mkd0UX6RqFBUZOtAyUxLzgRVhqN/XxIu3+je8xMcwf4046oYbL8bWNC300a6WDom
gRQp94C8lYZFzxt4AmLFyw1p/t5Cwkjb9w7Ukg9gHb5RaDNsmcJng0WgfmVc/gcz
jM1Xl7micbwJsywLVjJUwXcD4wOZD8AM0TtuSebFUplreV2BZM2YF62FXNK3neYI
t1J+yUTrsI97PNW8bRHoPrIoGnz8H28f3Q3BRJi/UMgcnIrKF0Zwc5c+RZ/C+Cr1
ZE7oJHcufRgddYjsE46wsOHTZf5Q7dtH8rDFNo1LkT4OYpeWx/DVPUdEJBaSewlr
ihcCZ8EW86BzwvmAiX1qmpGmwfw58mbE8On7GCUpjKKMGcLw/yosanvJKGRI35bU
bGcAUSNVqaH0+r5Pp52L
=48Yo
-----END PGP SIGNATURE-----

--B0EEds8a3xERofK0fIM8t0rQtppQBeHVn--
