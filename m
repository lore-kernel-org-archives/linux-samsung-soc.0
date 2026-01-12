Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7F2397AA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230416; cv=none; b=r4ENY9nBhdpiBQXIRk5DgBHEwl1RjExZ10Knb+oE5gDD3WE09Z6exZGcZvHukCTrD/iuguK4wr1do3d50FMDmYaWDWjW6q0XzO9adgwhuYTfuvtAX0hr4bo6dbQ+S6tjh7k2AqK5z7c9Wcdb6gQ5rKF7Z0hIkKEWEsGyScdapxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230416; c=relaxed/simple;
	bh=75MQjJBAxr5y5jIsOd2DHhXFNZlk3zoenuPM48yKilI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3izdoe7KCckkAMdNBDagIrmU821W4WzfLVUf0Uq9h33y58+RP5HmpD62c97tNYM8rxChJBdwVAEMC3YwzXYQCVmY9CovQbquXDA9XWqmFf/ybtqXDGi281HAcTHVIW30Ee57Vkw43Ipm9QEIQLl0FCCW+07QE6wSjE/WtHSe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnZtIzO4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnZtIzO4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f3d6990d6so823746b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768230414; x=1768835214; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=OnZtIzO4kGV2h899ADR0q8KyLPcBMXJot72RWGn6yRyRwRmpW/bcGjHlUvfeoqU71o
         QQnojS4gL7dYJZeShxPnQhDdMteungeiKCI9Wz2Uao/ZMPkf4c22eHNp3lHwbfMOm78t
         dRxblA/rTeYzsK6JJw2DfyY1uioMZO8EeCEy5Z8fLRU6xWFjYEH0X3nApD1h4F5/rU5J
         z34Ibz7ok8FM8GIoV3IK7Jw+sLNNO+dz1eVAs98qYPH6RUx2RZ0gNMNQsvXmHo2DBA0+
         UVPaG4/udrG22ZuLc6XJgsYwDbcRWiBAffNbzS7cjl9meh/9l4gO/X4fkwm/jovYxeTv
         BzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230414; x=1768835214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=Ezm4tuRpsXXRvv89Zmx8iq0of8bX2SvHdPM+fTlrYBTOP4PBR/mv0IxzGePIPl6gCO
         4QAwSh+JRU8+U1Lwnk+Ag8seV+r+x48UJof8p6AVH2FNl9036I0e0y/jGYTzVICRWrhE
         Eq/UTRVnup5mxs89TF/MqN+QZPJqoGF+8nJhTEopMYmm7/Ey2f+1rpCgb1gH/EqxQKM9
         lk2/hUK+OFxEkolt7WDWUS1ZYIGUI6rYfooc+Dkq/JJETrLbOoMRkB3KVHiUioFncHXc
         fio8gAt/Pd1nzQtbkxaMBsCvpARALA5SRh+6piRA0/Y4d3NooYSWbqCAhW9x0VJvZKnJ
         lHMg==
X-Forwarded-Encrypted: i=1; AJvYcCWfKCsSVZ7V4vvqvNSnd/wfG8P2yKgyH7YLCnmGDuYUXHddoSAeezi9izYVjXE8OIrStlpyX+jzoyvQlvpqP7fnIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxayWTojK30GnKqQbdtCEgdGgy8PFU/lmXMDPkdk31PmUsyh7eY
	D8u7RyfU5Eb68RAzTEPUlunS2K30txQZjTUIV3NT/24+9WM5u9rfam0UGD6prfQENiY=
X-Gm-Gg: AY/fxX7786pemUXUybYFuRgVqa+njn9uszlrsU/of1N0B9NMH/izTzVLQ9URKhlxtHQ
	bsejmKozaWiGfuiBkJnMA5uhSTgLHJA6qeg78X00SUcmgRYhiz3hv9ocrMpBA6hQ9mDVsf2ad4J
	2mAPo2WTeBp1VhhvyVmuurqU3fxMWMEGqQ0Z7qjcos9rTlnLIivsaV3w2pNWyHwzXsvvT1Uqxth
	RDvKZN6zNEn5REXfxwlNRZvbwuXCmcbdWGK+pgpge5/3cMUKKrjwo1nodQBA+5htWmgJvHsj7XU
	tbfwDI9BVDcuUnceRNeqb2SmJNUSNveb/pDS1Drc++jd8u3xKwrY8A4pv1Vk+4xvUtPTSODggOI
	8S3gshOoT+oWNFvT4QXECmsOLKgE9m/dYzhFbW7fAYV8RgZZFT4WPZ8KowbwVaHyCeZlu7ONOmG
	5sm+q/xaBQolDrTqSV
X-Google-Smtp-Source: AGHT+IEPMgDPCYjsxat+foxE0Th9ljcBX6K2Ppfj2CK2lZL+CCALz+VFGZbGbJZ0pdZjm8CcOhAGug==
X-Received: by 2002:a05:6a00:90a6:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-81b7f7e226fmr16141102b3a.34.1768230413899;
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6c8199f4sm6182089b3a.68.2026.01.12.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Message-ID: <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
Subject: Re: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 15:07:20 +0000
In-Reply-To: <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004ff=
5ffbc9a19320cac 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -25,6 +25,7 @@
> =C2=A0#define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> =C2=A0#define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> =C2=A0#define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> +#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)

Between APM and HSI0 to keep alphabetic ordering :-)

> =C2=A0
> =C2=A0#define GS101_GATE_DBG_OFFSET 0x4000
> =C2=A0#define GS101_DRCG_EN_OFFSET=C2=A0 0x104
> @@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu_i=
nfo __initconst =3D {
> =C2=A0	.drcg_offset		=3D GS101_DRCG_EN_OFFSET,
> =C2=A0};
> =C2=A0
> +/* ---- CMU_DPU --------------------------------------------------------=
----- */

I'll do a full review later, but this new block should also be between
existing CMU_APM and CMU_HSI0 blocks to keep alphabetic ordering.


Cheers,
Andre'
