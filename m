From: Wolfgang Wiedmeyer <wolfgang-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add reboot reason support for Trats2
Date: Sat, 24 Sep 2016 23:04:49 +0200
Message-ID: <87fuopvwjy.fsf@machinist.wiedmeyer.de>
References: <20160922205522.GA15917@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160922205522.GA15917@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Krzysztof Kozlowski writes:

> On Thu, Sep 22, 2016 at 08:59:03PM +0200, Wolfgang Wiedmeyer wrote:
>>=20
>> Krzysztof Kozlowski writes:
>>=20
>> > On Thu, Sep 22, 2016 at 06:48:35PM +0200, Wolfgang Wiedmeyer wrote:
>> >> This allows to reboot the device into recovery mode and into the down=
load
>> >> mode of the bootloader.
>> >
>> > Which bootloader? Probably UBoot... or Samsung stock one? Could you put
>> > that information here?
>>=20
>> I'm only working with the stock one. I was under the impression that the
>> stock bootloader cannot be replaced on a i9300 because there's a
>> signature check. Is UBoot loaded after the stock one on Trats2 or how
>> does this work? I didn't find information on that.
>
> +CC Marek,
>
> Trats2 is working with U-Boot. Just U-Boot. However I never converted S3
> into Trats2 on my own. I always used targets prepared to be "Trats2"
> type.=20

It would be awesome to be able to run U-Boot on i9300. Is there a way to
test this by not risking to brick the device, e.g. by booting from the
SD card? Then I could send an updated version of the patch that is
compatible with U-Boot :)=20

> Of course kernel is independent to bootloader but in that case you want
> to use a specific interface between kernel and specific bootloader
> type/version. In that case - this should be U-Boot, I think.

I absolutely understand that. Having the patch in mainline doesn't make
much sense if it's not compatible with U-Boot.

Best regards,
Wolfgang

>> >> Signed-off-by: Wolfgang Wiedmeyer <wolfgit-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/exynos4412-trats2.dts | 14 ++++++++++++++
>> >>  arch/arm/boot/dts/exynos4x12.dtsi       |  2 +-
>> >>  2 files changed, 15 insertions(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/=
dts/exynos4412-trats2.dts
>> >> index 129e973..a38d1e3 100644
>> >> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> >> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> >> @@ -1294,3 +1294,17 @@
>> >>  	vtmu-supply =3D <&ldo10_reg>;
>> >>  	status =3D "okay";
>> >>  };
>> >> +
>> >> +&pmu {
>> >> +	compatible =3D "syscon", "simple-mfd";
>> >> +
>> >> +	reboot-mode {
>> >> +		compatible =3D "syscon-reboot-mode";
>> >> +		offset =3D <0x80c>;
>> >> +
>> >> +		mode-normal	=3D <0x12345670>;
>> >> +		mode-bootloader	=3D <0x12345671>;
>> >> +		mode-download	=3D <0x12345671>;
>> >> +		mode-recovery	=3D <0x12345674>;
>> >
>> > Hmmm, how did you get these values? Are they already supported?
>>=20
>> I only have the vendor source drop as documentation. The magic mode
>> values [1] and the offset [2] can be found there.
>
> It would be useful to mention that in commit msg (just the source)...
> however as I wrote above, these values should be for U-Boot, not the
> stock one.
>
> Best regards,
> Krzysztof
>
>>=20
>> > It would be nice to document them:
>> > 1. In Documentation/arm/Samsung/Bootloader-interface.txt
>> > 2. In header. I hate such magic numbers... you could add new header ne=
xt
>> >    to existing rockchip one:
>> >    include/dt-bindings/soc/samsung,boot-mode.h
>> >    (and update maintainers entry :) )
>>=20
>> Thanks for the review! I will do the documentation and update the commit
>> message.
>>=20
>> Best regards,
>> Wolfgang
>>=20
>> [1] https://code.fossencdi.org/kernel_samsung_smdk4412.git/tree/arch/arm=
/mach-exynos/sec-reboot.c#n65
>>=20
>> [2] https://code.fossencdi.org/kernel_samsung_smdk4412.git/tree/arch/arm=
/mach-exynos/include/mach/regs-pmu.h#n79
>>=20
>>=20
>> --=20
>> Website: https://fossencdi.org
>> Jabber: wolfgang-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org
>> OpenPGP: 0F30 D1A0 2F73 F70A 6FEE  048E 5816 A24C 1075 7FC4
>> Key download: https://wiedmeyer.de/keys/ww.asc


=2D-=20
Website: https://fossencdi.org
Jabber: wolfgang-CMKNnOTVkIZM7kwft8N7nw@public.gmane.org
OpenPGP: 0F30 D1A0 2F73 F70A 6FEE  048E 5816 A24C 1075 7FC4
Key download: https://wiedmeyer.de/keys/ww.asc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJX5upxAAoJEFgWokwQdX/EcfUP/3nOEr8pqxIAZdjc7/S4Oosq
9cA4R69GfGYmGo//mT2RYE9L+3hPDXDm4HoAHYd7e871Maecnnf5r7xteBfoY+p9
ZeWb6oiGBhoO5IftxWBfLcfyKOCm8zLNAysocCM//sR/MBkcZb5NpiDphUcVfePy
zBITjqK8LmLAvMWj4xsB/SQPxfuOkMBqK+59Uj0iX8srPRxSN7WRqFlSBxY97ftD
lUvXBttUxJvKAMdk1c77XmBX4XgK+iJKXoYN8SztvshMhTK7iW0yf4aaWgvm8kTX
fJz94MXKt33nwPvho5SV7v2rXMVLO+7flazypwzMXgZXoeDFdbPJ3PXzpZlZqi1I
cOPJAKHmMpQfyhuBNNx2Wmpc43RcvqspBrhI0dCE3982e6eSwLBw8avB4cwN2h5V
qNnj2vxD98SDEz5N/89jySAVOMC5YFSCoXxjmsjDJbHX917NmWNpWD/rorL718Vc
D6afvKSWVZNpsVsVPPqMvtir23kuvQdteNgtPEjuVKI2vVOe/fzORyM1XyVpAw5m
uPmF0v+oYlSN9tMnE7nb1Tk6LD/zJrmBK21PQBEMuYpJd/yfxV8Gp15i/CPm0PbZ
rO8lCrASJJ7zJOv2IjtIPwReHlRqxi0UQiD6Oe0DXy8ZK1JaIqRbZPiM7lLniqy+
ZsFdXa+SavBY3jPW1jGp
=+Zl7
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
