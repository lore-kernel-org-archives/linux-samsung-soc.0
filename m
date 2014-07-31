From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 7/8] drm/bridge: Add i2c based driver for ptn3460
 bridge
Date: Thu, 31 Jul 2014 13:21:53 +0200
Message-ID: <20140731112152.GB11955@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
 <20140730120504.GJ29590@ulmo>
 <CAEC9eQPERoZjPV5=P_Re_Bs7gT7Q5Q_Z6sJViuxoG8oo9O3=-w@mail.gmail.com>
 <20140730154054.GE1345@ulmo>
 <CAEC9eQOnTEsCD1fKw_Ac0mDt=hJBU5MzHOSfSRmpM0MY2pMRjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:52429 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbaGaLV6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 07:21:58 -0400
Content-Disposition: inline
In-Reply-To: <CAEC9eQOnTEsCD1fKw_Ac0mDt=hJBU5MzHOSfSRmpM0MY2pMRjQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Paul <seanpaul@chromium.org>


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 09:44:32PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 9:10 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Jul 30, 2014 at 08:46:44PM +0530, Ajay kumar wrote:
> >> On Wed, Jul 30, 2014 at 5:35 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> >> > On Sat, Jul 26, 2014 at 12:52:09AM +0530, Ajay Kumar wrote:
> > [...]
> >> >> +int ptn3460_post_encoder_init(struct drm_bridge *bridge)
> >> >> +{
> >> >> +     struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
> >> >> +     int ret;
> >> >> +
> >> >> +     /* bridge is attached to encoder.
> >> >> +      * safe to remove it from the bridge_lookup table.
> >> >> +      */
> >> >> +     drm_bridge_remove_from_lookup(bridge);
> >> >
> >> > No, you should never do this. First, you're not adding it back to the
> >> > registry when the bridge is detached, so unloading and reloading the
> >> > display driver will fail. Second there should never be a need to remove
> >> > it from the registry as long as the driver itself is loaded. If you're
> >> > concerned about a single bridge being used multiple times, there's
> >> > already code to handle that in your previous patch:
> >> >
> >> >         int drm_bridge_attach_encoder(...)
> >> >         {
> >> >                 ...
> >> >
> >> >                 if (bridge->encoder)
> >> >                         return -EBUSY;
> >> >
> >> >                 ...
> >> >         }
> >> >
> >> > Generally the registry should contain a list of bridges that have been
> >> > registered, whether they're used or not is irrelevant.
> >> I was just wondering if it is ok to have a node in two independent lists?
> >> bridge_lookup_table and the other mode_config.bridge_list?
> >
> > Oh, it reuses the head field for the registry. I hadn't noticed before.
> > No, you certainly can't have the same node in two lists. Honestly I
> > don't quite understand why there was a need to expose drm_bridge as a
> > drm_mode_object in the first place since it's never exported to
> > userspace.
> >
> > So I think that perhaps we could simply get rid of the base field and
> > not tie in drm_bridge objects with the DRM object as we currently do.
> > But until Sean or Rob comment on this it might be better to simply add
> > another struct list_head field for the registry. That way both can
> > coexist and we can independently still decide to remove the base and
> > head fields if they're no longer needed.
> Ok. What shall I name the new list_head?

"list" would be a good choice in my opinion.

> > .get_modes() still needs to be done from the bridge because that is the
> > most closely connected to the display controller and therefore dictates
> > the timing that the display controller needs to generate.
> >
> > Querying the panel's .get_modes() might be useful to figure out which
> > emulation mode to use in the bridge.
> But, get_modes from panel returns me only the no_of_modes but
> not the actual mode structure. How do I compare the list of supported
> emulation modes?

You could iterate over the connector's probed_modes list which should
contain all the modes that the panel reported (after .get_modes() was
called).

Thierry

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2ibQAAoJEN0jrNd/PrOh/QAP/RDohUOgMW6lFMD9XotzTzZJ
4l5bQnCniHfEg7gueyajA4A+pkMGIWqU38jX9nO5kPuuWRBFmgZqgnATFjDYC8Yr
OFX20KDe0QIxqXmUKCQ9cirI0oQeVD0ixlXV/JxUusND8rwErGEFo7g2AZNaLVWD
hkDS12MjFhvEYjxCXg4Cfvj1IHScgGFWcg1j+QpK7qD5Z7ZFvoD2f506eZjARAWF
EYVRrQX0FwGGiUAZzXJQiCkSLa6SZwJjU5d5B1rIPSvByYAkr8N03dudibgopQq9
zVmDacyWyRAWfQH8r5xaxD22IBQ0KG6+rx2THPYL4at6vKEoD6FBRYrk59rfNyyb
iOs2/ZfMTLaAjU5VoUiUiVGOU9Lod+5COp7F9gbG+Mw9jneewg36zijRBnvJZjzp
N5J9PRK5vb4VeWOg1U40JSe2lWkh6JFSVy5iQLk5kuIhJItOu1nL77M15p6Xiqu7
JiHhqc65qR6hU6xeyyMiUQqLFN+2euq28WIsyaPCOkL8duy4dXRTkL2oQKUvLvn+
mbmxnO/9qOTagpb3HXyraM3XbSPFmXfrS9JYRLHF02PvRC9oy49ri72PnNVjcK//
NbxhWgfwySFaja0xOAWUKzzKunyJgmGoup+r1XVikS9Vpwg16W5MLWqZvVa80H9J
52B14To66ATF3RJkX0aD
=2fZk
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
