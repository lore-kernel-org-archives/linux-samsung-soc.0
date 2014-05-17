From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Sat, 17 May 2014 23:14:04 +0200
Message-ID: <20140517211404.GC1046@mithrandir>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140513080501.GH6754@ulmo>
 <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
 <20140514145402.GC8612@ulmo>
 <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
 <20140515081321.GF5952@ulmo>
 <CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196251106=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0196251106==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
[...]
> > I still don't see how controlling the enable GPIO from the panel will be
> > in any way better, or different for that matter, from simply enabling
> > the backlight and let the backlight driver handle the enable GPIO. Have
> > you tried to do that and found that it doesn't work?
> It works, but it gives me glitch when I try to configure video.
> This is because backlight_on(pwm-backlight) happens much before
> I configure video(inside drm), and while configuring video there would
> be a glitch,
> and that glitch would be visible to the user since backlight is already enabled.

Okay, so this means that your backlight is turned on too early. Instead
of working around that problem by moving control of the backlight enable
GPIO from the backlight driver into the panel driver, the correct way to
fix it is to make sure the backlight stays off until video is ready.

Thierry

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTd9EbAAoJEN0jrNd/PrOhMEMP/jN4uCnkaEvyvnf1lFnplWHL
riqvb2t4YnOzDsKVvQ+waNv5fLLPBoMz91msyjf/V9fs7udxi9OMA4IAClkFIEaD
sPAoZ+Ty+iRdABMHfJhK/kWBeO+fuxaeyVGZ2JLnVn4/625mLuU8bino0z7pq5BE
BHqqpOa5s8TpRNILTsPLVlFZiieaC8H/8OMCdZRZNQvyFLd2Rfedxuo7Q7MoMPCl
1gkHkgBJaOUvWQZ2UlgnoUTGJ3MW89+3+vA4IQA0G121BTdeagL3mesUS61s3qsX
spo3/f9Cp/02ndHOdqiXDhMc5e6+SIr41zWtJatFOHIvH7povZEW08159/PaOjKx
FHVP5SonifR8JiHj/FL+/r+Cgm9gAZWB/mKbDb0+1Ty+zHX1DfypXotM9rAeon6E
uWI/2D5xwIpFMrGQwnR3aBGvubDCkXIOTehslW8zaUKSxopyVf+AWI8Qz/Ijk+yN
1Fv6OevXpzeblmvY2898XPGMcrcaHw2dY7/wPG/VDqch9VYbKBnRFEiX0VyjYTM8
7nS5zWarGix0MkgThlHMGMgH82TPcxrrPdu7h6AH8uOMbs7rBQLpypfkPMJVPvxw
7LbnI1PPjcq1ogDQ6km2AD6J04hSxL86/8GSX+JVHWiUrI+9qXAksgjBzi4L+bLw
J4zR3RFz5tl8PM2c/Ka1
=Oco8
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--

--===============0196251106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0196251106==--
