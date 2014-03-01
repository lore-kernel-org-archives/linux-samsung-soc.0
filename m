From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 14/28] Remove MACH_SMDKC210
Date: Sat, 1 Mar 2014 12:53:39 +0900
Message-ID: <20140301035339.GK29849@sirena.org.uk>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-15-git-send-email-richard@nod.at>
 <20140210114154.GQ1757@sirena.org.uk>
 <1392039072.3585.15.camel@x220>
 <20140210141255.GI1757@sirena.org.uk>
 <1392046242.3585.41.camel@x220>
 <20140210163621.GA13533@sirena.org.uk>
 <1392070159.27939.34.camel@x220>
 <20140212160431.GB28112@sirena.org.uk>
 <1393623789.4052.17.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3962212965927967114=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1393623789.4052.17.camel@x220>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Richard Weinberger <richard@nod.at>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============3962212965927967114==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HmK7y6O+lKZIGkr"
Content-Disposition: inline


--+HmK7y6O+lKZIGkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2014 at 10:43:09PM +0100, Paul Bolle wrote:

> That commit is fine with me, of course. I now see no reason to continue
> my, rather slowly progressing, search for the problem that you wanted to
> get properly fixed. I suppose another commit already fixed it.

No, but it's someone from Samsung (Sachin works with the Samsung landing
team at Linaro) not caring about those drivers on these boards any more
and mentioning the DT conversion which is rather different to someone
doing mechanical cleanup with no mention of where the symbols went.

It should be fairly obvious that if the reason symbols are being removed
due to DT conversion of the platforms then the default thing should be
that the drivers be being converted to DT and appropriate DT entries
being added to the board DTS files, but more generally the important
thing is that some understanding is shown as to why the symbols vanished
and why the mechanical fix suggested is OK.

--+HmK7y6O+lKZIGkr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTEVnAAAoJELSic+t+oim9UeAP/3AbCx0eUSUgyA/4YbVeg6L0
9YJ9ENAhOqioM6FxchvKxAFRUJ5bbEt3dYl0jzsdjcQMM0DGjunY/MHnAiaEXYaQ
JYE0ccDRdNSZUf8HWGv1O4rrwfiPQespwImgYT+JSq6GrFCQdHVwbGjX+XCW9kDD
LP1ywiNn3JdPHPi6N9yX8THDIefu475zc7i0UqBEhnliRIi6I2TfUutXczdKg3wI
TnyE7eXHIr9lctDTkaIHbfVyntXrUZy2GHgVjBitNObSrmccfG/R2/3e3d/uyblS
QmkyLpdi/7GdjZI3JrwmdLEf6tUwNon/0j9gaWZbrKGEN77ub5BKUdJN9toj986f
82/yt922OfnksAQVNlEL8OC/nxrRPXG0pe7b6fn6dUxN829l5upBBX62bBrwHqw1
MON0nuv5EEsxLAFt60wO+vjI8W+FZnRSry2RjRPhkehTrILsqcp/HNnX0k2mduex
Rz9aDxF1INXIcwci5lGZgLKzzk9LWS2MVC3Z3GhV/7N5em8yD6uilvPU+gu4mLtF
y1hcNNTefJ6/Ioy7Nr/yoU2aLdc80aAA15lNQrqgIzD212JRXTBElU5h21OLJeaP
1q0/ROANqiNDP0yk7pLLQzZLj3TT7rotldRWONk+1zi1o32Pi7YwQKFO1BUgeLkT
0TzOhwSK4IfG+ULtqc9D
=TpnJ
-----END PGP SIGNATURE-----

--+HmK7y6O+lKZIGkr--

--===============3962212965927967114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3962212965927967114==--
