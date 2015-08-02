From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH V2] i2c: s3c2410: remove unused variable
Date: Sun, 2 Aug 2015 03:59:00 +0200
Message-ID: <20150802015900.GA1726@katana>
References: <1437164839-9287-1-git-send-email-laurent.navet@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437164839-9287-1-git-send-email-laurent.navet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Navet <laurent.navet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -565,7 +564,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  	tmp &= ~S3C2410_IICCON_IRQPEND;
>  	writel(tmp, i2c->regs + S3C2410_IICCON);
>   out:
> -	return ret;
> +	return;

What about removing out: and return as well?


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVvXlkAAoJEBQN5MwUoCm27tgQAJszIQLQsHbt8ro+TU6OtUO/
t+Apz4JoB+D2Rlw9dSPLB0gGsazr8SRZuXFG/s3EGvDsdR+8MxCJJPQ+KHKI7URV
T7sqPJOfaRnZKOxVittsDv7Yw/i9XRp0I+pe/1an543SxqaJRnGD9pvEjumg3PRV
fT0635zDtkVHmZeNLGApRYLXPaGcKANDepIPDCmmxkPcw1bevdjgtSzeKOiSXsHl
ozRNQO2sqASJSts7PRbuBk/rSRg7gYArpVfhV9qolYNlAesDxW/Fd6RwgX+YN4VC
BqcYuTo6L1gw9t+tcrSlxf1y5AEwdegRpHRWYEm0SL31ICDFUrSsEPNSN3EJbFqU
VIbVyU2k29BNu/utDR8YLvB+iHJUwhbrDaL0Oet2/0AlmnT//NPCXplL1nJNLlak
zMRz4SouPM+s/FFy2kiKZjA9T1ef0RzmcjuYzioSYY/3PfS2vd7n50NGnbx1kgDa
X17QFaQNnnFpn3pdXbMQcbRqKR9+XKfmJ/wNFQ5q6U6kvFYVXeWPr3cmVCqpEVnt
Nf3gKcIZ9UIsiBpFOWPV3RonRyil0iOUBMvkVWvGdoYK5WPxE36bqPxyI7BpDZ7j
F7OFczW0RRKxfFsUJZQXvmSFMzrOjYz/XstpWv7+fsLL8vxIeiPbz0nvBz0HVOB5
ouN2I33nbeqaXbRR504n
=rZ45
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
