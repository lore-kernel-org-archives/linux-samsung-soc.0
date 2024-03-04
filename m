Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AA162171
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Mar 2024 20:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709583147; cv=none; b=RqUZPXnPeoHHGBNYZJ/r/q5fPAhSxTGOCqaNTXEdRq+tU3WJNYspYJbuzR0zmNVnR5kfvrGYwmJx/71J9plzNcBaNHhczZHRT/Uy+xncIjl5TepCcoatWGnmfLCRxTe0/ud3EVXAy/buiA72wP293YxgDupwkEoJKphVOwsOLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709583147; c=relaxed/simple;
	bh=9e1w14lVhFmrPtPSUWZqcNue3UJPDbsF7j742qbsVu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WunHoNjJ1ksJxpuOujGL+Q9QmENHkMy9p0kQJRBZmrpNKr9ED5lMnMYofBbujm5UGFdK1KVQgTQAgFpxJppF0FpDm6LgK/0xwrh9XAnMjm3Qqjc7D3sExsyUhxBsumvzPhEITvBUBsBBsBKg2G6XYfcx5cmPIAps+z34eGCizL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JmKDPuZd; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JmKDPuZd"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db3a09e96daso4331814276.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Mar 2024 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709583143; x=1710187943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAiT61kggRPd5YDuiyv4v5ZMae/k0uuT4kkoEq4NmCU=;
        b=JmKDPuZdkUWp65KnSpv+MevYQv7eI0Yc74bY4zjpl44bdDZRCCWZH4hcq/1WBcSCa2
         KHoMBEVM6w6wWILhtMEWU57DVieWgKXcpETKgsfPOiAmTAsjtTu5InqbRRy2aPq2IX7b
         jktsmts4LCGkTELXlCDqzrrb1Z353AVpXg21lT0H13XThZMGYKRwO2v1YPo2CL7jJx0E
         NGhwvQcaJ7XPRQrUBf3lYND916eaqV1ai95g2IFpiDLDarzA9aUACOZm2Ym+MH2l53Ma
         P08i6rPvY5PbMpCjbaXF8D0Ooo4lM56wjFqaRVGj8wElyDSUa4ls4VeVhpXc1bup/kEK
         yjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583143; x=1710187943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAiT61kggRPd5YDuiyv4v5ZMae/k0uuT4kkoEq4NmCU=;
        b=q95Q8XoJvNkSlv8aCsRJXjJqolCilSQvlU5GBAHtre7yA6jEAFk1JcCn+Hb6hFWruQ
         kXLQYmjrsTz5KhTsTEQ1vRPeMAR48Zy5u/xU3pJHzb7pfCEMgHCow9VdLWP5G5YPzymL
         Nmeh0EDCtdD/uovOEtUdYlc6VipAB/Pa32ps+Jsp2lnVm9AwIJ0g2x/V15aNT7Np7XX/
         02w95wm98e7GhrjQfRHZf22ayk+meljpbCSKcuJYK+AaADlH3ErVFgAOYxLKBtPsq3Zr
         oax+ftjhl38c0Be1xSdRtHJCKnMG6vfJyuc1hhZHJBFOgNCC6wE+AT+NoUATegPE+8gX
         wAJg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zm2bBrx0KpnnqvJaZrFnQTmQlk/CT9N/2JKx2ALv5xKnUedghTo1wFMk8EF/m/0yIDKhbUNVYfjLTiXNJW4G5k6BY1hiUoT2Mx3svk6gHaI=
X-Gm-Message-State: AOJu0YwAdkja35Na9w2mAIf52xKATb3PPq72zHmTcG9lkoju5mVuDw6n
	jnUEzf3afgogbvNBM6KcFUyaF/y2s6D7Fh9X9Te2ct+lx0JrvXeMqyv7VRoPYnUUMyQfJKQ+p2K
	6Qa8kex97pO2h19vFqIiIyxay14ZN9Jil6/wzaQ==
X-Google-Smtp-Source: AGHT+IEqPJr4eKDnDYSeNoerMYFKAQrjzVTavb++7VXTSjtLAfm4FVFMvf/uNcNvjlfalWRr+qEPl3nwmkUNiNJTO9E=
X-Received: by 2002:a25:5f51:0:b0:dc6:be64:cfd1 with SMTP id
 h17-20020a255f51000000b00dc6be64cfd1mr7740725ybm.36.1709583143696; Mon, 04
 Mar 2024 12:12:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304175606.1200076-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304175606.1200076-1-andriy.shevchenko@linux.intel.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 4 Mar 2024 14:12:12 -0600
Message-ID: <CAPLW+4nqhMdiVNjZ+HJykBN6pSrZmwaeG6CHxfBTZ=-zwheVJA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mmc: dw_mmc: Remove unused of_gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 11:56=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/mmc/host/dw_mmc-exynos.c | 1 -
>  drivers/mmc/host/dw_mmc.c        | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-e=
xynos.c
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
>
