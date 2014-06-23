From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/10] regulator: Add driver for Maxim 77802 PMIC
 regulators
Date: Mon, 23 Jun 2014 10:47:34 +0100
Message-ID: <20140623094734.GV24291@sirena.org.uk>
References: <1402941758-11216-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402941758-11216-8-git-send-email-javier.martinez@collabora.co.uk>
 <20140616192500.GJ5099@sirena.org.uk>
 <53A01D54.10506@collabora.co.uk>
 <20140617141254.GP5099@sirena.org.uk>
 <53A06749.1010606@collabora.co.uk>
 <20140621204026.GH22657@sirena.org.uk>
 <53A7F339.7050608@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6qFdnjy6dKaiDX/E"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A7F339.7050608-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--6qFdnjy6dKaiDX/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 23, 2014 at 11:28:25AM +0200, Javier Martinez Canillas wrote:
> On 06/21/2014 10:40 PM, Mark Brown wrote:

> > That's not really relevant here - I'm asking if the regulators get their
> > own supplies rather than if anything uses them.

> Sorry if I keep misunderstanding your question but the regulators in this PMIC
> don't have a parent supply/regulator node.

They should, I'm pretty sure the device does actually regulate one
supply into another.

--6qFdnjy6dKaiDX/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTp/ezAAoJELSic+t+oim9E4sQAJi2kzIJpgcPKot+Qf54PELp
qJ9WtYpSj3JJ4wlco5MFkvpwhopDBid+s2FISAGL882quUOrkw4jsYRI4IeNTcz/
w5KiX9v40Au0ybcwglsHkDLYUQKdeHfZReno0JcPvLrNBb6n7V0m4oUkerOQ2kak
29EbRwVaGEARK1Vjob2EzGGzlKIrop/O1TjCfoVcC2xnJbgg/8ERINs81gy14wVE
15MoIQ2r7nEvWNJyGR3qYUwSnkZo20toZFNnEFl4B9C6SjWTvZWUpClW4CG22HwQ
9tmxvrY54mViWD024GD8/9D3nYR/zU/l26bzjy9wTpHkEsyOhzj5cvBYn6dR4fzw
Oy8QHiGAwFCRCdNcnIUdEURKZkVQXi9bDrRHe296oGWZH2V9b+57/wiWIxtfyWm1
5H0aKPTum8Xy3xECxQ8cuvDDwONcHktqJEl5Kde9TAia19EEEwnqMmy+KZThCDjh
OxGYDERal1ctVZyYW7UWpQezV7UKtbAzmhM0lJ0LGlHb1/jmzTYULXgWieDtLTf6
q8xlLijEpq3FJ5gk9D/5lYb6pR5tZ8PbJGnvGxQX2KIeVOSzHFUMsDTzpq9wp9Pm
GRJnVflHhUR6y4vkAUNuKYSQ+9B2mN24GKMM3CunxiAoW6FfxxsL1/XtvdWDJA0M
T7jZx+7vgHd223MNo7ex
=NTZb
-----END PGP SIGNATURE-----

--6qFdnjy6dKaiDX/E--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
