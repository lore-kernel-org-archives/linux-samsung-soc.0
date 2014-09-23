From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Tue, 23 Sep 2014 07:36:36 +0200
Message-ID: <20140923053635.GA30514@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <3764548.s4ysdtHE5z@avalon> <20140922074037.GA1470@ulmo>
 <3478703.M4FqhaqXMa@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0417977638=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3478703.M4FqhaqXMa@avalon>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0417977638==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 03:29:13AM +0300, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> On Monday 22 September 2014 09:40:38 Thierry Reding wrote:
> > On Wed, Sep 17, 2014 at 12:27:13PM +0300, Laurent Pinchart wrote:
> > > On Wednesday 17 September 2014 14:37:30 Ajay kumar wrote:
> > > > On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart wrote:
> > > > > Hi Ajay,
> > > > >=20
> > > > > Thank you for the patch.
> > > > >=20
> > > > > I think we're moving in the right direction, but we're not there =
yet.
> > > > >=20
> > > > > On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
> > > > >> This patch tries to seperate drm_bridge implementation
> > > > >> into 2 parts, a drm part and a non_drm part.
> > > > >>=20
> > > > >> A set of helper functions are defined in this patch to make
> > > > >> bridge driver probe independent of the drm flow.
> > > > >>=20
> > > > >> The bridge devices register themselves on a lookup table
> > > > >> when they get probed by calling "drm_bridge_add_for_lookup".
> > > > >>=20
> > > > >> The parent encoder driver waits till the bridge is available in =
the
> > > > >> lookup table(by calling "of_drm_find_bridge") and then continues=
 with
> > > > >> its initialization.
> > > > >=20
> > > > > Before the introduction of the component framework I would have s=
aid
> > > > > this is the way to go. Now, I think bridges should register thems=
elves
> > > > > as components, and the DRM master driver should use the component
> > > > > framework to get a reference to the bridges it needs.
> > > >=20
> > > > Well, I have modified the bridge framework exactly the way Thierry
> > > > wanted it to be, I mean the same way the current panel framework is.
> > > > And, I don't think there is a problem with that.
> > > > What problem are you facing with current bridge implementation?
> > > > What is the advantage of using the component framework to register
> > > > bridges?
> > >=20
> > > There are several advantages.
> > >=20
> > > - The component framework has been designed with this exact problem in
> > > mind, piecing multiple components into a display device.
> >=20
> > No. Component framework was designed with multi-device drivers in mind.
> > That is, drivers that need to combine two or more platform devices into
> > a single logical device. Typically that includes display controllers and
> > encoders (in various looks) for DRM.
>=20
> I disagree. AFAIK the component framework was designed to easily combine
> multiple devices into a single logical device, regardless of which bus ea=
ch
> device is connected to. That's what makes the component framework useful =
: it
> allows master drivers to build logical devices from heterogeneous compone=
nts
> without having to use one API per bus and/or component type.

But this doesn't work really well once you leave the SoC. For component/
master to work you need to usually (i.e. using DT) have access to a
device tree node for each of the devices so that you can create a list
of needed devices. Once you leave the SoC, the number of combinations
that you can have becomes non-deterministic. A driver that wants to pull
this off would need to more or less manually look up phandles and
traverse from SoC via bridges to panels to find all the devices that
make up the logical device.

>                                                              If the only =
goal
> had been to combine platform devices on an SoC, simpler device-specific=
=20
> solutions would likely have been used instead.

I think one of the goals was to replace any of the simpler device-
specific solutions with a generic one.

But one of the issues with component/master is that it's viral. That is
it requires users to register as master themselves in order to pull in
the components. While that makes sense for on-SoC devices I think it's a
mistake to use it for external hardware like bridges and panels that can
be shared across SoCs. If we make component/master mandatory for bridges
and panels, then we also force every driver that wants to use them to
implement component/master support.

Furthermore I did try a while back to convert the Tegra DRM driver to
use component/master and couldn't make it work. When I proposed patches
to enhance the API so that it would work for Tegra I got silence on one
side and "just keep using what you currently have" on the other side. So
in other words since I can't use component/master on Tegra it means that
whatever driver gets added that registers a component can't be used on
Tegra either.

> > Panels and bridges are in my opinion different because they are outside
> > of the DRM driver. They aren't part of the device complex that an SoC
> > provides. They represent hardware that is external to the SoC and the
> > DRM driver and can be shared across SoCs.
>=20
> They represent hardware external to the SoC, but internal to the logical =
DRM=20
> device.

That depends largely on how you look at it. From my point of view the
logical DRM device stops at the connector (well I think it actually
stops somewhat earlier already, with connector only being the handle
through which the outputs are configured).

Panels are, at least theoretically, hotpluggable. That is, if you have a
device that has both a panel and HDMI but you never use HDMI, then you
should be able to just unload the panel driver but keep the DRM device
running for HDMI. If you use component/master that's impossible because
as soon as the panel component goes away the complete DRM device goes
away.

> > Forcing panels and bridges to register as components will require all
> > drivers to implement master/component support solely for accessing this
> > external hardware.
> >=20
> > What you're suggesting is like saying that clocks or regulators should
> > register as components so that their users can get them that way. In
> > fact by that argument everything that's referenced by phandle would need
> > to register as component (PHYs, LEDs, GPIOs, I2C controllers, ...).
>=20
> No, that's very different. The device you list are clearly external resou=
rces,=20
> while the bridges and panels are components part of a logical display dev=
ice.

Like I said above, I consider bridges and panels external resources,
too. I can easily imagine (actually I don't have to because it was
recently discussed for a project) setups where some board defines a
standard header that display modules can be connected to and hence
whatever bridges or panels are attached can change at runtime.

> > > This patch set introduces yet another framework, without any compelli=
ng
> > > reason as far as I can see. Today DRM drivers already need to use thr=
ee
> > > different frameworks (component, I2C slave encoder and panel), and we=
're
> > > adding a fourth oneto make the mess even messier.
> >=20
> > Panel and bridge aren't really frameworks. Rather they are a simple
> > registry to allow drivers to register panels and bridges and display
> > drivers to look them up.
>=20
> Regardless of how you call them, we have three interfaces.

We need an interface to control the bridges and panels anyway. component
and master only gives you a generic way to handle the registration and
initialization.

Adding a drm_*_lookup() function to the interface to retrieve a resource
isn't as bloated as you make it out to be. Implementing component/master
is much more complicated for (in this case) too little advantage.

> > > This is really a headlong rush, we need to stop and fix the  design
> > > mistakes.
> >
> > Can you point out specific design mistakes? I don't see any, but I'm
> > obviously biased.
>=20
> The slave encoder / bridge split is what I consider a design mistake. Tho=
se=20
> two interfaces serve the same purpose, they should really be merged.

Agreed.

> > > - The component framework solves the probe ordering problem. Bridges =
can
> > > use deferred probing, but when a bridge requires a resources (such as=
 a
> > > clock for instance) provided by the display controller, this will bre=
ak.
> >=20
> > Panel and bridges can support deferred probing without the component
> > framework just fine.
>=20
> Not if the bridge requires a clock provided by the display controller, in
> which case there's a dependency loop.

I don't see how component/master would solve that differently than the
current proposal for DRM bridge (or the existing DRM panel for that
matter).

> > > > Without this patchset, you cannot bring an X server based display on
> > > > snow and peach_pit. Also, day by day the number of platforms using
> > > > drm_bridge is increasing.
> > >=20
> > > That's exactly why I'd like to use the component framework now, as the
> > > conversion will become more complex as time goes by.
> >=20
> > No it won't. If we ever do decide that component framework is a better
> > fit then the conversion may be more work but it would still be largely
> > mechanical.
>=20
> Are you volunteering to perform the conversion ? :-)

No. I'm still convinced that we won't need it. Less work for everyone.
=3D)

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIQbjAAoJEN0jrNd/PrOh2n4P/2d9cQ2bpkg0KDvjban4Ap9s
3kf8zyj64WMIKO+EAX9Ir+GUEg4yOyo4gCeUW6kUFmDtxgrIWlql+/RQSFJ3d3n3
/zvKLLgypKGJn5605HXl9k2Lfyj8Qzus+k4die9HHjkfNcA0+Z2ANId+iT5FF+gF
ulk19Za5JClZWMJ0O7mC5NCldumxXO1LNEqnYTadLRHvZ3GnEXfObTos4Epcubgr
jeJqciCkU67AWUvZBYga9XA4TIk2M7+oQmEVzh3XCQSw2RXrYoREMNUw//pfgWs3
6U/2NdEOFL2Zyhyk67xgSFRUV2UoW5fsH3IzI1pCSoQ0mGNsKrNH9exiJ573gj45
NtsT/UQLTWNNWQEU6smVoWeeEL/tDbCfsJxmyGl0H1B8nb1Y/g7gQ7M+6ryZzvOH
N0drFUS9GWwnykeHF83du/sOuzHPqlVcaHi9kd3dMbpNu6ka0C1vzSO7q0/fERcY
hHoYf/7Zs3SMz/EAYFp/IPMd1X09zNgq6dLEBuAqAcv/u8JVcMqlDp4wzWRlDq7d
lOAvQpupVRZDdxsp450+ZUeZq4B0U+e8yFojYV2ZKtS+yCvNXDBhFZCJMtSUOTJO
WTNKGefABheba2gNObCNO7ETv9dGx+g+mjSDgqaqCsIgsce7jgPavbIgL54ZJ7mO
EKcJyPUIDqOi8Em6+0/F
=KPFo
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============0417977638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0417977638==--
