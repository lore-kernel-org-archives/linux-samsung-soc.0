From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Wed, 30 Jul 2014 17:08:47 +0200
Message-ID: <20140730150846.GB1345@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140730111931.GI29590@ulmo>
 <CAEC9eQPv-D2ThnHR=FZiXJJisMf9NRqS-TJQKdZRjV45Y0Mjsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1630905823=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPv-D2ThnHR=FZiXJJisMf9NRqS-TJQKdZRjV45Y0Mjsw@mail.gmail.com>
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


--===============1630905823==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 08:01:44PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 4:49 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Sat, Jul 26, 2014 at 12:52:08AM +0530, Ajay Kumar wrote:
> >> This patch tries to seperate drm_bridge implementation
> >> into 2 parts, a drm part and a non_drm part.
> >>
> >> A set of helper functions are defined in this patch to make
> >> bridge driver probe independent of the drm flow.
> >>
> >> The bridge devices register themselves on a lookup table
> >> when they get probed by calling "drm_bridge_add_for_lookup".
> >>
> >> The parent encoder driver waits till the bridge is available in the
> >> lookup table(by calling "of_drm_find_bridge") and then continues with
> >> its initialization.
> >>
> >> The encoder driver should call "drm_bridge_attach_encoder" to pass on
> >> the drm_device and the encoder pointers to the bridge object.
> >>
> >> Now that the drm_device pointer is available, the encoder then calls
> >> "bridge->funcs->post_encoder_init" to allow the bridge to continue
> >> registering itself with the drm core.
> >>
> >> Also, non driver model based ptn3460 driver is removed in this patch.
> >
> > Why is it removed in this patch? Can't you do this incrementally rather
> > than remove the driver in this patch and add it again later? If you do
> > it this way then we'll always have this one commit where devices that
> > have a ptn3460 don't work, so it becomes impossible to bisect across
> > this commit.
> Ok. I will try to modify ptn3460 to support driver model in this patch it=
self.
> And then, adding panel support, converting it to gpiod interface and other
> cleanups should follow.

I think it should even be possible to do this in more separate steps.
For example you could add the new bridge infrastructure without touching
any of the existing drivers (so that they are completely unaffected by
the changes) and then start converting one by one.

For some of the changes this may be difficult (such as the dev ->
drm_dev rename to make room for the new struct device *dev). But that
could for example be done in a preparatory patch that first renames the
field, so that the "infrastructure" patch can add the new field without
renaming any fields and therefore needing changes to drivers directly.

The goal of that whole exercise is to allow display drivers to keep
working with the existing API (ptn3460_init()) while we convert the
bridge drivers to register with the new framework. Then we can more
safely convert each display driver individually to make use of the new
framework and once all drivers have been converted the old API can
simply be removed.

That way there should be no impact on existing functionality at any
point.

> >> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > [...]
> >
> > Maybe since you're introducing a new drm_bridge.c file above already it
> > would make sense to move out existing drm_bridge related code in a
> > preparatory patch?
> >
> > Maybe Sean or Rob can comment on whether there was a specific reason to
> > include it in drm_crtc.c in the first place.
> >
> >> @@ -1012,8 +1010,7 @@ int drm_bridge_init(struct drm_device *dev, stru=
ct drm_bridge *bridge,
> >>       if (ret)
> >>               goto out;
> >>
> >> -     bridge->dev =3D dev;
> >> -     bridge->funcs =3D funcs;
> >> +     bridge->drm_dev =3D dev;
> >
> > This sets ->drm_dev, but it was already set in drm_bridge_attach(), so I
> > think that's one more argument to call this function when attaching.
> Point accepted.

I forgot to mention earlier. drm_dev seems redundant to me. I'd go with
just "drm".

> >> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> >> index e529b68..e5a41ad 100644
> >> --- a/include/drm/drm_crtc.h
> >> +++ b/include/drm/drm_crtc.h
> >> @@ -619,6 +619,7 @@ struct drm_plane {
> >>
> >>  /**
> >>   * drm_bridge_funcs - drm_bridge control functions
> >> + * @post_encoder_init: called by the parent encoder
> >
> > Maybe rename this to "attach" to make it more obvious when exactly it's
> > called?
> "post_encoder_attach"?

"post_encoder_" doesn't contain much information, or even ambiguous
information. What does "post" "encoder" mean? A bridge is always
attached to an encoder, so "encoder" can be dropped. Now "post" has
implications as to the time when it is called, but does it mean after
the encoder has been initialized, or after the encoder has been removed?
Simply "attach" means it's called by the parent encoder to initialize
the bridge once it's been attached to an encoder. So obviously it's
after the encoder has been initialized. "attach" has all he information
required. Any prefix is redundant in my opinion and removing prefixes
gives shorter names and reduces the number of keypresses.

> >>   * @mode_fixup: Try to fixup (or reject entirely) proposed mode for t=
his bridge
> >>   * @disable: Called right before encoder prepare, disables the bridge
> >>   * @post_disable: Called right after encoder prepare, for lockstepped=
 disable
> >> @@ -628,6 +629,7 @@ struct drm_plane {
> >>   * @destroy: make object go away
> >>   */
> >>  struct drm_bridge_funcs {
> >> +     int (*post_encoder_init)(struct drm_bridge *bridge);
> >>       bool (*mode_fixup)(struct drm_bridge *bridge,
> >>                          const struct drm_display_mode *mode,
> >>                          struct drm_display_mode *adjusted_mode);
> >> @@ -648,15 +650,19 @@ struct drm_bridge_funcs {
> >>   * @base: base mode object
> >>   * @funcs: control functions
> >>   * @driver_private: pointer to the bridge driver's internal context
> >> + * @connector_polled: polled flag needed for registering connector
> >
> > Can you explain why this new field is needed? It seems like a completely
> > unrelated change.
> How do I select this flag for the bridge chip?
> Assume if I did select DRM_CONNECTOR_POLL_HPD, where to call
> drm_helper_hpd_irq_event in the driver? Is post_encoder_init a right plac=
e?
>=20
> Without the polled flag, I get display very late.
> Please throw some light on this!

I just don't understand why it's necessary to implement this field in
the drm_bridge. Every bridge driver will already implement a connector,
in which case it can simply set the connector's .polled field, can't it?

It seems like the only reason you have it in drm_bridge is so that the
encoder driver can set it. But I don't see why it should be doing that.
The polled state is a property of the connector, and the encoder driver
doesn't know anything about it. So if the bridge has a way to detect HPD
then it should be setting up the connector to properly report it. For
example if the bridge has an input pin to detect it, then it could use a
GPIO to receive interrupts and call drm_helper_hpd_irq_event() in the
interrupt handler.

Perhaps you can explain the exact setup where you need this (or point me
at the code since I can't seem to find the relevant location) so that I
can gain a better understanding.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2Qp+AAoJEN0jrNd/PrOhyZsQAJzme5R0v2H4PzeAenjBMrfq
gL6oQhINTywZDoLI9dOxiHkjxoWT5HZUDUWCoqQyeCkqLv6QY3/LsN2JCj/QJewh
ihMcMkKuU5qDp2Iu11foV8g63AdUOvpKrGlkk2w1mTitOZS/N/v9v3Tc3qgVL/ON
2diLbWVf4oSQFz3eB7X3r60OX1RsNeQuAMPm9+cfhuLILzzVLI2A0ZdtRixL9VM7
pQLPuDLEbP9HnkZBFJEm2KPjPcuc/tmspFXAlrg/ivMhMVDcKKcp7NxkZNCRPGAV
LXv1h1HMyJ4HpPTLhCMsyPk/ZWFqGoITOcHiWl7cAxiLobEhxgYQFHl4PxTp5LRy
uA8PV5xF4ZgREIWYbBpQE2YXEksObzcFZbtdE4y2Qn8xhUGBv7lVkRoDmsnAjB9F
tMksoG3kBNFzgkU3qoz86QDOttftWq/WxhbbgBF4m2LuJiXXb4LK5T6sIXZQA4+L
9crbkBlW8MsRG+jF1FGk4lFZ3cB1ckf94i5FfjPPv2R0alEaZtJ22LliwjZc6icD
zfbozz1lx3ShOMWPWk+OIinabGfA3CHDv2aL1fZz4/oeH8XcodkF1mvH/nB1KWlS
MUx5TUB/t+/oVuF7iqY+w/1nkk/hrbX36j3E9TUjgbrC6nQdPiqg0xGKavEAIOr0
Tyrf7MUSQYXIPnG3zbAE
=KXHE
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

--===============1630905823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1630905823==--
