Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9961D23D7FA
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060152; cv=none; b=Sr7EmTkp/XJdvdzNyOtLINJTUU9LKTtQzz4oIBDtzJkfcy7Bo3GPoGMabOaOFkBmIUzyVgU6Fx+U/cx5XS7SehbU38/EmNIRy53zB5kiw2ZWQk1c3CrUUZefQBZZWUBYrelQpqvkixJKm5B5Wc/o80t5buJ8WbrFotTSkOdzje8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060152; c=relaxed/simple;
	bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euj8p42iydKRxyhe4YeE22PU9IEfkM8igW/3xzXQ4ad4ckyKa4PSRJe8DLZE+eF23LdcrglD8YUQJ0yjzCLauefH6vfPHpxFfrg74KM3IYisOW871ckPtY/NWqrqz8WmHbukmcG+GMQnjia3t6GpjegmWOREOz+DeEVwMwltBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dW9ueFKZ; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dW9ueFKZ"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7459d6801c6so993595a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Sep 2025 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757060149; x=1757664949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=;
        b=dW9ueFKZs4M7zxcPMiQ3QlFCW+75uhcRIkSOiuKiNh+ng0O3pmPG0tZsQoSrckigtA
         195AZo6mxsI/d186cDNBwW8ZfnNGrzdJuvsuY5+MFSMLqLPIqi1yLGRacqS+ZEQiQ3Sn
         SUW15j0XADsBxDueQm06pyf6M47NUaSzDFayW55eec4MkzhM/wJ9GcdjkF2zZ7mfDoF2
         181mXP10Y1Pa9yZPjCogHmgAH8fc5IrdvS2RNoAvr+4rc8aCIjt9v07KngM6bwXGJzg1
         aIlBi+hv9/xgZsjnqbDadi73eA6m7aoHdUEnmcLmh4zJZqsFcyK3m2EtehbtoGzGDwWt
         EqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060149; x=1757664949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=;
        b=hwkfN8IbdIPljQq0z+9vCuBuevLblO2R+Vc6lIFUKinhF+VGNjEXdUbL/U7GXBS+BV
         JjUB8qvVFOpVPwF73rTGQjlyaGzrD5kYsHnBaUo2GBxXKYELYzgfh6H169t21cueXmuy
         kyOUFp3KfJiY+9xUA2Mpio0dim/bb1REA+g+zhr8cYsuqntpyyFdyZ2q9+0Pnbu8hoOn
         sw4+NG0QAAUlS5QgZtTaFTDu+Sumq2Ju2CtnJAKAr6BlmF/bq5I2KlQBDvAjW/4KWGaU
         +O5446Jyrkpx0fqfK6f3tclnZ9ffZwZzZoOXXoHE06x8SUHcAOcKCVe6+WBIKRuqoDUC
         0BMg==
X-Forwarded-Encrypted: i=1; AJvYcCVfomHWLZv4eYhKgwa72KEAtAXcTpj2mLOzsZrWG97laAcaJ/LFKdBC3vq6GOUSYl5/sVK0vDXEBEs5nF5rJM9lBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjapy5FPCYbtHGOCU0RixB4mS1ZnQWhSNmgXbOzT/RBwCDskf6
	La8MrU0wwPcYM4eTnn6z2R1xD2OOdY8EWmneQ/yRlR2IWnR8s5n6M+ikt3mGTj7uWiiLjUlZQEr
	xT4WM7T4OCDPLcDwWr6I95D7dwhrxtPoupNhzMBLKUQ==
X-Gm-Gg: ASbGncu5qeQJ84PkgOyUWEA/dx7ilRCxyqXfxo6EvOTRUB1VYTbhvIRAay49pWDlfZL
	wRXQdas7taJR5Fcbc5gihYJ+7CiYmLS3/G8wF+uqUN/PePaKtm253VVhLO08UYeoh+gB+rEy/Ub
	0cOqYivTumkfKO3bAhW9bzl4EJm9d1/OVAkI5f4483GUCr9GgxYwDQaQEKpyz9hGzsNlcEc40sI
	+GtaMEl
X-Google-Smtp-Source: AGHT+IHQj7XWIg+aHFhxE5wA0mBU6jl6RILB2uf8bPMyU1ck849cJn5VIU0gR4I4BwUtKnrjZoeB3FBwyczpBjhB1PU=
X-Received: by 2002:a05:6808:6d8d:b0:438:384b:be51 with SMTP id
 5614622812f47-439ae5b57d0mr1719731b6e.14.1757060149490; Fri, 05 Sep 2025
 01:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250904153242eucas1p12841f999bf68861f7386b0c9f3f4f60f@eucas1p1.samsung.com>
 <20250904-exynos-mct-arm32-cpuhp-regression-v1-1-5d9e4dd356ab@linaro.org> <28a9be50-2432-49b5-b10c-bf8b4f9ebd8b@samsung.com>
In-Reply-To: <28a9be50-2432-49b5-b10c-bf8b4f9ebd8b@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 5 Sep 2025 09:15:37 +0100
X-Gm-Features: Ac12FXzCRgR8yHlathKqigOEKqZV5Lvkwxo4wgJo10cx69pMLAPLfx34mAd5JLQ
Message-ID: <CADrjBPqjw82MuxctT5oxHWX7J4D0yghtO6Md8WkJHz5-6LkP3g@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: only use IRQF_PERCPU flag
 on ARM64 SoCs
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Ingo Molnar <mingo@kernel.org>, Will McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	John Stultz <jstultz@google.com>, kernel-team@android.com, youngmin.nam@samsung.com, 
	hoony.yu@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 4 Sept 2025 at 18:49, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 04.09.2025 17:32, Peter Griffin wrote:
> > This patch addresses a regression reported in [1] whereby CPU hotplug now
> > fails on little CPUs (for reasons that aren't fully understood) for Arm
> > 32bit platforms such as Exynos 5422 used in OdroidXU3/XU4 boards.
> >
> > Note: This patch makes an assumption that the exynos_mct driver is only
> > used on Arm 32/64 bit SoCs.
> >
> > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/
> > Link: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/ [1]
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Hi Marek & Krzysztof,
> >
> > Can you test this patch on your Exynos5422 based boards and see if it
> > resolves the issue Marek reported of CPU hot plug failing on the little
> > cores of Exynos 5422 based boards?
> >
> > Unfortunately I only have gs101 based Exynos hardware (which is Arm 64 bit
> > SoC) to test on. I can confirm CPU hotplug is functional on the little
> > cluster CPUs with IRQF_PERCPU flag on Pixel6/gs101 though.
>
> This is a duplicate of
> https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
>
> and yes, it fixes the reported issue.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Sorry I hadn't noticed your patch for this. Let's go with your fix
then as it seems more succinct.

Thanks,

Peter
