From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 1/8] drm/panel: Add prepare, unprepare and get_modes
 routines
Date: Wed, 30 Jul 2014 12:00:30 +0200
Message-ID: <20140730100028.GD29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0642522397=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-2-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0642522397==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 12:52:03AM +0530, Ajay Kumar wrote:
> Most of the panels need an init sequence as mentioned below:
> 	-- poweron LCD unit/LCD_EN
> 	-- start video data
> 	-- poweron LED unit/BACKLIGHT_EN
> And, a de-init sequence as mentioned below:
> 	-- poweroff LED unit/BACKLIGHT_EN
> 	-- stop video data
> 	-- poweroff LCD unit/LCD_EN
> With existing callbacks for drm panel, we cannot accomodate such panels,
> since only two callbacks, i.e "panel_enable" and panel_disable are suppor=
ted.
>=20
> This patch adds:
> 	-- "prepare" callback which can be called before
> 	the actual video data is on, and then call the "enable"
> 	callback after the video data is available.
>=20
> 	-- "unprepare" callback which can be called after
> 	the video data is off, and use "disable" callback
> 	to do something before switching off the video data.
>=20
> Now, we can easily map the above scenario as shown below:
> 	poweron LCD unit/LCD_EN =3D "prepare" callback
> 	poweron LED unit/BACKLIGHT_EN =3D "enable" callback
> 	poweroff LED unit/BACKLIGHT_EN =3D "disable" callback
> 	poweroff LCD unit/LCD_EN =3D "unprepare" callback
>=20
> Also, a helper function for get_modes is added.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  include/drm/drm_panel.h |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

I had already decided to apply an earlier version that you posted (I
think the only difference was that it didn't have the inline
implementation for drm_panel_get_modes() yet), reworded the commit
message a little (to be less specific about LED, LCD and backlight
units) and added some kerneldoc for struct drm_panel_funcs.

What I propose is to merge that patch (I'll hopefully push it today so
that it shows up in tomorrow's linux-next) and then apply a separate
patch to add drm_panel_get_modes().

Do you have any objections to that?

Thierry

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2MI8AAoJEN0jrNd/PrOhIDsQALvokMrAC16rn7gvGk7374K3
QZBXiBv7x8hdsjWnBTn81OCEaNBZt2wNh7vIuQiGghT/sztwK8xhzQifQFVhEHyt
40RVdQ6NmS4VOcVfzzSZPbYoEMCUpO1vM5bWnD8LZgIC47906MfskeMW+USBwK7f
Bmy+TdLMh0A+6V4wGw0CIuXytyIRsLnn7guJcuq1hzeYm+zsjVSj/lePSRf/wggZ
iYDvjkbcNSfTn2zDxVOjUOOnWqoQs/u6j9KWKkLDeDDaIbR3fCV9mlWal3mpGI52
5XB3SMhqsmqGOfpbmPqQaF4LAb1ISDjhQp+oYRV3dmB/xBtXW8oZaVkwZR4ec8cB
3acp36Q5Jl3DGFgP5SpJhpa+mtX5F1LgGYKfx1jdcxkCeKFNIrlwYE4E6ql2MCX+
XJAoPahuBpA/LkccJUkoSTmlfstQ53Xh6ZURlUdJVEJEb3Ou4mb2A+i6IEqjaXIe
4ddtJ4YLCjJszQ/djjQGcgpCm8QrVcj3Lo62D0/ZzQ8uGS1Wap0+Qf/i1WK6scWu
dAN/kBUc3e5IiSGJRr9/8AA0O2j54vyrS67u6TCn21qd4WvFqZE4iAGzOvyEZYby
ycij84hMJ7g/7mWg6xBCGIrE2rfdJq8Ky9QFSqd4qeDiS5Dtd3hd9fXG/PsgGgsO
DOtwVvyQO7wGP1VkpbKB
=thTb
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--

--===============0642522397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0642522397==--
