Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182F17CA1B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 May 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699190; cv=none; b=HEM1BHEnYUCbCt1VhZjPVR+SO+Kcj3zFvboJfNjMEwRlpmQM+17BWMjeo3o0Cd2SY5HjHLcrNxDE5TLv0dZ/vHI7jt04pThxcfWiwxOTor3zYWEe9bTvgZPG2zTDIwxMwf97w8eNeROHFofpL6LR98jEks4SZXQyQ/SCkwe0v18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699190; c=relaxed/simple;
	bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzlJuy8pkjZal3QTUpzd2bHgPj8hfdlRzgpg/gENj7ZtGfbZFNkRMMsJig4eZ9NrMo0PNybRufPfrM6Rw7dv/V0ej9pNaZDnhaQ5YBQCo+lo1wGA5h21SP4nqwRSleuZZ9g5pl7VLrOHe3v854/6eckQhGfIcHyXJmpo0CBXdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z56VpmEf; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z56VpmEf"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so14152926d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2025 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699188; x=1747303988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=z56VpmEfIr3G5KDQb/tzjCLh9LS0YOrxGz7zPE8YfcbybOktu/P8cuQBsEwqpoADdX
         SbJ51/+mYNOgClsqPCFK4MfjRVCd+daCztCHyP5EnVz70gq6Su/JL8wGl92s5in/i/cf
         Z0abIf57pTYZF3byCZ43Ez0YQcCwJuEjFzQyozvDbAppNMOwVix+DHWimqWSsXaZa09E
         27BA2dXmcVXqFFsPmvkLo65/GCMKITUgVF1v3kLFXV4bXAQMjDkuj6sagdN8G7AItqnn
         IbWahmTfqA1vEiHz0sdvOwTfAnxM+C4drcN10wGE0xTwaJSTUF6Kdohxg1heKTI5IS3l
         4SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699188; x=1747303988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=B/uHwR0tRkMs9Te8IdIIVa+OvUB81Ewl0muANpS6+/RIjP3m2ZWT7MSP77DQ1fec8B
         3DCGuKNB7tUAGjiKqteo2nvyU12/jT3xW0pxak8vmbTegX2WVpd8cIyIqOYEnfPWduEW
         YVSEJ74It2OdJVvJcA6P0rrZKtutf8npzviZDSvQzN0x+J7lLL7OBHEFHFWTfFAM4Th1
         R2IphptsQFtfd1Npk6YWoB8VzqwcA0CXTwvLy0hJhNWz6aoYO2aC0aGTSLSOReGRgSAw
         mDoghR80C4DqvFvJLzy96aC4q45v3GTxFMD4gjedSOC7LmvwSd6cm0zte5Yr69UWn4cp
         xKLA==
X-Forwarded-Encrypted: i=1; AJvYcCUcCER8VTjEWr5lvfp8AzXHTsHhHO2PZmBzD9OMpnwLOeH1a/X8weemglaJ7+lh/XkeCuEs6srF9E2MTboz6FtTnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxemfokHDuvzvGqxvbdoTdL/TFB0lDsmGNvrdBSR23P2dDY/cIM
	Ao5RJcFnwgElEdd0H0oM9ufjmKsRMvnrGSe6BaoehspwO4ScL1GsiWE9cNOVpSefb3wqsjom92r
	59NhO2e+eJG4NGgIWjEMTMTLtSjRD1kIW/t8uXJN0yDI7tFraEAw=
X-Gm-Gg: ASbGncub+XUHZt4Gx8Y+y4Ns6ZSUcz/uxWewlKiTLL0pXdV+ugdm9gldU+7AzasXsx0
	/7fJqBg/mA9G58WybwvzLHUSwbqlow31zzNlmxe479Mai81blpMdtQ1Mi3XZ/Mh2GtyNyReZmlN
	Tdx4HzLjJiWQwPErh7ejW+vbo=
X-Google-Smtp-Source: AGHT+IGHZuVXaUQ/u3XZJbuAZafur+n/lC9GK9G6Emz/GScjl53R/86ubfnNKLg/l/AxbJxOUCz0O2Jkui3OicdLBOk=
X-Received: by 2002:a05:6808:200a:b0:3f8:e55c:16ea with SMTP id
 5614622812f47-40378032892mr1579070b6e.24.1746699177190; Thu, 08 May 2025
 03:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-4-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-4-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:12:46 +0100
X-Gm-Features: ATxdqUHvE3fzypmFP1S8IOQDU_RCSOzzbAgcVp5I5etYCYOISwNGGPhI-JRyTfE
Message-ID: <CADrjBPphh0DgdeFSAZ9WDNqUOE=C8XasoW_9Hq=p1Q8onZj+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> To allow the CPU to handle it's own clock events, we need to set the
> IRQF_PERCPU flag. This prevents the local timer interrupts from
> migrating to other CPUs.
>
> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
