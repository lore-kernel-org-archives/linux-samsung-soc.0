Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3414A0B9
	for <linux-samsung-soc@vger.kernel.org>; Sat,  7 Dec 2024 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733609273; cv=none; b=Rlf3NymZO+lp+XEVrJIICuOPQpaxECNG+16T0DU24cnzn++mAl5B8cOl1pEK/joXFGe+lWWklKteDNkYCZ/bvkYQnYuJ5tV+24AXTd/KmzWqJkpyiR/48ijgGcUZoP8CBkHfogP/9pVLn1bAngn/sYFVA3b9HRneMqSopj5gtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733609273; c=relaxed/simple;
	bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrndbxj0fuqm2JUo25oIw7Zeysk4sda9gOSw6r8TaSUyJdgFB5id/dFiSHLHR2qrpdcN3w0nsfWkUc7dPY1Lk7XBat/4fI//E4cEqVTpuTBUVnekX5R0m2sXdFm6zXMmoHHl6pS5nRV3GOVCoMOO/3wAndCwMW57RQgeMLAos2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VxQUEnyV; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxQUEnyV"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e61fcc3d2so3067649fac.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Dec 2024 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733609271; x=1734214071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=;
        b=VxQUEnyVhStEzRe3BP2uro/RgtxpNqBGlNsTZDc6x4FQHtRZXiCkt1oKHGNPoO9SV7
         tP7vyVZSYdpdul3cKecu4J8wKSsFCcOfvgh8QCAI8+wTZBXzHwHGom0OZKzL5MYRJu28
         Inv6q37C2b70yFK0cVpsIPvLfcWRM8yP6eEOnzkN262XfknerypnzDAAUUrqPxtIg/KT
         VV7m90ZxAIAK/YLlr6OnPPp91xhU8CkTFoq8fUxPRC2MlGSn01+2RpujSM4d7l3J2bYJ
         NETMik+xlTscTBeAapWuuMmoTZ9f1uJMShjP5cx/Lzfl5i7M1vVZewJpmEq3E4/FEeF9
         8uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733609271; x=1734214071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=;
        b=gbCrYcbJ8AaNXXu/dt/Q8TW2H8WfqX+wYzlOZJvF8PWUYuf+FBhDa+mUky37WAhKNY
         irBZN7aFPGFHTJ0G0LvPnPfkuhcmm8mLYAkLHqChil6VBub8BoKPSA3+XbFYZEn6lZOM
         JMXKjqpU1esQRvnP+4Q+Rorj3LoCidCXu10HuGfJwNDaXT4h+OcmOojSzLUzYJ+paIRn
         CjDjoWfMmA5yYahccRKZAVfAiEmLbiEJyS/4DtU/nGJOOmIddMFU9lQNt1zvxX6k/23O
         +gTFiqv38Zswo7rgcU1JD7oldb91NDJ6CXwXgjHQx1jfzd5KdkYX5BYnZbUo8kFCZ5o4
         ZDog==
X-Forwarded-Encrypted: i=1; AJvYcCXWdR2DHW2Vsi+TH6UvYQKN6FYP0yfq2ovxqbztSsBYrqiuwgQmAu1rqT40zFzFQnucWpA8UWHuD5G9oskHpUF+XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFKLlRRbpW3oKu1pjnsR/j49lXEGtzKoCvhhmJe7AsBuu7aCb
	RUf9AR86eWgB+ocjn6QMY3ITnZAzmwhdgMHGJ07Quox8Z9kcXBVPE1aoN4uHECd1/htHZaUsEGQ
	RZjPRhyDSpaS5UN/2b9/o2acwYHEVcakbsimlXg==
X-Gm-Gg: ASbGncti0TPGPfv1tlbERUyzdbZQ24mK3FsEtL0IF27wlfyyc2ZVVYbbk122BJQNUny
	CRLgTZwF38XLE07L8xEKUZLzco6AXZFA=
X-Google-Smtp-Source: AGHT+IEDdkAGz2pPoVWiLs3MzVT2xuohkvNwg2NzDEclu/+M3ZXg3PNHTWshr/hQKka4Uc30sPUpjOwYgYxK7wfFjvo=
X-Received: by 2002:a05:6870:a546:b0:29e:3c90:148b with SMTP id
 586e51a60fabf-29f734e7640mr7389656fac.26.1733609271371; Sat, 07 Dec 2024
 14:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
 <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:07:40 +0000
Message-ID: <CADrjBPrzB6H5GCN_NWcqcGhB0D31xF07bRMmoKyeZji4M2CXqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2024 at 12:40, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Turns out there are some additional registers in the phy region, update
> the DT accordingly.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
