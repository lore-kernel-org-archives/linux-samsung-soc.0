From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 04/10] ARM: dts: Clean up exynos5250-snow
Date: Sat, 02 Aug 2014 14:56:19 +0200
Message-ID: <53DCDFF3.7030909@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-5-git-send-email-afaerber@suse.de> <53DCD7D7.2070208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:54770 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbaHBM4Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 08:56:25 -0400
In-Reply-To: <53DCD7D7.2070208@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 02.08.2014 14:21, Tomasz Figa wrote:
> On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
>> Use the new style of referencing inherited nodes and use symbolic na=
mes.
>> Reorder one pinctrl node in GPIO order.
>>
>> Goal is the alignment of all exynos5250 based device trees for compa=
rison.
>>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v5 -> v6:
>>  * Split off label additions (Doug Anderson)
>>  * Fixed alphabetical order of sd3_* nodes (Doug Anderson)
>> =20
>>  v4 -> v5:
>>  * Introduced labels to consistently use new referencing style (Toma=
sz Figa)
>>  * Use IRQ_TYPE_* constants
>>  * Use some more GPIO_ACTIVE_*
>>
>>  v3 -> v4: Unchanged
>> =20
>>  v3: New (Doug Anderson)
>>
>>  arch/arm/boot/dts/exynos5250-snow.dts | 291 +++++++++++++++++------=
-----------
>>  1 file changed, 145 insertions(+), 146 deletions(-)
>=20
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Just for convenience of other reviewers, here are actual changes done d=
o
the device tree after compiling into dtb and then back into dts:

> --- exynos5250-snow.dtb.dts	2014-08-02 14:54:15.145905921 +0200
> +++ ../dtbs.post/exynos5250-snow.dtb.dts	2014-08-02 14:54:15.14690592=
1 +0200
> @@ -8,6 +8,7 @@
>  	model =3D "Google Snow";
> =20
>  	chosen {
> +		bootargs =3D "console=3Dtty1";
>  	};
> =20
>  	aliases {
> @@ -829,15 +830,6 @@
>  			phandle =3D <0x44>;
>  		};
> =20
> -		hdmi-hpd-irq {
> -			samsung,pins =3D "gpx3-7";
> -			samsung,pin-function =3D <0x0>;
> -			samsung,pin-pud =3D <0x1>;
> -			samsung,pin-drv =3D <0x0>;
> -			linux,phandle =3D <0x33>;
> -			phandle =3D <0x33>;
> -		};
> -
>  		max77686-irq {
>  			samsung,pins =3D "gpx3-2";
>  			samsung,pin-function =3D <0x0>;
> @@ -846,6 +838,15 @@
>  			linux,phandle =3D <0xe>;
>  			phandle =3D <0xe>;
>  		};
> +
> +		hdmi-hpd-irq {
> +			samsung,pins =3D "gpx3-7";
> +			samsung,pin-function =3D <0x0>;
> +			samsung,pin-pud =3D <0x1>;
> +			samsung,pin-drv =3D <0x0>;
> +			linux,phandle =3D <0x33>;
> +			phandle =3D <0x33>;
> +		};
>  	};
> =20
>  	pinctrl@13400000 {
> @@ -1703,12 +1704,12 @@
>  		samsung,dw-mshc-ciu-div =3D <0x3>;
>  		samsung,dw-mshc-sdr-timing =3D <0x2 0x3>;
>  		samsung,dw-mshc-ddr-timing =3D <0x1 0x2>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <0x27 0x28 0x29>;
> =20
>  		slot@0 {
>  			reg =3D <0x0>;
>  			bus-width =3D <0x4>;
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <0x27 0x28 0x29>;
>  		};
>  	};
> =20

Best regards,
Tomasz
