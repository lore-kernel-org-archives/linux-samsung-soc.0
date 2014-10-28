From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 15:35:50 +0100
Message-ID: <20141028143548.GB17770@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0255831940=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <treding@nvidia.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0255831940==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> On Mon, Oct 27, 2014 at 11:20 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wrot=
e:
> >>>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> >>>>   * @driver_private: pointer to the bridge driver's internal context
> >>>>   */
> >>>>  struct drm_bridge {
> >>>> -     struct drm_device *dev;
> >>>> +     struct device *dev;
> >>>
> >>> Please don't rename the ->dev pointer into drm. Because _all_ the oth=
er
> >>> drm structures still call it ->dev. Also, can't we use struct device_=
node
> >>> here like we do in the of helpers Russell added? See 7e435aad38083
> >>>
> >>
> >> I think this is modeled after the naming in drm_panel, FWIW. However,
> >> seems reasonable to keep the device_node instead.
> >
> > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> > drm_crtc drop the struct device and go directly to a struct
> > device_node. Since we don't really need the sturct device, the only
> > thing we care about is the of_node. For added bonus wrap an #ifdef
> > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > Should be all fairly simple to pull off with cocci.
> >
> > Thierry?
>=20
> Looking at the of_drm_find_panel function I actually wonder how that
> works - the drm_panel doesn't really need to stick around afaics.
> After all panel_list is global so some other driver can unload.
> Russell's of support for possible_crtcs code works differently since
> it only looks at per-drm_device lists.

I don't understand. Panels are global resources that get registered by
some driver that isn't tied to the DRM device until attached. It can't
be in a per-DRM device list, because it's external to the device.

And yes, they can go away when a driver is unloaded, though it's not the
typical use-case.

> This bridge code here though suffers from the same. So to me this
> looks rather fishy.

Well, this version of the DRM bridge support was written to be close to
DRM panel, so it isn't really surprising that it's similar =3D), but like
I said, I don't really understand what you think is wrong with it.

> It doesn't help that we have drm_of.[hc] around but not all the of
> code is in there. Adding Russell too.

DRM panel and DRM bridge aren't just OF helpers. They can be used with
whatever type of device you want.

Thierry

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT6nEAAoJEN0jrNd/PrOhZJ4QAJYjRNY8x3GtFk/hhUbGULjF
InyOYwp+374VZYjgF/hAM+moW0Kf0Zde8mYRNLYRfkndryRTUSlmWVkDAvuQEGQO
Gfj72EUSUwqjoPfBKdSwYEyl8ZbyzK04pOZzHZBp5AEUuiT5+q6U8HozEl/N6T/x
+m/dk1NQNlPbNISD46sbNunwxDixYHby1lznrCSVR5JYdxXqdRAMU6YNB0Tq39m8
dkD/Oo9ggtM3yRgnx2RAivyBasfSMdogCBvxGymCL7yQ+cAR1+6JI+v+C///28MY
rw90Vikthp8cu4wbuurTkD/Y/3Ovb9wyRAvLaJM+vfKKl2q3+2JYNPmVPZetzDVk
Odo/AqZLgQlLEnM+WvvHf4AXfeg4GxOh9Wnd4rvpLEX9tqIt7pXBtm0cueuOtp+b
WGc2O2T6oy0R7/L2T+Y9BORTCg8FrafmPZb64Kw6FmeftBzD/ACcB+MdE+pzv7mS
TmAM1F9ddpfyY1bEeo2g4WGlO6gdlTkJClVJuf3aTA6Abkqq8j41bOgn5yBobozN
uh/fFKwt4VwGbERLCjXlGR1g8ddBXAzXVq8EF5IQ9cSSkbE+M9gUyQffvid8d8PU
amo5bDw8u7BIw74tlURysiTMKW0gjtrmNLjb72pzliPQ/EBAbEmACQ8rctGxglQK
BDhcNyZlIKpLHUEQNxwu
=s43g
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--

--===============0255831940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0255831940==--
