From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 7/8] drm/bridge: Add i2c based driver for ptn3460 bridge
Date: Wed, 30 Jul 2014 17:40:54 +0200
Message-ID: <20140730154054.GE1345@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
 <20140730120504.GJ29590@ulmo>
 <CAEC9eQPERoZjPV5=P_Re_Bs7gT7Q5Q_Z6sJViuxoG8oo9O3=-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0723685626=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPERoZjPV5=P_Re_Bs7gT7Q5Q_Z6sJViuxoG8oo9O3=-w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0723685626==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 08:46:44PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 5:35 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> > On Sat, Jul 26, 2014 at 12:52:09AM +0530, Ajay Kumar wrote:
[...]
> >> +int ptn3460_post_encoder_init(struct drm_bridge *bridge)
> >> +{
> >> +     struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
> >> +     int ret;
> >> +
> >> +     /* bridge is attached to encoder.
> >> +      * safe to remove it from the bridge_lookup table.
> >> +      */
> >> +     drm_bridge_remove_from_lookup(bridge);
> >
> > No, you should never do this. First, you're not adding it back to the
> > registry when the bridge is detached, so unloading and reloading the
> > display driver will fail. Second there should never be a need to remove
> > it from the registry as long as the driver itself is loaded. If you're
> > concerned about a single bridge being used multiple times, there's
> > already code to handle that in your previous patch:
> >
> >         int drm_bridge_attach_encoder(...)
> >         {
> >                 ...
> >
> >                 if (bridge->encoder)
> >                         return -EBUSY;
> >
> >                 ...
> >         }
> >
> > Generally the registry should contain a list of bridges that have been
> > registered, whether they're used or not is irrelevant.
> I was just wondering if it is ok to have a node in two independent lists?
> bridge_lookup_table and the other mode_config.bridge_list?

Oh, it reuses the head field for the registry. I hadn't noticed before.
No, you certainly can't have the same node in two lists. Honestly I
don't quite understand why there was a need to expose drm_bridge as a
drm_mode_object in the first place since it's never exported to
userspace.

So I think that perhaps we could simply get rid of the base field and
not tie in drm_bridge objects with the DRM object as we currently do.
But until Sean or Rob comment on this it might be better to simply add
another struct list_head field for the registry. That way both can
coexist and we can independently still decide to remove the base and
head fields if they're no longer needed.

> >> +     ret = drm_connector_init(bridge->drm_dev, &ptn_bridge->connector,
> >> +                     &ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> >> +     if (ret) {
> >> +             DRM_ERROR("Failed to initialize connector with drm\n");
> >> +             return ret;
> >> +     }
> >> +     drm_connector_helper_add(&ptn_bridge->connector,
> >> +                                     &ptn3460_connector_helper_funcs);
> >> +     drm_connector_register(&ptn_bridge->connector);
> >> +     drm_mode_connector_attach_encoder(&ptn_bridge->connector,
> >> +                                                     bridge->encoder);
> >> +
> >> +     if (ptn_bridge->panel)
> >> +             drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
> >> +
> >> +     return ret;
> >> +}
> >
> > I'm thinking that eventually we'll want to register the connector only
> > when a panel is attached to the bridge. This will only become important
> > when we implement bridge chaining because if you instantiate a connector
> > for each bridge then you'll get a list of connectors for the DRM device
> > representing the output of each bridge rather than just the final one
> > that goes to the display.
> So, do not initialize connector if there is no panel? and, get_modes
> via panel instead of doing it by edid-emulation?

If there's no panel, then there's nothing to connect the connector to,
so it's unneeded. Also if you have chained bridges, then each bridge
would expose a connector and it would become impossible to choose the
correct one. So only the final bridge in the chain should instantiate
the connector.

.get_modes() still needs to be done from the bridge because that is the
most closely connected to the display controller and therefore dictates
the timing that the display controller needs to generate.

Querying the panel's .get_modes() might be useful to figure out which
emulation mode to use in the bridge.

Thierry

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2RIGAAoJEN0jrNd/PrOhYJUP+wW3AIgtlY0/VmCyCCHKbzIR
sBAC3Kz+8vO4bVRlcprKJ61b7Pyg/2lGaesRUZKUSV/gYKNqQgRZbDjCR/ygHQ5y
YWk/+rWMVxsrBO68xhyjjk4LCD6mHzW0NhgZweTteRq/18cGIEI8+G/cuuQaV4t9
WYN6jPQ9nynuH1I1dznhq3ZBvz+5lOYX4P9Tc5EiMy/UX4cLFUK/UtThaGZQcz/w
WFbp4G0aP5/CdSoZ35wRGrzP0x9h5eQaHankuNPyMeLKhnuosDOqXeyQ0IFZakAg
Noaz8X4npEawgT2Yq8mXA4nOWwVucmAopwQkZVvfp4Kc4NGQ05Kx6spFKaXSvwjS
8vaSkoXEqXyPZCK2ZOTJq3qx9o451rsSn7BGGl6W2oi9nXoF3KQ/e7y0HP0PihZ3
QTFF1OI1ULWbNg9gGgP0jli50/yh31QFP0mG+VbwbNgkt8qi+vx4FUmEuFPe7//H
4opXoCcA/aCpZLb23rMWYoFq5ZsHQdtoK+GW4/wUaeEOQ8+zRoP/gjkyDMdyO/+T
iBysaEiSeAr2TYGO41SxFR7D55Y+XyHvCyPp1aqiqGA/2Ub2DHjJG1hkzhW7bxc3
sq1pRKYi/n73JxY4vT2eYweVzth4Fc7TMFlax8EZVFhDX8p0ocFNYcWHQDu631A6
Sk50PhOur+ixuWxyXjG3
=ro32
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--

--===============0723685626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0723685626==--
