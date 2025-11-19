Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E332F746
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542829; cv=none; b=hDkWkgWSW3uvHonbaAhJwDBMe3wZRmAh3XC5RN5jogfCiP4y0CT7niyLfIqylEwUf4Jv3+HTHtHhZqzMcjDIU7bpCQRZVgcOlERDCR+RZG8pjcQlJEmJ826jjD9Yd5Ntb+PjrtffnWs3WfE8IVefOzU95kaS6de/txDmKpzm2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542829; c=relaxed/simple;
	bh=x1ETO9gQBzCG9IxfyuhO9nUfEDSqlzn/l2nzh3hu+os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKu9q3ANTH7OR8JKDvACopST1v+/0jG7iQFiG3VMHdRRjrDch5K0OlOKyKT0H1gngRmEf9H/x2RMBtuPE2Q1hJrD5+KmrW10ilm+OFn91vGFSi9yQlBeK6DbdMc2cSmlC9dV9w4eHMRqak/DmFcHJgAhMtc2WdHdRIyoOZ/NQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6230568b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 01:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542827; x=1764147627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS0PIRW3Q0/zfkvWSrpPbMhxA5dRo1SmIMgccBT+00o=;
        b=joiBoyIZSvl2Kns8lq6zxlVIZqyfnzMPFjHJAGoowFwr7vw7LGwpZ7kzE+IGJTRXGv
         aujLXsrMSgqFinm4//flgBU7ZmmDu3HaOVbxmpVUUETPo4t5No9jljK2jPPmpYswyev7
         SYtuQmfKDrOz/qrbfBLBHnwkJYUuSJtqDX8X5mobEYueDZqKnj3vK5P3PKZGIqaMSD76
         rzDWDa4aDvnXWwLfzb3obbpdXLzxcI05C27rCwZnDf1BGYIpGem6GTO/JIqq2iPVVE5F
         otio6leqZMBI0BhEBJnlcQ1Ge/yJqHuI+22N0R4MObhQc0RmH+I/P9n1q5S8ztjqHU0H
         +WsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuBosxqaFu5E8THrUDtIPeLCCuGrjthwFxpHQIN2GZdNYl7cYaSdxVvmD+ZP/Lvq1j1AeipvzqReSuPeYORvMwFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywafrtq2C2l26UA6/+hRR2efvJZjW4z0UD8iME63abEcM2Z3O57
	v3f94NpCbtQDSPvh7uz8Eyjir6yXv+G/JK96fHrlyKHPjq4cqALyqTCTBOcuhbQc
X-Gm-Gg: ASbGnctTqiSvhBHnLVZi0nZhd2KkiO42AeyZd8yRn20PJ83gxglJDIN9DC4GZsImomU
	mF181qyp1E9swdsaSRI6KXnZZhjX0rkaEXpz7pWhQWHVAmMZQ5vPR+b02Cdi4EANPfk0+rbb+47
	+VR9CVojwF6PNK1iQ18j/tgWUhSWDVRMq65Li8f9f4Y935oKq65MIXO5vwt6vGtslNH/P8/GPi3
	OqoRFDiC4RokrpV0xHkCSbWglzg0l2NdwGZAd0ILWkS7SFDDPIq/3/XenBMeP5QdQqOJlahXliH
	kAOHO48k/8p6VZr0K+8+REm80xn5K4UXF/7nPpl1Jwrf5MUYIZnkj8UUNABpjob1c9G7PidFKN4
	h5FnJecVuCCNbGnJe/BOTdfdJk3/y8g9llDUIskrtMsKh+ngPCv/AUA5aGLhGdMVMlP+uYgLg3v
	PtjGuMqfYp9eFT187HNNw0DMufIndsN01fxuAuMeSRHNXKJ6hkEYgEvPe/xDN0+7w=
X-Google-Smtp-Source: AGHT+IFyWvBiuFYv+5J336fox8UalWHwJvixNxU0150OMAKPBnZMRCbWk/I7WlNvv1KYGrV/y7FZog==
X-Received: by 2002:aa7:88c9:0:b0:7b8:d12f:90ae with SMTP id d2e1a72fcca58-7c29de3b6f2mr2537841b3a.21.1763542826567;
        Wed, 19 Nov 2025 01:00:26 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782ad04sm18940939b3a.61.2025.11.19.01.00.26
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:00:26 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7306964b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 01:00:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWg4SPS2IoSSl1xy32dKoRcbtD6UFBR4HkLMKJgNUW0LzR26LOwc0q/kIuL1v+DIJoMCAa4bSkU2SVE3ADziwqOeg==@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:5df:b4a8:fbaf with SMTP id
 ada2fe7eead31-5e1a6dfeb50mr481222137.31.1763542404865; Wed, 19 Nov 2025
 00:53:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
In-Reply-To: <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:53:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
X-Gm-Features: AWmQ_bmK2x20bqzBbl34KnFcBc219BFFPGMTWyPQr3AqlLeaP7gK9n05hJwL6mw
Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/11/2025 20:34, Mark Brown wrote:
> > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >> The Devicetree Specification states:
> >>
> >>     The root of the interrupt tree is determined when traversal of the
> >>     interrupt tree reaches an interrupt controller node without an
> >>     interrupts property and thus no explicit interrupt parent.
> >>
> >> However, of_irq_init() gratuitously assumes that a node without
> >> interrupts has an actual interrupt parent if it finds an
> >> interrupt-parent property higher up in the device tree.  Hence when such
> >> a property is present (e.g. in the root node), the root interrupt
> >> controller may not be detected as such, causing a panic:
> >
> > I'm seeing a boot regression on the TI x15 platform in -next which
> > bisects to this patch in -next, unfortunately even with earlycon (though
> > just earlycon, I don't know the platform specific runes) the board just
> > dies with no output:
> >
> >   https://validation.linaro.org/scheduler/job/4252918#L409
> >
> > It does seem like a plausible patch for this sort of issue though, and
> > the bisect converges smoothly:
>
> All Samsung platforms fail as well. I was waiting with bisection but
> Marek was as usually very fast:
>
> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/

Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
properties, but no interrupts{-extended} properties.

Does the following (whitespace-damaged) patch, to restore finding an
explicit interrupt-parent, fix the issue?

--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
                desc->interrupt_parent = of_parse_phandle(np,
"interrupts-extended", 0);
                if (!desc->interrupt_parent && of_property_present(np,
"interrupts"))
                        desc->interrupt_parent = of_irq_find_parent(np);
+               if (!desc->interrupt_parent)
+                       desc->interrupt_parent = of_parse_phandle(np,
"interrupt-parent", 0);
                if (desc->interrupt_parent == np) {
                        of_node_put(desc->interrupt_parent);
                        desc->interrupt_parent = NULL;

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
