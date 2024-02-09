Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A936AE7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Feb 2024 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707490355; cv=none; b=GAkDVYLtDQ7Mpd6ddBzKZqBY9uAsYwe68fptC38WfeCVkE6hoV7qnXHO9JT6Zt9I/5Ve/xVAgCdrvd8zabD8J+7We24r3DACmuXjKzgVlCcGNImMkk/b8ZhMhNxAAAoKsszA+Y7Yig55gVw3vSDTbFYTLNssyjBKfX/MXQI84s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707490355; c=relaxed/simple;
	bh=byUSXn1CBT+qucWO0Diq0c+JAjJggUINmXXOxd3wzhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiVy5k3l5XbpLdqojQKcA2Kd2ZSlfpbWlBLMiyX3lY85xwIkoIgEE/nZkMZe+OXklqSVeWTcRZp+/5N1OdvHyaAOmq47oi/K4wmZ56zww8qxXWT+uQEXEUCO+/6ejwTcaWtIHJ/HAAR8RktN6GPBsyXvpTgF4f44widDPNzVVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDj4fRU8; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDj4fRU8"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-604ac794c01so8635337b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Feb 2024 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707490351; x=1708095151; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvSzfugfRa5xaGbubugy0cL8Ne5sgTH61y58yWXb1N8=;
        b=nDj4fRU8OAuuqqxq4bCapaC1rIrLIER9v4Au8Rg68yXQoVBn93fxTDAWddEiii9cYc
         xvPK7mjRqjPKz6r8rooplmyITClcPNecl6S2eeb9ZJvzzvctFRqoJA2s4G4JCedtiJQz
         KnpSQyxYpP8Ss5mUcoHIcoaiUFN+cdvS/quW3VrAcIKFTV1jLbkZfmlH3VdG3LlZYJna
         i8emUeH4S/Q1iFy2NcPO2SNFMwf1HzTQ6xXfs2I7bMedq/i1hfBUXAaUY4uebcUz0lkD
         GPMyLvt8pCNmZSM1tm4Jb3zoag49O8b2RAhfyjayO8V0glKu44HTL0sRiS802yjQQL2o
         PoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707490351; x=1708095151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvSzfugfRa5xaGbubugy0cL8Ne5sgTH61y58yWXb1N8=;
        b=ho2+Dg4DPooRoUzS3mXzLFqPLeDOIIyHj53PAykKWwFQhCRVbgeup/HgPc6rpnoOQQ
         NKlZ1bzhZjvor7K6sBb/+3sZnQiwpIsosw6yMoYfsvnklO0SYH8Dq7mT1umbQZ1e2yEh
         j5G9YVGYGAfmnUgWh60WWcF0pV/2mgRB021XYCLJyqtIcWZi0qdRl22rvCOnOO+m4Xx8
         Vkw34rwrLbVaUdTi960+20uMEkq+s0qgbJStH2/Srn/FbJpXo9U1u9jdwePD5gQez1W2
         hh2KuiN5HruDTt1eZWd/qYSciv6eAf0BaTJFWFc/0LsRFeNrZGmPaGXaSAkZqSfYC1Wy
         9Zlg==
X-Gm-Message-State: AOJu0Yz/mJ9uQ5cAMUgBddBMOifSfUbb4ZarcANmaN077yL5O636GX8A
	cAf7UZ911aIEDrzT7s5IzV2Y4EWSpQnACVBqFXIiY+ktGbcxPtF3pAuNbmV0LEB9nZloK9DrZbA
	fJQUDkqNEPUiucWSO5RWJKyuaezyhynBHk1HH6g==
X-Google-Smtp-Source: AGHT+IGNGpV2dAOJ1roKWNaPkfmJ7IwBlppVZizxMiwadARMvHVBZZR+vznEFtx+LiP3R/KfEq3g8Uhvd7c0h8926OE=
X-Received: by 2002:a0d:df16:0:b0:602:b21e:876f with SMTP id
 i22-20020a0ddf16000000b00602b21e876fmr1761503ywe.0.1707490351229; Fri, 09 Feb
 2024 06:52:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org> <20240208161700.268570-2-peter.griffin@linaro.org>
In-Reply-To: <20240208161700.268570-2-peter.griffin@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 9 Feb 2024 14:52:20 +0000
Message-ID: <CANgGJDpJX+ji1U3SN+2Q21FyckFQhmwb-Z2Qcx4-+GQ2ijmfCg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	semen.protsenko@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 16:21, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> security hardening reasons so that they are only write accessible in el3
> via an SMC call.
>
> As most Exynos drivers that need to write PMU registers currently obtain a
> regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
> is implemented in this driver using a custom regmap similar to syscon to
> handle the SMC call. Platforms that don't secure PMU registers, get a mmio
> regmap like before. As regmaps abstract out the underlying register access
> changes to the leaf drivers are minimal.
>
> A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> that currently use syscon_regmap_lookup_by_phandle(). This also handles
> deferred probing.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Apparently it seems tested-by should be provided for both patches. This was
also tested on odroid xu3 and I also have WIP code that depends on this
SMC-based regmap. No issues are observed and behaves as expected.

> ---
> Changes since v3:
>  - Fix PMUALIVE_MASK
>  - Add TENSOR_ prefix
>  - clear SET_BITS bits on each loop iteration
>  - change set_bit to set_bits in func name
>  - Fix some alignment
>  - Add missing return on dev_err_probe
>  - Reduce indentation in loop

I no longer see the compilation warning related to struct device_node declared
inside parameter list with v4, I guess one line change addition in exynos-pmu.h
does the job.

Thank you!
BR,
Alexey
