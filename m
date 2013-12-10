From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 10 Dec 2013 17:01:33 +0000
Message-ID: <20131210170133.GB11468@sirena.org.uk>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
 <1386253559-18262-2-git-send-email-broonie@kernel.org>
 <CAAgF-Bfk8byZwVBd_5PopM3ji-wdTMR5i-J7w1W4zq4gFk4i+Q@mail.gmail.com>
 <20131209173021.GC29268@sirena.org.uk>
 <CAAgF-BdWpQ2wn8GCpXLLWBZFxrrTYmX-e4bWRLYdwfpwhObnfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1733770349425640079=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BdWpQ2wn8GCpXLLWBZFxrrTYmX-e4bWRLYdwfpwhObnfg@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Padmavathi Venna <padma.v@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1733770349425640079==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2013 at 10:09:05PM +0530, Padma Venkat wrote:
> On Mon, Dec 9, 2013 at 11:00 PM, Mark Brown <broonie@kernel.org> wrote:

> > This is unfortunate...  I'd suggest trying mainline but I see it's
> > broken in Linus' tree too and no fixes in -next. :(

> > I'm tempted to push up with your Tested-by a note saying you did your
> > testing on an earlier version but weren't able to test due to other bugs.

> I managed to test your latest version of these patches(posted on
> Dec6th) on earlier version of linux-samsung tree. May be you can push
> up these patches with my Tested-by.

Yeah, that was what I was planning - I was just going to add a note
saying you'd not been able to test this version due to the other
breakage so if it turns out to have problems people know it was
something I introduced after your testing.

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSp0jqAAoJELSic+t+oim9vw8P/iWItuWCwqdI78T0MGIfkoqB
k4H7tmlBcaGEcPuZOohdA8bn3Z0NfMQrI0thNzYsEwyfUXFRRBkF/P+P81FevB5c
HrObSR4VM2FNq/5qE2HEDZkOlG8kxYY2u8dtlYW4lj3NTk4xNbQkZfMr2bvp1HKF
TRTkMfmoiG5XzjKa9M7oS9kO19Mejl17ue2IsqYiN/ZxhrRw07OLyTYtP6c6UgIG
FV60LlJo278qDBiJxjroqWz3pN/j60VVHd6bvWTiuGLsa4/CFZIz7awg9ErAIvsV
R375+G/Xuh9l34SkxqqkA64zX7OjUMGQsVygyIOVqArfN7lrq4wY9iTUg5Ankx75
7d3gZ2efcPvcYAxYeq/YhahHyUOHrjqcL4WaKq8LCwKBnCTjDytiw69SKb7HU7oP
LSMaDFKCboq/col4fd6PNW0eABw6V+jLohrLhD1k19GtrV31eBz+loR5THcCpcLb
wioy3CWNkO2qXww99DgwFAB8rB1QCgi//TFqgCdiHcR35Wu+HMKmzF2QS/vLzjrx
pRJFUz2oRrV7qUVMa8AlRt3zWXhQ8ZmkJn5K+NefthtjxPQ3g8uUcCs+Xd2bH5vp
M4P/Cc/l9935w4kD3kCUrzFWYkHd1+iN3tgvWTEyXUnQIAHqiFWAYWQIPsmSlf2P
tCrMM/poUi1bmWBUArM9
=1gIS
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--

--===============1733770349425640079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1733770349425640079==--
