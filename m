From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 00/11] ARM: s3c64xx: Let amba-pl08x driver handle DMA
Date: Fri, 21 Jun 2013 10:47:04 +0100
Message-ID: <20130621094704.GJ27646@sirena.org.uk>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <20130619174047.GB1403@sirena.org.uk> <3697657.tZFV7pR81Q@flatron>
 <20130619192211.GH1403@sirena.org.uk>
 <001201ce6d98$03d9b920$0b8d2b60$%carmody@partner.samsung.com>
 <20130620103532.GA27646@sirena.org.uk>
 <002501ce6da7$655924b0$300b6e10$%carmody@partner.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3505290066535613155=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <002501ce6da7$655924b0$300b6e10$%carmody@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Carmody <phil.carmody@partner.samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, linux-kernel@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-spi@vger.kernel.org, 'Dan Williams' <djbw@fb.co>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============3505290066535613155==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hk6Zb6cduJ+I0Tmj"
Content-Disposition: inline


--hk6Zb6cduJ+I0Tmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2013 at 02:14:53PM +0300, Phil Carmody wrote:

> With my language-lawyer hat on, I'd suggest ``(get_signal)'' to prevent t=
he
> macro expansion:

Right, which the patch I posted in the mail was doing IIRC.

> However, it's more tempting (i.e. sensible) to just rename the=20
> one with the weaker claim to the name.

I sent a patch for that which Vinod has applied.

--hk6Zb6cduJ+I0Tmj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRxCEVAAoJELSic+t+oim9MF4P/j3hmWhKx7+3QMiWNLdHrvjD
Z9E0j7GVEIirmknL8PlmwKFx971klj5tifU4U0xB0WZ9oQ7DTiTyiOprjLn4J46L
7q2P0yJDjh4d4OnnK/uzkpGsqeOW1Umcnt+4bWfOp3Xv4bF/Nu8ZLYxn6ZTHhxS3
KsnzaXVg9pazrS0apfzR8MxYO1xdML6jRSFeIjutY9DV0YieAgjVqfWbMYpYJ2JR
9eHGUWeKUfDJQ8aBCzJ7XAKibbv7U9PvAVkrwWzFGD1OsCn8P6WT8bgsfza/FG03
lUZemHlDV/RjNA/x0OaFKpSs1A2Ags9wTXe4cLWFhysr5n8H8CptDBPFgpsFJEdx
6p8VcVugYl0nPw9oPhVQTjITNFQ2J/Qxu19NLME/EjV+UccJSCLFJub3CJzhycKj
1hNEvqZnUSzDiKGd4V/uS8AbEtu0q1sIwSCRunJ//i6E/o/1LmXZnk6Ro/MXG93S
my63lu/ZSA8c0DaHThifvA10+u5Sj7sCXZrr7kxtTR9lrEDcbueM6rT+nAoIL+JF
7aqdoAKemYxG1I2VJNqwiXigbpOnpkZw0dmOMKGp9l06noeHrpW8CyjS24VIgE6w
C251BOuUa5acjUwxqDJOcnscxMBZx5vyOUWgEIs5o+kwmor9Un98i/AUifV02xwV
aakiqqM228fOgObR+J7p
=2CYh
-----END PGP SIGNATURE-----

--hk6Zb6cduJ+I0Tmj--


--===============3505290066535613155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3505290066535613155==--
