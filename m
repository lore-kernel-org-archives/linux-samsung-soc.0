From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 8 Oct 2014 09:09:19 +0200
Message-ID: <20141008070918.GA4999@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5433C0CC.5040804@ti.com>
 <CAEC9eQPq28GFS+1GweECM9QHfCM+LzOL9ySq05i6RfVG6-2ubQ@mail.gmail.com>
 <2230493.RvivJykn5T@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1003030932=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2230493.RvivJykn5T@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1003030932==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 05:49:24PM +0300, Laurent Pinchart wrote:
> Hi Ajay,
>=20
> On Tuesday 07 October 2014 16:06:55 Ajay kumar wrote:
> > On Tue, Oct 7, 2014 at 4:00 PM, Tomi Valkeinen wrote:
> > > On 20/09/14 14:22, Ajay kumar wrote:
> > >> Well, I am okay with using video ports to describe the relationship
> > >> between the encoder, bridge and the panel.
> > >> But, its just that I need to make use of 2 functions when phandle
> > >> does it using just one function ;)
> > >> -        panel_node =3D of_parse_phandle(dev->of_node, "panel", 0)
> > >> +       endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> > >> +       if (!endpoint)
> > >> +               return -EPROBE_DEFER;
> > >> +
> > >> +       panel_node =3D of_graph_get_remote_port_parent(endpoint);
> > >> +       if (!panel_node)
> > >> +               return -EPROBE_DEFER;
> > >>=20
> > >>=20
> > >> If nobody else has objections over using of_graph functions instead
> > >> of phandles, I can respin this patchset by making use of video ports.
> > >=20
> > > The discussion did digress somewhat.
> > >=20
> > > As a clarification, I'm in no way nack'ing this series because it
> > > doesn't use the graphs for video connections. I don't see the simple
> > > phandle bindings used here as broken as such.
> >=20
> > Well, I am okay with any approach you guys decide on. I desperately want
> > this to get this in since it has been floating around for quite sometim=
e.
> > The more we drag this, the more rework for me since the number of platf=
orms
> > using bridge support is increasing daily!
>=20
> I won't nack this patch either. I'm however concerned that we'll run stra=
ight=20
> into the wall if we don't come up with an agreement on a standard way to=
=20
> describe connections in DT for display devices, which is why I would pref=
er=20
> the ps8622 bindings to use OF graph to describe connections.

I think there's not really an easy way out here. It's pretty bold trying
to come up with a common way to describe bridges when we have only a
single one (and a single use-case at that). The worst that can happen is
that we need to change the binding at some point, in which case we may
have to special-case early drivers, but I really don't think that's as
much of an issue as everybody seems to think.

This series has been floating around for months because we're being
overly prudent to accept a binding that /may/ turn out to not be generic
enough.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNOMeAAoJEN0jrNd/PrOh2oUP/3irwcsoWdrAKD1cePQky8xx
TdWXI5yUql5x2dn6lKoYU4NrnWBk1At2wPvQDUDY616DVV2Jm2Vgxy1Rs+NPu+Lw
pDMLYxOwecDM/DcTtV0L1bQIpsT8kbJxP2FR6m9pFjNIED6G6dU05HAav8vfOru/
eneF4qZBJWehdA3wX2RN1MjFnxkL2MO4RBZts9qHpKEpoTTa+Iye2Flya6239YsP
z9UVN9kijktNsSnOmOsIh66x45qdHdH0998Q6wAUY4/u3yzmTs0iYk6Wh+qmnHw4
nlft3ojPa+jPCZeB1+KmawAbND0wAuLtfTiQJbu1psaBHro5tdLHrQhIFlt91Jyq
LB14yR72Mbz07L2Bn2iMI/BKpXyi/3OMPYOmFurr3WSu23TDhLbvulfVfGyWTsHu
YUwVYzi32GW93ItOKAXOxVUHOrrl6shNQegwvSbWxE8uf7+QfNMWCgJ6YTU0aBH6
cV1Gku2MYsXgEBuPFsmrZ7zCPQoxZfjxJHHsNvx+Rrebq0GJxIfGfNl+ouyiRA0x
X3hdMvOsfUQfy2EOg7bms4EJPu38c4y/G9A5DT3yL3737kmS0JkcMOi0c0e3ULG7
RVKLX/E3UwYRp6PTYkOauIjsvJ9LrqtOrA1jPCGvkwkZviF4YKCPzBUA65YlAHoT
rKIsKI60hXP+4V+QS5BG
=+znO
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============1003030932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1003030932==--
