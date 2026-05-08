Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A427979A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275422; cv=pass; b=EOTqN8aS/51T807/L+v4dyYpLmxmxcXfhyIh8hwj+uzQhY4+/PveFnL9h+zGQU4PlAj4YP/YifgvYZGlX87vyZ+Fu5MiCis8kGTYra6Cg3r9fgaWFzqvPZUwJHE8ePWSkXj2RJVTCq6ejial1aDWcCiIJRinJA4L1iib41DG6JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275422; c=relaxed/simple;
	bh=JjzbFy2ZE5GCQkLQ2jpRAjPX4ddb2In753y94sylcBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbtxtDMOuwDcB0ElkGJuj3+gZXZs00AxwRp6d+s8k3T9QcoOQIcQKEu4EgGdf9llNc+yKcrt73RrTUg0R+10ki6uUjkaZ5WdydAW1CnPeFIrCEHHML8XynRDpYIL/BUPOmVlRygsG2VTkektPJnkls+AWbG8wsnTLBMWOwn2FW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M7uyINkU; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7uyINkU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f9568e074so394973466b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 14:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275420; cv=none;
        d=google.com; s=arc-20240605;
        b=VOc9GVfWiCWgMQn8K2rDYrYbd0kBiCm1gmv831R8O1AoapiTvCZuf8yT388VIKATsJ
         dD/H6phCaGGMRm4lFZFhmXpivoFjARvl4pF6aIz6758HSGPZesUTHzlpnqsYpSgSkzCD
         KIOnW4nGuSYm7NljX0eL73wQYBLxRGtz02wT+Nssv1JSbkXuR5vi98KeSWYWSL4ZoPtx
         h+uzlii4GW+SKRD9om4VpZuTKwjoPJ4hmfVDdfR9LGmfT0ViuMf20kHc0jevYIOCHxpS
         qNoRDyZCzv4xauVVRmRWc3KbkoiDNJsVYqAHEOjUo/uWiGxZaR6GE9LHLajn8Hj1jCNP
         Zafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        fh=rZL+t7yNe76FEJcqg5Z9DvAkiYpv+3CKqDSI9n+PWaI=;
        b=faSWNW20ThshaAkufOwQx2kqI7ReG9pQZo1Nf4zH62tbgoDbkWoOLHepzU69ecEPVp
         YH4gytNqn/K4d7FQf44gvdBhHervv9tjasEYLdkcOaDRh6OVCG9ftG3eiCkUqDUsbWR6
         C2Mfe9SFNZrLWzRDPTpLTPHeg8QRanQwCFSXdP5jOXvViYf3BIEtLxryoN+Ta8pVOoHe
         /Hu5JQ9mL+nRb0bxw65vzF/+5IFGKMJTBY+poRgvToljupnFa5RAckcjqVQ/0jm9B9Lt
         JEcz5I01fbm6Wb0HHa3KTGeM8i34W8vgzDJW00VKLXfqX/JQQP6bf03SJK69EreygNig
         1XIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275420; x=1778880220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=M7uyINkUoLx8IIpyFEjRSs5ccMtENsWh15L3FCRSEheigOPlV7VMcetlhkhH/nDJ8F
         ymA74EjMovQ3N1+GZpVUjLhJeBOsqdsfy3p/vVYwyK70WhubXOGkuN5zvN2gVnNSQCN/
         BXy6U5D5kajDvBgNu9Fes6pWya3EzZ8FtKM3F4M4fT97BG1q6lYVLH3bJ1pXDafW5Qjd
         SSkpM49VTa2i9qaVffHZGIaS7OyMbmJa/9JYTp16MkqL/793VQINlPADrGgLM5xc83RS
         IpG7ulC1zGjPsjiJ4XjasCzST8cO5JpVcBzTkzFX+O9nozOPEY9KQtiSdo8oAsXVCMrg
         hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275420; x=1778880220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=RT9xgOPD9dzRjBb3E/NkyvU+V52MiAFhVZECmfnJ4HhrBHpDr+9ILfMunuJph8nPYt
         S70qKvcf89vnWXaFcIGrTo6NkQruCWbYoS4biMkm5TBDEOU0YHmhbDZhIpBPaE+seTnT
         e0Ofb4mCHkJOD5WiBBySxYxZYtCFne2nG6+hijP7nt2YhtoyXf+MPy+YvQvuxAsVV//u
         RjhwVcy79bPCpt6WY2P1NsfaEehqVN/2uj288ZAVjAWN6AUiewTMbs4HKwtTKw+XRGwj
         AgmrwaqidXBVMN+6IutlZr85XZCXoCgp/TwctEe7rgmOFT+F0HkAbpRs74ced5y2t4gt
         wh0w==
X-Forwarded-Encrypted: i=1; AFNElJ/xSnMO8SFYhaA8/+jZSV+Rqvl5iUwEu80x6KHX2vJqj38s1a38UZhUJNXjQkBptduCyKNqPAqxde9rCMjrEgu8dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGphvv1AXgV8Qi6UwYikbnBvRn+HzAxPyJcrXsZE3nUxEpFpj4
	eCYk5caoBCBJ7ZnbHV5aRHe2skdH6xjyX0SNsSmaG0zknVzMuHuR59ZUdb+r9aIRSRKgcxozIz+
	DPoQMqw5IohdRA0k7MYqIqW8L8oZySkS8O1ufoQ93kA==
X-Gm-Gg: Acq92OHqt7jPK2oMFWdgXmCVnoMGDFyWp9ILlN1Iw0fMv8sjFmYSELNTovQiB8z6bU1
	xhlOOP9jpmNrlHO47kwkUHSRkMaVWAnqJ763okPtc9efnSisK9nu/cvV60zZzkSOXtuYzHCtdHc
	fAY7RDaMQYIOzPvIssCTlMZ3iXw/fZWqStZhYJC+49Jh6nIPXP5SS6JqMTg/NxDyxLFnVLFEnMy
	dCk/lx/KXtqJtukNsqKOuKvHw3DauQwde4mxu675phF7CDAEtmyarsmg56nkzLSvcr3zcMJuFza
	e7gPB1d0KV9aQTQunaU3kx9tql5HAIbKVE28QuWrmw==
X-Received: by 2002:a17:907:c06:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-bc56be3f762mr934940566b.6.1778275419723; Fri, 08 May 2026
 14:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:23:27 +0100
X-Gm-Features: AVHnY4LLKqUnG42bw1kGuZ5A8Ore_i8f_07LxVicEeYBN4fNYRTwN4DHlu-DLSI
Message-ID: <CADrjBPqzKpcd9vuCmNUptCUPyPpPbHcc19-7kN-1c0RpW1e5DQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
> `dvfs` and `pmic` respectively.
>
> Since these members are housed within the `acpm_ops` structure and
> utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
> creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).
>
> This cleanup removes the stuttering, leading to cleaner consumer code.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
>  drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
>  drivers/mfd/sec-acpm.c                                | 6 +++---
>  include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index d8944160793a..93667777094c 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id);
> +       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id, rate);
> +       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index fac88c427d2a..da960d3e1145 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
>   */
>  static void acpm_setup_ops(struct acpm_info *acpm)
>  {
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
> +       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> +       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
>
>         dvfs_ops->set_rate = acpm_dvfs_set_rate;
>         dvfs_ops->get_rate = acpm_dvfs_get_rate;
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 0e23b9d9f7ee..9e15b260b8df 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index d4db2796a6fb..b206efa62be6 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -36,8 +36,8 @@ struct acpm_pmic_ops {
>  };
>
>  struct acpm_ops {
> -       struct acpm_dvfs_ops dvfs_ops;
> -       struct acpm_pmic_ops pmic_ops;
> +       struct acpm_dvfs_ops dvfs;
> +       struct acpm_pmic_ops pmic;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>
