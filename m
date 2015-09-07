From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Mon, 7 Sep 2015 10:39:18 +0200
Message-ID: <20150907083916.GC19961@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
 <CAL_JsqKoyZOAA7yzSATA-Ys8N1q9Edi-3ctPU09UVeV=7sTWTg@mail.gmail.com>
 <55EBF757.20108@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EBF757.20108-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dri-devel <dri-devel@>
List-Id: linux-samsung-soc@vger.kernel.org

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2015 at 04:20:39PM +0800, Yakir Yang wrote:
> Hi Rob,
>=20
> =E5=9C=A8 09/05/2015 05:46 AM, Rob Herring =E5=86=99=E9=81=93:
> >On Wed, Sep 2, 2015 at 11:27 PM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> >>Hi Rob,
> >>
> >>=E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
> >>>On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> >>>>Some edp screen do not have hpd signal, so we can't just return
> >>>>failed when hpd plug in detect failed.
> >>>This is a property of the panel (or connector perhaps), so this
> >>>property should be located there. At least, it is a common issue and
> >>>not specific to this chip. We could have an HDMI connector and failed
> >>>to hook up HPD for example. A connector node is also where hpd-gpios
> >>>should be located instead (and are already defined by
> >>>../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connector
> >>>binding, too.
> >>
> >>Yep, I agree with your front point, it is a property of panel, not spec=
ific
> >>to eDP controller, so this code should handle in connector logic.
> >>
> >>But another question, if we just leave this property to connector,
> >>then we would need to parse this property in analogix_dp-rockchip.c,
> >>and then make an hook in analogix_dp_core.c driver. This is not nice,
> >>and if there are some coming platform which alse want to use analogix_dp
> >>code and meet this "no-hpd" situation,  then they would need duplicate
> >>to parse this property and fill the hook in analogix_dp_core.c driver.
> >>So it's little bit conflict  :-)
> >Ideally, you would be able to just retrieve this quirk from the
> >connector or panel. Getting this property from your node vs. the port
> >you are attached to should not be much harder. Either the connector
> >struct can have this info or there can be a DT function that can walk
> >the graph and get it. Just don't open code the graph traversal in your
> >driver.
> >
> >>Beside I can not understand your example very well. Do you mean
> >>that there are some HDMI monitor which also do not have HPD
> >>signal (just like some eDP panel do not have hpd too), and then
> >>the "hpd-gpios" ? Hmm... I don't know how the "hpd-gpios" want
> >>to help in this case, would you mind show some sample code  :-D
> >I don't know that there is h/w, but it is always possible HPD is not
> >hooked up or hooked up incorrectly some how.
> >
> >If there is no HPD support, then hpd-gpios is not going to help you.
> >
> >I think there are 3 cases to handle:
> >- HPD handled by bridge chip - The bridge driver knows it has this
> >capability. No DT properties are needed and no HPD properties on the
> >connector node imply the bridge chip should handle HPD functions.
> >- HPD handled by GPIO line (or some other block) - Indicated by
> >hpd-gpios present
> >- No or broken HPD - Indicated by "hpd-force" property.
>=20
> Oh, I think the first/second case isn't suitable in this case, my panel
> "cnm,n116bgeea2" haven't included HPD signal.

Note that if your panel doesn't signal HPD you're supposed to poll the
sink to make sure you catch loss of link integrity. I've always found it
odd that people would want to save a couple of bucks on the HPD signal
conductor when that means that you will consume more power because you
need to periodically poll the link for integrity.

> >>>Are there any eDP panels which don't have EDID and need panel details =
in
> >>>DT?
> >>
> >>Oh, I think you want to collect some info that belong to panel
> >>property but no indicate in panel EDID message, so those can
> >>be collect in eDP connector binding, is it right ?
> >Yes, and as Thierry pointed out we may need to know the exact panel even.
>=20
> Yeah, just like I reply to Thierry, this is a panel quirk. And he suggest=
 we
> should
> handle this in panel driver, but I have no idea how to handle this in com=
mon
> panel
> driver.   :)

Like I said in another subthread, this panel does have an HPD line in a
variant that I've used in the past. So if your variant doesn't have the
HPD line, we're dealing with quirks within the same family of panels.
That would make this some sort of quirk, and I'm not sure if there is a
standard way for defining quirks in DT. Rob, do you know of any
precedent for this?

I suppose we could always add a variant-specific compatible string that
would allow this quirk to be encoded in the driver, though I'm not sure
if the model string in datasheets has enough detail to tell them apart.

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV7U0yAAoJEN0jrNd/PrOhdwEP/18HFrEGDwU/m9okI56Ou1X8
2ZIM5d2eK1+MDXTWoQsdAdd3uI2+Rt1gCjmalSBmAbOCqBuNTx3Y1OTJ6TgGdcPW
/cdAoasKReOqCb5XOm2q+92tCbtCpA4htYEGBIwkwlPbm0krPzCO1FUMlkYzzDQx
anNfpYsRJPDDMv6ebBVicBZuFobhp5xSUoUajQvrsESm9EBXlI0xeLuw4f6HltBX
rEmz/KePlkNajjgKzC7sab3kAyRWgzbSdt4VgKm92HDvQPkK84SfzT/H1rmLwkyk
KxRSWicF3o2/xFLlfikGQLKiO+k1gzIveEOO8RuIZTObF6xc/ePz1wMdQtfB0CzI
pcH4xcRf8byU1mZeSsIa1aSOiHS1cBNpMsSdOCM3vr6L9ssA1OYXmPgZLoy7pcn+
WKKdOFNLC/VHG+B0VxlP7WyvLBURA0zQfYwPol6VESogdkbKfoNyGUbjkN7AdwHc
dinPAIc2w+/aeIHXlGsEpxMpSBibJh+LdL/kyAAGoMMXBlPvmrYxo0oMxHXXL2Ph
i4eWyJO6MkGrDZkOMPieRkxenl4U2M4P4cr9HeyajL/IAvENP66S9E+IRF5zHnf0
/IzOTw4augIeSeQpTYKNTeVg0SBi9jBCFPTWd+weaNBg5C5t27DhJxkZtd9wVyRK
yfO1RRKg2fKgkMrNmOa4
=y65I
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
