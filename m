From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/4] ASoC: Samsung: I2S: Add quirks as
 driver data in I2S
Date: Tue, 13 Aug 2013 00:46:03 +0100
Message-ID: <20130812234603.GM6427@sirena.org.uk>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
 <1376300994-1679-2-git-send-email-padma.v@samsung.com>
 <52096871.4030703@wwwdotorg.org>
 <20130812231327.GK6427@sirena.org.uk>
 <52096D4A.5070903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2625783359098949804=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <52096D4A.5070903@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Padmavathi Venna <padma.v@samsung.com>, abrestic@chromium.org, tomasz.figa@gmail.com, Rob Herring <rob.herring@calxeda.com>, kgene.kim@samsung.com, Kumar Gala <galak@codeaurora.org>, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============2625783359098949804==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X0jFZ9B+Xs9PGREg"
Content-Disposition: inline


--X0jFZ9B+Xs9PGREg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2013 at 05:18:34PM -0600, Stephen Warren wrote:
> On 08/12/2013 05:13 PM, Mark Brown wrote:

> >> (although I dare say that at least samsung,supports-rstclr should
> >> be modified to use the new reset controller bindings)

> > Really?  That doesn't seem terribly sane - I had thought that was
> > for bodging resets on the side of things that don't normally have
> > them or need board specific logic.  Also note that this is actually
> > a magic register write done to reset the IP on some specific IPs.

> I believe that's exactly what the reset subsystem and associated DT
> bindings were designed for.

That seems...  interesting.  It seems like this is fairly core device
functionality I'd expect the driver to just be able to understand;  the
main thing this property was doing was deciding if the reset was needed.
I'm not sure I see the benefit here?

--X0jFZ9B+Xs9PGREg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCXO4AAoJELSic+t+oim9WzcP/is9ByUR8vY3cN3SRv7JRCqz
K5bzWSFb7z0xFlNTFY+Z93RtilBbisI+FHo8CDgSI3Ycs8KN+sM1bpgoC3gYIRGS
it9bzSoeMvQBNnxuhzOS0jDbznohQ+xiTX2gkISVX8X4mxDpGPLMtx2cqVZpCXh/
E9cSs0QcEu1/5VsxDO61UncBn/Jt53qIoj9hfziFzruUXoxLHOiMIzdhviST8/zc
AWm/0RIsHzXhgusVc/hNZ9Q6AVwWdJ2437taGPuuzaByWuKDp5I4Ohk2jTLn28P0
0YeV8/5qn8hQYlGiu6ru39ZyDnFmbObmO5z4ZBiM/r2D2IOv+1GPBTwCHerQezEU
gUDPcwAOOUXXR2kpvyXG5n9U5QTj3NX1LxTD4cPR5NG15J+bYPDZLoUgCRIw327E
pNmiL+77JbJNQAL4pQp42PdEkUYxAqSc1B0IgSLaDcNzhI8PQH8WtCUUnqhWkCh7
qKUFftwBK62CT/klCiNi5XYjGiMGGzRdwoRPqfRpyni67a531/G+tlukS3NYlbqv
iExrUdDW9rn/mSODgw4KglRLvXYzwwgoxBdqjPeLTdmSS6nQNB18VE2mlXR7TklM
/kSsQbbKSZWJ+gHDlMyKMgG0jS6Mx/dHmad7hus6rwnDwt5e1u+KO/rfitKgr1Fq
BxBSdKizLJjW5NkwV42f
=+4Rk
-----END PGP SIGNATURE-----

--X0jFZ9B+Xs9PGREg--

--===============2625783359098949804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2625783359098949804==--
