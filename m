Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ACD1DE892
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600196; cv=none; b=IF5mdvZMjMDWdiHCM4jAS+w7nBrG3Mm7tLB0ZSNcFIqD3Ym4Fkxsjfgolc96BQRwQ++ErdQzH9Uoa0RnuoBHGgWXapoNsPw63i2g3zaHKNe9vowsOTGWMcjeaGCvEifnKDUKYLIIvJKG7pE17UkV90K5m9ZXTWO3VnHg6wJCHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600196; c=relaxed/simple;
	bh=mCCWuV6Odut3uFczrkLcBwk95v4G96gg/5yw1QP4OoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG2iNOoV5CobpMoUgmOyoebPMMs3LhUcnGc9fIIe7uG4G/FrDUdvfvVSUDdm+Bpg9YkpPA4ovMmYN2urN8qgTUQ9cBerhufx80ArYkaCYSyv7u8SujT4+ZzlI3ikHQal9zdWBdbiWGnCimViV0DjBzTKUvyoYSN2KvU9TyEIzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b4XY0FZV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b4XY0FZV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23c703c471dso1288515ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752600194; x=1753204994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeSwPftceeI4bS5ZJ/5dVmNBTZSjRvLVPg9Q3yUXq/U=;
        b=b4XY0FZVD30gT3SeXKcFFVHwEM3WlBIuldn2vbqlG7fJ24L349gcrUH7xf8Np1MEEg
         tTlkQsxjxTNE1b42lNmqV+Vd3XuYPoYpd2Frix2PgwMiMQBRqdIRWnq2tDIbY2xQwWxn
         gU/PzjMzG8T50M0p+2EWQLKCwcPLrOJLrATXBWCIQpxIK7jbNpbE8QC0bgtHYsua+T8x
         Qh/wwvt/5YP+0Z1oVDmvAMZwMcHQiIugZMvtRMEGSLkBZCOC0DzVOARUsbXKVh5fy2qK
         ZfClTDJYX5+vdyCGr9rzs6VoUz4YEDU9uDP7ABjmAuVfrticYGblpg766F+caQkUtP27
         QR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600194; x=1753204994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeSwPftceeI4bS5ZJ/5dVmNBTZSjRvLVPg9Q3yUXq/U=;
        b=ra1pUGcGs1VGk9NmCULeZOlFr6+02K3pFUqJB2N/qiqOM+fcUHZqsAU3sgrfj0EOmE
         Lda1NAdTOkY60EbsEwA4HZOnZvTMV4T2B/Wk5V3cqQNCGmaw5nipbVL1SsL2Uf7un8Mj
         /GSX+lRiH9Z3bmRJwAOus1YXTk1hZs4dSOkx0svv0MubKlWR8aYkWHvejMnwi295hKLy
         FrFTHpWzTUbjG7l704STZPK1Pn3HvZUUJaQ1CCAmTMbigxxGsyKo2+Q5DMHd8I7VqIzu
         fUIfDXXcr9FR4fQGFYm/v5d7oxCfnwjDTUDZI1R8/zX9d/VwwGPU/iE96h17EvOiO01N
         4G7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX59j/XQeZPrnXk9t88ksBlbJrXEEzvMuXiowVnGu0MN8Ll+9h63SMhLvpGrPDHFx56h7Jz8dx7q1qo7cLpdkP+zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMo9zgo0Sm1FSnpudbugH6rOtzW0ITNYLye/Q3pcG5LfI7xCZw
	HWkMkGullJH6m0XdMTAWVAVOhxdQNneMsdjpxuL+rEptzh3IiGAnV62nBZ9H1rxmdQ==
X-Gm-Gg: ASbGnctHkMSHeLAmBWyHwb0v8IojNsiLxX/sX/L0oCU9jTwY5yGYNJdc7v16TzVzEkl
	ThDp//Z9Lkzimi13PGydVPO9fSLWnO8/MXyPMUt7r6i9d/5gkKR1Ez7nHAaNhsdB5hYNZ/0j6Ro
	RtYYqh/iAaoQTjmLGQGlgHsmNlNKM2P9NsZY9gvD+GvmPDFJjd4RZW1JwPrC+yADwFSYxqWljAs
	Z0Utcq15mB9qcNwPhPq635cVskDA2Z+NMYBRBAoUwVGwbIKKFihXPfaNOpNq56qVY5Jw7VcL0cl
	Aj9K7g4ucfp4cjC3cw/TW7KH5NzFTqLHboP+Q4JAyuZ3jlv7MVHjxIFCQUtDSZfM56GFnMXUwmo
	Frt54istip7cbl3CPUz/bhNh8u8NVwbFKZkFh3nuy64/OizVt2S3BaaLEyrefIdI=
X-Google-Smtp-Source: AGHT+IE8tlVGhJEdemSXyXUpK0hF30ss3dhi3KqymqtfDaNyMz+jAYsoKXuNfguzst4OMQTFv0uS9A==
X-Received: by 2002:a17:903:1248:b0:231:c89f:4e94 with SMTP id d9443c01a7336-23e1a4c71e3mr67028215ad.21.1752600193877;
        Tue, 15 Jul 2025 10:23:13 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4332eadsm116684575ad.153.2025.07.15.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:23:13 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:23:09 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch
 from the module conversion
Message-ID: <aHaOfZk77xDf81cP@google.com>
References: <20250620181719.1399856-6-willmcvicker@google.com>
 <20250715121834.2059191-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715121834.2059191-1-daniel.lezcano@linaro.org>

On 07/15/2025, Daniel Lezcano wrote:
> The function register_current_timer_delay() when compiling on ARM32
> fails with a section mismatch. That is resulting from the module
> conversion where the function exynos4_clocksource_init() is called
> from mct_init_dt(). This one had its __init annotation removed to for
> the module loading.
> 
> Fix this by adding the __init_or_module annotation for the functions:
>  - mct_init_dt()
>  - mct_init_spi()
>  - mct_init_dt()
> 
> Compiled on ARM32 + MODULES=no, ARM64 + MODULES=yes, ARM64 +
> MODULES=no
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

> ---
>  drivers/clocksource/exynos_mct.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 5075ebe052a7..80d263ee046d 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
>  
> -static int mct_init_dt(struct device_node *np, unsigned int int_type)
> +static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};
> @@ -705,12 +705,12 @@ static int mct_init_dt(struct device_node *np, unsigned int int_type)
>  	return exynos4_clockevent_init();
>  }
>  
> -static int mct_init_spi(struct device_node *np)
> +static __init_or_module int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int mct_init_ppi(struct device_node *np)
> +static __init_or_module int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> -- 
> 2.43.0
> 

Thanks Daniel for catching this! Sorry I missed it.

Regards,
Will

