From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Tue, 6 Nov 2012 09:10:03 +0100
Message-ID: <20121106081003.GA3283@opensource.wolfsonmicro.com>
References: <1352104419-31630-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1352104419-31630-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <CAM=Q2cuV5V4db8TU-mz+htqnL9MLPB0q-uwxSKFgV6BUB2866A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM=Q2cuV5V4db8TU-mz+htqnL9MLPB0q-uwxSKFgV6BUB2866A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 05, 2012 at 05:21:03PM +0530, Shubhrajyoti Datta wrote:
> On Mon, Nov 5, 2012 at 2:03 PM, Mark Brown
> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > A small code saving and less error handling to worry about.

> Looks good.

> request irq could be devm_* also. Not an objection though.

devm_ is a much worse idea for IRQs than for other resource types since
interrupts are delivered asynchronously.  Using it safely requires that
we do the analysis required to make sure that the hardware is totally
idle and can't interrupt.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQmMXTAAoJELSic+t+oim9DKkP+gMrOSAtp+YAgJPKEFyYOEf1
ugHZ29jlTLr5EoSPx/pi/wbm4SeVXp41AP5SMgCb+SQwppdUfugrO5AaQtV+Ty/J
4pd3Y3qAAzRijeUMTIWeWGVtwF/t8BTHjvacRZBPty+nF5hjiJlVyy1qFOZ0b48r
PFJoQAQWmQdG6Uk14h2ltp0CGPlnt6mhOCseJTs4AQk/KsfE+1THvaiDPh+4TnPl
6bfnaKhhqmxLdv4BHbpekzam2JBxde2nZEi7feTbg2/LWEx73vmYrhG5XDYd4uD3
KW05wP8EgPPjcXrYTLJLCpreqb+PCl98MUPd3l7QiMfu8iwE3BZgHLoLG0HH8q5q
C2Z7CTYm/KOTSymf7KBAla4ObZDm4jojgJp00VrDISMMAIieDEk5xdYuAmILZuK0
Qx+a4pKqau4ewXfUw/jeALcv4ZfLzTpo6yorZpNNuWSju/KNINDcN2cftRmivGAh
qxIbbxrsHVOShPgWoXadIMhdc/7XnMph/5jacZHkfzcbClIQykaTIVyPp/D7KVqz
KuKwi8hTE+J1vpoWnovRQ4fnqd/BatXmzuRr/C0AbuJ3wTm9pd37TwPuvSnwGBbX
SeF3Stz0g4cWMaY5w98jxaEsGpl6mFqt7F/58eClEFeqY6q7dpbg8XxC+BCoKTw4
7UFwjSl8//eZTOESjPz7
=GLBa
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
