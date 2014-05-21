From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode
 display timing
Date: Wed, 21 May 2014 13:02:05 +0200
Message-ID: <20140521110204.GB2014@ulmo>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1502002990=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org


--===============1502002990==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 21, 2014 at 01:42:56PM +0900, YoungJun Cho wrote:
> This patch is based on videomode and display_timing relevant codes.
> To support command mode panel, it does not need to guide its timing
> information to the display controller like video mode panel,
> but it requires signal timings to transfer video data.
> So this patch adds cmdmode struct, cmdmode_display_timing struct and
> the according helper functions to convert cmdmode_display_timing
> to a generic cmdmode.

Can you point me to relevant documentation? I wasn't able to find it by
a quick scan through the DSI specification.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfIesAAoJEN0jrNd/PrOhCJsP/2FtDc23LCdSlPlg2shCqHZQ
mqqvD8IU5s92KHzQr5OwRtSLyoXyTs3qUvSJ3ciaBNO1OPSY4kZ1tDlRYGhNq7UU
WewXCfqL626rAdmsu2C1XvVwTKeD6XfL3lALylRCivCQLrg762WlMtG2fjH4ob3g
OppvTuRcE83KvKeYFDlyiuIsaL7kl4KZVd5wZhrTspuRd1pYEudXvwiVpzwyaCK9
BW7FWSQ37uhu/OsrC/6Voxrt3VFbZjJYYLa0UYvudX4mKicMfpd+w3D6wYIMLhfR
4HRxEDb9sO2U6SJiKFbO4mKiApdKgDuquE8WdKlD0k4RYPw2OhWLCbHRtNEDg/8M
42VwW2KEfz43xa9RILl+Y+Xvv1ciLjKsf/NhIHDUoPLa8EyJ13t6xA2GJ14iJqtW
YEayjdV7CVnfayKnasA7Xs1J92Pquq1HT8OKwPDoUwFir60nXM3N+rXzASKSakQw
zQKHxai0wZz4fwdf5/Noj9OFdqfyT2kSYs/KcUXmzQ7oG7hca38SrHGv/7+fZehp
uoRiBV7MA+Yy14DchxPwnW2/JuaK5fRO83dXO63prvVKOwaQIna+/efPm78LjegD
qIXeUzo6ghFuk87lL5j9bYGV8JfqAUKvZ00n1pOBnoip1tbywRsTRAyJl0QN2FZy
e/EuAeyglu/sAdXxuaja
=Q9Mv
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============1502002990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1502002990==--
