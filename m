From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 6/9] drm/bridge: ptn3460: enable polling based detection
Date: Tue, 22 Apr 2014 10:43:27 +0200
Message-ID: <20140422084321.GE17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-7-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0808442494=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398119958-32005-7-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0808442494==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline


--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:15AM +0530, Ajay Kumar wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>=20
> Add DRM_CONNECTOR_POLL_HPD to the set of connector flags while
> registering drm_connector for ptn3460.
>=20
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>

This needs to explain *why* you think this change is necessary. As far
as I can see, the PTN3460 bridge doesn't support hotplug detection at
all, in which case setting DRM_CONNECTOR_POLL_HPD would be completely
wrong.

Thierry

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTViupAAoJEN0jrNd/PrOh57oP+wfls9U0eFgEhKd2ssY5Yypf
OPVdFRlbdRSpmHMsgLxngDIB/RiMAWUG882bbYPkazTDZWtKSxK3yNEjKjShDICy
/FOMtygX1zr91VufPlzbRNcS5E2gw5D1ivcCgirwrnQQ2MozS3veqkyyx3RNAKpp
Yk8TdcYPu2iWZ6ThgC4g5dCuEp5ao2r9Uyi0itRo7dmlUPAF2gMKT4vU41JU3Utr
Eb0ya4djhWs/YvibRLxR1AP61Q2nB11cq/RNoElSroZ0jqBOKdR6UleQJkGByMr2
9JsPK1uuxppmCitiPcZE9NcuQWIjpEz8YqlR80fqJJ+cnj9N3GyIVo9R/HaPr9tX
A+/eoxGlOPPBAAbWtnd5KmTHHr/5tVKH+eEPKTTw9J7C3lh3RAm8XpWpmF7ZQL//
hOs05tO32KPMA7T3pZfz7YCNWoGm7H9CxmJ4t0P2JVBpaES7LIUJE4ZJxGjtY5/s
ZbCPWFnockFw077o2tuYoMavkyNMt7yoSNQHNTRdkiyUHBf7Ki8+ZVt14F12NCyi
fcADGOa+cRHLbp90SOityN/sBZg2XRRpIr3CMKw6uBdcgInLUPt4odGV0AX3v57+
FWWXS7M2ghN0XeBcAV7n6IZUK3rgSEWs8KZ0oYeqT/V7iEaWU59O5F/WFPpJQMf9
mGN4dhwxPMpcdwQKqGpi
=sQCH
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--

--===============0808442494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0808442494==--
