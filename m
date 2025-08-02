Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED4171D2
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Aug 2025 00:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754094564; cv=none; b=TWcUsMmaUGGyNzrEd3AGw69A6OUU9BeJAbwfyez45UUA/m93xjBDuE6gBDLeNVPdoTMzcjkYq3mdOzsiD4VTC8qe0LAjfgE9qd1qpg4tMOO9+iFNck9n+iDA6YVLrrO+TXVifr6rFBjFi3DX8hL9UX0zspCgJag08EqcsV3eZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754094564; c=relaxed/simple;
	bh=/e3HiXOOhmzJYdmEluxt28mSjbsOiXAfIZ5KId+BGtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfF8oJc30wPRa4nVop8eYE7ZCljSyt8evFQ/HDOVGVX0HUQpMvTLOnRFzSmK2lIqnnhxfq9KGfQjGSNgdkGHLTIVUakz76jvM2l7JqaaH09Rsi0ZjSRKt9Rl1jTcfvuH9egLXGug5ujRz0SXh4y2xqyc0L1PyEnRBLoDYmDDqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFz66w5k; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFz66w5k"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8dfa190de4so1997642276.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754094561; x=1754699361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ukSKhmtxKEyX7FOOTcTRSkRm/xtlj9BuhhycLdVw0=;
        b=DFz66w5k0qUmNTadhV4g0/lKF++F8G2fPKsYyWmgsWy59GYENDqOus397dwEKeDtWq
         WTgkiHHzQwgerX/kippvJnQE8syFnRfduooO5YE1FWnd4+FokY2JoHaFeakDqiDRv2Kl
         PV8FrEvrYTOkIo4XAoyHlnOubUsbMGkyoeqGrcj1JxRsnFbgYbiYrBckDCP60RQ3Ziq4
         D/B5Zdn0S2/sJj/Yaka5RfBAdHDGFFDAu0pKAjKqp3hFmnAlrza4OXcuvSd6AbYxmuMD
         Iw2mlYZiiV+3nVKJZAk7rmKrniXZUJx5KRel/6++6Xe9nRrffySm9kkXobU9CBvFzSHw
         jRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754094561; x=1754699361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ukSKhmtxKEyX7FOOTcTRSkRm/xtlj9BuhhycLdVw0=;
        b=BqJ0ALj9R4UI27rIALfUqUtnGYejq6aBFYZPnWZVWRtb9xulPtywlsHMG4okcMYV3h
         cnwEsC5zkun5JGySnqLF4KLh1LUAOR+/yjnfPFrF++XWU17W3mSQr5iO3Qbys6axRRE9
         24M2VNprQ3jZ40/v8yqFFi/9EmuVEBMyHwNOcw6SUuaI4cgeZroE+pH5zKLST7q02kXZ
         qHMW29XOC2mxEtwtP8OtYFIIyR/Z47wxpyIjJcTfxm+um8R+v/jbvdyUmaScr6jxM/tk
         0GtgW6fC917bJz+C2l2CnuNjZRzHiU7tDDjuqzkWcs6fUGHEccqhSugi7UiAuKvMpjKl
         eN6w==
X-Forwarded-Encrypted: i=1; AJvYcCX3EgSaEF/2EVHRsp7o3FxWpsKdGBJi1nX1yW69m1LXCbvCjPwok/pq47vaALxE77Zca0BK6o1rO2qMTpNZRoYKPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLfaiMCO++iC8GOxVmnaLFqVX0ptUY7wd7Ocjp+ZB3xzVyf5F
	6tcIlngUvxmP+B24A9lLm+kdgBOZ7eBORF26h4gm3uHsu214W9hGBJXb+BgpGAQidRY+zCStCNI
	/gxO2fjfqCAioRmxVc3UMNqQ6zzZpdrBu+CTOIb6ILZQoqODcpptY3NXiHQ==
X-Gm-Gg: ASbGncu7gDLkJc04dJlWudIgltauaNpcRaDJ6JN6omU6G+YQtlLAscafpLo+D52mf8e
	OhcVA+WxL8/qxPr5PCuxE5Kkk3zoKM1r/jutDMEp9AgB68WZquphRK5eIKM2Fj/7PQmBqLXLCw2
	3vFrOrvtuq6pFloosFuuQaFPLtVy/z0j61agDMCv7zhzufuYfkZ2JQE6kmcG4ynYNMU3SEYnLWb
	Nj2Rw==
X-Google-Smtp-Source: AGHT+IE8ocrwfW+jYi1b+PwwdH776i/4xWR5LD9i+ONjyo97j81erbD7o9iAQzRF40MbhmQx3aXjuOwbFFA0dvMS4Yc=
X-Received: by 2002:a05:690c:3343:b0:71a:38ee:1ff with SMTP id
 00721157ae682-71b7ef4db59mr22292567b3.25.1754094561179; Fri, 01 Aug 2025
 17:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 19:29:09 -0500
X-Gm-Features: Ac12FXzIeJyXP9m27_ER8_SL561hmtMLHZi1Z0J-tLh9l2MOkqp5S4hnFCva6J8
Message-ID: <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos2200: define all usi nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:44=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Universal Serial Interface (USI) supports three types of serial
> interfaces - uart, i2c and spi. Each protocol can work independently
> and configured using external configuration inputs.
>
> As each USI instance has access to 4 pins, there are multiple possible
> configurations:
> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
> - the 4 pins can be used for 4 pin uart or spi
>
> Such configuration can be achieved by setting the mode property of usiX
> and usiX_i2c nodes correctly - if usiX is set to take up 2 pins, then
> usiX_i2c can be set to take the other 2. If usiX is set for 4 pins, then
> usiX_i2c should be left disabled.
>

The whole naming scheme is a bit confusing: one might think that
because both usiX and usiX_i2c have the same number (X), they
represent the same USI block. I can see how they might share the same
pins, but it doesn't seem enough to me to justify this convention. If
I'm missing something, please help me understand why it should be done
like that?

> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
> as their respective uart and i2c subnodes. As Samsung, for some reason,
> has decided to restart the counting of usi instances for cmgp, suffix
> labels for nodes of such with _cmgp.
>

Yeah, they probably meant to number CMGP instances, not USI instances.
Because CMGP (stands for Common GPIO) is actually a separate IP block
containing:
  - 2 x USIs
  - 1 GPIO controller (8 GPIO lines)
  - One general purpose ADC
  - 6 interrupt combiners

So some USI blocks are separate USIs, and some USI blocks are a part
of bigger CMGP blocks. And instead of using "usi_01_cmgp" for example,
they should've gone with "usi_cmgp01".

Usually it's recommended to follow the naming scheme from the TRM, but
AFAIU you don't have one. And the scheme used in the downstream device
tree looks like comlete garbage. Anyways, I don't have strong
preference on the naming scheme. Frankly I'd just do the consecutive
numbering for all the USI nodes in this case, like: usi0, usi1, etc.
And add the comments when needed, like "USI from CMGP01 block".

> Spi support will be added later on.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>  1 file changed, 1361 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 22c6da907..f83e6cf24 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>
>  / {
>         compatible =3D "samsung,exynos2200";
> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>                         reg =3D <0x10430000 0x1000>;
>                 };
>
> +               usi4: usi@105000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x105000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric0 0x1024>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_8: i2c@10500000 {

Why not number all the underlying protocol nodes using the same number
as the USI node? Like it's done in gs101.dtsi. And maybe even follow
USI naming scheme used in gs101 in general? Like, sort all USI nodes
by unit address, and then number them starting from 0. If some other
USIs are missing (like I mentioned in my review for the previous
patch), add those too, first.

[snip]
