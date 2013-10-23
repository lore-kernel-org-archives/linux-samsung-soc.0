From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ASoC: dmaengine: Support custom
 channel names
Date: Wed, 23 Oct 2013 12:30:28 +0100
Message-ID: <20131023113028.GP9388@sirena.org.uk>
References: <1382201032-13538-1-git-send-email-broonie@kernel.org>
 <1382201032-13538-2-git-send-email-broonie@kernel.org>
 <5266654D.30200@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8762327211302515734=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <5266654D.30200@metafoo.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============8762327211302515734==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IihjUyvzd0n5Ehsu"
Content-Disposition: inline


--IihjUyvzd0n5Ehsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2013 at 01:45:17PM +0200, Lars-Peter Clausen wrote:
> On 10/19/2013 06:43 PM, Mark Brown wrote:

> > Some devices have more than just simple TX and RX DMA channels, for example
> > modern Samsung I2S IPs support a secondary transmit DMA stream which is
> > mixed into the primary stream during playback. Allow such devices to
> > specify the names of the channels to be requested in their dma_data.

> As shortly discussed yesterday, I think the general idea is fine. But it
> might be better to have the names available at PCM creation time, since this
> allows us to e.g. do proper probe referral and will also have the code take
> the same path in the DT case, no matter if it uses the default names or not.

I agree, but I'm thinking that the way to do this is to get the entire
struct provided earlier so that the compat drivers get to use this stuff
too.  Is there any great reason not to do that?

--IihjUyvzd0n5Ehsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ7NRAAoJELSic+t+oim9q/cP/3GoDrtzO+N6XQ8DMeXeCQct
rjoRRptujeWjRlwtxr5ukTaTgVWFbPgrzHE+UCi6GJB5w6F3whP4kMmIPYjPtHi7
k0I/6E0lg0OlAdQtP/3EklepJCKUyvl96sYLiDR3iclxGvZnsOqFk1vSh6h2Yo2Z
chRhfEwUrjEDzH0DahpIYwrHiFzhJnY3KY9xQ+IMo/pxRdXLGMLT/qYGW3MXQDDu
/QgcmSo9QWnY2IHn+JyC+QGeuj0/GpsaHIkFfo2XwLQA0kthxvZwJIJ7y/jAIIfB
6HfkV6Kg3I7MpzykJJZmE1Iik/izWHxQlNSK7jUT5hpoRjjZ+vEPrfXSzA/+EG1c
UVsah+32i8ij9tM81xJ+4d3Yx6KEob5TwTZb5QNlhKQ01xPt2J3FDoZSGu7BOU5U
SOrwg8Jl4aPsQZVHGEreOt9s2/iSkY8h43bS6sOHF+inp/Qt7Eqj0v3oQWTakMBT
QrBP/DCkAjLUEOZXDPDzwifMXtU9EKLu5CyZpYr71FfHiAG3c9bi/RmgJRdmQT6M
dLIrZQjG/dkNWDiSeSPR/WWF15wZAfhKZi38vZy9cGRIB433vJhA0YZ0k/hazbKl
P17OzoTritKuiAIG4LcfnCWOtQ5EiIBldVq/LTKimFkUbZxgr+Z9EikFtrml7njt
TujpNKsaV+fHccBv6XFc
=E16e
-----END PGP SIGNATURE-----

--IihjUyvzd0n5Ehsu--

--===============8762327211302515734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8762327211302515734==--
