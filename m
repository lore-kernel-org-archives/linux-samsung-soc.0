Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12030B525
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299711; cv=none; b=g+h1WbgdJmSLydSKnX7UBWEBOIFRux8f+4gg6u5/pMsmn2H2hmdACEM7KI5TtTTTd1H3+8Q6YJtuxfhmEqc6bgm+yWoExovUUiDx68jRIG2lT1JTlhmSFA+LPwd5bzimVrZhINT/2yhnL2sr1Xjb7/PCrPyivwfK4ADtYdrbyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299711; c=relaxed/simple;
	bh=YXBUMz5vGaUA/FkR8v+yvZwyJDwVOrdh30LVLAsVIPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iK67iKahT2+MWrHjyhqLfurIJ8QlRrJHfDkX9crUmv1QbwGOqj+5lfi0e3ULaTLzLoauEiuJIzSckJVpaKcQu1E2UzHeLlz/73Z4dGirXxUB2zQMuBkglb7SCCvca1L0jE1d2viFfygkyRMbffRAsu1vjDlOISHZz8WBy2YrQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2b8IKVO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2b8IKVO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6536e4d25e1so395746a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768299708; x=1768904508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujA74UFzyY1R7k8wF+Fji5Xa7ziOl0VUUEmZ6sQVnWc=;
        b=I2b8IKVOYRQZ6sZsYnL9CVhzf9B2GVErlZ9xyQgARb84PiUam9vu0VJhQp5VtzEQS4
         VbxVApz64LBGmRMcRWyZ+nrNdPhEwhK2A5ZL7XDJ4WhfAP7vhFwFSVihCifktbgQ+FvT
         6AAdVW7Ejj+gRl5Zc++jc1PNrBgGsCUz0aQlzkR3ElkuJjzomINHqdWYO76n2uK75R8e
         Dq8nR0/gxXRtqUSt/SmeKvi0NVBeCGgzGDtEywaeINH7hHQwajv3B53L9p77r3q81sUm
         pjVUjaZSL3pcYWZnx38tpUj9a0V0kK7A9mLfT+UbNBnJMij6I85v37YNBvXYKU9TVmGk
         WFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299708; x=1768904508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujA74UFzyY1R7k8wF+Fji5Xa7ziOl0VUUEmZ6sQVnWc=;
        b=PNDUzelzKx9RV8qAZfVDdzKe1D8jodeGb1GMfxlFQJ7Y9yXIYF2GJheBAoQv1jhvHb
         yRbIq6CY6aZVAxkohGhwQMA0UphG4Kqoc+NctC9ftL/JgIVnoQi9lGz8i6W/wPqJJraB
         aHJVgoovOwobLUceIBpyPYJw98+lXM2B3lScs0vu6PnReh2T8trCRBUMmHogniRzrliB
         Kbiw+OH2Ghmwv6QPKW3iHJSyo17c2MLL/sHkX8lvqIGWuVcfmpRptyd/nBgjjF/FEtOE
         jtLA2Pbjci7TDqujcf7LaDDNaPY+Cl326l8fDQg9LCf5UPZ5y1Twa2N2RY8PBHg1/u9N
         BShw==
X-Forwarded-Encrypted: i=1; AJvYcCXY2ohFqkvF+3fqNoDnps/1PKXtriAvsmCvQLzHZ073fmKF6+2l/KU5onrKn6aKRKyga9qFp6lTOHNNHanVH221rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhawfdEizpe/LnRODb96E4KIUYdgzJHIVqUYv0CqjTW9b9x0F1
	Nj3PvwPRr7fUkkqiGMhKJnhckHj3zwcyGTi5lMxtblncPKDwyce++1qoIwAYN/gaGt0HSHMiXaP
	8m0rW2fWKLN+a76STNK6E7ILnKhG2I/QX+Lt7pmBIkQ==
X-Gm-Gg: AY/fxX6C0ev/dvWV/NLI+J3xtRK+jja4DPCxQNdPkdSeU95F7zja233k8xFLhcZlQBI
	RmAYP22/H6aPj2TVWc15DwLJd7d27momCDvW2Z17hfPnM39OZeQQvclv71pv8uTm2ddBVkfTAIk
	Ka8MbNsNMuie0G3zW8IPkS7xuOb/R/ZInZRzVEBOMj4A7csNqLnihjQNm6aECzjLWL9I3Q3cpeO
	8CwdMkcA19NQeQ2rch3QScHoazIkzExVN8shm3oAfpUtQueRO2A4jMSKJWZC3DNhRCy9nMawlvk
	6k6gdEnT7dde1r+9jjixKyCvZngc
X-Google-Smtp-Source: AGHT+IE6Wy/aibh8AKdbvQrUZa3QES7svhGaiNX2I9LwEcDIqqUrH20FYSyHYt1NDfOmk/19+sQBut9iwFovaQ/hDUI=
X-Received: by 2002:a05:6402:5247:b0:64d:65d:2327 with SMTP id
 4fb4d7f45d1cf-65097e59b47mr21305946a12.17.1768299708020; Tue, 13 Jan 2026
 02:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org> <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
In-Reply-To: <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:21:36 +0000
X-Gm-Features: AZwV_QjOP9Ch49Q2hgsiMLNrbriy5_cS7vekI0_2rDle6kIOrdJ55TM-KAAjG_A
Message-ID: <CADrjBPpphmaiQRWhncxFPur0x4M-wY1FbYi_k4iTAHB38fEd0A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 15:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > cmu_dpu is the clock management unit used for the Display Process Unit
> > block. It generates clocks for image scaler, compressor etc.
> >
> > Add support for the muxes, dividers and gates in cmu_dpu.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2:
> >  - Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> >  - Fix dout_dpu_busp parent (Peter)
> > ---
> >  drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 283 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004=
ff5ffbc9a19320cac 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -25,6 +25,7 @@
> >  #define CLKS_NR_MISC (CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> > +#define CLKS_NR_DPU  (CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)
>
> Between APM and HSI0 to keep alphabetic ordering :-)

will fix

>
> >
> >  #define GS101_GATE_DBG_OFFSET 0x4000
> >  #define GS101_DRCG_EN_OFFSET  0x104
> > @@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu=
_info __initconst =3D {
> >       .drcg_offset            =3D GS101_DRCG_EN_OFFSET,
> >  };
> >
> > +/* ---- CMU_DPU ------------------------------------------------------=
------- */
>
> I'll do a full review later, but this new block should also be between
> existing CMU_APM and CMU_HSI0 blocks to keep alphabetic ordering.

Will fix.

Thanks,

Peter.
