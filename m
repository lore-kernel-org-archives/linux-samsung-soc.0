From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 26 Nov 2013 12:20:31 +0000
Message-ID: <20131126122031.GA14725@sirena.org.uk>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
 <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
 <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CXwywHnYJ7GE90zd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49663 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756108Ab3KZMUk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 07:20:40 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>


--CXwywHnYJ7GE90zd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 04:18:41PM +0530, Padma Venkat wrote:

> I tried this on linux-samsung tree by applying all the patches from
> you and Lars.

Can you use -next plus the posted patches please in case there's
something been misplaced, it'll help if we're working from the same code
base?

> I initialised the dma_data for secondary dai as there is a crash with out that.

Can you please send a patch for that if you find it's needed?  Like I
said in reply to your earlier mail it looks like this doesn't work
anyway so mainline ought to be fixed.

> Then I used aplay after running the mixer settings.
> ./aplay /mars/share/sounds/alsa/Front_Center.wav

So this is 16 bit stereo or something, and did it work beforehand?  Like
I say I suspect the DMA is ending up being configured with the wrong
transfer size, can you check what actually happens there please - what's
different about the configuration that the DMA controller gets?  I don't
have any Exynos systems with mainline audio support so I can't test
anything myself.

--CXwywHnYJ7GE90zd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlJIMAAoJELSic+t+oim9by4P/2sUipayD6COz2TXKNtQ9E6T
rcpr0pPArGjEE+4XVGdBe+qsITL+Kh6P4N8BXm5LRpZEvTZJ3Hy7nPE5odmef5YK
6PZkD79wrJhEPgmNu9Xxsm0AX3JAd7aY+ito8IAHRH4gWuqQ7MFYFTNA8fbO/8ZW
LK1OshegthEQ6OWy0sTd3Q2XIYPn7CISNquoX30xveNGfxA+T1/y214+0aVUpJKM
+ZU5HxoVIgYEcSepN4gmbCrzO0Op6Xy2FDzs6PPQp5qdxdF2SC1VhQlumvJ5Mt9w
1mWm7NDZxPomm0sYYrwbusUVT3JPkYeo9A1Q604hKsv1Y1aPFQQjDy2c5jRfWQRl
uCIHqkn0vqtKhr5RHTtx+eajFGnr3o+VVBv1Duvgt50X+zlx36wY/rTaD3bCFTxv
TqVSWM8rXQuulV0znygtorqhDVHP16mCqLJ99qUXF0qoLFj/Tm0PmwSde71CwqHp
EoQwwfT/3DcbvvlIkrVXrAznIC4SasUFPN/yaK09OOboM5NdbcpL+Q2rtpMkuka+
y4sZYYYOkBJBW03KKeEvEzBYw2MJyu2ncTYUL8PBRLthGoAllg2XgHv0e3Qg/tn4
1M7zIy6p7v4D92BLvUM2FTaQMAcIEr6zfY8DFyqeDc62D+jytUb/2AtnP0HM2u/4
Aw9ZlYbcN64zfb9tkUZT
=G+K6
-----END PGP SIGNATURE-----

--CXwywHnYJ7GE90zd--
