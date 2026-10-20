Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482842;
	b=GbRnQsO5+BgGW4BR+Alyz7su6bGGgAQ0cccFUzpJTaahSEusCxEIh/ZpXRx7aTMLdIxn
	 plW7NxdovPbM7GRfqRyiEvbd08+z1qaqaXht0d3IyCzGdSh/S+GDVbAtlSFiiTlhZQW3p
	 p0013+T6otjS/9qHwcsgUv0E40ssDARWu89fMZeuAZi2j832XGhe4TLPtUCvkHbxKb9TN
	 YS9ey1iEunKrPB7OJ8GkqgMFpm1aLXq6C6eXQkRZ3lf81Uccobr2Zj9nMqjnn9f4QumIm
	 WpJ86YnzP+A3ZX8upVVmmwrJxjfgKCNC714YsUxOuNClZ5yxjpkJkravf2uN40gbr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482842;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2hDopJ7Qj8tTboD/8FzzAGyXZaGFBbxnDVfa4fvU0AE=;
	b=meTzTJ4Q6vWzC715n7KAlBmzfVn/4tfKaYyGKYD8F38Q+dm/dJYGwCxmY789fgRD6y6n
	 awkK0gHIrBv+UUrtYACs1wHNA1mG9ohy4/Lrg1DpS1vBqn7oqB8rrQRYWOQ7t2bIdzKeg
	 Grb9SiRVxnnWmjYuBmijVwU6h0uBqPP40xk9G53HXZY/dVy5ZkTs2cwkaN+AYeMM0ROAy
	 Ozk011mSeAQKYyuRBLyHINvj8iHihROfaqRPvSMQwZFlMD2QNZedPS584atBFvDwLHtQX
	 GJBlfov1b8TNCvb7J6ICgxq9dSrfuyt+d+MgoTurTbWiIjW4UqinW4bRih/SAk/ocRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vmes4ejj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BBA606A31E;
	Tue, 20 Oct 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vmes4ejj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A961F000C4;
	Tue, 20 Oct 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482842;
	bh=2hDopJ7Qj8tTboD/8FzzAGyXZaGFBbxnDVfa4fvU0AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vmes4ejjOo1Auy6cIFkuA9t+aWJ8TAxXtW7qD5jhTiuh4as5A+jB0XgnEg30U8x85
	 he+Q/9d8FxirJkp4+KK5e47c0vFmcZPxrITViI9mnuW3NoMCdkCUHfewhwAs/DuHoG
	 O0DbxNq8VSC7TVQnnRbmL1xWfi8ZU2Sf4bIXJ69lljekdCrM964eeE8hn6eA5ueuP9
	 RkaySItndo6BurJsmhtbjvmYsaipomkbTMrb7FGOrgVcOH+jPw9T3idO2ZHp7qmk0A
	 X7yNoJ4Ithhhe4AJlDsVvC+4siB89T2RuJc6594D5srmgu4HRovBLKQyQWrkeeZfIo
	 xDWLlsutovbyQ==
Date: Tue, 20 Oct 2026 09:53:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for
 Samsung Galaxy Watch FE
Message-ID: <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>

On Mon, Oct 19, 2026 at 11:23:46AM +0100, Aiden Isik wrote:
> Hi there,
> 
> This patchset adds initial support for the Exynos5515 SoC, along with
> support for the Samsung Galaxy Watch FE (codenamed lucky7), which uses
> this SoC.
> 
> Support for the following is added:
> - Bootloader framebuffer
> - Both CPU cores
> - Memory
> - Generic timer
> - Watchdog timer
> - CMU_TOP, CMU_FSYS, CMU_PERI clock management units
> - ChipID
> 
> Currently, these device trees support booting the device to an initramfs.
> 
> There are quite a few regions of reserved memory, where usage of them
> can crash the system and/or cause unexpected behaviour. Currently, most
> of them are named "misc-rmem@addr". They will be given names as their
> accompanying device drivers are added and their purpose becomes apparent.
> If you would like them named feel differently, feel free to let me know.
> 
> The VGIC maintenance interrupt seems to be unavailable on this SoC.
> I cannot find any reference to it, nor usage of it, anywhere.
> It *could* very well still exist, but it is a mystery for now (and also
> not a *huge* deal on a low-power SoC designed for smartwatches).
> 
> I am getting checkpatch warnings on this patchset advising to check
> MAINTAINERS as new files were added, but I am ignoring them as the
> entirety of arch/arm64/boot/dts/exynos is covered already.
> 
> This patchset depends on [1] for drivers and device tree bindings.
> Note: This dependency was merged into the linux-watchdog tree.

DTS cannot depend on drivers. Please fix your code, to avoid that.
Dropping from my queue.

Best regards,
Krzysztof

