Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC093B9D84
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729861; cv=pass; b=Y3tdNJq/PlGojb3o01Rcz0dzjcfxYNljLplK2BiSTciJGoo0QMzrb5RCZMNgXCXN01Y0IkcMht4VsVHrYa0iSuJMhbXFTdvym1OVWGLLu1z/7IrK1sLEGk4FvG2Ibhyg6wnZ3gpUZAiPYbdHfTy2DVSuBuDceW3O4cgomP05ytQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729861; c=relaxed/simple;
	bh=iDO4j2JAZZI6/SJz0ZNmXzlln8bKUKTt/Dj4jurK9p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmXxy+0+t06iWeSoCzJ14qikVbnf77hZ1pnmmaWTpmQGv47TZOnfN9uyk76SK1nCmDE9cAMLaBUplTgdkc0no5ejYL+5QQaaOhiKlRqWa0SDmQNcpTTqWvYgmr1xFiLRYkfhUe/cwyyN9jfmLWycEh7zfWwWl99ADLzdLWUrA80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYwkTSNy; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYwkTSNy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso4075193a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729858; cv=none;
        d=google.com; s=arc-20260327;
        b=FT3UKss/AQj+N72RMstoSagRlTDjsZd8QU4u2BK0GygQS4Gm4loHodMu63+EAsN/wM
         mtiwB0gZfnC811qtd1MOZzXzn0pX8gEoa2qwieDubx9Jv53OggWM4RqdiLCmC3nlaMHC
         iI3kqOg2I42so3n5zfJBj9ZN6rz8sykAHubTyS257AgY/erefBLmIC6DTW+spblsIgQs
         pFOKFatU4pk+RFZHtCVnUUA0yCHEXrR/ndUeqVzeik6lGG7xc1dgnQ5P7VyqWdDJXEXJ
         4MkXXNc7UgrnXfCGx7vIKrTx8szlD9g5bWNDzgpIvHJpCS8BZfkfB0nePm1+wEyAyIIB
         v13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        fh=2MULmamw9A1vbjnDL1o5sUNozon9quJycxJ4oXWF/X8=;
        b=ZtfJ+BrDXOLP59M+V+nbQ+csEAicQKjmB1A6NSvg/Ce/QTE4vXjpy1p+XRilZ2ytkp
         LipJo+0wOj/d11Ej8MUapf40/TnJPxxX/jMWA1yWZrQgYgDepMH58q1c9u/9RMvmDvmZ
         J9wQwGfxGJeCATwA9D9TWzETm0fZNi5iSYvNJPh6c243G6+Hw8bLfBhc+QQUHxljB0ON
         u9r+sSQa0LdIX3HfO4vsPh6MeuR7L4cAHHTv2xPjtYoL8YKM/YEX7KxcThbpKjNP7dWg
         sM1w/c/dkiGqEkX1a2MYmJySE748wgYlRlO6+oYhieXk5PngLfnqEMRK3dX1g7ainAhV
         eOPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729858; x=1783334658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=vYwkTSNydHDJMWhbVKWp3I0A/xVS9T1wUnB7DRi8/z1KJKysqwd0m+tNU6a7mIqter
         81qyJTlFztmPfCOU08vBZ6TLf3KmdjYKvrh0PNSfr2FVMEpPBlvHSPjAII0F5FhongtE
         lCLvfP+yYvcQ+KyYst5BxA5MVAeuPx9EIorhQD0rwKrduR/aEKB9/0Bjuwstj8EjVETg
         I/vsZOnVgQxYvnhMPv0MG6WoNRUdo+TS/wTgAxNxH6TalLxH7uZsaLJ+aajCSxXgfwg+
         htXJAluBwnzF5sQed2QkKuHsFWARL6sy1lD2FpKWCc3OYlGND1J/Swh3ME7e4cXGLQ85
         8kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729858; x=1783334658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=awbwWnhuqyw3ATeoybXOCchUzGjTkOKpYj7SQ9UlRae5KDjZsMhh4GItwgrEPzH9GP
         Ch70ub23ewthD8HVERQzjq0ItZMheGsB1+3QoLsF2fLf7xijkbv1vOwVn5CXmMrSB2qW
         TsPranUvb9+p/tRewvJzHfGuA4FbrGXYZ2LYCr4WLPqQAU5qAP/q26ZN234YUCxh5INN
         MU4odXqZqF7wmzUvliCdoPg78HIcVEDOAKgZ7AGI6meaV5hDvorLK31Im3CxfnoOOwhT
         oKZxCdQG2bLBgSXE2nAvDDBsvJrkflsoGmdcKA+ugEl6AAPNOj19MOgoOv5OvpVmIcCn
         E/LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5oXj2laivtEE3uz16B3T66hDDoLG+b2tm8ubhrLlaZjr+uY+GQ3TeXLT+8JL3qwmwUaJlZg+3sApo9p6iH/B8Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9nepHhSSeNiK5swX7fR3MNLanc7dx1OmjsnZFDyKUrirriSF
	EN/3WhDUzPavpb/mArcGoa6sH4GzQIgj/Uid4I45nlSIhl3QoVP5gsSioG44bAlHYWUekKaAxcB
	rsHwK+dLvP5HjhMjhapqUyVhFTcowcDHJBe+tBl4TGg==
X-Gm-Gg: AfdE7cnm/pxKHbtB6qr7sXqUNJMSq5yWGWcjUjZZLyXipw6VrXCksF9PJh0Mz18qDDa
	IBF0kC3GWvJva97m2qn2LWfOAI9rQyOjZV2cI6T0v/ZeLSpKaiQTm3potYz5PukSSOmBrjWVNCT
	doIRUg4wTMKHnK257iVyTnOzrpDSQ0bEpCNxB7ErysJYYqDiCVhifDmjz3tbXpA0gA+R3kiPB9h
	GJvQhy+V3XC69cv/jzwDa3svlH2wQAdBNULZjrSssF93lOgmUPf9foxjXKdFhLJUP+WvLCmfrwg
	POeJeyEzmeZA3umrhW8e47/vLkgEoA==
X-Received: by 2002:a05:6402:400d:b0:697:8d48:7fa7 with SMTP id
 4fb4d7f45d1cf-69810ae01c2mr5980595a12.22.1782729858308; Mon, 29 Jun 2026
 03:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:44:05 +0100
X-Gm-Features: AVVi8CdUhgADG2xSK96hAWTQ9tVWRhtK6fekJr5xsrWPfeyuxnqLTd7JZu91VDg
Message-ID: <CADrjBPrCKS-_FSFaL+124cdRioGOEvk+6HFfrJCGt7HB983rGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
> Management Unit sub-block and update CLKS_NR_PERIS accordingly.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos990.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 4385c3b76dd6..ee3566b8e57c 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -21,7 +21,7 @@
>  #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
>  #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
>  #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
> -#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
> +#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
>
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>
> @@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
>              21, 0, 0),
> +       GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
> +            "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
> +            21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
>              "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>
> --
> 2.54.0
>
