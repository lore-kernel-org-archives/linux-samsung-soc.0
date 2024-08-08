Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376E18E77E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128118; cv=none; b=lBEULLLQIFkCJQYjdYrN4oT8Cshe47fGdMMomj5q+6KWLaC44kL8QujJ8fASKn0LeCUIQgUL+EAC+nTEb8XhCRLRyLHg8FVZOegEuEs9VpuTIgnVSPH6bnCCXtC+a/PUR/ew2uRvDCY8/o5210w56rEojIMB0qW835ul12b/Hak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128118; c=relaxed/simple;
	bh=3Zm++0EiwaZDCPUMCRwmX3AigDh0NbUA1FXFLoV1300=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kieo6jq3DtKgB55VDn5iRE+xzJeWLuLi/4fCJEn3lLMhVyUyt/4xiXQ3i+dFu797f6vx19n2ofMP1WHrUpJmSgUCKm+BYf+AY3+3TxxnBueXCwcFDWPq6acCaCk5u0LXKU1FIq5liObymSFmllezozBy9wCoTrbLeh1Q4GCuxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYwL99EA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYwL99EA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368f92df172so518023f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128114; x=1723732914; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Zm++0EiwaZDCPUMCRwmX3AigDh0NbUA1FXFLoV1300=;
        b=lYwL99EAAlSYJnvP2D748Ayi2IZj5Ev4RKAt95IkQap7RHSglGBlb3BKUTGBIV2fWe
         lp1BiaXRM2nPtSGeVC2JL3KkHHEqvGEYRNq29P5uDz+kbC2galb3PURJDD6uP8OAgGF8
         gGzqFOdcECZnaJs+65ltyhI3fnfM7+y/cPTbt0VXH3shZxkIx5SvXHgZcZx5NQ4oJqyu
         /FUpy6BomBWXVy7bZrku9BbzdBAvaoO0rH6uB5ogLOg7g3KsXzL/EkJkI+e7D2lpmZNS
         RGk655biGEdd6RVF6rhbnEJ+n5hBXg0hxytTJDremgjtzsSrxN87YNdRHS4Y2RVifcmH
         LYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128114; x=1723732914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Zm++0EiwaZDCPUMCRwmX3AigDh0NbUA1FXFLoV1300=;
        b=LxQaLq2Of6IuRdygcpocmqWVUYd66+/DXfj4gE7MNwJwMXDk14BsDVRWbrSGBlmZKs
         ze1dZgaZoJ41Ce/GZGDm52ygQ6i+LYD3jXH1MwNFi+EIfu/5/lImHajlxnMdm/yUs71p
         5BlfwNB7awoo49Q+iSOKG2Stdqw1U5GAn1rcZ5DJZHfaADt6ymsev4hu6UAySXnArGiu
         aFX+qai3J6LlsdVUBDbOqxx9ujbzAi+LYAGvsWp1oqQVRCMenyO0hUNudFN1oW9CD1mn
         DT/JSh72WIIv2NcK2xzkQlmfmhabK+58BxNChlnasZl1RhlTZ5Xrcxd8cSiQNQ1K1s1x
         aGjA==
X-Forwarded-Encrypted: i=1; AJvYcCV/NOAMU7yP8SFPqG8VZc6OuA7npqxQYcn0dkRyozams/RYiCKF1xHOMOtgbMSUB9kRaQA7G5ULIhe1Cg/+u+FPMWAqaA0eRE6HxdA4Or/yNBQ=
X-Gm-Message-State: AOJu0Yzspb7PTCuJidF2IPDCO8WOrpBwCTHcxEHb1xvVBNYh4ugP4bl5
	uwdldz1HmU7chkDxpZyMIdMd8Q1QB66u2nxApEbjjhWePYrvrYBTXqbvDFinwLk=
X-Google-Smtp-Source: AGHT+IFXHGeeJUFdxaEWDM0TtP4N4O/AiT5tOuX2HrCQW4T6X/PQQ9IxC6Nf6q2GswA9UY7T4LQ/ng==
X-Received: by 2002:adf:f250:0:b0:368:57dd:3822 with SMTP id ffacd0b85a97d-36d27574952mr1574108f8f.37.1723128113815;
        Thu, 08 Aug 2024 07:41:53 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716caadsm2103076f8f.39.2024.08.08.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:41:53 -0700 (PDT)
Message-ID: <0fbc53b1c9e7b27d1363495b6fe3c8eb64efbb8e.camel@linaro.org>
Subject: Re: [PATCH v5 01/20] clk: bump stdout clock usage for earlycon
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev
Date: Thu, 08 Aug 2024 15:41:52 +0100
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-1-11cffef0634e@linaro.org>
References: 
	<20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
	 <20240808-gs101-non-essential-clocks-2-v5-1-11cffef0634e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-08-08 at 15:11 +0100, Andr=C3=A9 Draszik wrote:
> On some platforms, earlycon depends on the bootloader setup stdout
> clocks being retained. In some cases stdout UART clocks (or their
> parents) can get disabled during loading of other drivers (e.g. i2c)
> causing earlycon to stop to work sometime into the boot, halting the
> whole system.
>=20
> Since there are at least two platforms where that is the case, i.MX and
> the Exynos-derivative gs101, this patch adds some logic to the clk core
> to detect these clocks if earlycon is enabled, to bump their usage
> count as part of of_clk_add_hw_provider() and of_clk_add_provider(),
> and to release them again at the end of init.
>=20
> This way code duplication in affected platforms can be avoided.
>=20
> The general idea is based on similar code in the i.MX clock driver, but
> this here is a bit more generic as in general (e.g. on gs101) clocks
> can come from various different clock units (driver instances) and
> therefore it can be necessary to run this code multiple times until all
> required stdout clocks have probed.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0drivers/clk/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 129 ++++++++++++++++++++++++++++++++=
++++++++
> =C2=A0drivers/clk/samsung/clk-gs101.c |=C2=A0=C2=A0 1 +

I shall send a v6 with the modification to clk-gs101.c dropped. This was le=
ft
by accident while moving some of the code :-(


Cheers,
Andre'


