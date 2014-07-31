From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Thu, 31 Jul 2014 12:58:16 +0200
Message-ID: <20140731105813.GE7458@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140730111931.GI29590@ulmo>
 <CAEC9eQPv-D2ThnHR=FZiXJJisMf9NRqS-TJQKdZRjV45Y0Mjsw@mail.gmail.com>
 <20140730150846.GB1345@ulmo>
 <CAEC9eQMywCiQjD68_=Wwwbnb4Gau-gNEowqWPSvSV=AOc3Waeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1756232965=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQMywCiQjD68_=Wwwbnb4Gau-gNEowqWPSvSV=AOc3Waeg@mail.gmail.com>
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


--===============1756232965==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 09:33:28PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 8:38 PM, Thierry Reding <thierry.reding@gmail.com=
> wrote:
[...]
> > I think it should even be possible to do this in more separate steps.
> > For example you could add the new bridge infrastructure without touching
> > any of the existing drivers (so that they are completely unaffected by
> > the changes) and then start converting one by one.
> >
> > For some of the changes this may be difficult (such as the dev ->
> > drm_dev rename to make room for the new struct device *dev). But that
> > could for example be done in a preparatory patch that first renames the
> > field, so that the "infrastructure" patch can add the new field without
> > renaming any fields and therefore needing changes to drivers directly.
> >
> > The goal of that whole exercise is to allow display drivers to keep
> > working with the existing API (ptn3460_init()) while we convert the
> > bridge drivers to register with the new framework. Then we can more
> > safely convert each display driver individually to make use of the new
> > framework and once all drivers have been converted the old API can
> > simply be removed.
> >
> > That way there should be no impact on existing functionality at any
> > point.
> As of now only exynos_dp uses ptn3460_init.
> And, also only 2 drivers use drm_bridge_init.
> It should be really easy to bisect if something goes wrong.
> Still, I will try to divide it so that each patch contains minimal change.

Thanks.

> >> >> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> >> >> index e529b68..e5a41ad 100644
> >> >> --- a/include/drm/drm_crtc.h
> >> >> +++ b/include/drm/drm_crtc.h
> >> >> @@ -619,6 +619,7 @@ struct drm_plane {
> >> >>
> >> >>  /**
> >> >>   * drm_bridge_funcs - drm_bridge control functions
> >> >> + * @post_encoder_init: called by the parent encoder
> >> >
> >> > Maybe rename this to "attach" to make it more obvious when exactly i=
t's
> >> > called?
> >> "post_encoder_attach"?
> >
> > "post_encoder_" doesn't contain much information, or even ambiguous
> > information. What does "post" "encoder" mean? A bridge is always
> > attached to an encoder, so "encoder" can be dropped. Now "post" has
> > implications as to the time when it is called, but does it mean after
> > the encoder has been initialized, or after the encoder has been removed?
> > Simply "attach" means it's called by the parent encoder to initialize
> > the bridge once it's been attached to an encoder. So obviously it's
> > after the encoder has been initialized. "attach" has all he information
> > required. Any prefix is redundant in my opinion and removing prefixes
> > gives shorter names and reduces the number of keypresses.
> Finally, what name it should have?

I originally proposed "attach" as a more concise name and I still think
that's the best alternative.

> >> >>   * @mode_fixup: Try to fixup (or reject entirely) proposed mode fo=
r this bridge
> >> >>   * @disable: Called right before encoder prepare, disables the bri=
dge
> >> >>   * @post_disable: Called right after encoder prepare, for lockstep=
ped disable
> >> >> @@ -628,6 +629,7 @@ struct drm_plane {
> >> >>   * @destroy: make object go away
> >> >>   */
> >> >>  struct drm_bridge_funcs {
> >> >> +     int (*post_encoder_init)(struct drm_bridge *bridge);
> >> >>       bool (*mode_fixup)(struct drm_bridge *bridge,
> >> >>                          const struct drm_display_mode *mode,
> >> >>                          struct drm_display_mode *adjusted_mode);
> >> >> @@ -648,15 +650,19 @@ struct drm_bridge_funcs {
> >> >>   * @base: base mode object
> >> >>   * @funcs: control functions
> >> >>   * @driver_private: pointer to the bridge driver's internal context
> >> >> + * @connector_polled: polled flag needed for registering connector
> >> >
> >> > Can you explain why this new field is needed? It seems like a comple=
tely
> >> > unrelated change.
> >> How do I select this flag for the bridge chip?
> >> Assume if I did select DRM_CONNECTOR_POLL_HPD, where to call
> >> drm_helper_hpd_irq_event in the driver? Is post_encoder_init a right p=
lace?
> >>
> >> Without the polled flag, I get display very late.
> >> Please throw some light on this!
> >
> > I just don't understand why it's necessary to implement this field in
> > the drm_bridge. Every bridge driver will already implement a connector,
> > in which case it can simply set the connector's .polled field, can't it?
> >
> > It seems like the only reason you have it in drm_bridge is so that the
> > encoder driver can set it. But I don't see why it should be doing that.
> > The polled state is a property of the connector, and the encoder driver
> > doesn't know anything about it. So if the bridge has a way to detect HPD
> > then it should be setting up the connector to properly report it. For
> > example if the bridge has an input pin to detect it, then it could use a
> > GPIO to receive interrupts and call drm_helper_hpd_irq_event() in the
> > interrupt handler.
> Hmm. Are we allowed to call drm_helper_hpd_irq_event() the way
> DSI panels use it? Like the last step in panel probe?
> For bridges, it will be in post_encoder_init!

drm_helper_hpd_irq_event() should only be called when a hotplug event is
detected. For all other cases detection should already happen when DRM
initializes.

I see that on Tegra we call drm_helper_hpd_irq_event() in the DSI host's
->attach(), but I don't remember why that's there and I don't see why it
would be necessary either. I'll try to remove it and see if things still
work without.

> > Perhaps you can explain the exact setup where you need this (or point me
> > at the code since I can't seem to find the relevant location) so that I
> > can gain a better understanding.
>=20
> I can see bridge getting detected only when I set polled member of
> bridge connector to DRM_CONNECTOR_POLL_HPD, because exynos_drm
> also calls drm_helper_hpd_irq_event() to force detect all connectors at t=
he
> end of drm_load.

That shouldn't be necessary. DRM automatically force detects all outputs
(at least if you use drm_helper_probe_single_connector_modes(), which
seems to be the case for Exynos).

Thierry

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2iFFAAoJEN0jrNd/PrOhYU8P/1iCZ5Yfc5MCTaaC86t9oHxl
mPrte+OpU5oAfowleXdGps/AXHeNY1cX3MUuQOpNi0MlXdP02xDRXiSI6ZroIhcl
+74qGt3WRFpkghgk+dVuTwKL/C8JD3rbSqYKrmW8JlGtI83A/9ybCeydrx5RXWR6
RuZ1NIeqqmixG6MsUe92w7ZFfMiqLWLeJ5riUDIqi7xxqjaPoxflUbEflcOvNTOZ
5TT/T/0TO+AfWs5YlBCtc5b65IfK02tSGAvjeauSyYRQIVB7mNw2/A4NpZByZGdZ
VAb/ajpEtlrtc8ot3LXmOaam2EBoLeKcNfQDUVwT73Ga15DrV/McSGeqhtii7QOE
xpE6+PWZd13lvl2kinGuA3T+f3cwJgiRQnCqLHvnJHZUiPjkTVOSCKDzWNdj+uWl
2eQrkexd92B7jbVD6BuYR/vgbrta3+a0SwjjujWyxtthGdXKeb6QnA4bxc6w5fTy
uV0DgAdQEBaqQPRNDrbXCpbNIwwj4uL5JGpJW4EYmS7r0B4V6KM+WQNar7oMCsMy
dJBib29l0bKuN/lDEBkZCij7vr2XfnLEn7GCqDKcoc1uFIXy1bDygvMPcjKqYsrR
26ZZBSxCwLHjdX5r+M1mu5VN6WK78wm8tFA/zqTN1h0nZoZLXaMXbOXWVYdtXGgP
Trlwf+CdzCe+0WZdhu/a
=Tmqi
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--

--===============1756232965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1756232965==--
