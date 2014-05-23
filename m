From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Add machine driver for odroidx2
Date: Fri, 23 May 2014 12:05:44 +0100
Message-ID: <20140523110544.GY12304@sirena.org.uk>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
 <1400759708-25831-2-git-send-email-s.nawrocki@samsung.com>
 <20140522185334.GT12304@sirena.org.uk>
 <537F0A88.8000904@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MZRUDfwK0cLsyVHQ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40005 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752491AbaEWLF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 07:05:58 -0400
Content-Disposition: inline
In-Reply-To: <537F0A88.8000904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen Zhen <zhen1.chen@samsung.com>


--MZRUDfwK0cLsyVHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 23, 2014 at 10:44:56AM +0200, Sylwester Nawrocki wrote:
> On 22/05/14 20:53, Mark Brown wrote:

> As for the DT binding documentation patch, I thought we're supposed to keep
> documentation in separate patches, so processes of separating it from the
> kernel is easier ?

I'm not sure what the current theory is - they should definitely be
separate if they're part of a multi-patch series but for a single patch
I don't remember what the current taste is.  If you're sending to the
same recipients anyway splitting isn't going to accomplish much, the
idea was to only send the DT binding to the DT maintainers and list and
not the code.

> >> +	ret = snd_soc_dai_set_sysclk(codec_dai, 3, MAX98090_MCLK_FREQ,
> >> +				     SND_SOC_CLOCK_IN);
> >> +	if (ret < 0) {
> >> +		dev_err(codec_dai->dev,
> >> +			"Unable to switch to FLL1: %d\n", ret);
> >> +		return ret;
> >> +	}

> > So's this - also what is 3?  Set it on init.

> OK, will move it. I'm not sure why 3, it seems to be ignored by the codec
> anyway. Chen, can you confirm the second argument is actually a don't care
> value ?

If it's don't care supply 0 instead.

--MZRUDfwK0cLsyVHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfyuEAAoJELSic+t+oim955YP/0q2lXOX0mplig4lK/bLQD55
YThdFpX2rEAEI0ZhU+YcfydG2K3Um3tHpoMm9PV9yTBFPjzlVK7Ja1FosyDba5kc
JhCdG0ckeUvxaj5IZ7Pa9KkxqfW0CIZZ09yk5NqbOnj9C6+vqXKZYCkvL6BavZ3h
3Voa4TUQY1WLf1Zlx1C+FiMia6aHWfQVmh3tidKkJ/WdwEeHfNJl/Jnl4EDrNJ5I
KBVXtS4yff+9LZP1qaLtkLkzSVmQrtPGFj6LBrywH67L8rNkdqbN1ZtbeRGU4cx8
gX+RcdkljWjfP/BUsM6+UlsJ+3Xw4RKK6Qyi8Qy9f//VAPowRRbz7f+9HRao6uHz
F27YEcqwXTvA1DXJdeX4Uf+c3DUxhJkyQxB6wFgV4fTHfpLNhCLULLeSl/De67Ie
AZE7lOhGBsa77+T6Ew9M/ZXT9YuK1dIYQhg1YxPn2ZgmLLJi64wTrQaY9GguIxCF
zO5zR8eh2dxi2GIRyErAR4VP6MT3iVz6qauTYOwEBkQbe7lB09+P9XxP+GXjH1Gh
xTP5q9SZ7KGpoGJR8NKQwNeWAR6WWFcnLJBpxVuTj4J0tB7G0crBs3P9ZRCXupFs
F8/D8TAAVFPe/18c2+Q/pgEMXogAnqxZZ5lfvqHyIxwOir1NgB4rRCv+bSxWKBEA
bejqPtatfOqu5udrR5oQ
=HKeh
-----END PGP SIGNATURE-----

--MZRUDfwK0cLsyVHQ--
