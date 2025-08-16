Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD22EBDDB
	for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755365188; cv=none; b=nch2mvJIHTdF9Q9tRmqxQQS/zpaIkpNl9zJEg6WUeRhuhgqjqKF9hwvuhWvmeba6io3k4fAIPTvsM0+lrDaKSqpT+Y7mbAk0Q5fXmg3FJrQKuN3Kfrhxxco5g24dVqWWYfqf3Kf/k/D+geYXoG4RJdP3A+2ZnKVy1kzXreE3TtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755365188; c=relaxed/simple;
	bh=Pt4QFkJKeDes/1dpFWEZFRC9Fyo6Q/os1TmT4UtDfcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lg9zYHTWXhzPNDh4WpWX+1/MPdjn6UmQMo1PegBJNztI6Q6pF+qX/iEzK70PaD/zGJliZG5xEKZlmX9bWFXSi7rm4qCZu5+pel3AYEZ/JRLMF9Rdl6fs4fHZmuPQeckfQMRgQaR/fG3ZP7Uo/Wm9lomlQskxqHHRvbbtGptLXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMrKpGE3; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMrKpGE3"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e9347920101so113805276.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755365186; x=1755969986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+erJ0Zp3LHICZMt425StIsw9Vrx8YjGGvrTqeALgDWk=;
        b=DMrKpGE3gLl7UE8DO5puO8Qafguwz8USANOHBAqI+QGjwLDzXbI7/SDdCpaFKGSh6m
         XWJdJCqwlwo0boUVHTkN2OXspJislxpCdJSM4k2mNHtjYe/xs9X8hClf3atGALEbImPJ
         Yq7fNfFGiTfhUl5CSFvv7knPUWjBz5exqenyf3GpSgUkucn31yGH/aiADY/5l2Qc50qv
         fYOhAaW3/bbeeQtXK/uKFQJuWLKmqZZZu2qHuiNqg0+ieC1NDZPoyPcuIKhmRnHC2w7M
         TdQ/OFMfrxhJGd22TSvqtdy/aPntZ5aNT513Tgaz3rkXmc4oMHLsW8Asz8Y6VAdIeypw
         4GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365186; x=1755969986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+erJ0Zp3LHICZMt425StIsw9Vrx8YjGGvrTqeALgDWk=;
        b=LQ8mhc9JpQ9wKSxTs5ArVAmWLqtsrlpvWtBPnHBo63FRYYb9wGccC41Cn23TrRXd2+
         WgLw45Ek+9XyJ6b80gP1/Gy+2f7T1MSCblFvfnkdhDpi4TKumKERffyhH+V0bzc4Jgm3
         baQp4OvDMLo01Db4jIkBUVQbnPDvr1nt9xtD2me/n2D6m9NLpl651od8WZNogiF/D0Mz
         XOomPxTSDMHzNe2NK/7vqLnqKLx35mE9UecHpu3rhvDWq0bpn8wEmpfK4sNyFkfPYeBk
         3iyuCGeJSrN3piVqqbjLYx8KLWyQ4YxHLCYCLgdW5W/3iWBQqzYwtbikA4ca+yb7Lo4G
         FpvA==
X-Forwarded-Encrypted: i=1; AJvYcCVSJ/o3V9rx3YFlLZzBAXvJqR/iy2FoM7uW1lRzoEOTPxWvZ2uaXVFNnoL/Oyz/tC8rX1wZn5t6sDl4QccSMvLH3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRdNQdzP6pZA7Uo/brxektWk1U9zx5yUN2cE0XQX20C6QD+5+
	CQvWzqDH9aKUbUJURlyf7KjGd1oneedG06Kn2arrF5ERHR9zfsmEJAuShr0aV16InG9O1qqPfFl
	YPknBIhDAHdn3qsTda3MwKzZYsukSlnovI2sdVRNQXw==
X-Gm-Gg: ASbGncu+Ze94b00rtLZRcWjKvaxkdj5vmCylHmyLcgfye7hujPAvFVC0EXChBoTIev8
	lE+6/asCFkFYvVYakwfOT3t5KL5Nh0nbA2bF0pYv+Twtbs10x8ZbV0snwgGkqnf6ntPubg8HSGI
	FTrNPmVwpL+ZaNxZXvJ50OzWYHVzUOp09jFgtiMYwXmMtr3CK9IaP1FQNfAq6ht6psn5Lkxcrdu
	O4HoQ==
X-Google-Smtp-Source: AGHT+IEiUE/ZBe/h6CTv9oXmV/520CYO08VrAKRH9DK2kLKicjLwLKXfuc77q+NFZWV5/udeIZCHd/ZkZBNSaus2ZAI=
X-Received: by 2002:a05:6902:1208:b0:e93:36f3:573c with SMTP id
 3f1490d57ef6-e9336f35958mr7576548276.5.1755365186241; Sat, 16 Aug 2025
 10:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com> <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 16 Aug 2025 12:26:15 -0500
X-Gm-Features: Ac12FXxe2rWnXKWQd1X34M41uQmxOqzmaGTi-5t45-ucTyoZet0Hf0j8vH7V5Mg
Message-ID: <CAPLW+4mp5DASdcToSW1QD7f51w4AYQeKzTF=nq2U=f-HiXD-8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: exynos2200: increase the size of all syscons
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 2:06=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> As IP cores are aligned by 0x10000, increase the size of all system
> register instances to the maximum (0x10000) to allow using accessing
> registers over the currently set limit.
>
> Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> ---
> Did not add the r-b from Sam, as the patch is pretty much completely
> reworked, including the description. Please send it again :).
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 943e83851..b3a8933a4 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -306,7 +306,7 @@ cmu_peric0: clock-controller@10400000 {
>
>                 syscon_peric0: syscon@10420000 {
>                         compatible =3D "samsung,exynos2200-peric0-sysreg"=
, "syscon";
> -                       reg =3D <0x10420000 0x2000>;
> +                       reg =3D <0x10420000 0x10000>;
>                 };
>
>                 pinctrl_peric0: pinctrl@10430000 {
> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x10720000 0x2000>;
> +                       reg =3D <0x10720000 0x10000>;
>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
> @@ -418,7 +418,7 @@ cmu_ufs: clock-controller@11000000 {
>
>                 syscon_ufs: syscon@11020000 {
>                         compatible =3D "samsung,exynos2200-ufs-sysreg", "=
syscon";
> -                       reg =3D <0x11020000 0x2000>;
> +                       reg =3D <0x11020000 0x10000>;
>                 };
>
>                 pinctrl_ufs: pinctrl@11040000 {
> @@ -450,7 +450,7 @@ cmu_peric2: clock-controller@11c00000 {
>
>                 syscon_peric2: syscon@11c20000 {
>                         compatible =3D "samsung,exynos2200-peric2-sysreg"=
, "syscon";
> -                       reg =3D <0x11c20000 0x4000>;
> +                       reg =3D <0x11c20000 0x10000>;
>                 };
>
>                 pinctrl_peric2: pinctrl@11c30000 {
> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x14e20000 0x2000>;
> +                       reg =3D <0x14e20000 0x10000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
> --
> 2.43.0
>
>
