Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADECEEAC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877479; cv=none; b=IKvAs6ZPgyj2xULrXrzGDgdrayofI/5/k19cjEDoxEH4XRUo/csQMJgXPRrh7CsVg/QGAEOQwuO8QEjT7n2k8ZjtDzIu4tpvhSLTtSzxeb7fzSxbc3/OXrqyiKgz5iEdBNMM/FE50d7X4S2kwuhn6uaxpvcNiXPahrfE//dBz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877479; c=relaxed/simple;
	bh=+Rw9cHF3zvvHudVBxpfd85hAjXfCOlv2DWgdevEOxfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hpmXvlSqAci73LRjmRdGrVh59vFMr7s9ZxooHnMlKZD0sgZLFAO1mIKDVVxrbM/XZNhDuYqO08T+MHPhTSYvRci9W+VQ5ndPpRSHFuMhvbx1iFQmW/vuNTnwySWUNyhfJe7pP0Vd6DLNz1rJ6RDoOUiLupc/HQ7wa6pFvJhZmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTf1wnzr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTf1wnzr"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so34511361fa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877474; x=1709482274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21UrOfJ5QkeVV5ZEwy7jUJphKXCc27WnFaTIldWYtUM=;
        b=LTf1wnzrq/0VsYabZgzYhfPbq49o74EpTRlgvJlcAUk5q+zY18C68HAysn7N+H4pxK
         EQUnQCdTyXDZ8UwUtvQtxQVMN3aROtTyV2CjzYQ0kZXHjtdc3iDkTZXiiCPnGJ25pbgs
         AJx9pITlYb4U7MR/EPH7/y2SOon9y3fC9/OPX4zKaL7604jQaskH3p8J7EUVjr/C1CL2
         LIoHoMMXa4fMV9X3iX7Pe0x/Wlf8rybK9oMKEBvv66bEbCaQeTfciA+raK9/3llfmuln
         xC06HoyQq87ZIIj6yA5qah4bDF4D4rcaYx9O4c3HLZEPZ6RAnnmEcie5RBgJy+hWBhVK
         bcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877474; x=1709482274;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21UrOfJ5QkeVV5ZEwy7jUJphKXCc27WnFaTIldWYtUM=;
        b=oKanKSl69GGiojGSOyN7Vm8x87/eLEMwPLlAptkk02H/608LmK+UrYlnskf4QIYKgB
         EwgVps+4mQ/2llIYan0C/IhVWwMYf66EG08rvDTB/v1FqhM2v2255pN4S+iA97jMORm5
         DT1v1XTIKvdWsqLwIYAqd5WEUriQ3ftQORsv4EWi1lzcLVBWCGn81/gSDaK8FJtdYgfh
         t02xIhoHd87QIV5zPV0NigrXemukKapjyBjQiWva/KOsCl4HwnunciWSJfE3yy/s2T+P
         iHX5KueKpqrMmAEUnWI3b8svLScROoG3Fw191iYv9lJh2pjofGC9dxqLl6dLeTfCWdR/
         sL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyFuWMmzdr/us3kcVR5j2XAFZC4A5L5p8m3cZ+ch2tgajLirpYFVJN9k1Kon2dGrEtOwZKATF9RXBeB1Wua3FLBwscHh6Wsl4jdOu24xBKEPM=
X-Gm-Message-State: AOJu0Yxc+tD4d+zQHUvwsly3VDH8by+Qcd0aK7e6WXksNG5UpyAtclwB
	MQvd3IJ06UOimEt1mDUjAiHoxN3sSeVE4ObiInRLeflhWDIILPT1owTCnwZpNH8=
X-Google-Smtp-Source: AGHT+IEZ2nGwiR9Zs0FXNbvtOlq7ks4iteoQaOvCoZGxw0nEmtC/oNj0/clKB7TC/Yr6DpFDxLapGg==
X-Received: by 2002:a2e:990b:0:b0:2d2:7164:c6ba with SMTP id v11-20020a2e990b000000b002d27164c6bamr2529804lji.43.1708877474757;
        Sun, 25 Feb 2024 08:11:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-13-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-13-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 12/15] clk: samsung: Add CPU clock support
 for Exynos850
Message-Id: <170887747270.215710.14391018888369319254.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:50 -0600, Sam Protsenko wrote:
> Implement CPU clock control for Exynos850 SoC. It follows the same
> procedure which is already implemented for other SoCs in clk-cpu.c:
> 
> 1. Set the correct rate for the alternate parent (if needed) before
>    switching to use it as the CPU clock
> 2. Switch to the alternate parent, so the CPU continues to get clocked
>    while the PLL is being re-configured
> 3. Adjust the dividers for the CPU related buses (ACLK, ATCLK, etc)
> 4. Re-configure the PLL for the new CPU clock rate. It's done
>    automatically, as the CPU clock rate change propagates to the PLL
>    clock, because the CPU clock has CLK_SET_RATE_PARENT flag set in
>    exynos_register_cpu_clock()
> 5. Once the PLL is locked, set it back as the CPU clock source
> 6. Set alternate parent clock rate back to max speed
> 
> [...]

Applied, thanks!

[12/15] clk: samsung: Add CPU clock support for Exynos850
        https://git.kernel.org/krzk/linux/c/61f4399c74d0677ee64e42f7b8d4ab01ee39de45

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

