From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Thu, 12 Sep 2013 21:00:13 +0100
Message-ID: <20130912200013.GU29403@sirena.org.uk>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <2175767.kktjrZWOAr@amdc1227>
 <20130912135233.GS29403@sirena.org.uk>
 <1657964.f1bIFjAZ98@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4iHuaJcI85sIo7+R"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1657964.f1bIFjAZ98@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--4iHuaJcI85sIo7+R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 05:55:59PM +0200, Tomasz Figa wrote:
> On Thursday 12 of September 2013 14:52:33 Mark Brown wrote:

> > Please delete unneeded context from your mails, it makes it much easier
> > to find the new content.

> I always snip unnecessary parts of quoted message if its really long, but=
=20
> if its length is in acceptable range then I try to keep the whole message=
=20
> just for reference.

I tend to say that when I find myself paging through entire screens of
quote and can't see the relevance to any content I eventually find.

> i2c@12CA0000 does look like a normal hardware I2C controller, which needs=
=20
> some extra properties like samsung,i2c-sda-delay or samsung,i2c-max-bus-

Shouldn't these have sane defaults?

> freq. However they are specified in cros5250-common.dtsi, so I'd say that=
=20
> this might be better place for the status override as well.

Can we rename that file to something like exynos5250-cros-common.dtsi
so that it's obvious it's relevant to exynos?  I had completely failed
to notice that it was anything to do with Exynos when I was searching
for affected DTS files.

Especially given that it's included in exactly one DTS at the minute...

--4iHuaJcI85sIo7+R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMh1KAAoJELSic+t+oim9JXsP+QHl73nQpToQFIVlGkhcBTUq
pxCjh53Esd55RgtuhAMMKdQCsJrFsbLK+Z3fuyuH6fGEK1hMoVg6wm33PCK+6D3m
2ABZUL4m6lkJYbXKeHJAT74OnHgJ3gQeCtOvf9VXBzCWU2PFKZVXiFjTZfP6vgwr
wsbTwqlXuz7fU2thJ7OHdSEC+QpFUGFmgiozzbj+1JUkeSqhAk+NflVSONO2oSVV
VqTKDTB5ZaDQ2/popRl9sq84bZdMIjR5V0pMvbrnzbvSu8n1BouoFn6yxIcdi7sT
qML9gl022KgoX5R99U3L10YaSROzZDscKDaVuWArBhx3folXWxVIAzSFH+6+JsSd
2mUPtKDTRQeosMMo+isa/2O8eTDHbV2Gc4N3xLYIxphJS/n61feLcfCy91Lyw0ov
HiVTmTtuvcK5tS/26wQAIrc29C1wPa95svk57FU0ovPAUZg7YEqmh4pEpCjeTSzK
A6hgl7sRBHZhr0zbrTpHjt4Mj5fjN6Hw40dkVrypQycRu0x1kL1ld84Nn3eOnp6o
aRFOGNYGgHAo5/CoOFqJk+gK3jPrshwtfO9on3b68wuzRpG7UZvpAvGi6WXlTONp
fu8lopXf5cN5oT4izrfzzwarlUmalVNx9qilSARzI6tKSHb2C364rZplCAcpofXG
Ea/7QbslDleIn+zu0Ptx
=7tjR
-----END PGP SIGNATURE-----

--4iHuaJcI85sIo7+R--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
