From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/5] regulator: of: Decrement refcount for suspend
 state nodes
Date: Wed, 22 Oct 2014 17:38:57 +0100
Message-ID: <20141022163857.GC2344@sirena.org.uk>
References: <1413816472-1895-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413816472-1895-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3WLtXmtPTeS+BWmV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413816472-1895-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--3WLtXmtPTeS+BWmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2014 at 04:47:48PM +0200, Javier Martinez Canillas wrote:
> of_get_regulation_constraints() calls of_get_child_by_name() to find the
> regulator-state-{mem,disk} child nodes for each regulator. This function
> increments the device node reference counter but this is not decremented
> once the function is done using the node.

Applied, thanks.

--3WLtXmtPTeS+BWmV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUR92gAAoJECTWi3JdVIfQpiAH/RamknwBmjvA4bzUyt0ejX2l
YvkOm/2ZvmC0WNGAFwfnRqWXAwnZ8xe6B8Ayff14KaF4WNZpcOuhizlQ6EYJgjan
NLKTpDY6UXvY8gruWnLXbCZbAfzx4ymgzMMsz271UfI0Qjk5EJYMjMn6j6Ndhq2b
sPWItMqUiekTOwO+2wYuGs10yjkdc2Zxx+o+m7HddE9soUdLVE27cZ8xkBz6CMyY
Gp+4381j++1vf3oxdmMwIFcgXibyjFPwXbdR3tz9ooK0uS0e/1jp55JKFDqYSqU/
1huLo0+93IRpoRLee13T/VM6YaQNb4SiISvhhwYvaN/H8viZOA4ySagOfcFELkY=
=ohGC
-----END PGP SIGNATURE-----

--3WLtXmtPTeS+BWmV--
