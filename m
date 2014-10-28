From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 15:29:47 +0100
Message-ID: <20141028142946.GA17770@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074300769=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <treding@nvidia.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============2074300769==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 11:20:31PM +0100, Daniel Vetter wrote:
> On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wrote:
> >>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> >>>   * @driver_private: pointer to the bridge driver's internal context
> >>>   */
> >>>  struct drm_bridge {
> >>> -     struct drm_device *dev;
> >>> +     struct device *dev;
> >>
> >> Please don't rename the ->dev pointer into drm. Because _all_ the other
> >> drm structures still call it ->dev. Also, can't we use struct device_n=
ode
> >> here like we do in the of helpers Russell added? See 7e435aad38083
> >>
> >
> > I think this is modeled after the naming in drm_panel, FWIW. However,
> > seems reasonable to keep the device_node instead.
>=20
> Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> drm_crtc drop the struct device and go directly to a struct
> device_node. Since we don't really need the sturct device, the only
> thing we care about is the of_node. For added bonus wrap an #ifdef
> CONFIG_OF around all the various struct device_node in drm_foo.h.
> Should be all fairly simple to pull off with cocci.
>=20
> Thierry?

The struct device * is in DRM panel because there's nothing device tree
specific about the concept. Having a struct device_node * instead would
indicate that it can only be used with a device tree, whereas the
framework doesn't care the tiniest bit what type of device we have.

While the trend clearly is to use more device tree, I don't think we
should make it impossible for anybody else to use these frameworks.

There are other advantages to keeping a struct device *, like having
access to the proper device and its name. Also you get access to the
device_node * via dev->of_node anyway. I don't see any advantage in
switching to just a struct device_node *, only disadvantages.

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT6haAAoJEN0jrNd/PrOhT/YQAMH3BQmGbFekdBfClkzSCNdL
YeZ8xQE/0YpXTVvxoR7C8YdPqGKS7c25jEL4m00DpFhuGLFsf4jJNSU4mlxCAjOi
qnQ3L/iZm0CVeztXXN45wCrMM36LWhSPA1jLMOwu3QWFg8szhcTw6AaawFF/ZPqi
emiYRouPQ5CpmW45F56tOwvkl83U2nNy84q6YUHC2vC7joxXeopy0/a3twbKoYGG
cTdoCUGmrkYr8fyA69mAQ1rjsZkcEPbMWKrAwVGKO3czQ6HFSof+UGfj00lWlogu
VMveLMprbnMBwP9BphbZLAq77MjB8ZshpToGU3hYcDH6v6p7uyRiw8s5NMNFBROQ
Ox2cb/R+3clprf0SMNS/6BFCFsLiLfupEKjNLeBEqEt1zrUg512+o/CclRC0rJMT
uWZ9HYbgMJimfiqVP3yCmEicujBZyZC62ZKeT2Rtep8LlVIUwAot76ZouBYwksoq
WyOzngxgiczZlTBqx7PLp0DN2bCc+i9LmYzFXI+JHb894JrRzhzaTnOf6bDLrhHg
UOOVKkiV7wwQhKu+3GHRGN5FMJlPQwfJy1MC4PbhB58Dd5hro68/3HO5DemJ2/J9
di1vX05QJz08MdIpGgxeGtwfijviyhHRnJFTZ30XL1FZd+sdzc6KpXznH21teCTV
9dxfco0UYVzE5/S7QPEt
=XGYP
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

--===============2074300769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2074300769==--
