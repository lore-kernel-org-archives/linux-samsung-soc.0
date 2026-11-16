Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852398;
	b=XQhg4O9vtJEuLaxt/AeQ2AZMIoBvZI1fiT8xOEGU7elrclkt5AuNje+J9pkDq2XIY1C1
	 bWoKrdjAafg3SwPscFHupMkVixB/V8H4/80N9ynT+VfRKC9WMS4VHTBZoBRo9tTRD0pex
	 YcNoPzAtYDxWvXBml+HAgoMTbQp+IjNiinD6XgYd26J8vBEtVK+oqkKZfVSseku5a94j6
	 H8Y4NmUqiIhbu4muRPHt24bbx1XP0ZoJtYFCeG3wnGVk7/cnSh4itLSP5GrAY8RyAA92w
	 F/PiDQUavLd8LetPhA+93dzFQHQmreGGX/2ywwSEh6Xymv51i21mgBN+dovxJcnbQdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
	b=3CPp2VR7Die7OpBln5ljLNVPVIe/Vd1r5X1cH6zEaFNXdyIpvyGuHAaypia8rnGDCD/b
	 XRA4GDNsYN95k5AYhE8mNXbi9xMQQbMyH3zEVdD797Evs5YVxeFAEvFEZ6wNqQ5sy8w9f
	 byn57rqdZlFpVnKi/T67F5F6X81BSt9x6t8SrTxFSdqo7NgfTpqBwges7AgA2WUU3eFeU
	 1oGyM+pJ4MFPvxKbToejht4QO4SLuHghUiqq7yJ65qArpNCYzEWdxbYS1FYV+NhcKjzGH
	 xUG6X1bz+b1sh4nEjbDu+Tt4w79VuzIS5xd9/h1exBuEdX1BvNuuNhoAoeLRN+JRknA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634B606A31C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9634B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so4227861a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852396; cv=none;
        d=google.com; s=arc-20260327;
        b=VajkX5JxpSLyMxf35mRk2t/qG3ohX3aZJ3VOjKqwEc1FiRTnHf5cCP1IFEmcKUCTWK
         2yeRmFUMP3InpSETKWOXjR2MpjGlV3It7/QQxqeCysasbwtrs9zBWgOZ9C9ALJdeGApp
         IWcjyo8xp2NNtDSu4HXy42p+PHo5cqd7vFxWqrz0mtz1OCmR9Nn7AIGnrJkxlMO8P6La
         wbXJaVG2E/rXCYZnxr7NguaOc2ZzmUuydt3Zd7r0Z55D7t7nwzm2wP9bOyazpW+Ggrnl
         KtOKa+eTh+qxjqBaajOe1S6sYoNjZgjMii7Xa/BYGa84+oRtVjZnCIaLQB3jcZWi68rS
         8fOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        fh=PvoUBZdlCHCkGUzgMRy1T2peU9e5pd78/TE3gSI4r4w=;
        b=TiZo0bdYwZqnRknUQGAxw4xaTqcou6RTOqx0Hn2Olf/HjfwiLSAebqcfsvRMDDXzj6
         4aVig8TBWkpYiY3gjJAMj7+zTdC1XPT84gUEvARQvmoXTqZT8l62R7QUQFQKJFUtMllk
         3rP+t+qZcHpYVLaWg3CvvdeVzoH740xMM9nvFoAlJsw4ZhaBZQBQdoc5VgLIrNgSK/pf
         W9ycI3/Y252a594g2++J6MUwHjJGgVP/4ABM9QLqwzvuNiB2v9lPz4B2EbP9yhVvm5El
         SOKWplKaBbpc9CaNoUTK5UrbGKhgICkBuUksx2TSZZsqrNtlrIcoJQrD2Dt/p06hUARV
         vk6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794852396; x=1795457196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=kmfEtmJSUQOj12O65RS6VbY1Mw683v1ljPvF36Xaq8xyWwxLcE7Rgpv+P0xUSOOzWS
         CBohX4JEJNdoeAcC6jydgpFDt1yU41+HXutDjQAdyI8vLLYBoI/h4Emm3DiFQfqcNQUR
         ypxdcXFHdYJd6ZaX146We7oygm0fSjC2yeM8PoUbco8QbD2GyNZxH/fdgbsFR/SwJvJ0
         YDxEGIMYJYTUooX4Xp5OmSdS+fQ41EkMyu65zgulLxKykbDLEkMOPCpoBmrMKZQrTqxO
         KU7rr9M7eUtWKa9Fv0ia4lwZPdGN45eJodeXwq8zBsEC1Ei5SPQXIPFCGxuJR4mijPDa
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852396; x=1795457196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=r6x6LA7dNquhnZ4rdxTbAdbZwa3WA9X95s2uGUzR1d4h3Hk/MPpP5NGeFfjrTBlkeL
         BwCo2TY6bBT/Y/JN0X5MJNoa1P7gIJCcURrkaFxoSIVXJc5g3FCyqAMDl6cRCNQg2su+
         8cs9Ey1ssNKzD5MkZ9PnUT9/pLNxHMxxb0UMPMZL2BT3xrxMxtvdTs6PDsLXfoREwjxW
         uEPUNTpvr/zF/62e2DH92sQpuLqRwL5/I2IZX69ISiAx8T0KhdLABIdCGIjUDSIGwmR6
         BALsqTj4A1W9wMS/GLtWWm+y7S1NNq42J8WuSE5JLTq71GB4DRIv/GX5cO6vth+Myogw
         iIpw==
X-Forwarded-Encrypted: i=1; AL+hErFUWgZbLxXr1/XDHx1bkm3qP1WFPbYsA4bw32kFcX61zeGvgv3CTRv4N47QnDr/GMcnem6Xh+zbMXgA79+OiD6rnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zbYXdXacnkfZi6rdACEqTEcTxxeaOi4Ef6oJMo1MDqIh1Aof6
	bX1qlpeJliiwlYMPZ7bAUe72Cu8AOE91XJGolC8J9BEGvBffZ0FHiv4G48YhDu6Ou7qE2XH9YWU
	6enATfsrJu2yNHRr5aCFz5YuLwcyeuDixLYbiVzkuCw==
X-Gm-Gg: AYBFou3vzKG1Vw37tdaj0WQiAopGHSFDG0PjhiJlb9p9BumoE63C6YGOhpfQsjOgL5A
	D76tCUNnvNDSqcfsD9tVS+qXAxwQweQihB3TFal7JbaJuW/jLhOavvlFZV6i5ILlbHAqZ1iKEog
	pGh26DwTB+xGMQfQbrQdB0+xczronAIhRLqpB+NGevxdNo1+cF3XBDZtosVrGVFBIhg1pKddnTj
	uh/ml8aro3PQ/g3gbr81hC3ykPRwc/2lQFbLQSjs+VIxFOdkegu66bfe5PGY5DFHGVwZH7aR9ou
	jqWZwu13wHVzwgirboBxiIdO9owgLe+Hjm8jkGZ9J4etpUBRr5+81FhkYYdPTMEyol5qgt3odu/
	kJlEqH4J94uKQbi4rs7kMngx1zDkZxxDvnsINMR/Bx+RaVJ/8nB+4oFYBJV/+9DezXLfG126E
X-Received: by 2002:a05:6402:1389:b0:6b7:d672:7834 with SMTP id
 4fb4d7f45d1cf-6b7d6727942mr5514347a12.36.1794852396101; Mon, 16 Nov 2026
 10:06:36 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
In-Reply-To: <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 18:06:24 +0000
X-Gm-Features: AclHuK-FFknY5syd2Sq_iB3mSD9v2WzoQZ6qZmiqFZ7TfMDgzML0F8GxXx83h_c
Message-ID: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/11/2026 12:05, Raghav Sharma wrote:
> > This patch series adds clock support for below blocks
> > found in Exynos8855 SoC
> > TOP & PERIC
> > PERIS
> > HSI
> > USB
> > There are many other blocks, for which the support will be
> > added in a forthcoming patch series.
> > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > ---
>
>
> Thanks, entire set applied (even if b4 thank-you letters show partial).
> for-next will be updated later today after builds.
>

Just FYI, there were a couple of outstanding review points on this series.
https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/

I guess the main thing that would be intrusive to fix in a follow up
patch was introducing a slightly different naming scheme (compared to
most existing Exynos SoCs). The clock names being
"gout_<IP-clock_name>-<block-name>" as opposed to
"gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
"CLK_GOUT_PERIS_WDT0" etc.

Thanks,

Peter
