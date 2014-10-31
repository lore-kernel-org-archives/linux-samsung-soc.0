From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 01/14] mfd: max77686/802: Map regulator driver to its
 own of_node
Date: Fri, 31 Oct 2014 12:23:30 +0000
Message-ID: <20141031122330.GP18557@sirena.org.uk>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0vT1GPDkB6ir2Vi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414668053-31370-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--Z0vT1GPDkB6ir2Vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 30, 2014 at 12:20:40PM +0100, Krzysztof Kozlowski wrote:
> Add of_compatible fields for max77686 and max77802 regulator drivers.
> The driver's node should be the same as voltage-regulators node. This
> simplifies parsing of regulators init data from DTS.

No, this is broken.  You're introducing an ABI break that conveys no
additional information, I can't see any reason why this should make it
simpler to parse init data (you've certainly not articulated one in the
changelog here) but even if it did you are changing the ABI incompatibly
and convenience isn't a good reason to do that.

I'm getting very frustrated with what's going on with these drivers,
there seem to be a lot of rather large sets of patches spawning lots of
discussion but also frequent review problems and very little actually
getting merged (look at the set of changes in the past few merge windows
for example).  There's something going wrong here.

--Z0vT1GPDkB6ir2Vi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUU39BAAoJECTWi3JdVIfQegsH/ROIknnvQNqQ85+IHwXqO3kQ
8D84z/5A5u0nZRsbhI+veX0eOwfA4251qMEKXI88OMLlrPw2R6y5xAEzsMlH5aVj
Dm7wjxRjCCR45Uh79eoUsl0uKQYBd5Z4cCJPHcbi8iLWoJbFLMeBZkGJRciXl1p8
IDtZUWClt2zewNMbH9R/WA/hspCSKRzZrxqPts4tAruENZtCSrkQWAd++eGklTj0
gX4QhVXdh4qSEZHeI4Dkq1zC4Ar8ZkjkTJ8l+uhey3sTaTtIcXIhCmOwyiVPI4AI
m+RPe5ujnz11TvYgPW1CDPRiCH5DQVJgOh8dRGb3UvxymbtVk9mD7Cn4AMHzfsk=
=uY6/
-----END PGP SIGNATURE-----

--Z0vT1GPDkB6ir2Vi--
