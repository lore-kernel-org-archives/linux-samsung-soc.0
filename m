From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Thu, 31 Jul 2014 16:22:24 +0200
Message-ID: <53DA5120.7080709@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <53D5435B.8030305@suse.de> <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com> <53D783CC.2080108@suse.de> <CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com> <53D9484A.1070905@suse.de> <CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com> <53DA0513.3080602@suse.de> <20140731102348.GC7458@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Jj22w1ESj3FXg4dtXNTxxa4BSwH1I5PCg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33033 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751257AbaGaOWb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 10:22:31 -0400
In-Reply-To: <20140731102348.GC7458@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Jj22w1ESj3FXg4dtXNTxxa4BSwH1I5PCg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 31.07.2014 12:23, schrieb Thierry Reding:
> On Thu, Jul 31, 2014 at 10:57:55AM +0200, Andreas F=C3=A4rber wrote:
>> Am 31.07.2014 10:38, schrieb Ajay kumar:
>>> With just the spring-bridge.v6 branch of your own tree, I am able to =
see
>>> bootup logo on Skate(a variant of spring which also contains ps8622).=

>>> I have tried both exynos_defconfig and multi_v7_defconfig.
>>> I enable DRM, EXYNOS DRM, BRIDGE CHIPS, IOMMU, EXYNOS IOMMU
>>> in configs.
[...]
> If you have something like simplefb enabled in addition to a DRM driver=
,
> then perhaps the DRM driver isn't properly taking over the framebuffer
> console.

So, with simplefb reverted in U-Boot and ...

* with just the v6 applied (...~2), I get only a black screen from
Linux, no penguins, but the backlight seems on. System comes up okay,
ssh available, and nothing stands out in dmesg.

* with the two iommu patches on top, something breaks badly, no
backlight, no USB/network, system inaccessible.

I.e. U-Boot had no noticeable impact on these symptoms.

* with the iommu patches, but dp-controller, ps8622, panel commented
out, I do get backlight but USB/network not working, system inaccessible.=


With simplefb support in U-Boot and with just v6 applied, but
dp-controller, ps8622, panel commented out, things work as well as
before, i.e. this series has no bad side effects. Note that I never
claimed Ajay's series were broken, just reported that things regressed
for me from v4, which may well be DT-related.

The iommu patches interfere with my USB somehow (none or not all devices
powered; with v4, plugging my wifi dongle led to oops but ethernet
dongle worked, so not entirely new symptom), which is bad since my
rootfs is on USB. The internal SDIO-connected Wifi is not enabled yet,
so USB based network is my only alternative to a working display once we
reach userspace.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--Jj22w1ESj3FXg4dtXNTxxa4BSwH1I5PCg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT2lEgAAoJEPou0S0+fgE/hEIP/jL6jCLIqAk4IEFn3H9qhb4/
R4DHefa6lfUtOmpJ0pdgyo3KHpqog7OAZUzr6k79b8d5KGTCfpQrSDzHsKCmaGE5
pPtQn03mH5LFj12xsdIFG51SdqVp6fp2czPQmxjFTT1epwBFsMpuEOOIJ0/ABFcr
bKtt7v+n+lI4nGATw2+PPGgDqa7jOrSa6dNnO6nkGd7dyIIt+IrDM+LUgGEsiHM8
O7bw3L1IP4mJ/xJNiVqK6QQfZZT190K0sRD8O6HPlwobAnaBQ8Le43G4QgoaYbqW
Xdm9F7cacdvOehlfNNEa2F5adAMerK3CrPBn2vO55d0Qo1+LiGHc9zirBhNluW+o
66xRLw1KpiPPGrX8tPQ0ldfuV33Wv2XzZ83KWIvokci1iD7Z/s5iBwfcwnr52OU5
yMnYuKLsKViw+iWNIqVxc2YMbakhbC8IWUPHh+nR+t/++vYNDMYMatEzs7BbL9Wc
FVkXc+gCvJY/CK70gI3GUv5LGNZLKfFla23Nfex7sgqj87NnNHLWH3n7Hg8YxDiF
Fug4/5h8eVV61LjEoTyoShxqaq6XDAgWwuw+X1z3CRv7GWjk6wLAVnPXcOVipr7m
m6uG89gJOmX0KBnpYgP06zwtkLnsD/+ZASnuTAIelnPRmGKeRNLGxDSvA51NpwS6
vloN1n3gVMaQ/VCQPU7X
=Pita
-----END PGP SIGNATURE-----

--Jj22w1ESj3FXg4dtXNTxxa4BSwH1I5PCg--
