From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drm/panel: Add support for Chunghwa
 CLAA070WP03XG panel
Date: Tue, 6 Dec 2016 16:46:25 +0100
Message-ID: <20161206154625.GA28534@ulmo.ba.sec>
References: <1474311771-23321-1-git-send-email-ayaka@soulik.info>
 <1474311771-23321-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33105 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752820AbcLFPsj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 10:48:39 -0500
Content-Disposition: inline
In-Reply-To: <1474311771-23321-3-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, airlied@linux.ie, a.hajda@samsung.com, devicetree@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 03:02:51AM +0800, Randy Li wrote:
> The Chunghwa CLAA070WP03XG is a 7" 1280x800 panel, which can be
> supported by the simple panel driver.
>=20
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  .../display/panel/chunghwa,claa070wp03xg.txt       |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/chung=
hwa,claa070wp03xg.txt

Applied, thanks.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRt1OAAoJEN0jrNd/PrOhP4AP/2dSeLvsFL70tC23vFmNGVBV
sxsTAX6hVjcKNi9Texg+mCZo5dPIApBBrsLtuNMdW08IYuaZOe4oTY/EXhNvzCuP
ZV2C0F6uVScxD42RpdPO5D1NagcFxBALZ01d8oLg0J7drLsUCHBHofsFVO/C2PvJ
sTEgtR2SHpBl+wPc6ph8xV/C9kqE04wLnKIRZQ5v620tY64qPB4cWrPN6RY26SuW
i4kq7gpNY6InD5wJnPPoQOaJYcvKrWO3hqGSDO2sUzCT2aAhgzRXeED26Fia2Vpe
PHNcRZxQENovdHdlwoQDgy4L0JIduWeS5yKgt6m1+dl/JQSrTUHO2LwAHeAtMdQN
U0w7rO1UJEt6vUjGIC5vP5ri0FU9EYH93s/LOA/UFZ2ljaLhZUycxc0X6Lv5gMqK
PWTZzNC11wOFNJVaQbyK2uCNuYU4pd7rauNeiOczBU3zNcJ+j+kpoE6scvB681vb
c4zLQh9p54H+2q7v/aYyvhjW5gsM6R+YeBM54Cs3nnpC4Fr4pjYg6g/IQSXq/h+4
ZiXBRh3RJkNmKLm0INTmg9RuxTuwpemlJktY/2e8nQdYnMqoJk9sCmidrzcCi767
i9CAn6twfzC0bmqHfwI8vX4I+LZjdjYXud/CLUF1Qjn/WncyAXkmqosJFOANJpQl
73lyuHM8us9OuM5kP4zD
=PHIE
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
