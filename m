Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315238A9B1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385327; cv=none; b=hwWkY7cO2Wun+PJ+NWdKu/YlLroAfTBY5jZXtgMCLqUE54yscxDOhYUkqHdPF/2+ikSxbfrv4GvZ3Dx9h7Q3P6k/6jhdxbJnHGVLYzZs814dtODEWiYFxQWKoFJZfGgucf0YW4HrJBo7Kitdm0UDn207c66ZHchenObSRMWXpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385327; c=relaxed/simple;
	bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AXNs9QDYvuMzXO1uCIHinDCraauiurK+iWlXUJjHFZapQgbAfeAwVXWHbOS0uqyrpRhqX4TNN70rpcCN9oa6ffV7uoBTK0BuZQjmRO5mRXHZ3DqABu4sPykaeujIj5D9S2Cye2cYsabINLK/EL0nYXxavD4CuyQxMf+DTjmqHpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghupxcdT; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghupxcdT"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso6402028eec.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385324; x=1768990124; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=ghupxcdT/aeHjf39mpyt5EcQaM6/SMavCFYJkPV3iqxOvscTht/DQNCF8XpBuKX0OL
         4dCm4+Xpc6pL0zNpm2sNbj0C9A7k4UyYH1TNm1FGRoo2cHlV01XOYAqYW6j1gTV6tgrq
         bYNXc82y4LdmyjeNxAYCmig+5ZUEeIuBe/pEswyWFcll+gqgg2Y2HzWId7D77SpA2Kle
         IBM1RUOF94aIlOWB+E+Z0MipQW1QchLHE1yoh23nMF0CukXbbEDEWXRxmCUcHLeAxHJL
         Gkw/eKwcsihF1W2axNw17An/0HOioTLhOD5nMXPkOvWTHY4DN7zjHQnHOeLoRzOXXdXK
         vK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385324; x=1768990124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=QNmmvmeNy7AxjBsuiDg6EykcjRJlg5JpG8NWQ+DhNIdFPoy7J5vHHyP7ZfPLT2FSsJ
         BihJIM8ttadNR7R5hSOecfuZmjbGt5GAZXwNM4fVUrRmtFqFmcALJEm3O25b9U3CIAqS
         ySI7F/nK/e53Q3DRskMreFSrHG667m0YHCSRr+F3fuoo1+mZBgJTIA57/CIyXQKa3PEG
         NO1Dequnh9Q8I0PlVL/iXwGSHBo1QSuMx72rDlKlMZFCQl75Uu6MsK8PA0CLKrXRRkbc
         g8DfzZMOFwJ7YwQX45ONRZya4jJxoq20x61utv+ZincHkOuNWBv0in9YtQ6wXUnVdcTP
         pJcw==
X-Forwarded-Encrypted: i=1; AJvYcCWsnCFuR0oFDp+3hDtd4StUrUhLemS6/V5nW8Ye5E8wPW705q8xcESkp1bE4JxkesevQmiGg1hR9h2qEnvQXZ4u2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YycRxFRBJNGVVqZQmXTwn+CxDTHx92iLsQcc2z7dXrpSVX54Hq8
	bxef8QYvipXzXMoCqgsFbiq+Q6Ou9DlENRcq0QFQ26NGXFWp+FhYu8zSM2jrCoqA7lA=
X-Gm-Gg: AY/fxX4CQL5bTDFdlABeH/vGPA2HCRG4+POnEdfKJ1lBDmWw3/btCsGQSdZM/NhLuHa
	pKpuFEuyQjJYxxRPVHA1jVAeSEBbaoNYdGPXeb0dqcfvn1IOaYGcMFdefayXRB/gi/VUZhf4tn/
	ZtFPrLP0waLk2zFHeTt9xuhubEh2PUhrRDGHz5jmuwfKpbuPlMlhy6ZyIz3nEUurdVBigmpj8SS
	roZWmJQTMymJ9W2UgWlGR2xOvUzgbfMQByy9GRV/MuiGVpT/C2NuumQCEVu/zJyODnj+vdIou8x
	0iagrGWBukkgVR4qaegAiYSLDRxtLObY+NkbngzmPh4UjlJpWlTcYgdYF6KjAySj/mDd0QYdi+E
	bLXXwUnLN6krebjUhVyE0hGznBuH3WGmZwsiqOJ9A3O6Tq81N9MrHg6+fJvMKF/9aBs9zfuoW+k
	FOeiN/i/YB7S12ASxS
X-Received: by 2002:a05:7301:4e08:b0:2ac:1c5a:9950 with SMTP id 5a478bee46e88-2b4871eb693mr2526439eec.34.1768385323644;
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d60b1sm19790893eec.31.2026.01.14.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Message-ID: <c449218000258224fd9460e898b9705c1d0d415e.camel@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: samsung: gs101: add support for Display
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
Date: Wed, 14 Jan 2026 10:09:20 +0000
In-Reply-To: <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 10:59 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- Alpabetic ordering for all cmu_top children (Andr=C3=A9)
>=20
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
