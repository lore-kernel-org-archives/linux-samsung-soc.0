Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD215F40B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726515928; cv=none; b=n7CFi6tXIU8s14FvCbFBl9YA7LUPfkhFAFyuZcz1sPQ3wqRMGwLApnyKkjP2A9XvNjvga2JbcRaiy2T2tmyYSvp+WQfjkb9+09v76Rnb74g4Anvw701HXMH3kBfw8Ils7mlS1WCHZ5YRWTpR4Vnf9W+FYxF/mM1grjjIMlKSLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726515928; c=relaxed/simple;
	bh=86FkMyQ/G+8VD02/whrVHHkVIlcKpQjBLC52Gq1S/Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEPklb5rys8Fc7xqxwvpGSdbHsx2RGlXROpuGa44sOt6oAmxR6DicWxUpGsDy/EnwhM0FgLqBofguC8jgYuRhbWFVLUrwUsb7QUbXxjwWFgObmo+iikEFp6965BYrK4/01BSwdYySA0wdIM68onwRVwZjKWmfZXvy4CXvxxAUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QbK7rgrn; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QbK7rgrn"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e039889ca0so2776720b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726515924; x=1727120724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7hgMVwljI+22DdDn+2KiS5sYn8c5xk9LzhXAy8Fwus=;
        b=QbK7rgrnMxI+6EpxS7ZLgRdxOrguiFtoWRbhXFsFa0FrV9hL2jPWzTxrWVUyPqoG48
         O+1BO+Gq/ZDhORKg61K296/MzFeEgAoc+rywRIzVYTa5TjInHgqyAvF4YZXs6EC/30Ru
         yYcQc8OgstQdXm4x9JP7p6OyNvk6g5zAiTmhMzr0h0/cl1jprFZemQUVpOajySzUanVz
         oMpx0ethAMsVK9pZ2da8g6oFFou10l2bOphT79+i1z+8RGtozHnPaPCFdNoa4Nt2cDGZ
         dSe+9GHPmm50LXuT4mjf3uI/XFKIA4DknC0ckj8Ktt9tGgmHtdtIWtNUWsVmpYuxR2N+
         poYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726515924; x=1727120724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7hgMVwljI+22DdDn+2KiS5sYn8c5xk9LzhXAy8Fwus=;
        b=B/lMVTP/oRsUikXvmceDo43X1QJP7z7s/KQw0PwepAft9/9pM8eo8L3+lrOi6n/rUU
         3uM5yKquJGqHU/n4RwNH/Wa/kxqaJs2Ifa4dwBJBUsUYJVpqY0N6pxuXoU4AHN0T580T
         witwgYlaMKCAOj6HSA/rsNiTM+AW2Ve4jzpRYved/zGlis9F+XBuEQXsGcXJzPdE64/q
         tYAzYqDHquFaDv8s78aR6vCi3u4K95ApW1fWLfVBWo2pMw9W0RAWSgmzGtb/vpt5+IJI
         zrp/hArNTThE7ETltNXKfiDc0UymSHncjYSMtcA4cqQbkFSzWvdubjHVgBUKegFHsFFP
         2T7A==
X-Forwarded-Encrypted: i=1; AJvYcCVN8iKwaxH8M0seR+Wa1KoSZFn81wRoWZRwkJ5axswf2tGZMwZoeZIBpAoaxgim+EM7IlU+QjWvCvFE1r5LV/FiHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nM++ms51WpuQUNAvb22ftZuAyqx/t0XXu3lCjKxZEpHVYJUD
	V6PCmOqo9fZy1WDh0yEh+QkWLHW81jBe2yUrCHYpokmnq8q+0smtwQcA2XWgSnwMp+vMj7acQaY
	BRzG4GNBUridnkhRoBSO0+TamLM8ZjyyQgh9Vcw==
X-Google-Smtp-Source: AGHT+IH3OZJ7Dfh/L28GaVIFfHELZkTBoO/heaD4KN599aOPnL1NQjJea+s0cJl9iKsEMo5848K/h/romXt4JwpU1rg=
X-Received: by 2002:a05:6808:1290:b0:3e0:41ca:1443 with SMTP id
 5614622812f47-3e071a9a491mr14060081b6e.16.1726515924309; Mon, 16 Sep 2024
 12:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org> <20240916-max20339-dts-v1-1-2f7ed7c24e83@linaro.org>
In-Reply-To: <20240916-max20339-dts-v1-1-2f7ed7c24e83@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Sep 2024 20:45:13 +0100
Message-ID: <CADrjBPq0D1q4f7CxVpvdEs20uxkagsGfFLCNHeAQzm7L5CMaGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: defconfig: enable Maxim max20339
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Sept 2024 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
>
> Enable the Maxim max20339 as this is used by the gs101-oriole (Google
> Pixel 6) board.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter
