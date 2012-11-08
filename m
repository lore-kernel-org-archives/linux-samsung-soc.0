From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/5] ARM: EXYNOS: Update & move usb-phy types to
 generic include layer
Date: Thu, 8 Nov 2012 20:20:43 +0200
Message-ID: <20121108182043.GC2228@arwen.pp.htv.fi>
References: <1352213699-11112-1-git-send-email-gautam.vivek@samsung.com>
 <1352213699-11112-2-git-send-email-gautam.vivek@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352213699-11112-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2012 at 08:24:55PM +0530, Vivek Gautam wrote:
> Updating the names of usb-phy types to more generic names:
> USB_PHY_TYPE_DEIVCE & USB_PHY_TYPE_HOST; and further update its
> dependencies.
>=20
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Kukjin, I need your ack on this patch. Does it look ok for you ?

--=20
balbi

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQm/f7AAoJEIaOsuA1yqREHe8P/jWReY6M/ClbJL8sfIU60kTV
ppBnMNBBjzY58XGKVJvrdNsP4FhT5t5F1IZkgsn/T0vKE4XDPvT/WAYLsyhTwdTl
uAbgwVI+yOOr/mhifFlvCGwDR+WMlZALbEYqVUFMMQf0QgS7wjRiagbtUtjQpsjB
fZexOySNRVoFr64PajVhWhHdKIjwBDpUJKdAgBWDpvMvl9jAMwU+80oTcKg/bQkJ
kO4fGSzRn+WzE0sLQbWg45B8soMrdKa2wsPC3tuwklaVBqr7CpklZ9qUBr7yDgmR
nvTaDMA6UndxMDmsRyMwSYq4pmUjrzoLPaf2GMlRMFI0MACPMVavyDnBf4YMlDQr
EYRPhG117adTAGA+YqE2thVfmvWGwOWZkF71rqdYSmHkeW+slAnIKG8byQijppv9
g77mrpGYBohRMW3BdHgWrQj053TcUI1+LGyJ7YbanNUD+EIKeavzNzG6q38mEOM+
nOJncE6cw/BTperdCxIKiWotwSp01a5p0YS1Mh6r5UObEEHOWzt6P5SW17rnBwww
pdgzwbx0BZpmjYtnSwMtep9C1iqzyyCItPY/YUyCpWgVfU5VpVCB4bjHtu3ZIGUV
9iT0hhTYKwFrNJvxAgqgR0jUriFf9lW6SzEXWRZh7J7T8y/9kRO3CrDompKaM5AW
wvkWIM7WZclwgIhEAjj1
=K2do
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
