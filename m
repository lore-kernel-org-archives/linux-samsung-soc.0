Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1F292918
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759387210; cv=none; b=eIfJbmyouhdC1DMSfXSUA5QDYs3lMRdL1tv9XHnyhAWZJWv0yBPU4vBTTy6D56CriZbAbF3YdZ9q+rTtrmqb28RZWMxlOt4wqbq/jYQBI0U20b+Eb3e7cmUc8Rq8E08DZGYkxnnJzAVTi74YHqeb8TQvKePn38mForesyePGO9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759387210; c=relaxed/simple;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8YeKu/NziIUBKRAiJkkPlj+zRgC00zHe8QPxEorm8CvrTeDuOCqWSJ8wLE95xeSeXPhLi8/zXXaCAyVmH1RTPCicUDzv06HCcs4zJZGUG4SzrMWhYWYJ5ebsM2fsZtnh4XmY8Tr9ZU+Q/M2Q4/7FlL0Tp0Yclt98C8VcoILYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlSxbq2a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlSxbq2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C32C2BC9E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759387210;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rlSxbq2aRzxfcMKB2aNQECztMvISDp8XZalihZIOzysf/FUerJ1qJ6sYMfHTeUONE
	 62DOVUPnSTf0z2Gz7YC+gEt+IvcgptSvTab0KUw5vfuxhlHUA6CsMjvBF1+Th9JVjt
	 mUmuKy2lMTbC3OyOoMGgZkCIR0Jf50TAQkAEmyd70lxN6m1n3WmohzZslosFXEzdHC
	 cnEhaIVJlQz+riaPK0Y4Q7iUcjlRxNndIlZHkdMz6FSHql9EKIZ2JbazxfEijDpO27
	 wfvi+waLKnJZ4ZqDJii7yAlSACnjNtNZznkNNEQ2Z23elLGfH8Z4gZ3vt4k6nO+Fsk
	 6tHq+vxFarxNQ==
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b60971c17acso614296a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2025 23:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRKE6gSM31/xBbJMYw1SadYUWY1tzKR4EKhXCxYFyURiknH6dxu7jawaSzmDvzC82q6aSxIc/fx7bPitZJ5neAug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTzze1LR4RXTjUkKB1UOCK1U3QXmunVFIezOhfG5qtRkjZzbs
	UKI0U2CpYO4g6vKdV4Vm8Q9g4+B5I9IDtLRkkDO0Eo8Ap8ZTjtfAqGAC/eFXaco0Ck8yW3+p+sZ
	o1k6RX/2dLSHGG6gJ7efop6TQOi0aArU=
X-Google-Smtp-Source: AGHT+IGdtzOpvUYdPLtelHaB8zJ6rwGT1VrlFmtzCJU8l7UzsZsbFUnbb5aDI8NKj4eZKGgGJDmSr+LU1AO2yz3t6r0=
X-Received: by 2002:a17:903:32c9:b0:270:ea84:324a with SMTP id
 d9443c01a7336-28e7f328b47mr76608265ad.38.1759387209439; Wed, 01 Oct 2025
 23:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
 <20250901051926.59970-1-ravi.patel@samsung.com>
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Oct 2025 15:39:57 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
X-Gm-Features: AS18NWDO2eUChAY4_CCzuKLny2cYJfsAdkZKqOgM2dKZNuIdZKWV3kyYmcxtbLo
Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, 
	pjsin865@coasia.com, gwk1013@coasia.com, hgkim05@coasia.com, 
	mingyoungbo@coasia.com, smn1196@coasia.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Sept 2025 at 14:42, Ravi Patel <ravi.patel@samsung.com> wrote:
>
> Add basic support for the Axis ARTPEC-8 SoC which contains
> quad-core Cortex-A53 CPU and other several IPs. This SoC is an
> Axis-designed chipset used in surveillance camera products such as
> the AXIS Q1656-LE and AXIS Q3538-LVE.
>
> This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
>
> List of Samsung-provided IPs:
> - UART
> - Ethernet (Vendor: Synopsys)
> - SDIO
> - SPI
> - HSI2C
> - I2S
> - CMU (Clock Management Unit)
> - Pinctrl (GPIO)
> - PCIe (Vendor: Synopsys)
> - USB (Vendor: Synopsys)
>
> List of Axis-provided IPs:
> - VIP (Image Sensor Processing IP)
> - VPP (Video Post Processing)
> - GPU
> - CDC (Video Encoder)
>
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings
> - GPIO pinctrl configuration and its bindings
> - Basic Device Tree for ARTPEC-8 SoC and boards
>

Pretty useless cover letter since it doesn't say the damn most
important thing : dependency!

So this went unnoticed and now mainline (Linus tree) is affected. See
Linus rant on soc pull request

I'm very disappointed, actually mostly on me that I picked this up.
Your future patches, need to improve quality and probably you need to
go back to how Git works and how maintainer trees are organized. Read
carefully, really carefully please maintainer profile .

I'll be putting artpec 9 on hold, till you confirm what was wrong here
and how are you going to fix it in the future.
