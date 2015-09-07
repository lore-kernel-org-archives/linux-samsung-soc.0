From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Mon, 7 Sep 2015 10:20:18 +0200
Message-ID: <20150907082017.GB19961@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
 <20150903090421.GC3784@ulmo.nvidia.com>
 <55EBBA0C.1030100@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EBBA0C.1030100-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dri-devel <dri-devel@lists>
List-Id: linux-samsung-soc@vger.kernel.org

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2015 at 11:59:08AM +0800, Yakir Yang wrote:
> Hi Thierry,
>=20
> =E5=9C=A8 09/03/2015 05:04 PM, Thierry Reding =E5=86=99=E9=81=93:
> >On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir Yang wrote:
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
> >>Yep, I agree with your front point, it is a property of panel, not spec=
ific
> >>to eDP controller, so this code should handle in connector logic.
> > From your description it sounds more like this is in fact a property of
> >the panel. Or maybe I should say "quirk". If the panel doesn't generate
> >the HPD signal, then that should be a property of the panel, not the
> >connector. The eDP specification mandates that connectors have a HPD
> >signal, though it allows the "HPD conductor in the connector cable" to
> >be omitted if not used by the source. I'd consider the cable to belong
> >to the panel rather than the connector, so absence of HPD, either
> >because the cable doesn't have the conductor or because the panel does
> >not generate the signal, should be a quirk of the panel.
> >
> >That said you could have a panel that supports HPD connected via a cable
> >that doesn't transmit it, so this would be a per-board variant and hence
> >should be a device tree property rather than hard-coded in some panel
> >driver.
> >
> >Conversely, if the panel isn't capable of generating an HPD signal, then
> >I don't think it would be appropriate to make it a DT property. It would
> >be better to hard-code it in the driver, lest someone forget to set the
> >property in DT and get stuck with a device that isn't operational.
>=20
> Oh, you're right, if it's a cable quirk, then DT property would be okay, =
if
> it
> is a problem of panel, then maybe hard-code in driver would be better.
>=20
> After look up for the document of panel "innolux,n116bge", I haven't see
> any description of hot plug signal, and even not found in PIN ASSIGNMENT.
> So I believe it's a panel problem, that's to say it should handle in panel
> driver.

The datasheet that I have for that panel lists HPD as pin 17. Also I
used to have a setup with that panel and I distinctly remember hotplug
working just fine. Perhaps this is an issue with a specific variant of
the panel? Or perhaps this is indeed a problem with the cable that's
connecting the panel to the board. It could be one of those cases where
they left out the HPD conductor to save money.

Thierry

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV7UjBAAoJEN0jrNd/PrOhE68P/0B1Ca2qOrOsr1K0KU/AQhsk
DwpfyUV93vVdsTaSVyinlXsMi+Dpr3kse6y94kvLudF5r0yqMVcIHEuGwq5GkVAC
R2KexsvfBCtdIh2vF8C2zwSwpRJBmk42kWPzgcI+/Jbal4LKSoOvn3GJhalwWMxK
zfMhsjgb2XWFQPn7rdlHQ08z8v2ZV3njHPz/SF6aaKh5L6WZTFGRRifQcBzTzJh6
dDZ1T+MTjcDbEjOtTThhhS9976OM9NalebudYT/VQ1HZtOTCJu4s+fX2S9fltSVk
4TFIjgs1KXOCRB0knP6ITYOaHAZoydOnoJo/FCQClj4tiWuf4g42/lukW3oeYr3/
fNYOqfncKtSdvavtQCUUra/PvrygiZya8AvcGRVqZub/vmyqmTmPSmS4UKOr6i+j
lzfuoP0ubWe3gjFdJafa4kbWHd15j9+PxXKAgxhkUVt7UsWAejSQMnM4scLqy9dJ
HwwlxL8umkt1cMng4YmAIz4EIYI4P/Uu8cA+w+RtzzK7GVNOlrudtM5PrubjU33G
DvLTucz82biGx9B+SlTjEsYFKWPeimhwEkvzXauHmDp4AHwjS9d1I245f2FmJfLd
bJ9i/DvHwxJ9PbdLFl7P9m1kVhc9dp6MuKb4Vkm92UPmU7X9m6ls7o+uSLWN6vx2
/OgBPesp9l+CXunS2aL9
=DkJC
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
