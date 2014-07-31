From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Thu, 31 Jul 2014 12:28:00 +0200
Message-ID: <53DA1A30.4070509@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <53D5435B.8030305@suse.de> <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com> <53D783CC.2080108@suse.de> <CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com> <53D9484A.1070905@suse.de> <CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com> <53DA0513.3080602@suse.de> <20140731102348.GC7458@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="oNvHOiNqkbrDO6w2KfPcX4FnT158lXRDm"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56467 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932301AbaGaK2L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 06:28:11 -0400
In-Reply-To: <20140731102348.GC7458@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oNvHOiNqkbrDO6w2KfPcX4FnT158lXRDm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 31.07.2014 12:23, schrieb Thierry Reding:
> On Thu, Jul 31, 2014 at 10:57:55AM +0200, Andreas F=C3=A4rber wrote:
>> Am 31.07.2014 10:38, schrieb Ajay kumar:
> [...]
>>> With just the spring-bridge.v6 branch of your own tree, I am able to =
see
>>> bootup logo on Skate(a variant of spring which also contains ps8622).=

>>> I have tried both exynos_defconfig and multi_v7_defconfig.
>>> I enable DRM, EXYNOS DRM, BRIDGE CHIPS, IOMMU, EXYNOS IOMMU
>>> in configs.
>>>
>>> Even in your bootlogs, I can see DP getting probed.
>>> And, you say backlight is also visible. That means entire display
>>> path should be fine. Its just that you should start writing to the bu=
ffer.
>>> Have you enabled boot logos?
>>
>> Let me clarify: U-Boot uses the display [*], so it is powered and I se=
e
>> penguins initially. Then, when drm gets initialized, the screen goes
>> black and no longer prints kernel messages or systemd output or X11 gd=
m
>> login screen.
>=20
> Who's displaying the penguins? If you're referring to the Linux boot
> logo then it shouldn't be displayed at all until after DRM has been
> initialized (and the framebuffer console been set up).

Yes, I'm referring to the default boot logo, but before the boot
messages (console=3Dtty1) indicate that [drm] driver is being initialized=
=2E

>> Since drm stuff is the only variance here and it works with simplefb,
>> surely something prints to some buffer!
>=20
> If you have something like simplefb enabled in addition to a DRM driver=
,
> then perhaps the DRM driver isn't properly taking over the framebuffer
> console.

Okay, that's worth a try. Around v4 of this series it was not a problem.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--oNvHOiNqkbrDO6w2KfPcX4FnT158lXRDm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT2ho2AAoJEPou0S0+fgE/py8QAKfLqMssSWEKIiJY5/FwtvOV
+7pgtILS/IzejxYnm1DQjgXnevUcVlGG/ZB+C6avFW582pRhTHsxzTBcFGFzBrcE
dabq+ssVWcesoMqkYFXL4q9HBWj29ZBqXUUvKjr6+7/JvGAQ/xiMLonuJ3rsU3hE
3WBzR2SEyKMnQiPm9Mp4MP91AZPBcbMGeCpORpSFKTIRHkilbjS0jHmRo42Ns/P+
jD0GaHgQPlHsmWh/471PmyLV5MJ8a/QLCOCTPrjWkOU9siZQoHjS4843K2PwbwtC
qGbDNEIcigA9bH0lS68W29VtseNvea5JHDZ7it4z3GnUyszLojZB1xU9cbSEly7H
zI3YlQBhQU6RZJK1/c4ArExUoRM4MOUwdCTMrzppYVcZpF6lmr5DT1sza2fPRGuh
DYme4iwDjRfD9/LdBH1DlH6Dl8k/dp6S3dj5cCaCoplK2SJ7ocFdNnoASZsCPEad
ATja9qqzBwKF8YQ3wq/qH+kWOCUhMKGKBKaOtF1s2bntuuu0W20O3UtPUA72LO8X
kyKFscVyANprWsiV2bC+0XSbSmM/wiS4L7eGAO5vN8YTE2Snad1fOMO3oDGdiUxR
QBGjB2fDC2HU16jcUsMjzKMR+qlanlMNUlUdCPKvFBnuGdHFN2/pRQg+9w+iAEd8
xDITEafO+/6vM9OE6OZ1
=5MnN
-----END PGP SIGNATURE-----

--oNvHOiNqkbrDO6w2KfPcX4FnT158lXRDm--
