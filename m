From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Tue, 29 Jul 2014 13:42:09 +0200
Message-ID: <53D78891.4080703@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <53D5435B.8030305@suse.de> <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com> <53D783CC.2080108@suse.de> <20140729113645.GB21732@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Xq7OHpdbqswE53w60fuADl0RfWWDvbHWC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42794 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753356AbaG2LmN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 07:42:13 -0400
In-Reply-To: <20140729113645.GB21732@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Xq7OHpdbqswE53w60fuADl0RfWWDvbHWC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 29.07.2014 13:36, schrieb Thierry Reding:
> On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wrote:
>> Hi Ajay,
>>
>> Am 28.07.2014 08:13, schrieb Ajay kumar:
>>> On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
>>>>> This series is based on exynos-drm-next branch of Inki Dae's tree a=
t:
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t
>>>>>
>>>>> I have tested this after adding few DT changes for exynos5250-snow,=

>>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>>>
>>>> I'm trying to test this with a modified exynos5250-spring DT
[...]
>> Unfortunately the most I got on Spring with attached DT was a blank
>> screen with a white horizontal line in the middle.
>>
>> Do I need to specify a specific panel model for Spring?
[...]
>> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2001=

>> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
>> Date: Sun, 27 Jul 2014 21:58:06 +0200
>> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=3DUTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> [AF: Redone for v6]
>> Signed-off-by: Andreas F??rber <afaerber@suse.de>
>> ---
>>  arch/arm/boot/dts/exynos5250-spring.dts | 32 ++++++++++++++++++++++++=
+++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/d=
ts/exynos5250-spring.dts
>> index 687dfab86bc8..517b1ff2bfdf 100644
>> --- a/arch/arm/boot/dts/exynos5250-spring.dts
>> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
>> @@ -64,10 +64,14 @@
>>  		vdd_pll-supply =3D <&s5m_ldo8_reg>;
>>  	};
>> =20
>> +	panel: panel {
>> +		compatible =3D "simple-panel";
>> +	};
>=20
> You can't do this. "simple-panel" isn't a valid panel model. It should
> probably be removed from the platform_of_match table in the driver.

Okay, that means the Snow DT is wrong, too:
https://patchwork.kernel.org/patch/4625441/

And the others specify it as fallback:
https://patchwork.kernel.org/patch/4625461/
https://patchwork.kernel.org/patch/4625451/

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--Xq7OHpdbqswE53w60fuADl0RfWWDvbHWC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT14iRAAoJEPou0S0+fgE/gRUP/1XrbQPruMtqzfOi+lxi+apl
6uDDLEEMPfrbP7t27rCRwDKLsX16mm68xwm/o380pf89rk91MgRTal98sz90QZC5
ujFR3KfmO2MYxyjgIiXBtUg/F0eji5ktTh7L5zpsKmntgWPdlDqkw6z6ysEdWJx2
gL+Tu0XWp1vdFwFn93CrLcA5DTP2NoS2I+H1rRl56OhUvYfQrcCghJt+tYkLYzTn
B/POIJOX7R+Uk+MOXbmLupj1k0c7uo22erPR4iBhhe4IhB9GbaTKA1fSbyUXR7j9
LpsJ5kIk3a60AD1u93LYjJmHYxls1baEpML8WHB4aY2fsElPWwX7q6NUeBvCV5cz
2WodskCpvNZpbRngvt3sXmsXqAJBAmhYLOaNRBOUmRklsJ/SRBh9BTxHbBu/T/tb
rpmHT4d54jR0g+sKKTeYx6MIzfg1bLPtOChDhyz8f/WIoh8Uc5C8dUzgxOhHt+C8
3p7IBzvjxWP2vp1qj8LWQvwurvx4nVNkrkxP45TFPsMDGmEJuj3UjhvpTgq5rvM4
vEtAa90Ezp+9KqMSf62nSkHHNCskvQHx+D5oOgur8qMX7LKO7Auj/rsBoyc8kRYo
/M8rOsRraXNIz7pgGeMJl78uBfSlFPJN4vdJ++KnnqUnck10h6le0CESaJxYtgIV
i9Lo4M6iVq3ZMJpYWDh1
=KmsE
-----END PGP SIGNATURE-----

--Xq7OHpdbqswE53w60fuADl0RfWWDvbHWC--
