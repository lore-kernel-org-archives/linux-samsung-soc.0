Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3565A4E3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Mar 2024 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640923; cv=none; b=pF7E4EkazwFG8NO1eS/rRHsZi7HdNxMguZStfLGNMXPZedUqRCMLOhqfOqOLIeYJSdGi14xoyZze95UoSsieQyTAPmLAQRoiRfR5XoeCuKfx9gE3dpmOZi8oaXJSlb8fXaURbnuKNmFD6XQqmWPH2nUNj3KB6X/aaa3IXFqduQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640923; c=relaxed/simple;
	bh=aIbb1y6977IQBkZ/bp56H879bh0Vy937a+tWbyOg/JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQKF1iGyb/sbmzL8tbboXqhALw1YiG2h/NvLRiBiTWUUVnlkDY2VWsbLUunzSN1Y8JwNSiOO/aSUbj15p7VijhqmCpVd4D4h2LHVbO0xDZrENMF+p8dRmmqDIRKH7InyTyqxXFvpRIcgG5UxY/Fl5qNogMCsOnHi86536uAj930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/RhHz5V; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/RhHz5V"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db3a09e96daso4922901276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2024 04:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709640920; x=1710245720; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nd1S7MkPmJaZzvq5t+fXqIlS8Ad6jgg8iGnh7IRKP9Y=;
        b=D/RhHz5VxiZFbdNLT39hRVrgt+QlwaqILNtKeBxHBlC1S2SjEiT7MODYiPhTY0kHTb
         S4ESrVCZQqgWrUVByj1bp8qVn1jyCwI+e5KZCYswQ9cXK4U2InM24AbKSqMxLjc/ccgk
         ofSn6H0KxBAz/LlAq2xdFle3r8hVXGzJXwSFjoVRRtb2dr6HxD878uOFHjMdga0mxJui
         086fH5CM1YclSI2ZdiKMLqHBsl9Fui8895lYx/BOVxKD26mDHMb60xLIRBIx/MUzFuPL
         5m2Dcil9HMGFW67WAarepFEXPPRrryj42Zwp26gbHMKhYyo1eqGpX5e2Hnfobtx+R4+H
         Mh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640920; x=1710245720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd1S7MkPmJaZzvq5t+fXqIlS8Ad6jgg8iGnh7IRKP9Y=;
        b=SZ65ARQ+GE4VzCTXt1MZyM/m3uq9YatnqNrrMLCZo2WD+5sPeb1hm9NFjssF4Y+WQd
         ZZNQ5l3ISiR2tFdK3YBUXC1UDGOvJolsUc50fxYAB9vRf0PSm73o0TJ8HmShI/yFZQln
         Z9EJcJweA1OabTrg7YzkyxTYX9gw8BY4TZf75YO6HmS8BYPNxrORd87MHddFrfDkhvyM
         kfGvwBpbIjQdorExySwLnUpfAvEwD7RtJFtfr1eYuMaGec4jfNaZG6mpq4Nd/odAabRM
         eLnX/npYXvzXRZuT4hEm8XGE+wkW7ZSeBVAl4ETvQFcL80EuqesY6uXJ1W36HIvmneD2
         +xMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBbXJ9GF+n76d+bvFcafGc2TbBH47tWi6lmJdVB/98NV2wOGGdeIN+G4m/M16n3wAiVRb6ZflUMqU9mqHEXNXolh2mk1TQTQ6vvL+1V2vLQv0=
X-Gm-Message-State: AOJu0YxnS92MT5G/B7+vHcoWkNg/6BPnSioan2LaHt/VE7xrxuwXPNmx
	4Ljzd3XwRu4zeXPkmjoINH6hNIj4u6Z36qqfjO7fk3VoHCcmSaUT039/2Ttznur7XxZ8VKVSlBe
	PnlGxrBnoapNZ0ZJah7+EFn1laNgs1oLXfVvOrg==
X-Google-Smtp-Source: AGHT+IFb38GsRgce2KGsx0/Wwj0pEhfFF3NHBc9eAjpDvVHaHE04kKB+/yJB06PXTECa9X+ixXBG3PBFirGsewNigKc=
X-Received: by 2002:a25:adde:0:b0:dc7:3166:ad25 with SMTP id
 d30-20020a25adde000000b00dc73166ad25mr8366161ybe.25.1709640920491; Tue, 05
 Mar 2024 04:15:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304175606.1200076-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304175606.1200076-1-andriy.shevchenko@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Mar 2024 13:14:44 +0100
Message-ID: <CAPDyKFqKYhhEGvyhHuCh-U_nybXvyvVxnkbfQG682UfVZ5hkMA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mmc: dw_mmc: Remove unused of_gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 18:56, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-exynos.c | 1 -
>  drivers/mmc/host/dw_mmc.c        | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
> index 698408e8bad0..6dc057718d2c 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -11,7 +11,6 @@
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 829af2c98a44..8e2d676b9239 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -35,7 +35,6 @@
>  #include <linux/bitops.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/mmc/slot-gpio.h>
>
>  #include "dw_mmc.h"
> --
> 2.43.0.rc1.1.gbec44491f096
>
