Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589627FD71
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766222057; cv=none; b=cSKqzPu2vKB4XMaHWSIes1IfPJ28QUhY6Ol2rDKFGjeCsPVbncrDoZIcNJOiYP5X+iDm1SVNdYDHnRZhQRB2hbE3Ctgremnon761rq7S1jlFrC40xukq1RRFnlLg1aoJL9KMfFM+Z3KMOOFpeCOkGgQiF/fpfhYjkrMgiSRJbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766222057; c=relaxed/simple;
	bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDe76f6AG0RKH8cBHzwE1X0vtMRs1AY14Aqqp5GtH0u2ApL+YlszxTwOIY+BQcQe1FuBEuuU2HBzeKxuXvgqS0JgKlMNdqFVdEdGZtfJyLnBw8OXtC6jjip6y3uv5dAzAPWdwp9yvw4WWJCcM/+lfHDXTuoWLCRS+At+nar8gr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vse4xV9n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vse4xV9n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so1511696a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766222053; x=1766826853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=;
        b=vse4xV9nWGCMitSeF6h3K5bTB0XykDac81ER4edie4CGb0uSfUymnXf1ozLGmQxi1P
         +mVOu7Ypzb9wUYow6PRc3qGKdr2N8fbfoeRfSzWJR02Lm1tV5h5joU22JNRnUdrGOLJx
         0JvUT5h9lMf+ud+IfJYSb+9n6hGarE5Cizq22/lGnbv/d4XF/URDSTw51pTCIixfG4pS
         4DQFgL/5dYb6Sgf150qfTiU7phumMN+w6K6MTOaJxIrmRFt+cRe4qK9hSUowylk6EJwi
         W7oU9op+v7OMUlhOO5mUbpqlzdvUVVSndf38Epe/HYb2J1dWShYdKg+Tatx3wMbQMbYa
         7H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766222053; x=1766826853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=;
        b=SHmvYzGE4tqXoSqa6tgazaa7/bQKiuIHvimAmKd3vO3o8xTQ3sgxB/Iav2G41k6v/p
         xXwhwla3TXcvgs1lEIK2mHRW2aaHev6jajMOGakeVnmL24n9nEveCgFle2ZfW4AVKFpo
         YYKrdiNol7TlBcyeOX4f6NBtL+wnR+zRBqDJfzn1a741F+aBMpRpSoNjjYbp6uzGRKeX
         cwmnhrRbtxy8VoW71EU7xhW5FXkosU614erX/tnHW6ueYivuEvgtSkdrS5tHncocDngw
         vkAMIhoyJzhg+xZUqD0cFvny9EMmLs3PWiBW0Qx8+evygxWXUZ4si4JvRUlIUjue2XXM
         zHSw==
X-Forwarded-Encrypted: i=1; AJvYcCWXqkRp6OuoQIO+t8DH5GMwWQmDqz+oZUqHLpgDX/HfLrxUZoiwYt0mnYqhD+hIBzMBI8I3Qc0zVZ9qylRuJ7+6pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLUgnSsWP8aCkgcYRgV80jwxes5jRW669mkOEf2/CdlALAkxK
	QsHApAxOx6Yn2z4kXKIpo1uoUbKgFf0wNids0kBEpvBAxr5ohkzb4r6zDoOMEDm4G+TMWfEjlMS
	J2y5GLE0JQ1GrZ3Eht7YVH8AUlICAorATE+RRAG7koA==
X-Gm-Gg: AY/fxX5yARtP67456cLWd3PfC4oJL5qI6tKkdbRMzWmoF+g6Q3Hr1kO42KzMILD3Q8d
	RU6pJVcCFSEy41cGPwlzItu05LZnURUdKcLvMUeFdqz7ms2aHGgW0EntA9WYG3o45IVMC9DoUJv
	0pE/IOKY8xn+ejWrrQ/gPdnyDR2wVxCk8vjproS6lIhp2nuLwyr2BelchABRTonGNBDaDcNch5x
	ehfZ608TqkBlOgRC5mEZP5AE3sr1o/zkmZTH0E1ZBhR7vW7NXmS6Lst68XL8tAMVCHzUA==
X-Google-Smtp-Source: AGHT+IEi2oGHsGZXR7le6EPGgQR/lFz5KV5KMMycyOqdS3p5vqm96+TwVWyXCuuGX8CGH2LK41tImG4vOGHehFDZu9k=
X-Received: by 2002:a05:6402:2806:b0:649:9159:243d with SMTP id
 4fb4d7f45d1cf-64b8ec9cf53mr5203694a12.22.1766222052663; Sat, 20 Dec 2025
 01:14:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
 <20251114-automatic-clocks-v5-3-efb9202ffcd7@linaro.org> <e402ac33-c23a-46a1-b67e-097eb2ea7752@kernel.org>
In-Reply-To: <e402ac33-c23a-46a1-b67e-097eb2ea7752@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:14:01 +0000
X-Gm-Features: AQt7F2q9EnqLES2x3fb7MS0OWHPiCmq_EbCvY_7B7i_Ph5AvJoB7PQVDPtGa-S0
Message-ID: <CADrjBPq2oTz=PomQ08rWgYiQ40ResAUiKg4QVGoYCTYX20dKNA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 18 Dec 2025 at 16:06, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 14/11/2025 15:16, Peter Griffin wrote:
> > Update exynos_arm64_init_clocks() so that it enables the automatic clock
> > mode bits in the CMU option register if the auto_clock_gate flag and
> > option_offset fields are set for the CMU. To ensure compatibility with
> > older DTs (that specified an incorrect CMU reg size), detect this and
> > fallback to manual clock gate mode as the auto clock mode feature depends
> > on registers in this area.
> >
> > The CMU option register bits are global and effect every clock component in
> > the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
> > bit on every gate register is only required if auto_clock_gate is false.
> >
> > Additionally if auto_clock_gate is enabled the dynamic root clock gating
> > and memclk registers will be configured in the corresponding CMUs sysreg
> > bank. These registers are exposed via syscon, so the register
> > samsung_clk_save/restore paths are updated to also take a regmap.
> >
> > As many gates for various Samsung SoCs are already exposed in the Samsung
> > clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
> > some CMU debug registers to report whether clocks are enabled or disabled
> > when operating in automatic mode. This allows
> > /sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
> > correctly report the status of each clock in the system.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v3:
> > - Add missing 'np' func param to kerneldoc in samsung_cmu_register_clocks
> > (0-DAY CI)
> >
> > Changes in v2:
> > - Fallback to manual clock gate mode for old DTs with incorrect CMU size
> > (added samsung_is_auto_capable()) (Krzysztof)
> > - Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
> > - Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Andre)
> > - Reverse Option bit definitions LSB -> MSB (Krzysztof)
> > - Update kerneldoc init_clk_regs comment (Andre)
> > - Fix space on various comments (Andre)
> > - Fix regmap typo on samsung_clk_save/restore calls (Andre)
> > - Include error code in pr_err message (Andre)
> > - Add macros for dcrg and memclk (Andre)
> > - Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
> > - Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg (Andre)
> > - Fix 0-DAY CI randconfig warning (0-DAY CI)
> > - Update clk-s5pv210 and clk-s3c64xx.c samsung_clk_sleep_init call sites (Peter)
> > ---
>
> This does not apply, please rebase entire set:

Sure thing, I just sent a v6 rebased onto next-20251219

Just a heads up I hit a regression in serial on linux-next that I bisected to
24ec03cc5512 ("serial: core: Restore sysfs fwnode information")

It is unrelated to this series, but I guess you may also see this in
your exynos board farm. Now I have identified the culprit commit I see
others are also hitting it as well
https://lore.kernel.org/linux-serial/713aa37f-161d-4f08-9417-d7d2abdcdfd9@sirena.org.uk/

Thanks,

Peter
