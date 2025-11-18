Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C62FE06D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472129; cv=none; b=mhXTF506kU/fjCTgu0wNpLi8b7TR13xR9bBv1u9PPB4qFF99nqwMMdfyC6mBMkqdRgNfZpWgIWlrW6FtspsfKpyvWo5PsVgH0UghUSDCZXxHT3xiHVlfwcUYJDeblC9A6Eu9HxHJQGAAvImpb+h8FMStxqiESlf9kdTremzbGK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472129; c=relaxed/simple;
	bh=38bYLMu7gHJ/RFoIgWiK/ZMbze7jRQueT3UaNeabMJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOLCyBUBIoMVor/LOtcOfdHgtS64EPI5cNIAFqbjP95yHpVy8goG72cGryvf3Gp4gmOSCAZ8ANANp0b8csiTdH/D3DEFslb22xTuzZX1366poEvOClyLwyAHZUPtz4IGpZFgpNpJ7a5CCQRTFx6JaeAHsgIFopLba0PkJ6VSaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dde4444e0cso1892853137.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472126; x=1764076926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHhCA9cigoUdPwap5WRlueW/Hs8cXSQrGektg/X2Gas=;
        b=mym/mV1TzsP+Hh1rCQUT7JUwsVoRyKvtwvwGsjXb0aHdTzA7pZfRGeVrypQmIwuanp
         brCVDGTIOF+WZQrmzJkBep0hasjVJSZ6j9oL0WI+r3upq6qTh0v2OPu3utrRNvNJWT+8
         KAMXevHxp+tTNScFsKUUM7NjW//iKB61OEG9JjFOaO+c6hRzxExSVzgFAEVMbEoH4u3t
         RR4Ot3PDxskH6pOZPcuTvaBJ/MflIviiTFp6EfFii+Oq0uhnGRFkhyWyK8fZyGJTl/gV
         mfG0qaMztIrHlOR30u4Pypho/PhK1M8cafGMZb+gKjHpQmb4Otd+zzgBD5DaCHtmIaGE
         QE/g==
X-Forwarded-Encrypted: i=1; AJvYcCXXCHf4T1YwwpoNZN6ccKuqakVLB0WQH92sVWVWPRQRHrBR2zZh2Eb83QE01NOi9fVOt/JHoMhG2Mf0QYqd8FB1Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDlPwNnOiTv1ZwhJ9wpouD778Mipk6oTBy85SOcA3tiVRqFms
	zi8UYODlo7TS2peQgWSHAPHCaOZh9Fg54LMsdZSE0pK9rpY3E2tm1xZwqDFa1YbX
X-Gm-Gg: ASbGncuOQau9M/jYA9bbo2wNn0XlkKgGDP16h9QUA2UbGPCg2dEHKLJx/R0fqbhkfWV
	q3FEdFB32kQmosudBaTtt4A5VfRag1BGCK42NpvsQH/dYytVEzIR1JakixW2cLMQnFFKYWWcNpU
	BgBtDmIfy+hAvURPZ+xzdSOurCA7DvqrrT+OHkWMAjZtN3txsEodNVkW2C5pBnVIKTNdSc+MIrv
	mHC4K0KCRtzkYCcYsRGBq7lEZ+MdZiYrUX9fTjLQuFz/eSkLASE7TpbadP+OBhzBIyuQByhhtP5
	4aTuEw1rz0pvFa0MNMtHnvJiEhuJSMc2xCfESegR+esWOwt6Yop5IsNaw0+6GkahsHmLb1K/lfn
	S65ezjWIzPNvbU0XoOa05TviFuSDEHh17AjnvCKKYkJmRs8vtS+Pdqe90/b9DglccCFUGpefY6x
	fCqEDoKHBi3ZrLDz+2pDqiX5C2M+oLZO/19rZqatgIgIqt9kGI
X-Google-Smtp-Source: AGHT+IH0L6U/R4VsdmXSFhmnlno+WupTKnbItTruvg2OhTnaAnohq6VjdZoTRSoIn6lvf83XotQJfQ==
X-Received: by 2002:a05:6102:688d:b0:5d3:fed4:ac2b with SMTP id ada2fe7eead31-5dfc54ed3aemr4551501137.1.1763472126044;
        Tue, 18 Nov 2025 05:22:06 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b16sm5773682137.10.2025.11.18.05.22.04
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:22:05 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dde4444e0cso1892843137.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:22:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXoJTaKWS6YkfKcab2V3/I9Te9AR1rqWoH8YlCsZkZ5zs6IKxKUPtykqXQHEOBYlUq+mwxui6xOcP82PBfyk+MGqA==@vger.kernel.org
X-Received: by 2002:a05:6102:390d:b0:5db:e0e6:1b47 with SMTP id
 ada2fe7eead31-5dfc55688c8mr4951691137.19.1763472124716; Tue, 18 Nov 2025
 05:22:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251118115051eucas1p15f688883a4466dd7cabf3550a798c060@eucas1p1.samsung.com>
 <20251118115037.1866871-1-m.szyprowski@samsung.com>
In-Reply-To: <20251118115037.1866871-1-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 14:21:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
X-Gm-Features: AWmQ_bnjjds2ROTFY_LF0JjQ9CqJzRgGjh6ZD1fzHamlMqKfyof10aLGvuq8Ggo
Message-ID: <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
Subject: Re: [PATCH] ARM: exynos: Rework system wakeup interrupts initialization
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC Robh

On Tue, 18 Nov 2025 at 12:50, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Since commit 1b1f04d8271e ("of/irq: Ignore interrupt parent for nodes
> without interrupts") it is not possible to get parent interrupt device
> node when no 'interrupts' property is specified. Rework the hack used for
> initializing the Exynos system wakeup interrupts (PMU controller is a
> proxy for SoC RTC interrupts) to get the parent interrupt node by
> manually parsing 'interrupt-parent' property.
>
> Fixes: 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for your patch!

> ---
> This fixes the following boot failure of allmost all ARM 32bit Exynos
> boards observed since next-20251118:
>
> /soc/system-controller@10020000: no parent, giving up
> OF: of_irq_init: Failed to init /soc/system-controller@10020000 ((ptrval)), parent 00000000

Oops...

> ...
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address 00002008 when read
> [00002008] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00026-g1b1f04d8271e #16162 PREEMPT
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at exynos_set_delayed_reset_assertion+0x5c/0xb0
> LR is at exynos_set_delayed_reset_assertion+0x80/0xb0
> pc : [<c012b9a4>]    lr : [<c012b9c8>]    psr: 80000053
> ...
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xf0825f30 to 0xf0826000)
> ...
> Call trace:
>  exynos_set_delayed_reset_assertion from exynos_smp_prepare_cpus+0x10/0x34
>  exynos_smp_prepare_cpus from kernel_init_freeable+0x94/0x234
>  kernel_init_freeable from kernel_init+0x1c/0x12c
>  kernel_init from ret_from_fork+0x14/0x28
> Exception stack(0xf0825fb0 to 0xf0825ff8)
> ...
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---
>  arch/arm/mach-exynos/suspend.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> index 44811faaa4b4..02785342e0c7 100644
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -192,6 +192,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
>  {
>         struct irq_domain *parent_domain, *domain;
>

Perhaps add a check:

    if (!parent)

just in case any of the pmu system controllers ever gets a real
interrupts or interrupts-extended property?

> +       parent = of_parse_phandle(node, "interrupt-parent", 0);

Or of_irq_find_parent(node)?

>         if (!parent) {
>                 pr_err("%pOF: no parent, giving up\n", node);
>                 return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
