From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: Add tps65090 FETs constraints
Date: Wed, 13 Aug 2014 13:29:10 +0100
Message-ID: <20140813122910.GQ17528@sirena.org.uk>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
 <1407861868-20097-7-git-send-email-javier.martinez@collabora.co.uk>
 <20140812172552.GU17528@sirena.org.uk>
 <53EA61B9.2070805@collabora.co.uk>
 <20140812212757.GY17528@sirena.org.uk>
 <53EB4CA0.3010006@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BfWjI5LQ9yaoK0nw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53EB4CA0.3010006-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--BfWjI5LQ9yaoK0nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 13, 2014 at 01:31:44PM +0200, Javier Martinez Canillas wrote:

Please fix your mailer to word wrap at less than 80 columns, it makes
your mails very hard to read when replying.

> On 08/12/2014 11:27 PM, Mark Brown wrote:

> > Well, I think the question is if you understand where those numbers come
> > from and if they make sense.  I've not seen the schematic for the board
> > so I can't comment but it is quite unusual to see ranges listed for so
> > many supplies, for things like SD it's obviously normal but things like
> > video_mid are a bit more surprising.  Does anything actually vary those
> > voltages?

> You are right, in fact even the voltage for the SD supply (tps65090 fet4) does
> not change but still their constraints have to be defined, since it is used as a
> vmmc-supply and the series "Adding UHS support for dw_mmc driver" [0] calls
> mmc_regulator_get_ocrmask()/mmc_regulator_set_ocr() for mmc->supply.vmmc.

No, that makes no sense.  If the voltage isn't allowed to change why
should the constraints be specifying a range of voltages for it to be
set to, especially a range with more than one value in it?

Please try to think about what you're doing in design terms rather than
just bashing on things until you get something that works in your use
case, it's important that things are understandable so that we avoid
fragility and special casing.

> For fixed regulators (like fet4), mmc_regulator_set_ocr() just skips varying the
> regulator voltage but still expects to be able to obtain its voltage.

Which can be done with regulator_get_voltage().

--BfWjI5LQ9yaoK0nw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT61oTAAoJELSic+t+oim9qvwQAJMOyHURgjbRXek9aQr4LkKp
EtNjqmjIDPgDmzfQfokUSxqqFapR/Drr8L01QW6OvxVeFXVN3K1zx9bDUOFwcF1s
h57ddNWBROQ/8YvIZF5AaeyC+qXKABmovEMtRt4FtUtGHvVCLKVm8v4TBujkdvrF
BV53gEkL5LUbsRhjNvsnhygc1YDdO2IDBGQUPDiP5DewPbqkN1ig2fGuEDsRlzBD
aJJncUS+xwybDoMPqMQ5mfwxVwW6u8Rh0kO9kY+xrBFsozXreQpNd5cuoG8a5jmI
E01Oz9Pb4WHjQb3JBme1/CBrOqaGJDu9lrw4Ok4SS0adsw1TeLdyeksHdrn8tcEL
lwAlbjheK7xYNdgQ1SG7hxOi07icO+LDHzVIkyu5eLbBPm+iNHF34toVy9C6rqVt
kCaYrN6GzLGqQ/6J41lAHCi0PMVnrg999wvy4s9Zg9csHLfvX45cG6YnMWBy6sKP
5Ohh/tbAfKnY4+pFmBM5seA+6iMESbBOvYPTEqVLBvGeYjL4yu9h5WfInitIOkgT
wQKdpX8ztZ62m2+YVxIy/StDFWzMYdrh+EU+sxdnC3jPHdQZVWNtUKk4bbrcJ75n
stWb032S0qqaVQXySZlHVqoQcR6Nag7VpPQmxmIQgT8/M42nB62g+kHAq90YQURI
x8HNxdWPh4Hk0t6K1MGW
=ru7b
-----END PGP SIGNATURE-----

--BfWjI5LQ9yaoK0nw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
