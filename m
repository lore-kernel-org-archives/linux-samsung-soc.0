Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D3B40863E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736364; cv=pass; b=WD2rZVoo2RzpLLmEivtU6rgbwl3K8nrhrqi7FH/5W3JQvIN2TuTNaaD0c+64eLkbwVqaU8EMhHHaqLhCtbsV1I2N83wIJHh32PGMkfULHieMMCcPBZr6VIJsTsLh+srVmtkkL9EGpRgUdTI3hmF7my9/gA7EOf/aJIv6wO/b5Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736364; c=relaxed/simple;
	bh=L8JaU1cFQMm9KChrGufXeN5dKBFqD7lhpptMglX4LMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX+3UtCh2SCtD8KzdHBp3KZyiQj3+n+DMvGOx9NG5Mqg3TaoWCJbA6BkCWirf41NPAgbnZExIQ3raPpepVhNgwnAqfPKa0npuyvC5gkdP7vwN0RTIloONbAmhbu4tpqYfUC5V+XsIan7bHyOcgWxAZlItEoyHkjmojf6lWWIovc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGuyXLnQ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGuyXLnQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso1761410a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 05:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782736361; cv=none;
        d=google.com; s=arc-20260327;
        b=qdje9QV4EFbjgGjuSRZaOrLElPha+TOqmASivHEHxOqbofisJqdNOdvuGt5UhT2hER
         F9KJW4EU4Q+Bq3fVx1HWfb3X2CJUdxVxHGG3Pk+tpwSPKJFk5OJHcHH5Qex6X2EO7MZ1
         TuEFF3gW2uqXmypT2d45vYuQMPXEVI49S8oyARhSYRnzqaz3D0lTrXdZvV5/3Yk5aBqa
         j5qWkNE5sBwvtSLEs3WvD2ByWtwFBPgDLFjtye65D6UedL6ELFwL7/vMFzBWTmkIjiSk
         mqW8Vk0PUGWJH4qRlvyiAZGzKwkItrn/SyI1fBKmpHNINKFPaNEpFOaTfke92e/PooBo
         pZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        fh=ZbaUkDsxDw7EvddgnPYzIjRUn37LqKh+wOfw8Rn+YUo=;
        b=l4l6gLJ/gXtzGAay1SODplPZZwkt7ssVFCaFhdgaL5bYvjKPttcOyjgXjTAWKn44vb
         w16wn5xaXYjBQT54gXsdrsvK9ZUJKy3upiD7RSIqvQBsHLtkoLrZZBtuFAn8k5DSQCkR
         ePoYw5W/E2ZpnExCgTpTPmDsCXPtguTFiCHSXtkx+lpyD1KdK/vg+22N6nZhsB5j0ECp
         Mpf7duG/HrUeF0YmYbY+2MghTaFSKu27PxY1s8K0sTzJFq26FweBu1BITwj+x8tlZSbe
         VfaWmf0wrN6IPtgbf5EypTd4JUWZw2ILZWOsEr8cDSc3e+ZyZxdAG9C8cMZNZG5Dw+1A
         iHmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782736361; x=1783341161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=JGuyXLnQL5sz9BH6+VPjvQeoF3/judbJARvJ0xkTJSpwa3rlW9fTCnYBr3mSjiI2xB
         3Ac60HX+i5+KJAoVOEBKs+x3EUrHbziQNfLPDONqowB+t9HrmkDfyf1YK0P8vDtScu3Y
         791WtF7RyjGrvlOAOBWeitOkmZzwWJkx0f9z3W9jhD4iRV1xGBbKtKyvI231NsXMyMuP
         LDLPPtMnXTbWN/mUVqzpW0vlEevdhFAu00He9KdLufz9D/UHuvLWxDOjj5tSixQ+mR/1
         8jtGvG6Bgzl0NFhPretHBnDU9dB/73TI0SSZKc3sVk/29lR2qq6KpsiAZTLvkZPSIX31
         diog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736361; x=1783341161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=D28wO6T+NAfxMBoYHXY6QPCDhJrf9h+Bouq7UUAfKfrLdUaKcNpcY9sDBzPLzjL2cS
         RbsuH0g0x8TwWmXmwig5W99UpIGgHXCg0POJS5PFGwFeY9/Q0mSEDthM0NG2lA/oJ3R/
         Bo0W4d4Xq2m9R5qEZepEEofJ8bVbFGrOSDcQENNz/uZ7RTPb4FdI1sLWqP0heFLP9ID0
         ugA+eaC5Cxc4EFBe6ETpUj0BgLGrPDGBfUQKJ5j6vBqKBBrLBbr7lBpAB4FKkkmmeiX9
         fN0fnDsUFDhnlVYIZuU4QX51I0oAD1tj4p21KtW0hgvDGkYYQu2iZ1kxPRJERv8uF0hh
         X7eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJQYcNSfYfzMt+JgxmP18bYQANZqQCdB9QlsuuirAZ/zvBhs3zojF1BuXyPjpcGmM/PTwsiui4Ueachkluhtqhag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/p9l56jwF+YlUcEWRPyCFLElyePAt9oEoclQh1SqAQH3plVQn
	8N6N86zynGG+UdHED1Rr9xelVOXQBzyXvy8gjLWPdpmWDYZUSNCRLCbMs+g/LQcl7IIvhKjWdOV
	TPbcPWYdf5pikMYFE3fGbSFDVjIB4eCtv/jQcAfX/0VKfRGIB9zPxJZY=
X-Gm-Gg: AfdE7cl7wUZV9G/Xi6/qqqedLM9IFVpsCCkSD/LK6L0RX+nG9VSEDw7N9oyU7oddExD
	FH/JTOvMJc+0X9XqrR1att0Jn/p6a+wIEfUcdFIrJctpiLHNa27mk0sCAJuWtlJvF164V6JwRpE
	aoOJgOzEs6uoICWvTQzkEEtn0Ri5GNsfi50BVQcQtbZh1OLtop2t3SRhcWppw02d5UaF3CgfzB7
	8SAmLss51yjPTb1LqI26U6zeCYXWdyCFPPLc72u99I2vnWFHjdhB9JF/CkJxorP2R2X1xA4z5dH
	9AzUVcb5lXeGkblx7Tr9aogrkA3xlg==
X-Received: by 2002:a05:6402:35cd:b0:697:d475:9692 with SMTP id
 4fb4d7f45d1cf-6983630b4camr4695431a12.11.1782736360872; Mon, 29 Jun 2026
 05:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 13:32:29 +0100
X-Gm-Features: AVVi8CdLbhp4Di9rmkSMap57ieyZzpxVCIoG3c1G91VB-Ou_IfcxhglJYrQ6uH0
Message-ID: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof & Denzeel,

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Correct eight PERIS gate clock parents to match the hardware clock
> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> default source.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krysztof: I was thinking, maybe we should establish a new rule/best
practice for Samsung clock upstream submissions whereby patch
contributors should link to the downstream cal-if code for the SoC
after the --- line. That would make reviewing the patches' correctness
a bit easier, as the downstream cal-if code would be readily available
to the reviewer.

regards,

Peter

>  drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index ee3566b8e57c..df5928833b23 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
>
>  /* Parent clock list for CMU_PERIS muxes */
>  PNAME(mout_peris_bus_user_p)           = { "oscclk", "mout_cmu_peris_bus" };
> -PNAME(mout_peris_clk_peris_gic_p)      = { "oscclk", "mout_peris_bus_user" };
> +PNAME(mout_peris_clk_peris_gic_p)      = { "mout_peris_bus_user", "oscclk" };
>
>  static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
> @@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
> -            "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_oscclk_clk", "oscclk",
>              CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
> -            "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
> -            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
> +            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
> @@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_GIC_CLK,
> -            "gout_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
>              21, CLK_IS_CRITICAL, 0),
>         GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
> -            "gout_peris_lhm_axi_p_peris_clk", "oscclk",
> +            "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_MCT_PCLK,
> -            "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_mct_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
> -            "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
> @@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
> -            "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
>
> --
> 2.54.0
>
