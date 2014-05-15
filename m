From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 11:23:50 +0200
Message-ID: <20140515092349.GE6434@ulmo>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
 <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
 <20140514221423.GC6215@mithrandir>
 <CAPdUM4NaLpN99JCJH3qMakSO3OG6ASjEuvvr_CnKv=gOiqfzMQ@mail.gmail.com>
 <20140515074203.GD5952@ulmo>
 <CAPdUM4OXXMzMDNVym1ysMx7wifbO2QsSP5jk6cn3+F8Or3ng3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ep0oHQY+/Gbo/zt0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPdUM4OXXMzMDNVym1ysMx7wifbO2QsSP5jk6cn3+F8Or3ng3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--ep0oHQY+/Gbo/zt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 01:47:33PM +0530, Rahul Sharma wrote:
> On 15 May 2014 13:12, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, May 15, 2014 at 10:49:37AM +0530, Rahul Sharma wrote:
> >> On 15 May 2014 03:44, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > On Thu, May 15, 2014 at 12:47:21AM +0530, Rahul Sharma wrote:
[...]
> >> >> +#define PHY_NR       5
> >> >
> >> > I'm not sure that this belongs here either. It's not a value that wi=
ll
> >> > ever appear in a DT source file.
> >>
> >> I want it to grow along with new additions in the phy list else
> >> catastrophic. This will look unrelated in driver.
> >
> > But this is in no way growing automatically as it is. Whoever adds a new
> > type of PHY will need to manually increment this define. Furthermore the
> > driver will need to be updated to cope with this anyway.
>=20
> Not automatically. What I meant was If keeping it at end of the list, it =
is not
> possible that somebody skip the updation of PHY_NR when adding a new phy
> type.

It's perhaps not as likely, but still possible.

> If I leave a comment at the end of the list to update PHY_NR (after movin=
g it
> to driver), that also serves the purpose.

I don't think this is needed either. Like I said earlier, since the
driver has an internal maximum number of PHYs that it supports the
maximum that can be specified in the DTS is irrelevant. If it doesn't
support a new one, then it will simply return an error. And I would
assume that if somebody added support for a new PHY type then they
probably wouldn't forget to update the driver since they're modifying
it anyway and testing will fail if they don't.

Thierry

--ep0oHQY+/Gbo/zt0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdIelAAoJEN0jrNd/PrOhflAP/1Gzw5mXfrnFNP7lQrnxHxSC
aT9K0BoLcPdz37oJu5euWFZAT8Oe2cojaVfWCeeBPi2kaKEdCHIV82Dr9wJjE9Rs
0hJu8Kp9pprXVSkYUje+6ik1Ts+oKjzrdiaz0IDkUzqFhQHAJY9AQn/yilSCnGct
vswKnpht5t2r0SfzIeNahCksgbZnqkDfUOb2RI/IwPFo23pJSv44ljvE2FDJ4qZ8
l+2Nyurd+86+G/swomAwNQd4oaby0vrSkXt0Y6vreKYtWoSyrB7JtBWuuip8L3S7
8giMMldQyMG1bXiOwKkz7+IUVBtKI4Q2lALsjmiL0FstkEXE3HiVVP8zp9H3JT2M
5qqDOM5Wx0AI6oRhnzMyVxpU3JSxMFix9+Jyt1Hc7HGZ5GHHfAo9x3SqQGyvYur/
kn6fa5j1h0h+MH38AlvCXDNGaK90BUG09pj+aafnIXTdKqkV8W+x04gDjS7fNlHJ
c+nRCcOiYuF4aE3g4twhB0pLB3YmBidhP8piKVaSG/70Zt4QvOeRnYlA0UyCGaPr
cRUk96raZn/+ncLToghVSxf6Cv4CHSb+jOgcRq28xzn31Yllp0la7qOTmPHr24f0
6/7rh6MP649kMVPOTXBTzlVYZXVnT7TlN8OQ7ChTk1e4JhS6iYw8XUbXBHWhZQBc
LDhbFXosdQNy9GtqdjcR
=12g9
-----END PGP SIGNATURE-----

--ep0oHQY+/Gbo/zt0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
