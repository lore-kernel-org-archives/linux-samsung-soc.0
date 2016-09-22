From: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add reboot reason support for Trats2
Date: Thu, 22 Sep 2016 20:59:03 +0200
Message-ID: <87shsrlq1f.fsf@monsta.com>
References: <20160922174606.GA4988@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160922174606.GA4988@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Krzysztof Kozlowski writes:

> On Thu, Sep 22, 2016 at 06:48:35PM +0200, Wolfgang Wiedmeyer wrote:
>> This allows to reboot the device into recovery mode and into the download
>> mode of the bootloader.
>
> Which bootloader? Probably UBoot... or Samsung stock one? Could you put
> that information here?

I'm only working with the stock one. I was under the impression that the
stock bootloader cannot be replaced on a i9300 because there's a
signature check. Is UBoot loaded after the stock one on Trats2 or how
does this work? I didn't find information on that.

>>=20
>> Signed-off-by: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/exynos4412-trats2.dts | 14 ++++++++++++++
>>  arch/arm/boot/dts/exynos4x12.dtsi       |  2 +-
>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts=
/exynos4412-trats2.dts
>> index 129e973..a38d1e3 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -1294,3 +1294,17 @@
>>  	vtmu-supply =3D <&ldo10_reg>;
>>  	status =3D "okay";
>>  };
>> +
>> +&pmu {
>> +	compatible =3D "syscon", "simple-mfd";
>> +
>> +	reboot-mode {
>> +		compatible =3D "syscon-reboot-mode";
>> +		offset =3D <0x80c>;
>> +
>> +		mode-normal	=3D <0x12345670>;
>> +		mode-bootloader	=3D <0x12345671>;
>> +		mode-download	=3D <0x12345671>;
>> +		mode-recovery	=3D <0x12345674>;
>
> Hmmm, how did you get these values? Are they already supported?

I only have the vendor source drop as documentation. The magic mode
values [1] and the offset [2] can be found there.

> It would be nice to document them:
> 1. In Documentation/arm/Samsung/Bootloader-interface.txt
> 2. In header. I hate such magic numbers... you could add new header next
>    to existing rockchip one:
>    include/dt-bindings/soc/samsung,boot-mode.h
>    (and update maintainers entry :) )

Thanks for the review! I will do the documentation and update the commit
message.

Best regards,
Wolfgang

[1] https://code.fossencdi.org/kernel_samsung_smdk4412.git/tree/arch/arm/ma=
ch-exynos/sec-reboot.c#n65

[2] https://code.fossencdi.org/kernel_samsung_smdk4412.git/tree/arch/arm/ma=
ch-exynos/include/mach/regs-pmu.h#n79


=2D-=20
Website: https://fossencdi.org
Jabber: wolfgang-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org
OpenPGP: 0F30 D1A0 2F73 F70A 6FEE  048E 5816 A24C 1075 7FC4
Key download: https://wiedmeyer.de/keys/ww.asc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJX5Cn3AAoJEFgWokwQdX/EwKoP/1KJqjrX/3/FViBc8Yg5k0Dl
uFAr7YeAEloGEBLahjF6ERsLzTjCPuaDDTNsYJ3AtaRZJCvzJI1xCQusspwEh0sV
n1/ZWGCKhEC0QHfvO8y2dH4F636Z7yZoPyEp3wS+X3EkTeB2/6aMzT7vhXhqmhyc
qnTf2NamQnAVvRuLwv1+KLP+sYczllnrJ02Xrtmg5+Mlkc7rX5/Ik+b60AUK+ogT
VpSv/Y1SrdKe2+Edzvx2APTVcEMiBlPjXr1PUkhGzCMXhlkiYtWP7tLAaLC0J2OP
t0xlcGG4vTEZBAzVpsHdZ8NnXHRVckq+BklIOdn+cle7jAG/SF3gTj47i84eqJZW
iJaaA16zEN4p/s06rOHWyTx2uTNp8TcyaXxzPfM/EMQH6EXV7WT5AZoMsB8iJsjB
GcTFe6AyQTXcc0903uRX2tF9t6cxZsX0234OgFf/W9SrnAB/MNyNbJkniNaE+1KK
E1uyk9dCARPqJaKD396ve/OpOvHCC7VzlhGpCrmQI01YrFoQHsBe7Xz1qm4CTCkA
E6CIdD1FlfDMsV+paCEj+guhvLtXyNBJt4N2PQwtlXuC8GfSUuO3pova/TKCnkGg
PLvmnh2aLYc5Y66eM3IyodSHejETuxSmkUv5ZC5qDagiF9x20GpIcoq+jTbOysbj
xc+1ly4kYRvtJQUDgwMT
=j86r
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
