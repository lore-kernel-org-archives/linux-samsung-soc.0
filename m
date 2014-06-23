From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5410: Fill in CPU clock-frequency
Date: Mon, 23 Jun 2014 11:53:28 +0400
Message-ID: <53A7DCF8.4090108@samsung.com>
References: <1403466596-3347-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403466596-3347-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@linaro.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/22/2014 11:49 PM, Andreas F=C3=A4rber wrote:
> It's 1.6 GHz for the Cortex-A15.
>
> Avoids warnings like "/cpus/cpu@0 missing clock-frequency property".
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>   arch/arm/boot/dts/exynos5410.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/ex=
ynos5410.dtsi
> index 3839c26..9d0b8cc 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -28,24 +28,28 @@
>   			device_type =3D "cpu";
>   			compatible =3D "arm,cortex-a15";
>   			reg =3D <0x0>;
> +			clock-frequency =3D <1600000000>;
>  =20

Reviewed-by: Tarek Dakhran<t.dakhran@samsung.com>

--=20
Best regards,
     Tarek Dakhran
