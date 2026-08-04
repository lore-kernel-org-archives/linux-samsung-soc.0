Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859823B9DA5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845178; cv=pass; b=Yfi70+thcjAx6J/9e11C4P3pMa3z775H1pQDQwVe201Wubu+6XYPLB6AKIz5hREnsK2MKE5PEebX6Rz1bSRHJ/PosSxs7/ekSfd7y11Rd6GxozoG+PMaxo/IpD8PMpVWm53UMf79abFK97kgA/7diB/MCRvoWozSgXPeVUCnSPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845178; c=relaxed/simple;
	bh=OKfmS8TsaGtc91iX9mLi6r83sQXms/fmJaIviRH0BCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjmzN4kjc3tEuqFqrR3nGZhkyf57/aNKZrTKti7dbaYZ9ENYDhwmsSJSE5ZaXYNENRjGNVExKEno+hpqmK2ZaT/oruy259GDRmqdWnlgOrOmPxVOk2NMbnU4Ept+vxggGLu5uATYOP9cjIkCOgDWu/V3XoTGiJGv1nf+Cn16qv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/Xi3Suu; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/Xi3Suu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so6009709a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845165; cv=none;
        d=google.com; s=arc-20260327;
        b=qRgOxnb1y6zO6mb55WEWOBTyDM2fDP2H8+LkUns8qoywHGTNED8HfahOgE5Dttb2th
         +STB8culWC5RhquNkYtbPSdDqELYUpz5EYaqw77bIPsbrkVKEEWWrgV+xci+UTpqtRTK
         NMV9mIZ9G4aVQR1jOhJKddrjltJoyiJUduwscfW1wrIOTbJmHkswq4q+MyVi+NUGYcV7
         ungOSZOzxpl462/bAJY3fSELCeubE+TFAc6ytisLfwKy/RTPzf7/Dj11HdJJYtkS+S+e
         LcSCeqpImdjHxVRDstBAfMK1Jr+PrLZnG4tKHYR5dH3Yn4e1NmugCNemcfKW0J67MRnB
         IAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fCyU7QtPUTyFXWV8lHJd0pj2CzXXfS/x9VTPpIUporM=;
        fh=ND9tOqSh7+XBJUh4oDKp7pNw6ztHWli2kyYhx4XPvhE=;
        b=BDqzzwcs3gnle7GrlanzsEOWwAA2sHQFbvjbrEmwunTy786oW1oGn355L1Kdzo9xTo
         1TzEH4SWHIJrpFXHiLZ58p4AQXnEOnc1VSc7Fo69sDCo4LtKK1L50gl8FkRSBHhLM9Ce
         981giH6Q8MVTTnyVjD7cCMzTzgNdWg6y08hRLzk1LYg6K9n68phjt+3D5wkQySLnWtZn
         7UC82KYnhFcZaAZYkxK3ose+uR4hA2iOzilrddxdMl3lY0dy1pbZOwVhi84Da/uT7eOW
         901w7PIixpf/nlu8/hGzMg+gkQwqsHKtKI71OT50ao7aJ9iL9UukaRkMx1h7k6Qkq9Ib
         mJ3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845165; x=1786449965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fCyU7QtPUTyFXWV8lHJd0pj2CzXXfS/x9VTPpIUporM=;
        b=u/Xi3SuuTOzPld5RapE2mn7THlhmIhJKnJ84MUDHK4ZdkuV+GnoJnL2o9yd+jBk1r0
         fD32BlypPj5feeyrvrjUQNfpwfnxXMhdNLg00RZ4k6rvO//bMvkPSR8ydnr5jhJiIjlh
         FJnOdzAuEC5udrCbCLq/ivfaEc+w6XnxWz//sFAcobnG1mjUTWCx/nWCesVE22OWQq8/
         CtvUPcahdBxzDbRcpi7F5VHeSf4cCDsvXepGaIAm2BT/iBCyiyNh+LDgiiJcz/RuWSai
         9aSHfyHjKb5Wn721I1urz18t+DAY60Xj03Drzfi/KDFguUKJXQ/K8RK6rXpHF67cdfUa
         XT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845165; x=1786449965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCyU7QtPUTyFXWV8lHJd0pj2CzXXfS/x9VTPpIUporM=;
        b=WyoNcDPe1SrYub/THfWvts3EZNRqFy49QIWF5lQ6CD2U4QlpMF+HV+RpxpfaDmRDuN
         7BXlfMPu78nf8BVuAeRIO8zAhY7k8HAM1X12IyUdAIMlpbvhLiCjevcPmdFjyslFshgg
         URrXKfDVl3iMaCGMOO58yRB3bGZlcnOwDzNs7xFIeNkXrFxhDVNdM0ptdHYCRk+RN96o
         tP0pHHKR3elJjuEI8PiuaJlbVWTXCy5kvrI7au+Vu/nRYMjJaF2jS6AKNjgNaS6kE8vY
         5unBEKGtWSUX3H6B9oH7XqfGpyN7AO0uARClJ/vBtKkZRjctlSCDH3Jp6R2Ka3V2bCDy
         AbRA==
X-Forwarded-Encrypted: i=1; AHgh+RqHAmBHKi8KHQYjVa5yg8z4bSKX0uB3RkAypTQmGo9PGquF1sdPXyebdGM24zXwbaHAulDqick9Mu4fd2MEAuLQdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4PYrjPcwrdzpPdICzPyJizj3qRg/vR6xf3x3awHMeRubm0Ty
	/GRSMXwrXj6RUKAND0hwyE8Ehap7G8Ijp9k9menrWOxl9GUnVgaXZ8Gu8RTemlJUOK4IPCSczRi
	YUC3cx0q+xje0SO5Bb90npvJt/kc9UQHThZP0i9fsZQ==
X-Gm-Gg: AR+sD12KQahgWM8ABZRXADdFSM8pNljv7yiiOpcTX0ZUjLwrv6IXY8yY2T+/j/saP/A
	T081eVgwyYHhI6BsL3qNtTUSYaWJguTpz5LiTbvZWXdSUtjg8I9I9Po3J83mugea+wUr/nXMJom
	bUIzWZ1weR4jyXC1TO51OUy5glmQhi+kcL1paPaVjLILygOVZDMWxmyqnwdUclhxiQ9UjYRI/GW
	MLOKJfyh2VdoJgsGPKF5LdJEvi4FJUElyz2VoMmy3watquQoDi2enJhBd6PTB3gWvbILHFBnrxE
	ypVdPWl9nQjF9sPiAdpR6uNV9siz4WmsDc3n+ggF20jn14iP8ZXnp/ZOLvtb95Edndl+eCxBp1Z
	T5xQ=
X-Received: by 2002:a05:6402:5110:b0:6a1:db5:cfee with SMTP id
 4fb4d7f45d1cf-6a10db5d1a0mr5648857a12.15.1785845164798; Tue, 04 Aug 2026
 05:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-2-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-2-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:05:52 +0100
X-Gm-Features: AUfX_mwrlgYvFkTTRG_NBrxloAPVHFqvdFO9-HQmrc4Owx0tXTyLAEmfyE0LJV0
Message-ID: <CADrjBPqUzTtucMbu4=-4PiiThHambQWFjEGjeNMGmO0N9Ok9kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: exynos: Align continued properties and
 add missing blank lines
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  19 ++
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 120 ++++++-----
>  arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  45 ++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 230 ++++++++++++---=
------
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   3 +-
>  .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
>  arch/arm64/boot/dts/exynos/exynos7.dtsi            |  34 ++-
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
>  arch/arm64/boot/dts/exynos/exynos7885.dtsi         |   9 +-
>  arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
>  arch/arm64/boot/dts/exynos/exynos850.dtsi          |  16 +-
>  arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi         |   9 +-
>  arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
>  arch/arm64/boot/dts/exynos/exynos990.dtsi          |   3 +-
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   9 +-
>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |   7 +
>  19 files changed, 359 insertions(+), 188 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/=
boot/dts/exynos/exynos5433-bus.dtsi
> index 0c200df9996f..9bfa0474675c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> @@ -105,22 +105,27 @@ opp-400000000 {
>                         opp-hz =3D /bits/ 64 <400000000>;
>                         opp-microvolt =3D <1075000>;
>                 };
> +
>                 opp-267000000 {
>                         opp-hz =3D /bits/ 64 <267000000>;
>                         opp-microvolt =3D <1000000>;
>                 };
> +
>                 opp-200000000 {
>                         opp-hz =3D /bits/ 64 <200000000>;
>                         opp-microvolt =3D <975000>;
>                 };
> +
>                 opp-160000000 {
>                         opp-hz =3D /bits/ 64 <160000000>;
>                         opp-microvolt =3D <962500>;
>                 };
> +
>                 opp-134000000 {
>                         opp-hz =3D /bits/ 64 <134000000>;
>                         opp-microvolt =3D <950000>;
>                 };
> +
>                 opp-100000000 {
>                         opp-hz =3D /bits/ 64 <100000000>;
>                         opp-microvolt =3D <937500>;
> @@ -133,15 +138,19 @@ bus_g2d_266_opp_table: opp-table-3 {
>                 opp-267000000 {
>                         opp-hz =3D /bits/ 64 <267000000>;
>                 };
> +
>                 opp-200000000 {
>                         opp-hz =3D /bits/ 64 <200000000>;
>                 };
> +
>                 opp-160000000 {
>                         opp-hz =3D /bits/ 64 <160000000>;
>                 };
> +
>                 opp-134000000 {
>                         opp-hz =3D /bits/ 64 <134000000>;
>                 };
> +
>                 opp-100000000 {
>                         opp-hz =3D /bits/ 64 <100000000>;
>                 };
> @@ -153,9 +162,11 @@ bus_gscl_opp_table: opp-table-4 {
>                 opp-333000000 {
>                         opp-hz =3D /bits/ 64 <333000000>;
>                 };
> +
>                 opp-222000000 {
>                         opp-hz =3D /bits/ 64 <222000000>;
>                 };
> +
>                 opp-166500000 {
>                         opp-hz =3D /bits/ 64 <166500000>;
>                 };
> @@ -168,18 +179,23 @@ bus_hevc_opp_table: opp-table-5 {
>                 opp-400000000 {
>                         opp-hz =3D /bits/ 64 <400000000>;
>                 };
> +
>                 opp-267000000 {
>                         opp-hz =3D /bits/ 64 <267000000>;
>                 };
> +
>                 opp-200000000 {
>                         opp-hz =3D /bits/ 64 <200000000>;
>                 };
> +
>                 opp-160000000 {
>                         opp-hz =3D /bits/ 64 <160000000>;
>                 };
> +
>                 opp-134000000 {
>                         opp-hz =3D /bits/ 64 <134000000>;
>                 };
> +
>                 opp-100000000 {
>                         opp-hz =3D /bits/ 64 <100000000>;
>                 };
> @@ -191,12 +207,15 @@ bus_noc2_opp_table: opp-table-6 {
>                 opp-400000000 {
>                         opp-hz =3D /bits/ 64 <400000000>;
>                 };
> +
>                 opp-200000000 {
>                         opp-hz =3D /bits/ 64 <200000000>;
>                 };
> +
>                 opp-134000000 {
>                         opp-hz =3D /bits/ 64 <134000000>;
>                 };
> +
>                 opp-100000000 {
>                         opp-hz =3D /bits/ 64 <100000000>;
>                 };
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/ar=
m64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> index 681553577ebc..d6850c51db26 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> @@ -139,7 +139,7 @@ gpz1: gpz1-gpio-bank {
>
>         i2s0_bus: i2s0-bus-pins {
>                 samsung,pins =3D "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
> -                               "gpz0-4", "gpz0-5", "gpz0-6";
> +                              "gpz0-4", "gpz0-5", "gpz0-6";
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
>                 samsung,pin-drv =3D <EXYNOS5433_PIN_DRV_FAST_SR1>;
> @@ -572,16 +572,14 @@ hs_i2c9_bus: hs-i2c9-bus-pins {
>         };
>
>         i2s1_bus: i2s1-bus-pins {
> -               samsung,pins =3D "gpd4-0", "gpd4-1", "gpd4-2",
> -                               "gpd4-3", "gpd4-4";
> +               samsung,pins =3D "gpd4-0", "gpd4-1", "gpd4-2", "gpd4-3", =
"gpd4-4";
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
>                 samsung,pin-drv =3D <EXYNOS5433_PIN_DRV_FAST_SR1>;
>         };
>
>         pcm1_bus: pcm1-bus-pins {
> -               samsung,pins =3D "gpd4-0", "gpd4-1", "gpd4-2",
> -                               "gpd4-3", "gpd4-4";
> +               samsung,pins =3D "gpd4-0", "gpd4-1", "gpd4-2", "gpd4-3", =
"gpd4-4";
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
>                 samsung,pin-drv =3D <EXYNOS5433_PIN_DRV_FAST_SR1>;
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch=
/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index bc5ff66d8455..0ad02a098765 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -234,60 +234,60 @@ &bus_noc2 {
>
>  &cmu_aud {
>         assigned-clocks =3D <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
> -               <&cmu_aud CLK_MOUT_SCLK_AUD_I2S>,
> -               <&cmu_aud CLK_MOUT_SCLK_AUD_PCM>,
> -               <&cmu_top CLK_MOUT_AUD_PLL>,
> -               <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> -               <&cmu_top CLK_MOUT_SCLK_AUDIO0>,
> -               <&cmu_top CLK_MOUT_SCLK_AUDIO1>,
> -               <&cmu_top CLK_MOUT_SCLK_SPDIF>,
> +                         <&cmu_aud CLK_MOUT_SCLK_AUD_I2S>,
> +                         <&cmu_aud CLK_MOUT_SCLK_AUD_PCM>,
> +                         <&cmu_top CLK_MOUT_AUD_PLL>,
> +                         <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> +                         <&cmu_top CLK_MOUT_SCLK_AUDIO0>,
> +                         <&cmu_top CLK_MOUT_SCLK_AUDIO1>,
> +                         <&cmu_top CLK_MOUT_SCLK_SPDIF>,
>
> -               <&cmu_aud CLK_DIV_AUD_CA5>,
> -               <&cmu_aud CLK_DIV_ACLK_AUD>,
> -               <&cmu_aud CLK_DIV_PCLK_DBG_AUD>,
> -               <&cmu_aud CLK_DIV_SCLK_AUD_I2S>,
> -               <&cmu_aud CLK_DIV_SCLK_AUD_PCM>,
> -               <&cmu_aud CLK_DIV_SCLK_AUD_SLIMBUS>,
> -               <&cmu_aud CLK_DIV_SCLK_AUD_UART>,
> -               <&cmu_top CLK_DIV_SCLK_AUDIO0>,
> -               <&cmu_top CLK_DIV_SCLK_AUDIO1>,
> -               <&cmu_top CLK_DIV_SCLK_PCM1>,
> -               <&cmu_top CLK_DIV_SCLK_I2S1>;
> +                         <&cmu_aud CLK_DIV_AUD_CA5>,
> +                         <&cmu_aud CLK_DIV_ACLK_AUD>,
> +                         <&cmu_aud CLK_DIV_PCLK_DBG_AUD>,
> +                         <&cmu_aud CLK_DIV_SCLK_AUD_I2S>,
> +                         <&cmu_aud CLK_DIV_SCLK_AUD_PCM>,
> +                         <&cmu_aud CLK_DIV_SCLK_AUD_SLIMBUS>,
> +                         <&cmu_aud CLK_DIV_SCLK_AUD_UART>,
> +                         <&cmu_top CLK_DIV_SCLK_AUDIO0>,
> +                         <&cmu_top CLK_DIV_SCLK_AUDIO1>,
> +                         <&cmu_top CLK_DIV_SCLK_PCM1>,
> +                         <&cmu_top CLK_DIV_SCLK_I2S1>;
>
>         assigned-clock-parents =3D <&cmu_top CLK_FOUT_AUD_PLL>,
> -               <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
> -               <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
> -               <&cmu_top CLK_FOUT_AUD_PLL>,
> -               <&cmu_top CLK_MOUT_AUD_PLL>,
> -               <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> -               <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> -               <&cmu_top CLK_SCLK_AUDIO0>;
> +                                <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
> +                                <&cmu_aud CLK_MOUT_AUD_PLL_USER>,
> +                                <&cmu_top CLK_FOUT_AUD_PLL>,
> +                                <&cmu_top CLK_MOUT_AUD_PLL>,
> +                                <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> +                                <&cmu_top CLK_MOUT_AUD_PLL_USER_T>,
> +                                <&cmu_top CLK_SCLK_AUDIO0>;
>
>         assigned-clock-rates =3D <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
> -               <196608001>, <65536001>, <32768001>, <49152001>,
> -               <2048001>, <24576001>, <196608001>,
> -               <24576001>, <98304001>, <2048001>, <49152001>;
> +                              <196608001>, <65536001>, <32768001>, <4915=
2001>,
> +                              <2048001>, <24576001>, <196608001>,
> +                              <24576001>, <98304001>, <2048001>, <491520=
01>;
>  };
>
>  &cmu_fsys {
>         assigned-clocks =3D <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
> -               <&cmu_top CLK_MOUT_SCLK_USBHOST30>,
> -               <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
> -               <&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
> -               <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER=
>,
> -               <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_US=
ER>,
> -               <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>=
,
> -               <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_USE=
R>,
> -               <&cmu_top CLK_DIV_SCLK_USBDRD30>,
> -               <&cmu_top CLK_DIV_SCLK_USBHOST30>;
> +                         <&cmu_top CLK_MOUT_SCLK_USBHOST30>,
> +                         <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
> +                         <&cmu_fsys CLK_MOUT_SCLK_USBHOST30_USER>,
> +                         <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE=
_PCLK_USER>,
> +                         <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PI=
PE_PCLK_USER>,
> +                         <&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYC=
LOCK_USER>,
> +                         <&cmu_fsys CLK_MOUT_PHYCLK_USBHOST30_UHOST30_PH=
YCLOCK_USER>,
> +                         <&cmu_top CLK_DIV_SCLK_USBDRD30>,
> +                         <&cmu_top CLK_DIV_SCLK_USBHOST30>;
>         assigned-clock-parents =3D <&cmu_top CLK_MOUT_BUS_PLL_USER>,
> -               <&cmu_top CLK_MOUT_BUS_PLL_USER>,
> -               <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
> -               <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> -               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
> -               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY>,
> -               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>,
> -               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY>;
> +                                <&cmu_top CLK_MOUT_BUS_PLL_USER>,
> +                                <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
> +                                <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PI=
PE_PCLK_PHY>,
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PIPE_PCLK_PHY>,
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PH=
YCLOCK_PHY>,
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PHYCLOCK_PHY>;
>         assigned-clock-rates =3D <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
>                                <66700000>, <66700000>;
>  };
> @@ -347,6 +347,7 @@ ports {
>
>                 port@0 {
>                         reg =3D <0>;
> +
>                         tv_to_hdmi: endpoint {
>                                 remote-endpoint =3D <&hdmi_to_tv>;
>                         };
> @@ -386,6 +387,7 @@ ports {
>
>                 port@0 {
>                         reg =3D <0>;
> +
>                         hdmi_to_tv: endpoint {
>                                 remote-endpoint =3D <&tv_to_hdmi>;
>                         };
> @@ -393,6 +395,7 @@ hdmi_to_tv: endpoint {
>
>                 port@1 {
>                         reg =3D <1>;
> +
>                         hdmi_to_mhl: endpoint {
>                                 remote-endpoint =3D <&mhl_to_hdmi>;
>                         };
> @@ -416,8 +419,7 @@ pmic@66 {
>                 s2mps13_osc: clocks {
>                         compatible =3D "samsung,s2mps13-clk";
>                         #clock-cells =3D <1>;
> -                       clock-output-names =3D "s2mps13_ap", "s2mps13_cp"=
,
> -                               "s2mps13_bt";
> +                       clock-output-names =3D "s2mps13_ap", "s2mps13_cp"=
, "s2mps13_bt";
>                 };
>
>                 regulators {
> @@ -433,6 +435,7 @@ ldo2_reg: LDO2 {
>                                 regulator-min-microvolt =3D <2800000>;
>                                 regulator-max-microvolt =3D <2800000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -450,6 +453,7 @@ ldo4_reg: LDO4 {
>                                 regulator-min-microvolt =3D <1300000>;
>                                 regulator-max-microvolt =3D <1300000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -460,6 +464,7 @@ ldo5_reg: LDO5 {
>                                 regulator-min-microvolt =3D <1000000>;
>                                 regulator-max-microvolt =3D <1000000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -469,6 +474,7 @@ ldo6_reg: LDO6 {
>                                 regulator-name =3D "VDD10_MIPI2L_1.0V_AP"=
;
>                                 regulator-min-microvolt =3D <1000000>;
>                                 regulator-max-microvolt =3D <1000000>;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -479,6 +485,7 @@ ldo7_reg: LDO7 {
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -489,6 +496,7 @@ ldo8_reg: LDO8 {
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -499,6 +507,7 @@ ldo9_reg: LDO9 {
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -508,6 +517,7 @@ ldo10_reg: LDO10 {
>                                 regulator-name =3D "VDD33_USB30_3.0V_AP";
>                                 regulator-min-microvolt =3D <3000000>;
>                                 regulator-max-microvolt =3D <3000000>;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -518,6 +528,7 @@ ldo11_reg: LDO11 {
>                                 regulator-min-microvolt =3D <1000000>;
>                                 regulator-max-microvolt =3D <1000000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -535,6 +546,7 @@ ldo13_reg: LDO13 {
>                                 regulator-min-microvolt =3D <950000>;
>                                 regulator-max-microvolt =3D <950000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -545,6 +557,7 @@ ldo14_reg: LDO14 {
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <1200000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -555,6 +568,7 @@ ldo15_reg: LDO15 {
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <1200000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -721,6 +735,7 @@ buck1_reg: BUCK1 {
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1500000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -731,6 +746,7 @@ buck2_reg: BUCK2 {
>                                 regulator-min-microvolt =3D <900000>;
>                                 regulator-max-microvolt =3D <1300000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -741,6 +757,7 @@ buck3_reg: BUCK3 {
>                                 regulator-min-microvolt =3D <800000>;
>                                 regulator-max-microvolt =3D <1200000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -751,6 +768,7 @@ buck4_reg: BUCK4 {
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1500000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -761,6 +779,7 @@ buck5_reg: BUCK5 {
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1500000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -771,6 +790,7 @@ buck6_reg: BUCK6 {
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1500000>;
>                                 regulator-always-on;
> +
>                                 regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
> @@ -855,6 +875,7 @@ ports {
>
>                         port@0 {
>                                 reg =3D <0>;
> +
>                                 mhl_to_hdmi: endpoint {
>                                         remote-endpoint =3D <&hdmi_to_mhl=
>;
>                                 };
> @@ -862,6 +883,7 @@ mhl_to_hdmi: endpoint {
>
>                         port@1 {
>                                 reg =3D <1>;
> +
>                                 mhl_to_musb_con: endpoint {
>                                         remote-endpoint =3D <&musb_con_to=
_mhl>;
>                                 };
> @@ -906,6 +928,7 @@ port@0 {
>
>                                         port@3 {
>                                                 reg =3D <3>;
> +
>                                                 musb_con_to_mhl: endpoint=
 {
>                                                         remote-endpoint =
=3D <&mhl_to_musb_con>;
>                                                 };
> @@ -924,6 +947,7 @@ muic_to_usb: endpoint {
>
>                 regulators {
>                         compatible =3D "maxim,max77843-regulator";
> +
>                         safeout1_reg: SAFEOUT1 {
>                                 regulator-name =3D "SAFEOUT1";
>                                 regulator-min-microvolt =3D <3300000>;
> @@ -981,7 +1005,7 @@ &mshc_0 {
>         fifo-depth =3D <0x80>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
> -                       &sd0_bus8 &sd0_rdqs>;
> +                    &sd0_bus8 &sd0_rdqs>;
>         bus-width =3D <8>;
>         assigned-clocks =3D <&cmu_top CLK_SCLK_MMC0_FSYS>;
>         assigned-clock-rates =3D <800000000>;
> @@ -1304,7 +1328,7 @@ wm5110: audio-codec@0 {
>                 interrupt-parent =3D <&gpa0>;
>                 interrupts =3D <4 IRQ_TYPE_NONE>;
>                 clocks =3D <&pmu_system_controller 0>,
> -                       <&s2mps13_osc S2MPS11_CLK_BT>;
> +                        <&s2mps13_osc S2MPS11_CLK_BT>;
>                 clock-names =3D "mclk1", "mclk2";
>
>                 gpio-controller;
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/=
boot/dts/exynos/exynos5433-tmu.dtsi
> index 81b72393dd0d..57b335f579d8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> @@ -13,37 +13,44 @@ atlas0_thermal: atlas0-thermal {
>                 thermal-sensors =3D <&tmu_atlas0>;
>                 polling-delay-passive =3D <0>;
>                 polling-delay =3D <0>;
> +
>                 trips {
>                         atlas0_alert_0: atlas0-alert-0 {
>                                 temperature =3D <65000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_1: atlas0-alert-1 {
>                                 temperature =3D <70000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_2: atlas0-alert-2 {
>                                 temperature =3D <75000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_3: atlas0-alert-3 {
>                                 temperature =3D <80000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_4: atlas0-alert-4 {
>                                 temperature =3D <85000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_5: atlas0-alert-5 {
>                                 temperature =3D <90000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas0_alert_6: atlas0-alert-6 {
>                                 temperature =3D <95000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
> @@ -58,36 +65,42 @@ map0 {
>                                 cooling-device =3D <&cpu4 1 2>, <&cpu5 1 =
2>,
>                                                  <&cpu6 1 2>, <&cpu7 1 2>=
;
>                         };
> +
>                         map1 {
>                                 /* Set maximum frequency as 1700MHz  */
>                                 trip =3D <&atlas0_alert_1>;
>                                 cooling-device =3D <&cpu4 2 3>, <&cpu5 2 =
3>,
>                                                  <&cpu6 2 3>, <&cpu7 2 3>=
;
>                         };
> +
>                         map2 {
>                                 /* Set maximum frequency as 1600MHz  */
>                                 trip =3D <&atlas0_alert_2>;
>                                 cooling-device =3D <&cpu4 3 4>, <&cpu5 3 =
4>,
>                                                  <&cpu6 3 4>, <&cpu7 3 4>=
;
>                         };
> +
>                         map3 {
>                                 /* Set maximum frequency as 1500MHz  */
>                                 trip =3D <&atlas0_alert_3>;
>                                 cooling-device =3D <&cpu4 4 5>, <&cpu5 4 =
5>,
>                                                  <&cpu6 4 5>, <&cpu7 4 5>=
;
>                         };
> +
>                         map4 {
>                                 /* Set maximum frequency as 1400MHz  */
>                                 trip =3D <&atlas0_alert_4>;
>                                 cooling-device =3D <&cpu4 5 7>, <&cpu5 5 =
7>,
>                                                  <&cpu6 5 7>, <&cpu7 5 7>=
;
>                         };
> +
>                         map5 {
>                                 /* Set maximum frequencyas 1200MHz  */
>                                 trip =3D <&atlas0_alert_5>;
>                                 cooling-device =3D <&cpu4 7 9>, <&cpu5 7 =
9>,
>                                                  <&cpu6 7 9>, <&cpu7 7 9>=
;
>                         };
> +
>                         map6 {
>                                 /* Set maximum frequency as 1000MHz  */
>                                 trip =3D <&atlas0_alert_6>;
> @@ -101,37 +114,44 @@ atlas1_thermal: atlas1-thermal {
>                 thermal-sensors =3D <&tmu_atlas1>;
>                 polling-delay-passive =3D <0>;
>                 polling-delay =3D <0>;
> +
>                 trips {
>                         atlas1_alert_0: atlas1-alert-0 {
>                                 temperature =3D <65000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_1: atlas1-alert-1 {
>                                 temperature =3D <70000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_2: atlas1-alert-2 {
>                                 temperature =3D <75000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_3: atlas1-alert-3 {
>                                 temperature =3D <80000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_4: atlas1-alert-4 {
>                                 temperature =3D <85000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_5: atlas1-alert-5 {
>                                 temperature =3D <90000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         atlas1_alert_6: atlas1-alert-6 {
>                                 temperature =3D <95000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
> @@ -144,37 +164,44 @@ g3d_thermal: g3d-thermal {
>                 thermal-sensors =3D <&tmu_g3d>;
>                 polling-delay-passive =3D <0>;
>                 polling-delay =3D <0>;
> +
>                 trips {
>                         g3d_alert_0: g3d-alert-0 {
>                                 temperature =3D <70000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_1: g3d-alert-1 {
>                                 temperature =3D <75000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_2: g3d-alert-2 {
>                                 temperature =3D <80000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_3: g3d-alert-3 {
>                                 temperature =3D <85000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_4: g3d-alert-4 {
>                                 temperature =3D <90000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_5: g3d-alert-5 {
>                                 temperature =3D <95000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         g3d_alert_6: g3d-alert-6 {
>                                 temperature =3D <100000>; /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
> @@ -187,37 +214,44 @@ apollo_thermal: apollo-thermal {
>                 thermal-sensors =3D <&tmu_apollo>;
>                 polling-delay-passive =3D <0>;
>                 polling-delay =3D <0>;
> +
>                 trips {
>                         apollo_alert_0: apollo-alert-0 {
>                                 temperature =3D <65000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_1: apollo-alert-1 {
>                                 temperature =3D <70000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_2: apollo-alert-2 {
>                                 temperature =3D <75000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_3: apollo-alert-3 {
>                                 temperature =3D <80000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_4: apollo-alert-4 {
>                                 temperature =3D <85000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_5: apollo-alert-5 {
>                                 temperature =3D <90000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         apollo_alert_6: apollo-alert-6 {
>                                 temperature =3D <95000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
> @@ -232,24 +266,28 @@ map0 {
>                                 cooling-device =3D <&cpu0 1 2>, <&cpu1 1 =
2>,
>                                                  <&cpu2 1 2>, <&cpu3 1 2>=
;
>                         };
> +
>                         map1 {
>                                 /* Set maximum frequency as 1100MHz  */
>                                 trip =3D <&apollo_alert_3>;
>                                 cooling-device =3D <&cpu0 2 3>, <&cpu1 2 =
3>,
>                                                  <&cpu2 2 3>, <&cpu3 2 3>=
;
>                         };
> +
>                         map2 {
>                                 /* Set maximum frequency as 1000MHz  */
>                                 trip =3D <&apollo_alert_4>;
>                                 cooling-device =3D <&cpu0 3 4>, <&cpu1 3 =
4>,
>                                                  <&cpu2 3 4>, <&cpu3 3 4>=
;
>                         };
> +
>                         map3 {
>                                 /* Set maximum frequency as 900MHz  */
>                                 trip =3D <&apollo_alert_5>;
>                                 cooling-device =3D <&cpu0 4 5>, <&cpu1 4 =
5>,
>                                                  <&cpu2 4 5>, <&cpu3 4 5>=
;
>                         };
> +
>                         map4 {
>                                 /* Set maximum frequency as 800MHz  */
>                                 trip =3D <&apollo_alert_6>;
> @@ -263,37 +301,44 @@ isp_thermal: isp-thermal {
>                 thermal-sensors =3D <&tmu_isp>;
>                 polling-delay-passive =3D <0>;
>                 polling-delay =3D <0>;
> +
>                 trips {
>                         isp_alert_0: isp-alert-0 {
>                                 temperature =3D <80000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_1: isp-alert-1 {
>                                 temperature =3D <85000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_2: isp-alert-2 {
>                                 temperature =3D <90000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_3: isp-alert-3 {
>                                 temperature =3D <95000>;  /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_4: isp-alert-4 {
>                                 temperature =3D <100000>; /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_5: isp-alert-5 {
>                                 temperature =3D <105000>; /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
>                                 type =3D "active";
>                         };
> +
>                         isp_alert_6: isp-alert-6 {
>                                 temperature =3D <110000>; /* millicelsius=
 */
>                                 hysteresis =3D <1000>;    /* millicelsius=
 */
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index bc061b57caff..5fc3ca233ac6 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -57,12 +57,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -72,12 +75,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -243,38 +249,47 @@ opp-400000000 {
>                         opp-hz =3D /bits/ 64 <400000000>;
>                         opp-microvolt =3D <900000>;
>                 };
> +
>                 opp-500000000 {
>                         opp-hz =3D /bits/ 64 <500000000>;
>                         opp-microvolt =3D <925000>;
>                 };
> +
>                 opp-600000000 {
>                         opp-hz =3D /bits/ 64 <600000000>;
>                         opp-microvolt =3D <950000>;
>                 };
> +
>                 opp-700000000 {
>                         opp-hz =3D /bits/ 64 <700000000>;
>                         opp-microvolt =3D <975000>;
>                 };
> +
>                 opp-800000000 {
>                         opp-hz =3D /bits/ 64 <800000000>;
>                         opp-microvolt =3D <1000000>;
>                 };
> +
>                 opp-900000000 {
>                         opp-hz =3D /bits/ 64 <900000000>;
>                         opp-microvolt =3D <1050000>;
>                 };
> +
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <1075000>;
>                 };
> +
>                 opp-1100000000 {
>                         opp-hz =3D /bits/ 64 <1100000000>;
>                         opp-microvolt =3D <1112500>;
>                 };
> +
>                 opp-1200000000 {
>                         opp-hz =3D /bits/ 64 <1200000000>;
>                         opp-microvolt =3D <1112500>;
>                 };
> +
>                 opp-1300000000 {
>                         opp-hz =3D /bits/ 64 <1300000000>;
>                         opp-microvolt =3D <1150000>;
> @@ -289,58 +304,72 @@ opp-500000000 {
>                         opp-hz =3D /bits/ 64 <500000000>;
>                         opp-microvolt =3D <900000>;
>                 };
> +
>                 opp-600000000 {
>                         opp-hz =3D /bits/ 64 <600000000>;
>                         opp-microvolt =3D <900000>;
>                 };
> +
>                 opp-700000000 {
>                         opp-hz =3D /bits/ 64 <700000000>;
>                         opp-microvolt =3D <912500>;
>                 };
> +
>                 opp-800000000 {
>                         opp-hz =3D /bits/ 64 <800000000>;
>                         opp-microvolt =3D <912500>;
>                 };
> +
>                 opp-900000000 {
>                         opp-hz =3D /bits/ 64 <900000000>;
>                         opp-microvolt =3D <937500>;
>                 };
> +
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <975000>;
>                 };
> +
>                 opp-1100000000 {
>                         opp-hz =3D /bits/ 64 <1100000000>;
>                         opp-microvolt =3D <1012500>;
>                 };
> +
>                 opp-1200000000 {
>                         opp-hz =3D /bits/ 64 <1200000000>;
>                         opp-microvolt =3D <1037500>;
>                 };
> +
>                 opp-1300000000 {
>                         opp-hz =3D /bits/ 64 <1300000000>;
>                         opp-microvolt =3D <1062500>;
>                 };
> +
>                 opp-1400000000 {
>                         opp-hz =3D /bits/ 64 <1400000000>;
>                         opp-microvolt =3D <1087500>;
>                 };
> +
>                 opp-1500000000 {
>                         opp-hz =3D /bits/ 64 <1500000000>;
>                         opp-microvolt =3D <1125000>;
>                 };
> +
>                 opp-1600000000 {
>                         opp-hz =3D /bits/ 64 <1600000000>;
>                         opp-microvolt =3D <1137500>;
>                 };
> +
>                 opp-1700000000 {
>                         opp-hz =3D /bits/ 64 <1700000000>;
>                         opp-microvolt =3D <1175000>;
>                 };
> +
>                 opp-1800000000 {
>                         opp-hz =3D /bits/ 64 <1800000000>;
>                         opp-microvolt =3D <1212500>;
>                 };
> +
>                 opp-1900000000 {
>                         opp-hz =3D /bits/ 64 <1900000000>;
>                         opp-microvolt =3D <1262500>;
> @@ -752,7 +781,7 @@ tmu_atlas0: tmu@10060000 {
>                         reg =3D <0x10060000 0x200>;
>                         interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peris CLK_PCLK_TMU0_APBIF>,
> -                               <&cmu_peris CLK_SCLK_TMU0>;
> +                                <&cmu_peris CLK_SCLK_TMU0>;
>                         clock-names =3D "tmu_apbif", "tmu_sclk";
>                         #thermal-sensor-cells =3D <0>;
>
> @@ -764,7 +793,7 @@ tmu_atlas1: tmu@10068000 {
>                         reg =3D <0x10068000 0x200>;
>                         interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peris CLK_PCLK_TMU0_APBIF>,
> -                               <&cmu_peris CLK_SCLK_TMU0>;
> +                                <&cmu_peris CLK_SCLK_TMU0>;
>                         clock-names =3D "tmu_apbif", "tmu_sclk";
>                         #thermal-sensor-cells =3D <0>;
>
> @@ -776,7 +805,7 @@ tmu_g3d: tmu@10070000 {
>                         reg =3D <0x10070000 0x200>;
>                         interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peris CLK_PCLK_TMU1_APBIF>,
> -                               <&cmu_peris CLK_SCLK_TMU1>;
> +                                <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names =3D "tmu_apbif", "tmu_sclk";
>                         #thermal-sensor-cells =3D <0>;
>
> @@ -788,7 +817,7 @@ tmu_apollo: tmu@10078000 {
>                         reg =3D <0x10078000 0x200>;
>                         interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peris CLK_PCLK_TMU1_APBIF>,
> -                               <&cmu_peris CLK_SCLK_TMU1>;
> +                                <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names =3D "tmu_apbif", "tmu_sclk";
>                         #thermal-sensor-cells =3D <0>;
>
> @@ -800,7 +829,7 @@ tmu_isp: tmu@1007c000 {
>                         reg =3D <0x1007c000 0x200>;
>                         interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peris CLK_PCLK_TMU1_APBIF>,
> -                               <&cmu_peris CLK_SCLK_TMU1>;
> +                                <&cmu_peris CLK_SCLK_TMU1>;
>                         clock-names =3D "tmu_apbif", "tmu_sclk";
>                         #thermal-sensor-cells =3D <0>;
>
> @@ -812,17 +841,17 @@ timer@101c0000 {
>                                      "samsung,exynos4210-mct";
>                         reg =3D <0x101c0000 0x800>;
>                         interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&xxti>, <&cmu_peris CLK_PCLK_MCT>;
>                         clock-names =3D "fin_pll", "mct";
>                 };
> @@ -960,21 +989,21 @@ decon: decon@13800000 {
>                         compatible =3D "samsung,exynos5433-decon";
>                         reg =3D <0x13800000 0x2104>;
>                         clocks =3D <&cmu_disp CLK_PCLK_DECON>,
> -                               <&cmu_disp CLK_ACLK_DECON>,
> -                               <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
> -                               <&cmu_disp CLK_ACLK_XIU_DECON0X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
> -                               <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
> -                               <&cmu_disp CLK_ACLK_XIU_DECON1X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
> -                               <&cmu_disp CLK_SCLK_DECON_VCLK>,
> -                               <&cmu_disp CLK_SCLK_DECON_ECLK>,
> -                               <&cmu_disp CLK_SCLK_DSD>;
> +                                <&cmu_disp CLK_ACLK_DECON>,
> +                                <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
> +                                <&cmu_disp CLK_ACLK_XIU_DECON0X>,
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
> +                                <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
> +                                <&cmu_disp CLK_ACLK_XIU_DECON1X>,
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
> +                                <&cmu_disp CLK_SCLK_DECON_VCLK>,
> +                                <&cmu_disp CLK_SCLK_DECON_ECLK>,
> +                                <&cmu_disp CLK_SCLK_DSD>;
>                         clock-names =3D "pclk", "aclk_decon", "aclk_smmu_=
decon0x",
> -                               "aclk_xiu_decon0x", "pclk_smmu_decon0x",
> -                               "aclk_smmu_decon1x", "aclk_xiu_decon1x",
> -                               "pclk_smmu_decon1x", "sclk_decon_vclk",
> -                               "sclk_decon_eclk", "dsd";
> +                                     "aclk_xiu_decon0x", "pclk_smmu_deco=
n0x",
> +                                     "aclk_smmu_decon1x", "aclk_xiu_deco=
n1x",
> +                                     "pclk_smmu_decon1x", "sclk_decon_vc=
lk",
> +                                     "sclk_decon_eclk", "dsd";
>                         power-domains =3D <&pd_disp>;
>                         interrupt-names =3D "fifo", "vsync", "lcd_sys";
>                         interrupts =3D <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
> @@ -992,6 +1021,7 @@ ports {
>
>                                 port@0 {
>                                         reg =3D <0>;
> +
>                                         decon_to_mic: endpoint {
>                                                 remote-endpoint =3D
>                                                         <&mic_to_decon>;
> @@ -1038,15 +1068,15 @@ dsi: dsi@13900000 {
>                         phys =3D <&mipi_phy 1>;
>                         phy-names =3D "dsim";
>                         clocks =3D <&cmu_disp CLK_PCLK_DSIM0>,
> -                               <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV=
8>,
> -                               <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0=
>,
> -                               <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
> -                               <&cmu_disp CLK_SCLK_DSIM0>;
> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDI=
V8>,
> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC=
0>,
> +                                <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
> +                                <&cmu_disp CLK_SCLK_DSIM0>;
>                         clock-names =3D "bus_clk",
> -                                       "phyclk_mipidphy0_bitclkdiv8",
> -                                       "phyclk_mipidphy0_rxclkesc0",
> -                                       "sclk_rgb_vclk_to_dsim0",
> -                                       "sclk_mipi";
> +                                     "phyclk_mipidphy0_bitclkdiv8",
> +                                     "phyclk_mipidphy0_rxclkesc0",
> +                                     "sclk_rgb_vclk_to_dsim0",
> +                                     "sclk_mipi";
>                         power-domains =3D <&pd_disp>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
> @@ -1059,6 +1089,7 @@ ports {
>
>                                 port@0 {
>                                         reg =3D <0>;
> +
>                                         dsi_to_mic: endpoint {
>                                                 remote-endpoint =3D <&mic=
_to_dsi>;
>                                         };
> @@ -1070,7 +1101,7 @@ mic: mic@13930000 {
>                         compatible =3D "samsung,exynos5433-mic";
>                         reg =3D <0x13930000 0x48>;
>                         clocks =3D <&cmu_disp CLK_PCLK_MIC0>,
> -                               <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
> +                                <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
>                         clock-names =3D "pclk_mic0", "sclk_rgb_vclk_to_mi=
c0";
>                         power-domains =3D <&pd_disp>;
>                         samsung,disp-syscon =3D <&syscon_disp>;
> @@ -1083,6 +1114,7 @@ ports {
>
>                                 port@0 {
>                                         reg =3D <0>;
> +
>                                         mic_to_decon: endpoint {
>                                                 remote-endpoint =3D
>                                                         <&decon_to_mic>;
> @@ -1091,6 +1123,7 @@ mic_to_decon: endpoint {
>
>                                 port@1 {
>                                         reg =3D <1>;
> +
>                                         mic_to_dsi: endpoint {
>                                                 remote-endpoint =3D <&dsi=
_to_mic>;
>                                         };
> @@ -1103,19 +1136,19 @@ hdmi: hdmi@13970000 {
>                         reg =3D <0x13970000 0x70000>;
>                         interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_disp CLK_PCLK_HDMI>,
> -                               <&cmu_disp CLK_PCLK_HDMIPHY>,
> -                               <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
> -                               <&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
> -                               <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_P=
HY>,
> -                               <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_C=
LKO_USER>,
> -                               <&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_=
PHY>,
> -                               <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_=
CLKO_USER>,
> -                               <&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
> +                                <&cmu_disp CLK_PCLK_HDMIPHY>,
> +                                <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>=
,
> +                                <&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
> +                                <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_=
PHY>,
> +                                <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_=
CLKO_USER>,
> +                                <&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO=
_PHY>,
> +                                <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL=
_CLKO_USER>,
> +                                <&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>=
;
>                         clock-names =3D "hdmi_pclk", "hdmi_i_pclk",
> -                               "i_tmds_clk", "i_pixel_clk",
> -                               "tmds_clko", "tmds_clko_user",
> -                               "pixel_clko", "pixel_clko_user",
> -                               "oscclk", "i_spdif_clk";
> +                                     "i_tmds_clk", "i_pixel_clk",
> +                                     "tmds_clko", "tmds_clko_user",
> +                                     "pixel_clko", "pixel_clko_user",
> +                                     "oscclk", "i_spdif_clk";
>                         phy =3D <&hdmiphy>;
>                         ddc =3D <&hsi2c_11>;
>                         samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> @@ -1219,30 +1252,37 @@ opp-160000000 {
>                                         opp-hz =3D /bits/ 64 <160000000>;
>                                         opp-microvolt =3D <1000000>;
>                                 };
> +
>                                 opp-267000000 {
>                                         opp-hz =3D /bits/ 64 <267000000>;
>                                         opp-microvolt =3D <1000000>;
>                                 };
> +
>                                 opp-350000000 {
>                                         opp-hz =3D /bits/ 64 <350000000>;
>                                         opp-microvolt =3D <1025000>;
>                                 };
> +
>                                 opp-420000000 {
>                                         opp-hz =3D /bits/ 64 <420000000>;
>                                         opp-microvolt =3D <1025000>;
>                                 };
> +
>                                 opp-500000000 {
>                                         opp-hz =3D /bits/ 64 <500000000>;
>                                         opp-microvolt =3D <1075000>;
>                                 };
> +
>                                 opp-550000000 {
>                                         opp-hz =3D /bits/ 64 <550000000>;
>                                         opp-microvolt =3D <1125000>;
>                                 };
> +
>                                 opp-600000000 {
>                                         opp-hz =3D /bits/ 64 <600000000>;
>                                         opp-microvolt =3D <1150000>;
>                                 };
> +
>                                 opp-700000000 {
>                                         opp-hz =3D /bits/ 64 <700000000>;
>                                         opp-microvolt =3D <1150000>;
> @@ -1437,7 +1477,7 @@ serial_0: serial@14c10000 {
>                         reg =3D <0x14c10000 0x100>;
>                         interrupts =3D <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peric CLK_PCLK_UART0>,
> -                               <&cmu_peric CLK_SCLK_UART0>;
> +                                <&cmu_peric CLK_SCLK_UART0>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&uart0_bus>;
> @@ -1450,7 +1490,7 @@ serial_1: serial@14c20000 {
>                         reg =3D <0x14c20000 0x100>;
>                         interrupts =3D <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peric CLK_PCLK_UART1>,
> -                               <&cmu_peric CLK_SCLK_UART1>;
> +                                <&cmu_peric CLK_SCLK_UART1>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&uart1_bus>;
> @@ -1463,7 +1503,7 @@ serial_2: serial@14c30000 {
>                         reg =3D <0x14c30000 0x100>;
>                         interrupts =3D <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&cmu_peric CLK_PCLK_UART2>,
> -                               <&cmu_peric CLK_SCLK_UART2>;
> +                                <&cmu_peric CLK_SCLK_UART2>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&uart2_bus>;
> @@ -1480,8 +1520,8 @@ spi_0: spi@14d20000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&cmu_peric CLK_PCLK_SPI0>,
> -                               <&cmu_peric CLK_SCLK_SPI0>,
> -                               <&cmu_peric CLK_SCLK_IOCLK_SPI0>;
> +                                <&cmu_peric CLK_SCLK_SPI0>,
> +                                <&cmu_peric CLK_SCLK_IOCLK_SPI0>;
>                         clock-names =3D "spi", "spi_busclk0", "spi_ioclk"=
;
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -1501,8 +1541,8 @@ spi_1: spi@14d30000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&cmu_peric CLK_PCLK_SPI1>,
> -                               <&cmu_peric CLK_SCLK_SPI1>,
> -                               <&cmu_peric CLK_SCLK_IOCLK_SPI1>;
> +                                <&cmu_peric CLK_SCLK_SPI1>,
> +                                <&cmu_peric CLK_SCLK_IOCLK_SPI1>;
>                         clock-names =3D "spi", "spi_busclk0", "spi_ioclk"=
;
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -1522,8 +1562,8 @@ spi_2: spi@14d40000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&cmu_peric CLK_PCLK_SPI2>,
> -                               <&cmu_peric CLK_SCLK_SPI2>,
> -                               <&cmu_peric CLK_SCLK_IOCLK_SPI2>;
> +                                <&cmu_peric CLK_SCLK_SPI2>,
> +                                <&cmu_peric CLK_SCLK_IOCLK_SPI2>;
>                         clock-names =3D "spi", "spi_busclk0", "spi_ioclk"=
;
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -1543,8 +1583,8 @@ spi_3: spi@14d50000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&cmu_peric CLK_PCLK_SPI3>,
> -                               <&cmu_peric CLK_SCLK_SPI3>,
> -                               <&cmu_peric CLK_SCLK_IOCLK_SPI3>;
> +                                <&cmu_peric CLK_SCLK_SPI3>,
> +                                <&cmu_peric CLK_SCLK_IOCLK_SPI3>;
>                         clock-names =3D "spi", "spi_busclk0", "spi_ioclk"=
;
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -1564,8 +1604,8 @@ spi_4: spi@14d00000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&cmu_peric CLK_PCLK_SPI4>,
> -                               <&cmu_peric CLK_SCLK_SPI4>,
> -                               <&cmu_peric CLK_SCLK_IOCLK_SPI4>;
> +                                <&cmu_peric CLK_SCLK_SPI4>,
> +                                <&cmu_peric CLK_SCLK_IOCLK_SPI4>;
>                         clock-names =3D "spi", "spi_busclk0", "spi_ioclk"=
;
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -1802,9 +1842,9 @@ hsi2c_11: i2c@14df0000 {
>                 usbdrd30: usb@15400000 {
>                         compatible =3D "samsung,exynos5433-dwusb3";
>                         clocks =3D <&cmu_fsys CLK_ACLK_USBDRD30>,
> -                               <&cmu_fsys CLK_SCLK_USBDRD30>,
> -                               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHY=
CLOCK>,
> -                               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIP=
E_PCLK>;
> +                                <&cmu_fsys CLK_SCLK_USBDRD30>,
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PH=
YCLOCK>,
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PI=
PE_PCLK>;
>                         clock-names =3D "aclk", "susp_clk", "phyclk", "pi=
pe_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -1815,8 +1855,8 @@ usbdrd30: usb@15400000 {
>                         usbdrd_dwc3: usb@0 {
>                                 compatible =3D "snps,dwc3";
>                                 clocks =3D <&cmu_fsys CLK_SCLK_USBDRD30>,
> -                                       <&cmu_fsys CLK_ACLK_USBDRD30>,
> -                                       <&cmu_fsys CLK_SCLK_USBDRD30>;
> +                                        <&cmu_fsys CLK_ACLK_USBDRD30>,
> +                                        <&cmu_fsys CLK_SCLK_USBDRD30>;
>                                 clock-names =3D "ref", "bus_early", "susp=
end";
>                                 reg =3D <0x0 0x10000>;
>                                 interrupts =3D <GIC_SPI 231 IRQ_TYPE_LEVE=
L_HIGH>;
> @@ -1829,11 +1869,10 @@ usbdrd30_phy: phy@15500000 {
>                         compatible =3D "samsung,exynos5433-usbdrd-phy";
>                         reg =3D <0x15500000 0x100>;
>                         clocks =3D <&cmu_fsys CLK_ACLK_USBDRD30>, <&xxti>=
,
> -                               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHY=
CLOCK>,
> -                               <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIP=
E_PCLK>,
> -                               <&cmu_fsys CLK_SCLK_USBDRD30>;
> -                       clock-names =3D "phy", "ref", "phy_utmi", "phy_pi=
pe",
> -                                       "itp";
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PH=
YCLOCK>,
> +                                <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PI=
PE_PCLK>,
> +                                <&cmu_fsys CLK_SCLK_USBDRD30>;
> +                       clock-names =3D "phy", "ref", "phy_utmi", "phy_pi=
pe", "itp";
>                         #phy-cells =3D <1>;
>                         samsung,pmu-syscon =3D <&pmu_system_controller>;
>
> @@ -1844,11 +1883,10 @@ usbhost30_phy: phy@15580000 {
>                         compatible =3D "samsung,exynos5433-usbdrd-phy";
>                         reg =3D <0x15580000 0x100>;
>                         clocks =3D <&cmu_fsys CLK_ACLK_USBHOST30>, <&xxti=
>,
> -                               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_P=
HYCLOCK>,
> -                               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_P=
IPE_PCLK>,
> -                               <&cmu_fsys CLK_SCLK_USBHOST30>;
> -                       clock-names =3D "phy", "ref", "phy_utmi", "phy_pi=
pe",
> -                                       "itp";
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PHYCLOCK>,
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PIPE_PCLK>,
> +                                <&cmu_fsys CLK_SCLK_USBHOST30>;
> +                       clock-names =3D "phy", "ref", "phy_utmi", "phy_pi=
pe", "itp";
>                         #phy-cells =3D <1>;
>                         samsung,pmu-syscon =3D <&pmu_system_controller>;
>
> @@ -1858,9 +1896,9 @@ usbhost30_phy: phy@15580000 {
>                 usbhost30: usb@15a00000 {
>                         compatible =3D "samsung,exynos5433-dwusb3";
>                         clocks =3D <&cmu_fsys CLK_ACLK_USBHOST30>,
> -                               <&cmu_fsys CLK_SCLK_USBHOST30>,
> -                               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_P=
HYCLOCK>,
> -                               <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_P=
IPE_PCLK>;
> +                                <&cmu_fsys CLK_SCLK_USBHOST30>,
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PHYCLOCK>,
> +                                <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_=
PIPE_PCLK>;
>                         clock-names =3D "aclk", "susp_clk", "phyclk", "pi=
pe_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -1871,8 +1909,8 @@ usbhost30: usb@15a00000 {
>                         usbhost_dwc3: usb@0 {
>                                 compatible =3D "snps,dwc3";
>                                 clocks =3D <&cmu_fsys CLK_SCLK_USBHOST30>=
,
> -                                       <&cmu_fsys CLK_ACLK_USBHOST30>,
> -                                       <&cmu_fsys CLK_SCLK_USBHOST30>;
> +                                        <&cmu_fsys CLK_ACLK_USBHOST30>,
> +                                        <&cmu_fsys CLK_SCLK_USBHOST30>;
>                                 clock-names =3D "ref", "bus_early", "susp=
end";
>                                 reg =3D <0x0 0x10000>;
>                                 interrupts =3D <GIC_SPI 244 IRQ_TYPE_LEVE=
L_HIGH>;
> @@ -1889,7 +1927,7 @@ mshc_0: mmc@15540000 {
>                         #size-cells =3D <0>;
>                         reg =3D <0x15540000 0x2000>;
>                         clocks =3D <&cmu_fsys CLK_ACLK_MMC0>,
> -                               <&cmu_fsys CLK_SCLK_MMC0>;
> +                                <&cmu_fsys CLK_SCLK_MMC0>;
>                         clock-names =3D "biu", "ciu";
>                         fifo-depth =3D <0x40>;
>
> @@ -1904,7 +1942,7 @@ mshc_1: mmc@15550000 {
>                         #size-cells =3D <0>;
>                         reg =3D <0x15550000 0x2000>;
>                         clocks =3D <&cmu_fsys CLK_ACLK_MMC1>,
> -                               <&cmu_fsys CLK_SCLK_MMC1>;
> +                                <&cmu_fsys CLK_SCLK_MMC1>;
>                         clock-names =3D "biu", "ciu";
>                         fifo-depth =3D <0x40>;
>
> @@ -1919,7 +1957,7 @@ mshc_2: mmc@15560000 {
>                         #size-cells =3D <0>;
>                         reg =3D <0x15560000 0x2000>;
>                         clocks =3D <&cmu_fsys CLK_ACLK_MMC2>,
> -                               <&cmu_fsys CLK_SCLK_MMC2>;
> +                                <&cmu_fsys CLK_SCLK_MMC2>;
>                         clock-names =3D "biu", "ciu";
>                         fifo-depth =3D <0x40>;
>
> @@ -1974,8 +2012,8 @@ i2s0: i2s@11440000 {
>                                 #address-cells =3D <1>;
>                                 #size-cells =3D <0>;
>                                 clocks =3D <&cmu_aud CLK_PCLK_AUD_I2S>,
> -                                       <&cmu_aud CLK_SCLK_AUD_I2S>,
> -                                       <&cmu_aud CLK_SCLK_I2S_BCLK>;
> +                                        <&cmu_aud CLK_SCLK_AUD_I2S>,
> +                                        <&cmu_aud CLK_SCLK_I2S_BCLK>;
>                                 clock-names =3D "iis", "i2s_opclk0", "i2s=
_opclk1";
>                                 #clock-cells =3D <1>;
>                                 pinctrl-names =3D "default";
> @@ -1991,7 +2029,7 @@ serial_3: serial@11460000 {
>                                 reg =3D <0x11460000 0x100>;
>                                 interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 clocks =3D <&cmu_aud CLK_PCLK_AUD_UART>,
> -                                       <&cmu_aud CLK_SCLK_AUD_UART>;
> +                                        <&cmu_aud CLK_SCLK_AUD_UART>;
>                                 clock-names =3D "uart", "clk_uart_baud0";
>                                 pinctrl-names =3D "default";
>                                 pinctrl-0 =3D <&uart_aud_bus>;
> @@ -2037,14 +2075,10 @@ pcie: pcie@15700000 {
>
>         timer: timer {
>                 compatible =3D "arm,armv8-timer";
> -               interrupts =3D <GIC_PPI 13
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
HIGH)>,
> -                       <GIC_PPI 14
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
HIGH)>,
> -                       <GIC_PPI 11
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
HIGH)>,
> -                       <GIC_PPI 10
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
HIGH)>;
> +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_HIGH)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_HIGH)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_HIGH)>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64=
/boot/dts/exynos/exynos7-espresso.dts
> index c8925f4076b5..b3d5b447aeb6 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> @@ -99,8 +99,7 @@ pmic@66 {
>                 s2mps15_osc: clocks {
>                         compatible =3D "samsung,s2mps13-clk";
>                         #clock-cells =3D <1>;
> -                       clock-output-names =3D "s2mps13_ap", "s2mps13_cp"=
,
> -                               "s2mps13_bt";
> +                       clock-output-names =3D "s2mps13_ap", "s2mps13_cp"=
, "s2mps13_bt";
>                 };
>
>                 regulators {
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi b/arch/a=
rm64/boot/dts/exynos/exynos7-trip-points.dtsi
> index d3301b8bd364..ecae9550801c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
> @@ -12,36 +12,43 @@ cpu-alert-0 {
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-1 {
>                 temperature =3D <80000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-2 {
>                 temperature =3D <85000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-3 {
>                 temperature =3D <90000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-4 {
>                 temperature =3D <95000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-5 {
>                 temperature =3D <100000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-alert-6 {
>                 temperature =3D <110000>; /* millicelsius */
>                 hysteresis =3D <10000>; /* millicelsius */
>                 type =3D "passive";
>         };
> +
>         cpu-crit-0 {
>                 temperature =3D <115000>; /* millicelsius */
>                 hysteresis =3D <0>; /* millicelsius */
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos7.dtsi
> index fa4e7d678423..a722d721a7c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -670,13 +670,13 @@ tmuctrl_0: tmu@10060000 {
>                 ufs: ufs@15570000 {
>                         compatible =3D "samsung,exynos7-ufs";
>                         reg =3D <0x15570000 0x100>,  /* 0: HCI standard *=
/
> -                               <0x15570100 0x100>,  /* 1: Vendor specifi=
ced */
> -                               <0x15571000 0x200>,  /* 2: UNIPRO */
> -                               <0x15572000 0x300>;  /* 3: UFS protector =
*/
> +                             <0x15570100 0x100>,  /* 1: Vendor specifice=
d */
> +                             <0x15571000 0x200>,  /* 2: UNIPRO */
> +                             <0x15572000 0x300>;  /* 3: UFS protector */
>                         reg-names =3D "hci", "vs_hci", "unipro", "ufsp";
>                         interrupts =3D <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&clock_fsys1 ACLK_UFS20_LINK>,
> -                               <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
> +                                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
>                         clock-names =3D "core_clk", "sclk_unipro_main";
>                         freq-table-hz =3D <0 0>, <0 0>;
>                         pinctrl-names =3D "default";
> @@ -706,10 +706,10 @@ usbdrd_phy: phy@15500000 {
>                         compatible =3D "samsung,exynos7-usbdrd-phy";
>                         reg =3D <0x15500000 0x100>;
>                         clocks =3D <&clock_fsys0 ACLK_USBDRD300>,
> -                              <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>=
,
> -                              <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYC=
LK_USER>,
> -                              <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE=
_PCLK_USER>,
> -                              <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
> +                                <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PH=
Y>,
> +                                <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PH=
YCLK_USER>,
> +                                <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PI=
PE_PCLK_USER>,
> +                                <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
>                         clock-names =3D "phy", "ref", "phy_utmi", "phy_pi=
pe", "itp";
>                         samsung,pmu-syscon =3D <&pmu_system_controller>;
>                         #phy-cells =3D <1>;
> @@ -718,10 +718,10 @@ usbdrd_phy: phy@15500000 {
>                 usbdrd: usb@15400000 {
>                         compatible =3D "samsung,exynos7-dwusb3";
>                         clocks =3D <&clock_fsys0 ACLK_USBDRD300>,
> -                              <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
> -                              <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0X>=
;
> +                                <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>=
,
> +                                <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0=
X>;
>                         clock-names =3D "usbdrd30", "usbdrd30_susp_clk",
> -                               "usbdrd30_axius_clk";
> +                                     "usbdrd30_axius_clk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         ranges =3D <0x0 0x15400000 0x10000>;
> @@ -747,14 +747,10 @@ atlas_thermal: cluster0-thermal {
>
>         timer {
>                 compatible =3D "arm,armv8-timer";
> -               interrupts =3D <GIC_PPI 13
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
LOW)>,
> -                            <GIC_PPI 14
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
LOW)>,
> -                            <GIC_PPI 11
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
LOW)>,
> -                            <GIC_PPI 10
> -                               (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_=
LOW)>;
> +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64=
/boot/dts/exynos/exynos7870-j6lte.dts
> index de30d0970336..02bab3ab2711 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> @@ -398,8 +398,8 @@ accelerometer@1d {
>                 pinctrl-0 =3D <&accel_irq>;
>
>                 mount-matrix =3D "-1", "0",  "0",
> -                               "0", "1",  "0",
> -                               "0", "0", "-1";
> +                              "0", "1",  "0",
> +                              "0", "0", "-1";
>
>                 st,drdy-int-pin =3D <1>;
>         };
> diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot=
/dts/exynos/exynos7870.dtsi
> index 19f9ae783587..9e3ec6c952f0 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
> @@ -36,12 +36,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -51,12 +54,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -201,8 +207,7 @@ gic: interrupt-controller@104e1000 {
>                               <0x104e2000 0x1000>,
>                               <0x104e4000 0x2000>,
>                               <0x104e6000 0x2000>;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <3>;
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot=
/dts/exynos/exynos7885.dtsi
> index 7d7d56206b86..6b994b487107 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> @@ -56,18 +56,23 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> +
>                                 core4 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core5 {
>                                         cpu =3D <&cpu5>;
>                                 };
> @@ -77,6 +82,7 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -186,8 +192,7 @@ gic: interrupt-controller@12301000 {
>                               <0x12302000 0x2000>,
>                               <0x12304000 0x2000>,
>                               <0x12306000 0x2000>;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
>                 cmu_peri: clock-controller@10010000 {
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm=
64/boot/dts/exynos/exynos850-pinctrl.dtsi
> index 424bc80bde68..e3f1ae8dedbf 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> @@ -509,6 +509,7 @@ gpp0: gpp0-gpio-bank {
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>         };
> +
>         gpp1: gpp1-gpio-bank {
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 8abf7c9eac9e..911643008b9f 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -61,12 +61,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -76,12 +79,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -96,24 +102,28 @@ cpu0: cpu@0 {
>                         clocks =3D <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
>                         clock-names =3D "cluster0_clk";
>                 };
> +
>                 cpu1: cpu@1 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x1>;
>                         enable-method =3D "psci";
>                 };
> +
>                 cpu2: cpu@2 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x2>;
>                         enable-method =3D "psci";
>                 };
> +
>                 cpu3: cpu@3 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x3>;
>                         enable-method =3D "psci";
>                 };
> +
>                 cpu4: cpu@100 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
> @@ -122,18 +132,21 @@ cpu4: cpu@100 {
>                         clocks =3D <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
>                         clock-names =3D "cluster1_clk";
>                 };
> +
>                 cpu5: cpu@101 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x101>;
>                         enable-method =3D "psci";
>                 };
> +
>                 cpu6: cpu@102 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x102>;
>                         enable-method =3D "psci";
>                 };
> +
>                 cpu7: cpu@103 {
>                         device_type =3D "cpu";
>                         compatible =3D "arm,cortex-a55";
> @@ -207,8 +220,7 @@ gic: interrupt-controller@12a01000 {
>                               <0x12a04000 0x2000>,
>                               <0x12a06000 0x2000>;
>                         interrupt-controller;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
>                 pmu_system_controller: system-controller@11860000 {
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8855.dtsi
> index 9d82fceb5130..0333b80eba84 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -42,12 +42,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -57,9 +60,11 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8895.dtsi
> index e3b6d37aac09..a9a6f6970d71 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -35,12 +35,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -50,12 +53,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -207,8 +213,7 @@ gic: interrupt-controller@10201000 {
>                               <0x10206000 0x2000>;
>                         #interrupt-cells =3D <3>;
>                         interrupt-controller;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                         #address-cells =3D <0>;
>                         #size-cells =3D <1>;
>                 };
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810.dtsi b/arch/arm64/boot=
/dts/exynos/exynos9810.dtsi
> index 01eba31f7ca3..4f1f1e9a41b2 100644
> --- a/arch/arm64/boot/dts/exynos/exynos9810.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos9810.dtsi
> @@ -36,12 +36,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -51,12 +54,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -179,8 +185,7 @@ gic: interrupt-controller@10101000 {
>                               <0x10106000 0x2000>;
>                         #interrupt-cells =3D <3>;
>                         interrupt-controller;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                         #address-cells =3D <0>;
>                         #size-cells =3D <1>;
>                 };
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/=
dts/exynos/exynos990.dtsi
> index c15ccaff2666..8115d581b173 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -243,8 +243,7 @@ gic: interrupt-controller@10101000 {
>                               <0x10106000 0x2000>;
>                         #interrupt-cells =3D <3>;
>                         interrupt-controller;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                         #address-cells =3D <0>;
>                         #size-cells =3D <1>;
>                 };
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynosautov9.dtsi
> index 94f8d1c47676..9c140ca261a2 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -51,12 +51,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -66,12 +69,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -338,8 +344,7 @@ gic: interrupt-controller@10101000 {
>                               <0x10102000 0x2000>,
>                               <0x10104000 0x2000>,
>                               <0x10106000 0x2000>;
> -                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 |
> -                                                IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
>                 pdma0: dma-controller@1b2e0000 {
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/=
boot/dts/exynos/exynosautov920.dtsi
> index f42207bdc701..399b56b4dbdd 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -48,12 +48,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -63,12 +66,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -78,6 +84,7 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpu8>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu9>;
>                                 };
>
> --
> 2.53.0
>
