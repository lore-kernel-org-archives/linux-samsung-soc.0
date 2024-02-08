Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C1A74E29
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396085; cv=none; b=a78OeUPhTR6KGZlnaL713FTjVd1ZsXBw/Wjl3qxk7jcyLrqeOnVgYY4AAhZHOxDPoHbgd6yWTXyuhnwx3AZ5/wpFluC0aLclryUVwu0JfoDqL9V2Kps7QsW8a1ojvemchFTjddxhQyK+i1QS53gP3DBLY3xFQTlNbL/qJ2kue9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396085; c=relaxed/simple;
	bh=qDk7UEWrlqaGwCuD8ABX2X5AjVW+Rcn6ztsH2olqobc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIAP7+m/4vwrtsFFeNJNjVmRzPPI3ARnDYqpdQfH2UiKVQIV+76JjQdd7yzJS6ugf63I72MaYKOHQZ7L5ozzdpSeCY/FtJ8a97WYUUmmVnFsEXRCCY655q5L5KLj9Kv4gvoDIJOwDQ6bfmbjK8a8K/9+KnMLnpAp030F91C9cc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uassgZjt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uassgZjt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-296c2b74448so1221293a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707396082; x=1708000882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Py4LQQCjOD+63xICQgoe8LGjtYSfgfgYUdsYohF9IsI=;
        b=uassgZjtbWN7S7eEJl7Oc7Wk+gn19vhaaInRkry38+Qqvp2nZSgOWtERJtdusd7mfC
         5KV829x0o3/qdAGOlVolWRwoZNJksuOygT5XAiU67evpnqAO5nkiC6w3JqEb9IWlqmns
         jmYFsMEfqiDgM484LEaokB+Bo49/nO1sgx3e33HNmR0RTizGxtIDQR7SfuPBHVQ8XPMv
         RZfYO7QJE3DeR/+la0EhNb+yzXz9RaJKUBKQ+HGvtrdfOIm5vWQ5+Juohjr1vHUUQ5f2
         s+53DCPEJDmrZJinscCJHq+d/jighw4oE6xka2tTmtODdEbE4YwmSEiP+sz6a3AoCH9P
         CLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396082; x=1708000882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Py4LQQCjOD+63xICQgoe8LGjtYSfgfgYUdsYohF9IsI=;
        b=JtFlv5aGmQTbJqrgaSMx2eNeTn1lGs1ZYseKsLUyAK0TdRL8K16wTH/ozdP017K/lQ
         kFw+Nv0D0KVk9oj2ylwZOwAvD2xJW/q5YWkQhOG5Ss8HEemRCuey30P0CZIR1E+fHTTg
         F80V9z4Ga06nKW4jzUoeZvto9KovBd8TTkIfKlQBmAadks5i0kVyzK+gw8SG4nxAt0Hn
         zYY8FYsrD90k+vHGN4VKWvnhf9fxPCQz78mkqgWIEx8GKJVR5kXWkm3fQ71bhPNYai+/
         IPy5JuvpfwoAfyE3MrjZZ+BiTu17OkUtbzuljUlrxFH5k9cMPW3z14RciGDx2LCDnXdv
         JAbw==
X-Gm-Message-State: AOJu0Yxr44WgHxi9HnU94M6bohtTQadJ+lhpfqAQFQAj75IYMJbufNyV
	+vG8e+xvLDe+KyTWn3KLxOb8TGcL67adQFxjrssk5HKZnxqRYQADf6T5cWRNhE8ASOZVxxyONit
	Ya4/4hCA2kyh6kgEZh8+58lKV+AyZzaVpe8nW4Q==
X-Google-Smtp-Source: AGHT+IFTVbn9MROnjZ4NEuMlDyJg8O7OWSiIXi5sJ9EP3ohJj7o0qEJihfhAu8IXeI2TFNlGpHudI04RAgjFiq2t5+0=
X-Received: by 2002:a17:90a:fb87:b0:290:7739:b886 with SMTP id
 cp7-20020a17090afb8700b002907739b886mr5369282pjb.29.1707396081873; Thu, 08
 Feb 2024 04:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208105243.128875-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208105243.128875-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 8 Feb 2024 06:41:10 -0600
Message-ID: <CAPLW+4n5LqENFgUZYDb2rF+Db59Ry4tdAfKLiL-W-ZG6mP=kjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: gs101: minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 4:55=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space before '{' and
> around '=3D' characters.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../boot/dts/exynos/google/gs101-pinctrl.dtsi    |  2 +-
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi     | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi b/arch/=
arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
> index e6a9776d4d62..a675f822acec 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
> @@ -251,7 +251,7 @@ gph1: gph1-gpio-bank {
>                 #interrupt-cells =3D <2>;
>         };
>
> -       pcie0_clkreq: pcie0-clkreq-pins{
> +       pcie0_clkreq: pcie0-clkreq-pins {
>                 samsung,pins =3D "gph0-1";
>                 samsung,pin-function =3D <GS101_PIN_FUNC_2>;
>                 samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index c7a9e81d23b9..80cc933cca3d 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -73,7 +73,7 @@ cpu0: cpu@0 {
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x0000>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ANANKE_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <250>;
>                         dynamic-power-coefficient =3D <70>;
>                 };
> @@ -83,7 +83,7 @@ cpu1: cpu@100 {
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x0100>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ANANKE_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <250>;
>                         dynamic-power-coefficient =3D <70>;
>                 };
> @@ -93,7 +93,7 @@ cpu2: cpu@200 {
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x0200>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ANANKE_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <250>;
>                         dynamic-power-coefficient =3D <70>;
>                 };
> @@ -103,7 +103,7 @@ cpu3: cpu@300 {
>                         compatible =3D "arm,cortex-a55";
>                         reg =3D <0x0300>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ANANKE_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <250>;
>                         dynamic-power-coefficient =3D <70>;
>                 };
> @@ -113,7 +113,7 @@ cpu4: cpu@400 {
>                         compatible =3D "arm,cortex-a76";
>                         reg =3D <0x0400>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ENYO_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <620>;
>                         dynamic-power-coefficient =3D <284>;
>                 };
> @@ -123,7 +123,7 @@ cpu5: cpu@500 {
>                         compatible =3D "arm,cortex-a76";
>                         reg =3D <0x0500>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&ENYO_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <620>;
>                         dynamic-power-coefficient =3D <284>;
>                 };
> @@ -133,7 +133,7 @@ cpu6: cpu@600 {
>                         compatible =3D "arm,cortex-x1";
>                         reg =3D <0x0600>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&HERA_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <1024>;
>                         dynamic-power-coefficient =3D <650>;
>                 };
> @@ -143,7 +143,7 @@ cpu7: cpu@700 {
>                         compatible =3D "arm,cortex-x1";
>                         reg =3D <0x0700>;
>                         enable-method =3D "psci";
> -                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       cpu-idle-states =3D <&HERA_CPU_SLEEP>;
>                         capacity-dmips-mhz =3D <1024>;
>                         dynamic-power-coefficient =3D <650>;
>                 };
> --
> 2.34.1
>
>
