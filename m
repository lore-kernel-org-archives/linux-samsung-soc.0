From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410 : Add polling mode support
Date: Tue, 1 Oct 2013 15:24:56 +0100
Message-ID: <20131001142456.GP19304@sirena.org.uk>
References: <1380623620-31901-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hwMNHYNcH9aNQF1X"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380623620-31901-1-git-send-email-yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, aditya.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vasanth Ananthan <vasanthananthan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasanth Ananthan <vasanth.a-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--hwMNHYNcH9aNQF1X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2013 at 04:03:40PM +0530, Yuvaraj Kumar C D wrote:

> +static bool is_ack(struct s3c24xx_i2c *i2c)
> +{
> +	u32 time_out = i2c->tx_setup;
> +
> +	while (--time_out) {
> +		if (readl(i2c->regs + S3C2410_IICCON)
> +			& S3C2410_IICCON_IRQPEND) {
> +			if (!(readl(i2c->regs + S3C2410_IICSTAT)
> +				& S3C2410_IICSTAT_LASTBIT))
> +				return true;
> +		}
> +		udelay(time_out);
> +	}
> +
> +	return false;

This is a bit weird - the amount of time the driver waits between polls
shrinks as the timeout approaches.  It'd be more normal to see either an
even period between polls or (ideally if the delay is non-trivial) a
dead reckoning sleep based on the expected time to complete followed by
polling at even intervals.

Also consider usleep_range() for the delay, it's a bit nicer to the rest
of the system than udelay().

--hwMNHYNcH9aNQF1X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSSts1AAoJELSic+t+oim9ukIQAJaq+7j4ymv+9MKuN894887r
vGxECx6BjtK1qN6FOrJGKhtnM24sEqdaIsq1q5+KbtkpGFQz/H39LcR691b0BEP0
K1EUNG2mWnZMaoxPvf8kja8wzrYitKBcEMYeyX95zdtpnSCNEWyUOYhB0U/0DJek
C0qrfsfKyqU4pw7AEMGaeWOUo6iE/UvPoaRljggijIJhQP6ok0dPrQkX4G9ecDpZ
aRAu4jj2DSc2Wnl2X0hI+XLgs/eIm8xd7HC0HV8FA8sqvZgCbkfJPnP7IIjd+suV
cG4Ix8Yvlqc0qYlz7LRILQfgO1VQJDChJlQJTT2kW43zviXDWd2b8n5bWBNeWK4x
IpkPkVwMcsU5mI3jPp+WsHFTA0oK37vDJNYdlZoSjjNacTYZEfjrXYg3C/Buy8fz
gvLwEIwMJVctQd7sNE8sPLDIMYvcZtI1KZXFKLjrnM8OddeK2uF2WcYpP3u1MW2X
xnUWP18oNwx7rTri7/7J897qfWgvLUnYW1CaTiHm5c8O1LJZoZog30zkx9eoR7bn
XxJWAMlrPZiwfUVhuWEjFlPIeYhteUo1WlWpI9sUMqhmuIx4KWOo13ulL68yGk5F
Hid0EtO7GtE6XJpe6NncZN4N/diw5+1r1ZFof8uzhLhLqe3YNzWeYcbIqglOrvn9
oKtms5R28dYrbPxv6pDL
=flPm
-----END PGP SIGNATURE-----

--hwMNHYNcH9aNQF1X--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
