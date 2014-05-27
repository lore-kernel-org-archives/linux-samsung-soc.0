From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 27 May 2014 22:21:23 +0200
Message-ID: <20140527202122.GA10609@mithrandir>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
 <20140526134153.GA2373@ulmo> <538430A4.8020702@samsung.com>
 <20140527075328.GA13081@ulmo>
 <CAAQKjZOGLPoGbZ7G3+BFd3ydRC2HGmz8JKqFiytdSvxN3T5U_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0382824121=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAQKjZOGLPoGbZ7G3+BFd3ydRC2HGmz8JKqFiytdSvxN3T5U_w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org


--===============0382824121==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 11:24:49PM +0900, Inki Dae wrote:
> 2014-05-27 16:53 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> > On Tue, May 27, 2014 at 08:28:52AM +0200, Andrzej Hajda wrote:
> >> Hi Thierry,
> >>
> >> On 05/26/2014 03:41 PM, Thierry Reding wrote:
> >> > On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
> >> >> This patch adds DT bindings for s6e3fa0 panel.
> >> >> The bindings describes panel resources, display timings and cpu mod=
e timings.
> >> >>
> >> >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >> >> Acked-by: Inki Dae <inki.dae@samsung.com>
> >> >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> >> ---
> >> >>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++++++=
++++++++++++
> >> >>  1 file changed, 45 insertions(+)
> >> >>  create mode 100644 Documentation/devicetree/bindings/panel/samsung=
,s6e3fa0.txt
> >> > You're totally confusing me here. Half of this patch series is about
> >> > adding i80 support to Exynos FIMD, and then you go and add what is
> >> > apparently a DSI peripheral driver here that's supposed to be used by
> >> > this new i80 support. Nothing I've been able to dig up indicates that
> >> > i80 or DSI are in anyway related.
> >>
> >> FIMD can produce parallel RGB output or command mode in i80 style outp=
ut
> >> via parallel lines.
> >> DSIM can accept parallel RGB stream in this case it produces MIPI DSI
> >> video mode signal or it can accept i80 and in this case it translates =
it
> >> to MIPI DSI command mode.
> >
> > Then the command mode timings aren't a property of the panel at all.
>=20
> Then the video mode timings aren't also a property of the panel.
>=20
> Which interface mipi and display controller should use would be
> decided by lcd panel type: display controller can use i80 interface
> based lcd panel, and also mipi controller can use i80 interface based
> lcd panel.
> In here, the only difference is that lcd panel receives  packets,
> which includes video data or command data, packed with mipi protocol
> via lane lines or receives video data or command data via parallel
> lines.
>=20
> And the below is LCD types,
>         RGB interface panel.
>         i80 interface panel.
>         MIPI based RGB interface panel.
>         MIPI based i80 interface panel.
>=20
> RGB interface also is called video mode, and i80 interface also is
> called cpu mode. In case of omap SoC, it is also called Smart panel.
> i80 interface is just one of LCD types. So I think this interface
> timings should be handled by frameworks related to mode in same way as
> RGB interface.

LCD is a display technology, it has nothing to do with the interface. My
point is that from Andrzej's description, and in fact from this patch
series in general, the S6E3FA0 panel is a DSI panel. Associating timings
that are i80 specific to it is therefore wrong.

Consider for instance what would happen if somebody were to use the same
panel on some other device (connected to a DSI controller). If you
specify i80 timings for the panel then the new device won't know what to
do with them because it expects DSI-related timings.

Let me try to summarize the above to make sure we're all on the same
page:

	- FIMD is a display controller that can be configured to either
	  send RGB data or i80 data
	- DSIM takes either RGB as input and outputs DSI (video mode) or
	  i80 as input and outputs DSI (command mode)

In both cases the panel is connected to DSIM and it takes DSI as input,
because it is a DSI panel (it doesn't understand RGB or i80). The panel
needs to describe the properties of the DSI interface so that DSIM can
be configured appropriately. DSIM in turn works as a bridge or encoder
that converts RGB or i80 to DSI (video or command mode). So it makes no
sense to describe the i80 timings for the panel because it has nothing
to do with i80. Instead the DSIM is the hardware that needs to specify
the i80 timings, so that FIMD can be configured to generate the timings
that DSIM needs.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJThPPCAAoJEN0jrNd/PrOhvugP/0qOAEr/lN9UFxdZXF/eT+H+
hhSd3SsM+baD1d09SJMy+uramqnSOB7QFG9meTLG6sPkwhbcPPkOSu2OKt7y0V7i
LHKabxSGasU4Lmf8nMs0PlJW29sruJWtKY8BTQAoK6Nikx5s2hp9d3uQ8j9vCIxC
SACd4ZxA1bGDDah5Z8Z/uO5rtv3alTcJrnH3hoYucIlHZx0t75GiY5EIWludsIc/
Aoox8cd2GDIrqzI0E0rebJinoZQsDQOI4YxcBkVQ2NQgV75zv4etNlE97vjQExm3
EC8d2rNVL27hAI/mzWy3wBMKbLAdIon7Nzz4YzYczUVmJiUbEILsMsucq3hwe82g
oCnXKqW12fQ5oRikthzr+tRhvP96zYzCUIy6Pyq66i8oMFkpCChZbObC5glAK3sQ
LUgX2W8gz5vJP95Yk7Xw5NPj14l8LynzC5BPc0343yVdo6qcEhLEgHiptVbGlEaA
0YYpvOpsot9MIymueL7pyqOKwOC9+ITei57GPO2zm1c+1FoXxNVlhHogH5SZBmdS
LwZ3gOniY/H5NP3S0hi2GTle27aCQ/75VlZvjsyH6IgnDz5RZfzxzY2kXHlyA1h8
3LZm3kiQ8LvwSExWewwZEattKX0DaLBuhVjKoKOfuPanQ2KlQIO8r/IXOOhhjTK7
KLslKFcN4XWRFtYFnkw0
=VkoZ
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============0382824121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0382824121==--
