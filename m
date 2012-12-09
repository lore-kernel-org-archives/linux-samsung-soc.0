From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Sun, 9 Dec 2012 16:26:08 +0900
Message-ID: <20121209072607.GD6511@opensource.wolfsonmicro.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
 <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
 <20121206041141.GA10867@opensource.wolfsonmicro.com>
 <20121207135131.A53643E0B87@localhost>
 <CAAgF-BenOdFJK2LMot73_B=wHOFgD2sq8x-Ou=1CvpkiJpmeQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41103 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964852Ab2LIH0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 02:26:20 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BenOdFJK2LMot73_B=wHOFgD2sq8x-Ou=1CvpkiJpmeQQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 08, 2012 at 10:07:54AM +0530, Padma Venkat wrote:

> Samsung i2s driver registers the platform device twice one for the
> samsung-i2s.0,1 or 2 and two for samsung-i2s.4(which actually doesn't
> represent any H/W peripheral). The max number of I2S blocks on any
> Samsung SoC are 3, the secondary device registration starts with
> device number 4.The second time registration is for the secondary fifo
> interface of a CPU dai if any exists.

> With DT support the device number in the driver is always -1, I used
> alias id for the above purpose.

So, the thing here is that while the numbers were totally OK for
platform device use they really don't fit into DT at all well.  I think
the thing here is to either have a node for the second CPU side DAI or
to have a single DT link automatically expanded into two DAI links.  I
think the second option is much better - there's only one link on the
board, it just happens to get expanded into two the way things are
currently implemented in ASoC.

This stuff probably also ought to be moved over to soc-pcm as well by
the way.

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQxD0EAAoJELSic+t+oim9FbIP/2a499cFEMc5Hke+hup0iFc1
wqb6G8JDRnKOFBh++Dddz6E64XIdOdcptqZqhpXGBe++4fQCCIFHuw74W76tH8ea
4QnJBNPBPNKzp+t/ODq887eWg/ZrPccJx9COB33kMREEljsACGGQkMb3FT211sgV
3jxLfP57AU2YrKSbLHyoaZm+Gmhz0lXdBDhoyX4ocCXUsGf7+oG9kK+Yjd703zbU
q6X3mOyHZ0Nbmb5TtVvdvpkOSf7zLz+f6hDE1+pD2MVaoyfPufgwnelmw/rg9ppc
NkpgjW5PyaX91+Crl2I30CoNVKUNSC7/5FVwQooIa85W0O6X6sQqCLkJFoegAujs
YU7CtCJrcFnfD3ospJR66c/tu8AP0yLKgSgnQvUIGb/YuibgrqzPexT3vTSDtlSC
J+W0d8ASAK1L81s82PJnSz8PNXV0P90cVguGkZ/XnTBzxY9yGpq+0LvKQX72mHB7
N8/PpoSVKmfW6HU+KAdCvKBpx+1JIdt8wRpyCs19Ih/pN+mUe07CgkSTyVOTz/yp
LBFJu+fSR/YWCk1sFo2JbX5OgY9tlG6hhggXre1RdMZtTYCG26n9OY57gNe29232
t5f6swQ+L3dgnP9n9WIg4ZdOvKiVJFWAg/qGvHblb2tZcGgqu1Okv9/JQI3Gv4u9
9aiZXZpADJbtOOaEpBLF
=o6Bf
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
