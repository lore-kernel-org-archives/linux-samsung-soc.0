From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Mon, 19 May 2014 22:10:04 +0200
Message-ID: <20140519201003.GB30737@mithrandir>
References: <20140513080501.GH6754@ulmo>
 <CAEC9eQN=AAOVFNqWp61zFsS1jtewyDb18oFP1VAuCjYhQWGRnA@mail.gmail.com>
 <20140514145402.GC8612@ulmo>
 <CAEC9eQOvObG5CKb-GcpuSBXccSnVrEjQsBThAOJ4q5YECc6d0A@mail.gmail.com>
 <20140515081321.GF5952@ulmo>
 <CAEC9eQM_KtHDRaYGCmeT3f61+Rwh5oG2xWDNTTMkQCht6kAydQ@mail.gmail.com>
 <20140517211404.GC1046@mithrandir>
 <CAEC9eQN5Z+dGqNBDq_pkMu0AzASkrA9xPpEjKRWRoVYAq2L1bA@mail.gmail.com>
 <20140519153053.GB30978@ulmo>
 <CAEC9eQMPR1VbA6+ziDGaPSH_9VHtFS8-YkMKiTtaD90gDTLcKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0096443679=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQMPR1VbA6+ziDGaPSH_9VHtFS8-YkMKiTtaD90gDTLcKA@mail.gmail.com>
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


--===============0096443679==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2014 at 12:37:38AM +0530, Ajay kumar wrote:
> On 5/19/14, Thierry Reding <thierry.reding@gmail.com> wrote:
> > On Sun, May 18, 2014 at 01:50:36PM +0530, Ajay kumar wrote:
> >> On Sun, May 18, 2014 at 2:44 AM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Thu, May 15, 2014 at 05:10:16PM +0530, Ajay kumar wrote:
> >> >> On Thu, May 15, 2014 at 1:43 PM, Thierry Reding
> >> >> <thierry.reding@gmail.com> wrote:
> >> > [...]
> >> >> > I still don't see how controlling the enable GPIO from the panel will
> >> >> > be
> >> >> > in any way better, or different for that matter, from simply
> >> >> > enabling
> >> >> > the backlight and let the backlight driver handle the enable GPIO.
> >> >> > Have
> >> >> > you tried to do that and found that it doesn't work?
> >> >> It works, but it gives me glitch when I try to configure video.
> >> >> This is because backlight_on(pwm-backlight) happens much before
> >> >> I configure video(inside drm), and while configuring video there would
> >> >> be a glitch,
> >> >> and that glitch would be visible to the user since backlight is already
> >> >> enabled.
> >> >
> >> > Okay, so this means that your backlight is turned on too early. Instead
> >> > of working around that problem by moving control of the backlight
> >> > enable
> >> > GPIO from the backlight driver into the panel driver, the correct way
> >> > to
> >> > fix it is to make sure the backlight stays off until video is ready.
> >> Ok. Please suggest an idea how to do the same!
> >
> > I did post a patch[0] a long time ago that added a way to fix this for
> > pwm-backlight at least.
> I have tried this. We have to wait till the userspace to switch the
> backlight on again :(

Erm... why?

> >> I have already suggested a simple idea which conforms to a valid spec.
> >> Just because enable_gpio is already a part of pwm_bl.c, I somewhat feel
> >> like we are forcing people to handle enable_gpio inside pwm_bl.c.
> >
> > And that's a good thing. That's what people will expect. Backlights are
> > exposed via sysfs, which is currently also the only way to control the
> > backlight from userspace. If the driver for that doesn't have everything
> > required to control the backlight how can userspace control it?
> This is a valid point, only at the hardware level.
> But if you consider a user experience perspective,
> user still will not be able to see the backlight even
> though enable_gpio is controlled elsewhere, since
> pwm is disabled anyhow.

But that's precisely my point. If the enable_gpio is controlled
elsewhere there will be no way for the userspace interface to enable the
backlight.

> Now lets talk about backlight_on case. Even though user tries to turn
> on the backlight, and the driver turns on backlight supply, pwm and
> enable_gpio, the driver cannot always guarantee him that backlight is
> "really on" since it also depends on panel power.

No. If the backlight is properly hooked up to all resources, then
turning it on will *really turn it on*.

> >> Note that, pwm_bl can still work properly without enabling the backlight
> >> GPIO.
> >> And, I did point out to a valid datasheet from AUO, which clearly
> >> indicates why
> >> backlight enable GPIO should be a part of panel driver and not pwm_bl
> >> driver.
> >
> > Just because some spec mentions the backlight enable pin in some panel
> > power up sequence diagram that doesn't mean we have to implement it as
> > part of the panel driver.
> That is not "some spec". I believe all the AUO panels share the same
> sequence!

Just because some specs mention the backlight enable pin in some panel
power up sequence diagram that doesn't mean we have to implement it as
part of the panel driver.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTemUbAAoJEN0jrNd/PrOh22EP/139ijflxNb6H7yqfNCokOoi
fe1fBsKz/fxZb19tZUuL2DSQYAgXzvs9IgHgIr+mmWLwOFDVnezozeKq+jx6mnA5
Frst96KU43AF4bnI7K7YNaasnlGm1dXtkE3Y+DxrJ4OhmB3pJIRVqlIVhj4L5xjW
weUsdcsXIuD2dYB0UB/7Es+AR1cYa7QxKpo1ZtFtUMGHS9PllTXUC2zach0xLN6b
pI2ESlxamnWfO9L8A9psb+BpYyJXiw0vt1sp/6WbWLIlFx9dc8vtyH6EuxxDqaEE
Rslx8gYUtZjh/86HqjG7IB1iDYL0LKdOYw036WIHny8omGBH/uKjQQ3LKDAnWcVC
82ftookfWJfv+sVfCdkFIP6Qo/sMQ1KBBTDceM63iOttS9dfE9ucxJS02j7cWBKv
0artq4X6WqJJg0HKkrCajwbWZqXyCqHjoTW5OgUhzSO9dITzuAoFrR5+OxZFvqlp
PFE7oSEz7yLrXDeiGOIh2gC29RVOHrWDaCV/0NFZ8AGj95RLa8XNX2l5FWXwOKYQ
HV4HT2GTakwyh1zh2CqeVlq2UMyxH2pS5raqDQ8onSVsrsObw9DilILOGJlxF/GS
vNB+qSS9bUaUbcROS43xjimiuQIRDlb5J3TBgHJnSCRzd3sCxISHkz332NxXDJ2g
KGblR+wJNUnN8kuULA8v
=kET1
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============0096443679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0096443679==--
