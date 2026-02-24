Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FE37BE86
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931960; cv=none; b=LATZszDxb73NYrLCEeQAk7n+QEQA+Lk8hv6wlf0z1w/bQR5cm+Yr9do5hpTDYTQY4C7fXfXTzhBf5lwCClL4beYYRZxk109Xcj/8LXptfIrPvOA21kucEreSGHn1K/RSzKWPNH7KJiJMRj2n5XZVOwH49DxCt2xx4r+ckVCmWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931960; c=relaxed/simple;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gadB8KjkHL14pKzqBN7QdXo9uwBOQN9F5/RC0PA+iyssBynE2JpBPyaRCyjhkt757u/Wr8Ss7rC3/881iwNfO4F2fMC+F6I5KQRzSKj+H9+dzpoMei1IkqqzvuGdZyIICwsheKwQgx2xRqotHqCzk94VTI3Npylkz3M9m4MFxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBlFHkCq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBlFHkCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20E6C2BCB7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931960;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CBlFHkCqyw+h08K9vVyBvEC3FyrbEus9slNsgNQZkIcncNWsDW6T4c7zuKO6gBh7Q
	 L4zk70XHlv7nX5/H8bOvm0Ff2T6Lkd5ORrb1SDemGccIevbVhLjZQ1SJWDZYRo96z7
	 s7nQazecFlce8JZ6ieFb0ODgeIg2H+2F9irwESDySXVSJRjLdwYEZ/DUEY5DQg9v+d
	 IvqGHEVlhoTNJlpwDfhwmlokzWItmFXcA3vUiLJvU1TcIfZVmakyc5M38iiYF/XkFL
	 M3EVdJ2HbgfCFEAFMqJMJC2FUG8oKaPsvpte/q8Fm/Vf4BNvqsV8Cyhc3GzH8639TV
	 UwMi7AjJXEblg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e65b8e268so5479208e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 03:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCYLySiTabPcUPQXJIQO+N61Dddyifa8MZUefNVRZ/uUOfofF9/v1bS8OTi+izPMyDynYQXxx6C8w0zD9HovV2Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEmj2D8lqPoPEJMr37hsR3d0ICIy5P59w96hf/PUteK3CamUi
	kcMOvtVzIwllJB3oW4hSqMVbPSd3EhJa78fodnmuAE91Pi0KgSTHhkK4Pc+88FemrLwFKj4XpA5
	E51vIJ9JRINcjpesAragKoLd0BFHxIO0=
X-Received: by 2002:a05:6512:334b:b0:59e:5fc4:26b2 with SMTP id
 2adb3069b0e04-5a0ed83e246mr3961609e87.0.1771931958134; Tue, 24 Feb 2026
 03:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 19:19:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
X-Gm-Features: AaiRm51ME-8YiE4AvLn72GWWw2sauxN-ScuBUrDsWnKr42ng_6yKdEudjebdqcE
Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 6:04=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
>
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
>
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
>
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi            | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi   | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi  | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts    | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts  | 1 +
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts        | 1 +

We don't know the internals of these SoCs, even though said power is
likely from the same regulator, as that rail provides power to most
of the SoC. But I would rather not speculate.

I think these systems are at the other end of the spectrum: the power
rail for the GPU and the rest of the SoC is simply never turned off.
Neither is DVFS available. In theory you could make it work, but the
voltage range is fixed so there is little savings to be had.


ChenYu
