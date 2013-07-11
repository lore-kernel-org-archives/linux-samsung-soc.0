From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Set RFS and BFS in slave mode
Date: Thu, 11 Jul 2013 12:11:44 +0100
Message-ID: <20130711111144.GL24508@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <1373526505-27115-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ai3I8gwHc37+ASRI"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35228 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755031Ab3GKLMI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 07:12:08 -0400
Content-Disposition: inline
In-Reply-To: <1373526505-27115-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org


--ai3I8gwHc37+ASRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 12:38:25PM +0530, Padmavathi Venna wrote:
> As per the User Manual, the RFS and BFS should be set in slave mode
> for correct operation.

Applied, thanks.  Since this is a fix it should have been the first
patch in the series - this allows fixes to be sent to=20

> Reviewed-on: https://gerrit-int.chromium.org/37841

Including things like this isn't terribly helpful - this is the Chromium
internal system and nobody in the community can view the review.  A link
to a public system might be useful but a private one should be omitted.

--ai3I8gwHc37+ASRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3pLsAAoJELSic+t+oim9Zq0P/1s62NgK/c308aWV/yWLHdy9
TxFhL0oMRUpu78tPYUgz2jsHNuOhcJ8Y4okrQwPMVdxhUGVxGg7lRZKDOOLRg3NU
EeJ5LL5di0TFybt6m4pgX7+GPq0Q9LYO0UpR0RKAujZGoE9HnvEaJKAylbLjSaAW
MbsB8vMTBO2MM9APJonSA6I/baIYRU5h9Webvo0Wb8ljhyFuHRFSgiFzXgwC1DKT
CYY47adrEOfhRrAAQw9hxz21M5MuonValnvjM2dlXqxZhA1sBPyWMO/cO+89rgl5
1zqrg3rPqp9Y75jqg+kKMedqU6HZQBlrZCKmCFfrO9DKfBQnjtfEbQ3WyZSg2f02
MP7UcnxlGoDx70FC5tyJpOSYd7AtWRs7wDpfvOKo9GxXe+j/YWKAPsaiWCl0IP0U
/MqeDl7csxhXc4/a0krH6Pq/znKLCLkO9zf0vImoHMk8juEKVKSR8TxEDh5RKv5q
MRttojMswcnrCqI1L5kCKpnrw5KaNfs1F0cgN83lkrq041w8WAtcNn9+LCIE64Jw
MLBGzNHubdxzUrw3I16l5s52vh3nu5RPhMgQvoJt5ifaE4QVC7w2p8JLOiMBc/FM
pzj92LvIVNnIH/DClOf8KHGl4r6cwYvO/eYgGQbDISMAAj2ey7PTQYOT2oXN9UVU
0oYykunRj58rZv6CP5Lu
=nngr
-----END PGP SIGNATURE-----

--ai3I8gwHc37+ASRI--
