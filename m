Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646772;
	b=a3quHF96U4ZXdbMAHC+lUe8aj3Hq9DYcu+u4GIjuJcK4o7DzELaQpXODgJTo++oqKoCv
	 QZiW2/pGhxzJITiI3+I3fldf3LxI9gHE0b45mcf3Uhpjsh++Xu4J9rYHthdKtc2xK2aUv
	 6bNw/ZFjVWKPhYxHLeZDhCuAaxhDK0Pt+xRKMsj7ZP+Trwwr+wooiScarVWGRQPuBEtyG
	 vQAEkdvuGvNpla44TQdPuvLDv7/AUefZTeEKaiEecj82xKgBkI/x6jE/5ZKyjSsSRcf63
	 UM17KpY6jL07acIgK0im5UahLuQLeLOvotVdOrU8At3tlC1Kn5F/XYO+OlBWDp/1c0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646772;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jiTkIxHuhAkziw0ro13jvW8WYMk3a+CT3sljb5fNVfs=;
	b=HE6gFXEe4e0VrzI9zXEjEPNRHgqqnAo9umvSyZ7rovWf4UjxIodP1iraXTEaevYGu2op
	 owzILLqbgxgAKAAINmuqEVsasScOjZkLfIkX9idC6RqXkqIG+fx3A9+a8MOgObNfRo6en
	 UpgW+1BcfllYvh5g7etOfwX6GAP1FJzKvljh32LqzPuMEnzSOLBB/hV/rQy29DZI+WHD4
	 fVu9hlNDFovGyW8s5ERSRoqgZBN1et9dWv+pgl2V0YPqvarZqu0IenkewDyMKMYEyQN9c
	 5Yc3EwCbUH0BiCIxTT676Zv6jSbE3Jvxk/Rp3lkf3B14MCg8jpHEgUG4fRtULTq5IWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ggir4WL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA710606A329
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ggir4WL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D2B1F00A1C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646771;
	bh=jiTkIxHuhAkziw0ro13jvW8WYMk3a+CT3sljb5fNVfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ggir4WL2ENvsjGBc0Dunfrx15FRVSzPAYHhJCAnJccJhU5tldMV9gI8IqcAdNUZiR
	 2UA+zEf/4YNXOFqguwEvBo6Ycdv1LFLGR67utf391GnrSh3fWG1npEeRL22FdtWBGU
	 dRORbuEHJ0QdCHKiKtc59NNFow9sUVjPjPsuGhS3KcdBBxbjucmAwbooedJWPoERm8
	 HBOXPWruv3GhbnqPxO1C+D1nmA5y3Mi9nWo4sv9E4sNreP3D4oxJg0qJ5+O2a9YYnX
	 710mvIJV1YnfILddxx7kxqov+tp9VwVjaZUpMKd/GGrIWqckR2216ZSYt6UquMKCqf
	 8zxg1czW6VuBg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso590006966b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2026 11:12:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwtDBGQj3a8KxQoQNWpFV/Zc/te1BWtrQ4tfHBKUSjveUkkZDLRZX+6p6Q8vPkW8mg3UGat37iXyf/8WkzvsNZz9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfToaHGw3iA3MsI37/lslB+jpxuKjE7+WGSQhyOrYUoU+s4ews
	9nXSe3HuZ4DHxL+PTSHY2O588OnHFd9ETuwVCUiqx1fuZ23viJwEC0PwzUlj9ftm0ooSO57FHcW
	WhGF641mmu4Dn/4Cj1GFuqyNKdPhkkA==
X-Received: by 2002:a17:906:eec9:b0:c26:1648:a076 with SMTP id
 a640c23a62f3a-c4ca7abf2aemr893729966b.49.1793646769977; Mon, 02 Nov 2026
 11:12:49 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102658.968138-1-m.szyprowski@samsung.com> <179362278569.150793.16322788098732007689.b4-ty@b4>
In-Reply-To: <179362278569.150793.16322788098732007689.b4-ty@b4>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Nov 2026 13:12:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
X-Gm-Features: AclHuK8yGh3NSN4CvPkoAvulZs_KXn319zDDRWAbtCSGLwxtYjAagwVTktYpSvU
Message-ID: <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
>
> On Mon, 26 Oct 2026 11:26:56 +0100, Marek Szyprowski wrote:
> > The wm5110 audio-codec node uses the legacy "wlf,reset" and
> > "wlf,ldoena" property names without the standard "-gpios" suffix.
> > gpiolib-of.c only recognizes these bare names as aliases for the
> > correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
> > alias support is compiled in only when CONFIG_MFD_ARIZONA and
> > CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
> > disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
> > codec without a working reset/LDO enable line.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
>       https://git.kernel.org/krzk/linux/c/76ef3ed714ac178cda84ef39733d4f7=
12e682081

Now in next:

arch/arm64/boot/dts/exynos:2:1
   Schema warnings:1
      2 audio-codec@0 (wlf,wm5110): Unevaluated properties are not
allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios' were unexpected)

sashiko pointed this out.

Rob
