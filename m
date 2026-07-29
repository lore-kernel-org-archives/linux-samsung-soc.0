Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C33BFE34
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311060; cv=none; b=H+1/0Gvchgj57E+LhJgc4KIZikxnx2saE1jlTXQVJuBbmMa1lZpiqHDdN8UBPzei65bU5Kj5JG0wjSbWxCJ208W3t7D3VTawcyz/H9PksOw2V/X963BFgGrQQ+ttGb5oknDKw6l4j9MINUFUGTIA1YR1IO9T/9VDv61zX4dXF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311060; c=relaxed/simple;
	bh=ot46wtUCSvLaFPk3Tzd2lHn9BHDi6euTPMRIGmIYQUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kf4UOD1kj1ospa8QMfoCP0m92rFFAJVWVkQWEe7JLojYckmFGT7MhWA4lLjcFU60xijxWj5nUmZUzhxUSJ1AxNapkrf6bpI/L4gdkhR2CUdEUI6E3Sd5OoqiDvMabK2Se2LNXGjVNrHuGl0BGc8m3bDLYVknlRTYYajIvEpWRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POpn12y/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POpn12y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFBC1F01559
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311044;
	bh=ot46wtUCSvLaFPk3Tzd2lHn9BHDi6euTPMRIGmIYQUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=POpn12y/mRNEVBNOEb9px8uTYLCjMqqXdWNSvaTtaiYYHsw3H2bYuqkKIRBy8l1N8
	 BINql2rHJXkdn1PmYHRFxoE0YeGK/BX5zw1WkUZwvBeB3ITz7Bgv8/MhIA6n/Tm/DE
	 XlQCW5v5z9YnzDaXOsxKOTkQ/8cFX8pZ2CnSqLwVJOfcwkxt8mFMWr77dNi8BYDTf+
	 OMry0SrRRNWX7TsFmLoTGMgXJFkwAbM6L0mNA5cpCLoPf4LMjvSZR+3HviOJMsNAm6
	 zo+RYw6SPj/Fwl4vqzA7AavXWp2ipHEZPJZptjszyRpFsFMSbYOUTwXTulWoP8/Cmo
	 w+21lyYI+3zgw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso4618981fa.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 00:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPViN4y4bpTQwi9cOwn0AQmd8T4zCkV+AOfqrilE+5iZ3Q3lbbLpaydecVICSrf8D0DWI3qukwKqV0WPb0IF/lrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDs21mA2tDbVVJ/uUpjfXCI6AkYWp3tIWgRvJweYKZA0ZQUyl
	zOGHNdO2qN0b2yTFn/mFMAkESVilRB9B3ZcVMyugh+7lvqNpJHFaKPQbf8dOECcilZHWVQuxTEd
	kmaCej/1bSh4GJYMBFKWuPtlH1C3book=
X-Received: by 2002:a05:6512:3d87:b0:5b0:1b78:4969 with SMTP id
 2adb3069b0e04-5b2d0253d4bmr1263858e87.46.1785311043134; Wed, 29 Jul 2026
 00:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org> <20260724-zinitix-modes-v1-5-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-5-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:43:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRHgLHLenBPsvO+sFpj0Um6-2P5Ap_eBSq5K=dr2+mWA@mail.gmail.com>
X-Gm-Features: AUfX_mwvn_ui2ZSBDvNroUCnVv97gaxxHNTnHQtdrsBXAAI1m0EXRHGlkojbzCs
Message-ID: <CAD++jLkRHgLHLenBPsvO+sFpj0Um6-2P5Ap_eBSq5K=dr2+mWA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: exynos7870-j6lte: set mode 0 as default
 for zinitix touchscreen
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 9:25=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> The ZT7548 chip in the Galaxy J6 is actually able to support mode 2 (the
> recommended mode) just fine.
>
> However, the downstream kernel driver utilizes mode 0. This creates a
> problem in the aftermarket world where fake touch digitizers only
> implement the bare minimum functionality, as used by the downstream
> driver, to compromise on cost, which leads to such chips implementing
> mode 0 only. To ensure touch works on those devices, set the default
> mode to 0.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

I guess it is not possible to detect in software which digitizer is used?
In that case:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
