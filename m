From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Fri, 4 Sep 2015 12:01:48 +0200
Message-ID: <20150904100147.GE22056@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <20150903084735.GB3784@ulmo.nvidia.com>
 <CAL_Jsq+F=eE6vU3f-bHrrSCD9GCoh80Nf-5=Qm73QgGDW1Np=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+F=eE6vU3f-bHrrSCD9GCoh80Nf-5=Qm73QgGDW1Np=w@mail.gmail.com>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dri-devel <dri-devel@lists>
List-Id: linux-samsung-soc@vger.kernel.org

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 04:55:59PM -0500, Rob Herring wrote:
> On Thu, Sep 3, 2015 at 3:47 AM, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > On Wed, Sep 02, 2015 at 03:17:57PM -0500, Rob Herring wrote:
> > [...]
> >> Are there any eDP panels which don't have EDID and need panel details =
in DT?
> >
> > Most panels need information other than EDID. They typically have some
> > requirements regarding the power up sequence that aren't to be found
> > anywhere in EDID or detectable by some other mechanism. A decision was
> > therefore made a long time ago to require panels to be listed in DT with
> > a specific compatible string. That way all of these details can be
> > stashed away in drivers that know how to deal with these kinds of
> > details.
>=20
> I guess I was being hopeful that eDP was improving that situation.

Unfortunately not. eDP helps with a number of things (DPCD and link
training take care of a lot of the issues), but it doesn't provide a
solution for everything.

To my knowledge in most cases the power up sequence isn't strictly
necessary to get the panel to operate. But there have been instances
where this is absolutely required if you want to avoid visual artifacts
as you set a mode. A lot of panels that I've come across require
receiving a couple of frames before they guarantee that something will
actually be displayed on the screen. So if your code is too quickly
enabling backlight, and your backlight doesn't happen to have just the
right amount of ramp-up time you might end up seeing garbage on the
screen for a couple of frames.

It would be great if somebody came up with, say, an EDID extension to
describe these requirements, but I'm not sure if even that would give
us panels that could be driven with a generic driver. Often the power
supplies or reset/enable signals are very different across panels. So
describing it all generically would become messy rather quickly.

Thierry

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV6WwIAAoJEN0jrNd/PrOhupUP/R8NGiS4+QlVvgcwjg8bApv3
4t98ttuU/sxl3qA5V2PXkq5GCuPByrAoFRV+hqvabfOYV6EYTpe8SoCjoBcuipzP
3dXdV5Wo/MCIAdFEsf2rasZve4RLAxyJt0VGkc3hEXiNmC1TKzJmWe9utLDGxmbL
7bPfj4izEu3Z8MqIadao95PiVUyN3U1rtOB0BwzLZg5nQv+YnzB1t+rXhc2nqsCn
bXs7F9CMrw7sHtPTPe1JwnWxNWfECaqOJ25UrN5T2mus1+X7/nkVQa2VoiltMAD/
BayxfsjWXr6bbGSE+WYLDP2oRfNxcfSGBP+sU5yrUHnkw6domsxAmOdd5buMRhpi
84JoAtePV0jeNQNzG1kP+OAQ7Ug3pxHS9WkqoNAGNUB3PwJ1aF25+aRG+5KSj9ct
i7CPDoYRjz88TxMEaoG41zOkCedcyGAJYdCtFneCDhP1cvX1NECIt7toA6252/yQ
Qbvyq/3xTHSOkzJWhkLlMGUoqWa99wdAPzklfSGtEIVY2uNUljGTT6bPKxeZcWfA
dPWCY+ER+iLRPJw9zqfSzULAafXZcmjQxQqU5OxUQQ3u4yUmjS6wY6rTbnZ1t5dc
fEYRMvqIAC62vnlLq+2k7aNI5kcUXvpaCBet/dlaeUYyMw5DDFGNzdCMGSxz6K++
nCEyQGo/n0DNQU9bnz01
=fFha
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
