Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29196366048
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jan 2026 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673183; cv=none; b=hDeM6NPKSdn0nHqRHphfy9nqhWFdFLJpU++MInEF6KB5OuhD+p0hqEgV3KIGc/OU4nLwR1/piWew3ZpGMRQJy3Gl/j2Opmi4TxJD93UYxQDGJPhm7hBO6csX8aXOnAqf2hkXwTElnttYQwmMlNNWxTbxYg0EvOZaMpt4im6rPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673183; c=relaxed/simple;
	bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LSTG6GTgnnAvfqOrtwAmk8kMZZfPXg4TGfSohV44pQXYbDUY4Eg5LaTxEQdcdV5zdfbCjEU3zHBViauiTG1ogNAEp4rJc+ioxxhocrK4gVQbX5qC+eXGAvbKy2/aPcCS8Pa8oqD2q8U3OOiLjcuo3AFBqwIbWIij6z9aOjgKnfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hITg21l2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hITg21l2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so12292025e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 23:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769673179; x=1770277979; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=;
        b=hITg21l2RRszOmIciwQjy2uAj0jupjwwklVg+fvb3B7bBd58xF/oWBM4QRvWZu07N1
         L+xjAlc0SoxWIv1dued1hCfn/9RgC+RpO4ggr1yTuUTuyr2kpZfARFF8G/yzbVd5jLLQ
         FXpRGxp4RyEBMdc7yC2y2KkTYGY5WQS0wfM4ED5hBEEadYh2sfp1x3qvSSxFIxlomM7D
         cOiIQgw3/PrqNclCYEkuypajUxcanDP+vk/HS90xsH62ESbSNXExOtwjBJwAzMNn7O2R
         AmOdAgmjWUY6ojcn5HQU3jY9WJPERuJmrA2so7Ip8zNhSwbMB+W6PWD5ltFG48CZKSKx
         odiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769673179; x=1770277979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TreBPbYcd+qcEfeyzd9gSmsPnjmGM3aP8CkrKuGABXo=;
        b=eK/P6enbyf9dLDpnGOF7eg2ZVTaGRz97Tl4c5lEfmQoVP1OH9zhKMTsnYk2L/XGTI6
         wAf95FfXOh7IHJhd3JY4ZULb9Q/gfjKNUg0To5K28Coew0AqZxQw6HK7jlBMCyjXmsik
         P/fXIJjw5FSdhOKAlDgTOrIBoIqa/rkZSgE+SsTVmADSXuUlHHd59U/1bx/FTdn9hA3s
         aJJAaJDALBF1yVCMj5W29073/x98Yh94f+T5xRxYQsYlxS9rp36lrT6Tif0vorOZ84vl
         SUofh5lyzSWu6VJIP9BDV0dwIj8ln4v4WjCsVY9QI3Unca5r0Pa7PQiB3Q14Luh9P/ke
         bs0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdZU5I/ttdxSdzZ9N6BPdIZgB843680os2GqJeKbxmAc+ndX9kiI9CBAAdZLJu5PHVwuOkKjOiI48mFhNYI6tK3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww80EOEeStLrGexUKOhIfLiPoYTUZ9SB6Q1PKXo1HpVjEMbfHv
	aGrlVQTHHPmoWh/Yz4oysI8aaSBEtE85WtlC2dsZlRBBL68uwHrFWamm60dP6WTF0wY=
X-Gm-Gg: AZuq6aKZznRtUJH3D3xUP6+ELxIZhb+j1mniyKEut+CpBzccbsT5K1q4uxrYYTDatdW
	M/rTNEdxzCeX129o3ZxrYGv2x847USeFY5CS0FEIFYv2n7ZfpF/HoiNw+lZh/2wCeFghc28EcCL
	zrAmNFMA9ehE8s9QCcqFBjuUEfD2s3w7Fz/0gCgpzlVs+2cgAzIr4sZxHvyIDVl00eWJQIuR4aZ
	tFZMp6g8lc1Qc6jjHb7AkBwZB488B+0+LUZm5oyvFLdUhLRy7N0t/W3Vx+WNjcQpi8vSlbL6i2M
	rxdE0qMO6YbfALFZyvGuXeCmfHaNSgGG+4sFT0ZBGtYEo9XZP55trcc5OFBr1TPtKeGGq/mdVew
	SDKA9iF7RvRhqVe3WBfWkp1M2iY9dgI8G4pk4jWqnteYyF1fOg8YvDWLGBaxeH8Fzvsr2xS76+M
	v8swlDmECzG1+KEk8JZQ==
X-Received: by 2002:a05:600c:450c:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-480829beec9mr29095775e9.17.1769673178631;
        Wed, 28 Jan 2026 23:52:58 -0800 (PST)
Received: from draszik.lan ([212.129.82.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5d31756sm4253955e9.2.2026.01.28.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:52:58 -0800 (PST)
Message-ID: <3471955c681a8f9fb0ddf2dd421e1b4552dfbea5.camel@linaro.org>
Subject: Re: [PATCH v4 10/10] pmdomain: samsung: implement domain-supply
 regulator
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Thu, 29 Jan 2026 07:53:10 +0000
In-Reply-To: <20260128-gs101-pd-v4-10-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
	 <20260128-gs101-pd-v4-10-cbe7bd5a4060@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-28 at 16:10 +0000, Andr=C3=A9 Draszik wrote:
> Some power domains on Exynos are fed by a regulator rail and therefore
> regulator control needs be implemented for Exynos power domains.
>=20
> On Google gs101, HSI0 (USB) is one example of such a power domain.
>=20
> While at it, add a to_exynos_pd() to avoid direct use of
> container_of() in various additional places, and update existing code
> to use it.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++=
++++++++---
> =C2=A01 file changed, 48 insertions(+), 5 deletions(-)

Looks like I forgot to include the binding patch for this, will
do a v5 shortly.

Cheers,
Andre'
