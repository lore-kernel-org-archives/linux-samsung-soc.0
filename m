Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661542314E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275689; cv=pass; b=d0kv6zSjtKrCs9HaGc3EKg0dnGj0cEdlkCqT+lWlKJoqjzclx2K62GDja8krEK+UqKgQ7ODj/Es4CTpZ1SUXJbXxCxFT7Cokjg3a7bob+DAqp73hiRL9u6/Tjbk/ig3cpRugDJb5U7KCeUHh3d+dEJVdj7QpTQaTBIyzIqXqbLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275689; c=relaxed/simple;
	bh=6A68+dfr/d+pHkYNchrRBxT3co+NdL/w8uNTbJYvy6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDJ5h2wZmMaAZnHdlxVJ6Z3oG494dB+3C2cPHqTYLqYGlKchPZRdbxGV+SOz0lmlW9cqmZsj/TbGWwWWxONVAf5NZKLio/FhJWk5voqt3ix6H328ikK50zg8GkjXigVKI3pKuQPnUZjcQOQvA6fqUwHiKp7yxJexOHnz0NrJyKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYSNzrjZ; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYSNzrjZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bad54961385so391916166b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 14:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275686; cv=none;
        d=google.com; s=arc-20240605;
        b=C2ddcyibwqg1qqBc2ZxTiX3EbBUvth/iypa5RJ65S5Zd9LiowVEs3PO1Aj/2o4QXyG
         5v2Zkh0mh51+h+0URNxoE2tuGkOyPlJdvG/CjDY361CH4sCmFCUwgZWXTOEOu/z611WV
         R2CNIyjvu1rB5yYAHPRryL4045qHL7hyTcvhQxPg7LaBEDduXHnV2m4gU8EPSdv01aV9
         nTdgr3Rgomy/yb/rFAGT8HBekdxFelWO9TwKjrHfyADniFljfb/YKnHQDbnIWnwJrylT
         Tp9Q0wcNDmTSrh7mguyDn66kbEN7+fVIdJK9YzVlh9zUS9/qkMZ/Zo9v05KSPH0sOSU9
         CS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        fh=jxxA4r9p+mtQyD69RIFSwHesDwvivO0mT4HekME+ufw=;
        b=Sp/mGYOx9Wpq4B8nteQ3eZwawAv+MetV9GqI5Ns4B25jdi6vFywlrrBGmr93H8mJaI
         xYi4Pg+73evO23zx+uSeFsckOOJ3AjxSPx+VfkaufofjLzfLEFXN7PzHUPvgSeifWEGJ
         UoKXrhNtcjouQ/guRIG/8McRNl9iB/ULsgKNgJRHjY+qtsS1UvJFpKl1D4F9xR2nsWre
         1mTHjOe7wSgCxt2z1dFSa+BzJKgqz7eApghxnmFa08f7E4/4nWjcFQaKgNHBfjvcklzt
         +J/2AsECqfIZtELXOorjiFxbxOpaXqUh8ToOmd9CIvv91q76qLmm9TbLAaKFqth6ME/a
         1HZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275686; x=1778880486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=SYSNzrjZxAkp+BQvd7UVXPTZvpfdqqvXeR01C0tPTrKJHKzu26ZMzjwr2N9xz8IJD8
         658JQJCGZtDp2xtAg6YlMpyTHIUhvlg32Hn5sbztWB/IXIz9b6M03saPeGVQ7zfubU42
         wh0txolqeAprk3/1MQeixqbB9e26FtVImhgmFKl/t08RtkJDK5JmPQlAIy10kZM9fGSk
         1xnX+knmotI9VoBXAwbtRXcgii2k5i/OD84CJ5JeA5z4907ETETNaLUmKw1x4WYBhMIz
         iXjQ8e+glDs+5u+DPmUoOVx0b0aPxU8Mf2mG3hoaeDY2UAm/mscJ/rsQ2/UeMINlY91W
         gT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275686; x=1778880486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=SLJXNn/9/sFnfqOzqc5n6cSUga4t23h7h9s5qrXxzFIIL+6FF9NydgZSDr+xaZ8axX
         aQ+srUUmMpkYmFW5Bwku+mx4T8oZSTC1ulnmaMZL55ES2rFBYxbj3QG4jiJVDK83ZiSV
         XuReH3FSmJEzlUD0CTlCdCM+IIZpGdBWFRe7meOUSbEf7dGZshFghAmDHtHrdOieBsrY
         4094QUmpb6h3yuKsaWv5zC56FRb1hkFWlLXhuTiO0s4fjAEKfhEiLzbRJzHOmLI+K3aW
         MtPah58W3luetY6HMjfhlLt8jFIM1CNHpyMI3BOE02yPW6ZZfKQsFwVrCY4K/YUweEPK
         kY0w==
X-Forwarded-Encrypted: i=1; AFNElJ/tvSDAlos+dk9Enu0x4qkUtImlpTYo3fgjAFOOGhFbPgU7250nDrW9EZzsZzJTAOvde6rweAtZcBR5aCYbodnciw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymT/6Rr3yeg8ZopAqWd+z7oFAjdYtBPMBi6mLuWBwWWsHZleJ1
	ZtwNV4ee/8u1DN2E9zp6ZV6O8rs/ZyPtzX2K4PJHL6kKJD60kRiJcYpK55axrorWhm4pNP6tL9Q
	cpnS0lkSVp4ACv1OqdTUfIgAOZleUORaPhOoZ/vDplg==
X-Gm-Gg: Acq92OHLvJj2jgsPYU3OPJsY81qyz0ql5HvRzRZdwga5Ad363z1hwhrKcq17KJsrz/Y
	5sYFbPEGZJo1ewSH8LhrLYxiA86zyRVwoHa3+/ilLxo+lOzrVPSczIVOux9OgPbi9YMLyBGmuV2
	EsEVvDej7mfZs4U5IxeoiHaCRl2rSMSaWe0w0fTnyhAUbJtUmZymqfH4NbYn9pcaF5WIzfnpQE9
	JB+U8pIK+EZUmpqBKbDRupV0Gkz6/f/SEPpUTv/uoIKm9NCIl8yxReMplRqTytIMhO4y5BZdRAX
	WCZX4h68lxsAz4H46GCFdhwAp8s8oVnyuMF9hfMLSg==
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id
 a640c23a62f3a-bcbea694c4fmr29891466b.38.1778275686056; Fri, 08 May 2026
 14:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:27:54 +0100
X-Gm-Features: AVHnY4LpLOSjFyVaXAGyH7bOa_gQLppEIJLOzpAApaqZ0siC-A8__fDWDoAHaHo
Message-ID: <CADrjBPry4yQXjc4MLVFvkhHbVCUPmVw5BFLVuMkE21wA2FAdfg@mail.gmail.com>
Subject: Re: [PATCH 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
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
> Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
> a pointer to a `const struct acpm_ops`.
>
> Previously, the operations structure was embedded directly within the
> handle and populated dynamically at runtime via `acpm_setup_ops()`.
> This resulted in mutable function pointers and unnecessary per-instance
> memory overhead.
>
> By defining `exynos_acpm_driver_ops` statically as a `const` structure,
> the function pointers are now safely housed in the read-only `.rodata`
> section. This improves security by preventing function pointer
> overwrites, saves memory, and slightly reduces initialization overhead
> in `acpm_probe()`.
>
> Consequently, update all consumer drivers (clk, mfd) to access the
> operations via the new pointer indirection (`->ops->`). Finally, fix
> the previously empty kernel-doc description for the ops member to
> reflect its new pointer nature.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                     |  8 ++---
>  drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
>  drivers/mfd/sec-acpm.c                             |  6 ++--
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
>  4 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index 93667777094c..953ca8d5720a 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id);
> +       return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id, rate);
> +       return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index da960d3e1145..1a0d98b55439 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -670,30 +670,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
>         return 0;
>  }
>
> -/**
> - * acpm_setup_ops() - setup the operations structures.
> - * @acpm:      pointer to the driver data.
> - */
> -static void acpm_setup_ops(struct acpm_info *acpm)
> -{
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
> -
> -       dvfs_ops->set_rate = acpm_dvfs_set_rate;
> -       dvfs_ops->get_rate = acpm_dvfs_get_rate;
> -
> -       pmic_ops->read_reg = acpm_pmic_read_reg;
> -       pmic_ops->bulk_read = acpm_pmic_bulk_read;
> -       pmic_ops->write_reg = acpm_pmic_write_reg;
> -       pmic_ops->bulk_write = acpm_pmic_bulk_write;
> -       pmic_ops->update_reg = acpm_pmic_update_reg;
> -}
> -
>  static void acpm_clk_pdev_unregister(void *data)
>  {
>         platform_device_unregister(data);
>  }
>
> +static const struct acpm_ops exynos_acpm_driver_ops = {
> +       .dvfs = {
> +               .set_rate = acpm_dvfs_set_rate,
> +               .get_rate = acpm_dvfs_get_rate,
> +       },
> +
> +       .pmic = {
> +               .read_reg = acpm_pmic_read_reg,
> +               .bulk_read = acpm_pmic_bulk_read,
> +               .write_reg = acpm_pmic_write_reg,
> +               .bulk_write = acpm_pmic_bulk_write,
> +               .update_reg = acpm_pmic_update_reg,
> +       },
> +};
> +
>  static int acpm_probe(struct platform_device *pdev)
>  {
>         const struct acpm_match_data *match_data;
> @@ -734,7 +730,7 @@ static int acpm_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       acpm_setup_ops(acpm);
> +       acpm->handle.ops = &exynos_acpm_driver_ops;
>
>         platform_set_drvdata(pdev, acpm);
>
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 9e15b260b8df..3397d13d3b7f 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index b206efa62be6..fbf1829b33db 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -42,10 +42,10 @@ struct acpm_ops {
>
>  /**
>   * struct acpm_handle - Reference to an initialized protocol instance
> - * @ops:
> + * @ops:       pointer to the constant ACPM protocol operations.
>   */
>  struct acpm_handle {
> -       struct acpm_ops ops;
> +       const struct acpm_ops *ops;
>  };
>
>  struct device;
>
> --
> 2.54.0.545.g6539524ca2-goog
>
