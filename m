From: "G, Manjunath Kondaiah" <manjugk@linaro.org>
Subject: Re: [PATCH 2/2] arm: dt: Add device tree support for i2c instance 1
 on exynos4 dt machine
Date: Mon, 18 Jul 2011 17:23:30 +0530
Message-ID: <CAP6yH7dUnqhvSA8AYx2R9ZZ1mBL=YMz6oMiJVpphA1FhgLHOvw@mail.gmail.com>
References: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org>
	<1310950241-13602-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:60414 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756399Ab1GRLxc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 07:53:32 -0400
In-Reply-To: <1310950241-13602-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, patches@linaro.org

Abraham,
=46ew comments on i2c child devices handling:

On 18 July 2011 06:20, Thomas Abraham <thomas.abraham@linaro.org> wrote=
:
> Add device node for i2c instance 1 and list all its connected slave
> devices.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0arch/arm/boot/dts/exynos4-smdkv310.dts =A0| =A0 19 +++++++++++++++=
+++-
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-exynos4/mach-exynos4-dt.c | =A0 =A09 +++++++++
> =A03 files changed, 28 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/d=
ts/exynos4-smdkv310.dts
> index d65c18c..29c40ed 100644
> --- a/arch/arm/boot/dts/exynos4-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
> @@ -23,7 +23,7 @@
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0chosen {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/mmcblk0p1 roo=
tfstype=3Dext3 rootwait console=3DttySAC1,115200";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/mmcblk0p1 roo=
tfstype=3Dext3 rootwait console=3DttySAC1,115200 init=3D/linuxrc";
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0soc {
> @@ -64,5 +64,22 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0samsung,sdhci-cd-type =
=3D <0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0samsung,sdhci-clkdiv-e=
xternal;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c@13870000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung=
,s3c2440-i2c";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x13870000 0x1=
00>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <345>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-bus-number =
=3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-slave-addr =
=3D <16>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-sda-delay =3D=
 <100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,i2c-max-bus-fre=
q =3D <100000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8994@1a {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "wlf,wm8994";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x1a>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };

The i2c child devices are board specific.
=46or ex: few boards such as smdkxxx based on exynos4 has wm8994 with
i2c1 controller
where as other boards based on exynos4 does not have any i2c1 devices.
Hence these child entries should go to board specific .dts file right?
There should be soc specific .dts file and board specific dts file
should include soc dts file.

-M
