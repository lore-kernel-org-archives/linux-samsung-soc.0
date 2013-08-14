From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V4 0/4] Add i2s support on smdk5420
Date: Wed, 14 Aug 2013 10:25:27 +0200
Message-ID: <6538092.D4LPomiMyc@flatron>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com> <20130813124440.GX6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1928965.jBuVOadR8z"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:56088 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759410Ab3HNIZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 04:25:42 -0400
In-Reply-To: <20130813124440.GX6427@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, abrestic@chromium.org


--nextPart1928965.jBuVOadR8z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 of August 2013 13:44:40 Mark Brown wrote:
> On Mon, Aug 12, 2013 at 03:19:50PM +0530, Padmavathi Venna wrote:
> > Samsung has different versions of I2S introduced in different
> > platforms. Each version has some new support added for multichannel,
> > secondary fifo, s/w reset control, internal mux for rclk src clk and
> > tdm support. Each newly added change has a quirk. So this patch adds
> > all the required quirks as driver data and based on compatible string
> > from dtsi fetches the quirks. This also adds i2s support on
> > exynos5420.
> 
> Applied all these, thanks.

Hmm, this series looks good to me too, except one thing. What about the 
bisection breakage introduced by the hole between patches 1/4 and 4/4 
(after the list of supported compatible changes in the driver and before 
respective dts files are updated)?

Best regards,
Tomasz

--nextPart1928965.jBuVOadR8z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSCz8CAAoJEIv3Hb8G/XrudrAQAKPWQgcEj0XNAb5DViZzf93G
8nNzFMDBfPAbzxdC1vgcmVsrIUZCYjWAcKelMHMsE/YLnywekzBz/ZvA45xsQmXG
pli8hukdgaIP5uF7Q5MEsLMITKP+tplaiBDy2oRuhJV/fJ5kM4sPAQAcNYUYWoAH
ay8L3hjBxrm+GUVdVHcnNF2tncDZ+zofdPKX1D0ZSCrdysKxrK8A00EiYbxhwsPj
Dz6jrkOnYSqzbQjFPonkagGfdYrjnXbNlYQSB25vh79o+Egk9eOL59rT4SqGxhAA
8FRjKlBXchUJEfl1z9ZWsTqXarwJaNB9pKFEAU1veTj42qVM5JpnevZ6kWuYC4T0
IZ44ZC3H41BB0YE70ob+h4Mjugt2pxsoeIWe3YJ3Emim/E7VOd2NoMb9QDm3Rjje
j4Y2KCLu9Iw+kT1uGip0MszVdcotlArEsHRMKEw3czgDIu+rYz8retDkz1fzgQZe
0tvqDlyXjqhc52DMG5Whm1NtQ3mMkt8CxxJQnjTdZMGqJ1RcMojoSOThPi8jqA0g
TbTYU3kZaCM/323abceQW1knqCvj0MVmatD0/5yoiTrtflGe33KBX5FTIqfUzP9P
YNX1ERkEXf7jbcbGo5vgS6IhGzptPDuaEYDNm4qDa2fMCumfh7/i1IRTbRVsnqx8
oClnBI5HN2moVAJ7Oad0
=MABX
-----END PGP SIGNATURE-----

--nextPart1928965.jBuVOadR8z--
