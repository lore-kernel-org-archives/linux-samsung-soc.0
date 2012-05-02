From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 18/20] ARM: dts: Update device tree source files for EXYNOS5250
Date: Wed, 2 May 2012 12:55:53 -0700
Message-ID: <CAOesGMiSrNoOA5wTEZo4RiZkPvSAMi43CntN6GUepTzx6M++OA@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-19-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64813 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756181Ab2EBTzy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 May 2012 15:55:54 -0400
Received: by yenm10 with SMTP id m10so580280yen.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 May 2012 12:55:54 -0700 (PDT)
In-Reply-To: <1335813270-13083-19-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Apr 30, 2012 at 12:14 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Updated EXYNOS5 device tree source files to reflect changes in rev1
> of EXYNOS5 SoC. This includes new additions to the EXYNOS5 dtsi and
> SMDK5250 dts files and few minor fixes.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 52 +++++++++++++++=
++++++++++++++
> =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 44 +++++++=
-----------------
> =A02 files changed, 65 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boo=
t/dts/exynos5250-smdk5250.dts
> index 399d17b..bcc4b89 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -23,4 +23,56 @@
> =A0 =A0 =A0 =A0chosen {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bootargs =3D "root=3D/dev/ram0 rw ramd=
isk=3D8192 console=3DttySAC1,115200";
> =A0 =A0 =A0 =A0};
> +
> + =A0 =A0 =A0 i2c@12C60000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;

Two nits:

#a-c and #s-c is likely to always be 1/0, so you might as well move
these to the dtsi file for the SoC.

Also, we tend to use non-caps here and in other locations (so it
should be 12c60000 here).


-Olof
