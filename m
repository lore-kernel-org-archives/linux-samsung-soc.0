Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794572864;
	b=axtv2E1fzweA7l/4t2rqTNcQhBg2yazRZtiWsrKtlARy28gYBmEaYR94Vh8f95L6a0k9
	 RlFWzL4iBkYqzFP/7Mrlv21cXLcWOQwp6Z6DcB9EWBX9HiDAg0R2si3YFAsTDMr3Y14UQ
	 VVb9HLV/15YxhaQFGHnLRibp1NZR3AnBrlx2sm9YA+kvjrxpBX+yWEwB183stshO9rn6R
	 8tVYp2Nf1rhfjFtRUTiocxBI/OhgP/aGDIwdzZeojAoFwRulBV/a8goOi0vBa7oDT3i1+
	 K0aDsFcA4XtJer20udkeTuMycFFhh8DULvHWDsBBEWHeIjGQnswE+A6p/aXeI07n/Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
	b=fCAz0DavJPzDAkrvxM4ky9pxxw9yE4WifBgUMBKOpIBQY8vQe0wiI5chb7+J6m8S5r8l
	 8nIlXD0UUwmqsdns2/qaqABf8Ejq090M3n5luplsMYIDH+7k/cRBKKTAqcOHQhL89TOVH
	 SDfLhZ2naNomiHC+8ocCZOXO4S343YY8Ax9Vm+B2wMqgDCHkOVTyXVhp+C0BYw8l/0Ur3
	 gXiEJAFLIgoJcdtL16QSNP7l4bvP2oUL2Yj8oJCidRkaIWGoAC1GQRXvue8K5dpEv3feN
	 uatyIFKd4NIgEw67ogmqrSZdYmobUeRzZjD4ISttkW26K8Z8JIW+QGKJ39zHzfQhNBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh;
	arc=fail smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B4606A330
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 12:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292B4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so215262566b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 04:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572862; cv=none;
        d=google.com; s=arc-20260327;
        b=D0GNeEftRLqn1DuG0HjehEbza3WDsoky6WuPggSx+5SQ3xasxUr+1RGBwMXfpObRep
         ZJJk56nTv4J/MCYb+h7JdduGB2J0YhB8JMB6fGnN3KOm4D2JT9jxzQx3FurFv9HSfkjP
         bJyuX0ne7QGNDVzmHzG45PjYiMxvwVcj4kO5WuGkTvadtljgoOYXQVlkU4AnsWHRGnpJ
         217G/3oUbnQaMmB6mKl6NDNbMBJLPOzpWMtC7yfheObC6ZfzMLimczN9qeJdGtCTxM6k
         fYHlgpW5RjBw0Qa6JzDl3wa8B+xZhgrkodEp2W3KzGQS/7V8LZ6C5Z6bVUH7HqudH4do
         XDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        fh=qyA8lQa/KxUrXnPM06Mg/8RwRp7u/YSdLqbhGj5quDE=;
        b=J1yz9qpjs7Xs+IUAmXTTC50PIDGGrvpiVz3zutC5q2eIRiqWlPj62ZIBMWeuCIVya3
         AK9uqcciBeRXcjTzf9cITqKJP5iNFzTRHMKp2WdhYtBcHQjDo0M5BvYmYQBXQxuc+54P
         ax81a5rUGV/HQ4WTFTCRg3mkF7bEGflhTpI7ChdHDkfg6oNB+NNjudSMI8GBWPBi86Ez
         hqPj0G/QAXSaoZuqnopxXn8RkFmypjkBRAKcXsApumxQVMCxjS4vE1If+bI4oB0SOiIC
         V4poeMlSnijSL59/mz5CqcGHdUOGR2G2opTKBDAGK0CGzWJFyfwGWVB5kX76CPrPxmn+
         yMKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794572862; x=1795177662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=fpPSGCQh019xgnP4jNvjti8I/0AyxGyalkypQFm2kRkMTu7+kWMkCSqT3vZEEI+z2e
         U+eSA00vDHTlcZgqCYQn+e5R7A9Cru19JflQDbfR8SUD1CQPtQ4e54v1VUTgSYsXnVF1
         YQyfHaPezpOgrJhYnKhv2Jp/IULw+bNkPw8Uqnz8g+ucj5EgaXhanvyRmGLI+QfgQNn2
         XdwYa0+NVc770n44qHjYIhgH6QidViDyNfITPg7ELnVGfQJaP+k8TkWoln0Xu3dJEW/E
         VFzbwfAG8pdVpleuiQIzGZ1XdmSpiCQv0Qg+qUHvsBNtBIK5ZwWpvkItqUdiPXv+8A1h
         d9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572862; x=1795177662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=JTl8wf66PU/miVdDIvNFfMERwOY8+Psq5cHp/f75ShOW4QrDnIcT+u5V2nony2NEAc
         yEP7HJqMtnieFmUe073DvIPl1sYd0Z7U3HyvkFXw+x0bsagLqzJpmY3FdFMErS5TlRx+
         Xx3rIWVPV+PJ1QabmJiSoQoaVZttj1Xv0qLqAcW2+Ui2ew1Vfm218MgE0Biro8FTAbtH
         b1rwZ/kD7TzKFHZOwMDzfPhW93c9GFB1Rr2dQwkWkai+Q8itzXxM9QGZW83TFrZaRekf
         4clRUBPlY6kkFvWs/DA05ZZWqCzTklZXqLD/STbKvLVkjm+NDviLy9L4f6w26V369ub5
         ZkNA==
X-Forwarded-Encrypted: i=1; AL+hErHXI4p2qNDx0cV+bWtTH76vQEuLZ/TCk7FzMi2aI9w+4ezLzgCXmNOgvibxOOrk3KiHMXcs3skVqa1zZnTUfHQ6Vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fiM1LMJK3Ggz6v7uVrvvMiJuVXmyx8w/bOcvxUJOlu2Gmta9C
	8jyv2zqM0dxD0km4WkgY+RV1XESzPzoipkZpSZAOkZ+lxaJ/WPY7sgxbG3vsTDXSzJwt6k5x37x
	b8/NA0KeZA5WUiZ29Z/ghydpU1soTezGOKsR8rGk/Hw==
X-Gm-Gg: AYBFou3cHiZnzwczyiZf8CqWbR/QbQJWZ8GBnDV+dJ0gpcj1cV3UVvh3EfW3bKfS0cu
	begj6CrW60qQR35slUiRfVerVa/LI+05MHd9mqxh+wRGr9kcWSv7vHDYgKs3pCTbXSHxSk4cfLf
	UbbKm+QbXgFHMbVE8sNzj/vkgf1/TG3ruBCbOODSWNOUPHOFNZdlIHJ3C8kE16gQXuVXiRg7lJB
	/7cREIvxc2/dtwlz5R12ADdCfNZ2fcjTzhKbUzRNKoy9o6758uBV9zqcOetzS3UcjINcoLIih5F
	Y7vhtoTZ4zdsDfKhPlGxgxF5PqL3PT8lyMegzeDWA2nOwK8uMucWceeyNySfm73tfl+q3OOuoYW
	9eRxvbh/2ntFKngy9cIM2UyKMowcsztzwqjBlBvqvcOY+3FwplsKekOc9ionVTHs0KFN+CQ==
X-Received: by 2002:a17:907:3d8d:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c507b3944a2mr522415966b.4.1794572862414; Fri, 13 Nov 2026
 04:27:42 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-7-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:27:30 +0000
X-Gm-Features: AclHuK-p51p0Vx5xI8MvGi-0HN81TalHpuLQqDi6SVVgi93XmBwCD0wdDg3iAr0
Message-ID: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> PLLs 4313 are found in the Exynos8855 SoC and it is similar
> to pll_531x except for CON8 offset, so re-using code for
> pll_4313
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 3d837bd74355..7b0756127306 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
>         u64 mdiv, fout = parent_rate;
>
>         pll_con0 = readl_relaxed(pll->con_reg);
> -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       if (pll->type == pll_4313) {
> +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> +                * which is PLL_LOCKTIME_OFFSET - 0x4
> +                */
> +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> +       } else {
> +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       }
> +

This starts to feel a bit hacky (pll_con8 register being referenced as
an offset from lock_reg). Is the register really called pll_con8 on
8855? Or is it called something else, but happens to contain fdiv?

I think something like this would look cleaner:

u32 fdiv_reg;

       if (pll->type == pll_4313) {
               /* fdiv in <insert name> register
               fdiv_reg = readl_relaxed(pll->lock_reg - 4);
       } else {
               /* fdiv in pll_con8 register */
               fdiv_reg = readl_relaxed(pll->con_reg + 20);
       }

regards,

Peter
