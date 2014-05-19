From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Mon, 19 May 2014 17:30:55 +0200
Message-ID: <20140519153053.GB30978@ulmo>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140513080501.GH6754@ulmo>
 <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
 <20140514145402.GC8612@ulmo>
 <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
 <20140515081321.GF5952@ulmo>
 <CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
 <20140517211404.GC1046@mithrandir>
 <CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1384705064=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
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


--===============1384705064==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2014 at 01:50:36PM +0530, Ajay kumar wrote:
> On Sun, May 18, 2014 at 2:44 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
> >> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> > [...]
> >> > I still don't see how controlling the enable GPIO from the panel will be
> >> > in any way better, or different for that matter, from simply enabling
> >> > the backlight and let the backlight driver handle the enable GPIO. Have
> >> > you tried to do that and found that it doesn't work?
> >> It works, but it gives me glitch when I try to configure video.
> >> This is because backlight_on(pwm-backlight) happens much before
> >> I configure video(inside drm), and while configuring video there would
> >> be a glitch,
> >> and that glitch would be visible to the user since backlight is already enabled.
> >
> > Okay, so this means that your backlight is turned on too early. Instead
> > of working around that problem by moving control of the backlight enable
> > GPIO from the backlight driver into the panel driver, the correct way to
> > fix it is to make sure the backlight stays off until video is ready.
> Ok. Please suggest an idea how to do the same!

I did post a patch[0] a long time ago that added a way to fix this for
pwm-backlight at least.

> I have already suggested a simple idea which conforms to a valid spec.
> Just because enable_gpio is already a part of pwm_bl.c, I somewhat feel
> like we are forcing people to handle enable_gpio inside pwm_bl.c.

And that's a good thing. That's what people will expect. Backlights are
exposed via sysfs, which is currently also the only way to control the
backlight from userspace. If the driver for that doesn't have everything
required to control the backlight how can userspace control it?

> Note that, pwm_bl can still work properly without enabling the backlight GPIO.
> And, I did point out to a valid datasheet from AUO, which clearly indicates why
> backlight enable GPIO should be a part of panel driver and not pwm_bl driver.

Just because some spec mentions the backlight enable pin in some panel
power up sequence diagram that doesn't mean we have to implement it as
part of the panel driver.

> I am not trying to say we should remove enable_gpio from pwm_bl.
> Provided that its already an optional property, and if someone wants
> to control it in a panel driver, what is wrong in doing so?

See above.

Thierry

[0]: https://lkml.org/lkml/2013/10/7/188

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTeiOtAAoJEN0jrNd/PrOhaI4P/jrPCCKOiZQorcZ9pc49U/Ps
/N3/AbBmXFdy2tmpz7gzQzfQrtzhtd5fXjwNo/SaG2RrPITsg1v0UmAFOoeqmOTg
MJjVzqWzakt7pwJne8C9ztE2KDuUk3BEBxV6HeGOGHAPSJmMqTxtq/o74jbvSYUG
6NKEwMUBpgm+zby6ZYELAMETCg0YX11ZnoewOLlM+3VPZn3y18VJ97+svAa0ZwCh
U5NXA8mTOsi74fLhP/IcBYFgVIMguzeJq+aqTHPlNmNOrpm6fhfdP7m0Uub9MRH6
DwnxkBwHTP+50en3AahpV5V3x0whAQQaZlxjeiWXFeO/Zy7VoiLyCspb20rpDE0v
S4iNs50XzW53vMoq4HyU3rcrsMAF4+Z1kOR8DThQYrnQNirMnslG7FT1RJV3ruwS
1cK09t2D26ZEo6JIKOoWKRBCYwd5if2Gs2VtA9bHgcLMarPhRGc1hkx5fjEskakY
hcJxQhuAuESFTXK0c87OU/q+HHgfvvewvgQGroX0EPRQaFm5wCFXQBStIyqI8ckS
Ww0/4pr2jM4yOyujeewO+zhD036LZWoJYx9fQQm+OLNdFx/8DZIwVSe2XtfJrk8j
Npxt6qgWZfsdzNXXDl60q+HCcHPwGCXisfQmvTFUD1Rg1NjHvFq0ZSD/E6uzi5pP
fvhFytcsKvqs+m7XRGLl
=u6UU
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

--===============1384705064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1384705064==--
