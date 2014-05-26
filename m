From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Mon, 26 May 2014 15:41:54 +0200
Message-ID: <20140526134153.GA2373@ulmo>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:59774 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310AbaEZNoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 09:44:24 -0400
Content-Disposition: inline
In-Reply-To: <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, djkurtz@chromium.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources, display timings and cpu mode timi=
ngs.
>=20
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3f=
a0.txt

You're totally confusing me here. Half of this patch series is about
adding i80 support to Exynos FIMD, and then you go and add what is
apparently a DSI peripheral driver here that's supposed to be used by
this new i80 support. Nothing I've been able to dig up indicates that
i80 or DSI are in anyway related.

Even the Exynos DSI Master bindings[0] say that these two are not at all
the same thing:

	port node:
	    - reg: (required) can be 0 for input RGB/I80 port or 1 for
	      DSI port;

Am I missing something here?

Thierry

[0]: https://www.kernel.org/doc/Documentation/devicetree/bindings/video/exy=
nos_dsim.txt

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg0ShAAoJEN0jrNd/PrOhq1sQAIYJIGlds6R9NjdR1R6lhrO7
ly7PjU2ToUtrJxkrCJOOMgg0DieBRWBXF8Q90GKRUQB6JPS4pUwnc9D9A3QwyixO
f1HMwhHodnxCR94PkbSD5x6+D05Hm6Yu+pepUbVpYvh9MpqbsRcXXUPesOexbWVS
ekDr9OTgosBtdijYXRYS11wowWoCJ0799SASGl/4v2B3+Hq0MEZQcV5iBfTrG1/A
PPQ2beC0mSTZgv/N4JSUrtjJ57+Zx5uSabmWEPx/z8r000F7XbfRh1EmzrVdrrhs
Np2/TsZty7AqJqWrxVnlymWUxjeo9Jzy+t0WjBNo8lSvxTKhFSm+OF1ox55OscNO
MQ6swV7Eutw16BPJh8FrLTFtpbF7KCKr4WMuS0vzxzrRLDyoKOjKoZ2r7IhDrXqK
crHvCuslVqCfdZV3NXEUmCztLjmJqPSvPY8pW9iHs0DnJ05s4wnEUwKOpB65u0e+
wVNTa0xW4sO2cqAlFvfzd6bRZ4UUceQixo27waZBt33G1R+QAHE7Wjl9aZ/0/EmY
IvfTI1b7NG3M614YfFljB+nGNZle8J5wyl5Jw+HJy6iWPJEhfD9KeQIaoWpq+XwU
f5kfERzTvawdWOjBCY1dUBCQYcBnubn1q+SDwWIScOKUUmLQJmaOI5u6j8tUjGnO
KUPU93umAHqeYUIBDG8X
=h0Co
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
