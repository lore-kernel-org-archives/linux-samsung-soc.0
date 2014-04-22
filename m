From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Tue, 22 Apr 2014 10:19:49 +0200
Message-ID: <20140422081948.GA17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648542175=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0648542175==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:11AM +0530, Ajay Kumar wrote:
> Most of the panels need an init sequence as mentioned below:
> 	-- poweron LCD unit/LCD_EN
> 	-- start video data
> 	-- poweron LED unit/BL_EN
> And, a de-init sequence as mentioned below:
> 	-- poweroff LED unit/BL_EN
> 	-- stop video data
> 	-- poweroff LCD unit/LCD_EN
> With existing callbacks for drm panel, we cannot accomodate such panels,
> since only two callbacks, i.e "panel_enable" and panel_disable are suppor=
ted.
>=20
> This patch adds:
> 	-- "pre_enable" callback which can be called before
> 	the actual video data is on, and then call the "enable"
> 	callback after the video data is available.
>=20
> 	-- "post_disable" callback which can be called after
> 	the video data is off, and use "disable" callback
> 	to do something before switching off the video data.
>=20
> Now, we can easily map the above scenario as shown below:
> 	poweron LCD unit/LCD_EN =3D "pre_enable" callback
> 	poweron LED unit/BL_EN =3D "enable" callback
> 	poweroff LED unit/BL_EN =3D "disable" callback
> 	poweroff LCD unit/LCD_EN =3D "post_disable" callback

I don't like this. What happens when the next panel comes around that
has a yet slightly different requirement? Will we introduce a new
pre_pre_enable() and post_post_disable() function then?

There's got to be a better way to solve this.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTViYkAAoJEN0jrNd/PrOhvzcP/3JFU+SrMB4m9cx5UBPgZ+xc
lg5UHGBztaz1inHvXVExPmoodRy+BLsCeJh4o7AbxQLcQpgJ5p2fS1ZHtd17A9gV
RyPA+dnaGPHf5lWrc5tlXzKcFT7jnkc738TYpIKn4QINpS2QnOkKcn7NSSMpsJEl
KA5jNIHrxzLjXRbPKu+tJ6+Vxjl7XyWHhtYDGeL3/FTt1YogVdIvy4vqtE03ZaPT
s1Mk2JoctGGUeLirC4GbeIxKzJxUZ+UW2lzWmLFvo6iBuWlUpKrPkrnVpjzZoGUq
zvdt5sHWKdpbZORGU4Uy0dpczsT0v7xMbCXSEP8RbEWzc15WJEo4gydWhtoHje3Y
45KE5hgzY1HnkPf1kDdQAqj5LCPaqgCVQ6dM/xY0ZVzo1AdXWaRqKWXovQoK21GK
o3OQhpSG1G7aQBgBv4vOzz6gBX1ac9tgH95wRkpeyyredIUVG+t2bHwjBlf2+U1E
03XyxQ4rWV1XYF/4AYqaVeyF2pA+FTUe5A/iVc9VGnixikFOq0HegK4vaGkXuhDu
sZieUu4xX4niiJLULzXlqBX5okqipKYnpl2HyiC5J5rmgJeSck/GtuYAwxoFQGDS
fK7+eif/mEaFnOIzz4UrDp0QOcyyLhzKoWoFsJebQV2BrB9YOBLCQf7DqC7aBicC
snEjqOVLRmppZqC7fdaD
=ionJ
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============0648542175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0648542175==--
