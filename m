Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3F2BCF65
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750872350; cv=none; b=WNvIB69jJdYchbeoek0ztIf8xm53lK92d5Ro0m125KiiD229P8/MpePO+F6GPLZbUFz8ACWE2DG3GebPdXWM6Ok4fRKSYOfXdgFZso1cGHvLVpM63ft8SB7M/P96HILN/m0DNXT7MppXuyugWk1yyRrH4GRUBfbZO74kYdFPGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750872350; c=relaxed/simple;
	bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nUJ51IbsZusm4jbEtDe+P96aQhtpAwbn5TDGkLduhwiWrb397tM2Zg149IZi8Hq1PvRrz9ayUkggnLjR3Ld0Fqsq/fs/3YCOxZRQUH30BDKztAIbcnr0ktQr3pr/rKjZOhT5ExWJQzKl/6Fvh3hsQTJSEriJTeWT4O+cVr6aW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jE67b83Q; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE67b83Q"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so60966f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750872347; x=1751477147; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=jE67b83QgwZcy6pHW8GumX2NRNDq0snQKw5l8LoV39RDzm998i1h2inlkvN5yiEyFy
         gfEuT+a/azn6tvE37Y01vL5tzWboOreQuuWlOjKLbeUDdrc6T+T93smKTBWNuGwJBkEf
         n9j8nHRZ6QDtb4ynm3Ydz0J898zvRpnA/Thk2bWOuRFxBIqq77SZYYqmX3DEF7HD7+Ce
         h2i5gC9e16aNeAKjiU9xUs9bDTh2Gk8mtG55XR3VEBiLsjdpoofek7riMheJRp30r88f
         DUm5mmvAT3lEbbq0w1Rym6B74AJfoWxOr3dplJ3AFELv42OHmCpyuDrjHr/sjHB/sVfy
         U7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750872347; x=1751477147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=TkuDf8yM3kaIv14hmmVB7rmACtym4vIZMWq1t5hqUTMrdFXNDLYYXeB6f6HVaOOU/H
         0hNssLfg/Rr/H8D0XT4hFtAAgR6OPybKoEoeolSrda9jGEzEXtJhqqfrQ3gUhkX7Pf5L
         1wI4bqEJLdBOJcOFn3tUitt8caHqB5K5cZYpOZjSXzgSW3NE/uiqNXWMtl3P1bUvSL7J
         Hd+MJy7PxecDxpzGryAZVMxjWDJrrZquX2EUBo4MAHTkWGKJ4+9uBoMcD4ouk7SUr2DS
         UpIQM0Io5Chcn6z9kohCmqt7TDv80nVuJb7wRPRqSw+W8gR/nBsss29uPvIYNlSk6iUz
         h22Q==
X-Forwarded-Encrypted: i=1; AJvYcCU67NW48bvule2sj3MN+pCsnAe+hHrvOf3rrrHFtBJ4NDyTx5WrOKp8eeSKyA4I99Ld0X2Z0b7LWwqmcSLbrz4u9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Lb82AZ5QD+y6fjxvENOPRyYdB+1StaVomwpm75W1Oskjk2pj
	znjAAWFtx3MxyHnTfukt+Cdt08G+6wVOGO4DI482mq4wB+1wTTldISrVrnko375/J0c=
X-Gm-Gg: ASbGnctz/NE3hfS3VDLxbm3NomhP9b3/mGzIadO5Q9XWikRt1hMNWz2sJ50nkDu2flm
	5EoGDFh2eHRHOXv2VworKp+7fEpc6zhLaC9zApLu2MeI5F2F6X5cw7MWfOqsvUn2K4ml55rj09Q
	7UVOCzGf9KgGhCf9xGUM3kcCgfPjsO5YKfxYGfbT2L5+gM4XUZUADSEwNq6rEpXtu2runodmS/y
	vibxXM0FP6mJuGv0Pj5N5UCAH6slXuIlJhR92kKHytaRDNRDpvg0Ji17K45dZq2NZtXbG1lqtgZ
	VxwET9stv9CBJEr5KuOxvIv3elsRb0d1IuJzERejJa9dH15x7CHUBeyyvikIaBQ2n2JwgD+Y2om
	G
X-Google-Smtp-Source: AGHT+IEWqQYs8mY+5uoMYCKPajkMpm7F+LqZUiSbpYVGFaDjaB+825h/sM7EDs5jZzTatPcapcPi/g==
X-Received: by 2002:a05:6000:4186:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a6ed64bdb6mr2932119f8f.48.1750872346775;
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm26240185e9.28.2025.06.25.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Message-ID: <5113e57e0475a62f2f50006a7178377c508f9403.camel@linaro.org>
Subject: Re: [PATCH v2 0/4] gs101 max77759 enablement (DT)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 25 Jun 2025 18:25:45 +0100
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-05-24 at 06:21 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables the recently merged Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
>=20
> This gives us some extra GPIOs, and enables NVMEM which is used to
> communicate the requested boot mode to the bootloader when doing a cold
> reset.

Friendly ping.

Cheers,
Andre'
