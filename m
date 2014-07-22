From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Tue, 22 Jul 2014 09:49:36 +0200
Message-ID: <20140722074935.GC18258@ulmo>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
 <53CCD5A8.6090406@samsung.com> <20140721091917.GK8843@ulmo>
 <53CCF70A.5010403@samsung.com> <53CDDD61.6000005@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130100484=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53CDDD61.6000005@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Tomi Valkeinen <tomi.valkeinen@ti.com>, Paul Mundt <paul.mundt@gmail.com>, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0130100484==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 12:41:21PM +0900, YoungJun Cho wrote:
> On 07/21/2014 08:18 PM, Andrzej Hajda wrote:
> >On 07/21/2014 11:19 AM, Thierry Reding wrote:
> >>On Mon, Jul 21, 2014 at 10:56:08AM +0200, Andrzej Hajda wrote:
> >>>On 07/18/2014 03:49 AM, YoungJun Cho wrote:
> >>>>On 07/17/2014 07:36 PM, Thierry Reding wrote:
> >>>>>On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
[...]
> >>>>>>+static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
> >>>>>>+{
> >>>>>>+	unsigned char id[MTP_ID_LEN];
> >>>>>>+	int ret;
> >>>>>>+
> >>>>>>+	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
> >>>>>>+	ret =3D s6e3fa0_dcs_read(ctx, MIPI_DCS_GET_DISPLAY_ID, id, MTP_ID=
_LEN);
> >>>>>This also looks like a standard DCS command. I can't find it in eith=
er
> >>>>>v1.01 nor v1.02 of the specification, though. Do you know where it's
> >>>>>specified?
> >>>>>
> >>>>Yes, I also can't find it in DCS specification and there is no special
> >>>>description in panel datasheet.
> >>>>But as it is declared in "include/video/mipi_display.h", so I think it
> >>>>is a standard one.
> >>>
> >>>On page 9 of the "Introduction of MIPI by Renesas" [2] there is info
> >>>it is a part of "Nokia I/F command list", I guess it is kind of alpha
> >>>version of MIPI DCS.
> >>>
> >>>[2]: http://wenku.baidu.com/view/658fab68af1ffc4ffe47acbe.html
> >>
> >>That link is the only one which contains "Nokia I/F command list" on the
> >>internet (that is, according to Google). But since this is already part
> >>of the mipi_display.h header file we may as well use it.
> >>
> >>I wonder if perhaps the READ_DDB_START and READ_DDB_CONTINUE commands
> >>could be used as a replacement for this display ID.
> >>
>=20
> There is a simple description for "Read DDB Start(A1H)" like below.
> - This command returns supplier identification and display module model /
> revision information.
> - NOTE: This information is not the same what Read IDs(04H) command is
> returning.
>=20
> For reference, Read IDs(04H) description is like below.
> - This read command returns 24-bit display identification information.
> - The first read byte identifies the OLED module's manufacturer.
> - The Second read byte is used to track the OLED module/driver version.
> - The third read byte identifies the OLED module/driver.

Okay, that explains things a little better. Can you point me to the
document that this is from?

But what I was trying to say is that if the Read IDs command isn't an
official DCS command, maybe it would be a better idea to use the DDB
instead. I assume that even if it isn't the same information it would
at least be a superset and therefore a suitable replacement.

Thierry

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzhePAAoJEN0jrNd/PrOhsUEQAJdwQx63WI8owaraFNfL5oZI
f2cleQCk9rF8j0bWhtBtRWhInqK8pLog8dFbcJh9fRcrO79GQhnVfs7BbfdJMeKu
WUTslblQm5aqWGDJdTVBNcEEggqG8YV5imMHKgpBi29mJ2N4qKEQUQwUSE5tgRpO
xJ0dKrZr4Jze0dtpkky1DJZ9vHJObzVjMhvzIDzXZQvpSmTZcHgVzi6XcZ29xCtf
+HzWlkDrQX8VHENFzM13/f3bky4+pNwX+GZI/i6/XW2AKqF6TcpnbYHgGJxDqKAV
Nb4FiHiEQt0lzLaWwpyBoDpEkaebYqcA9+BVqGEs/DTpj1Z7qW+2Lv4/mVmC8LPJ
/gmUwoHGDp/MBUk3YOI60obDd4m4gGQwGEBogJsSl7rZqTA243zvSq9JGS7uNdk7
MszArcanEUqgAUKAvURCVFRxH+q6PmkeIuDGykvyuakQ68V+mMNgvE0nTTrkA16b
hc4lM1WmIqnR5RYy5EfxtYaYc1VL/JBZad6+TFmfo2jTSUNaQIl5v6NcMLCBqEpo
1sL2wFDH9EZGYZ590XIuHNz23JXn9DuXWaYpMh3XX785cA/Ohsz8xMtrCUGKt9Ul
awnVi5uCkqEDqRBcOjYI5Ds3RMAGIS0ef0YYu+p4hadxZufgMzosuNFV/VzI6SW6
uuAFor9nWyHqUokmADTr
=ndVx
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--

--===============0130100484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0130100484==--
