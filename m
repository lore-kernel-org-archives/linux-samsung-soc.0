Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1032F8EA3
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274935; cv=pass; b=X7uXN94G6bRwfTnWyjJ7UbO26Ush4K9e4u98tvWmfpvtyTuzXatTG82FqyzRVFWz3eUnDLshwyHvHm9UcZrQ+vAG1h8R4TqDtJ4Sn1XO+RhWkYudIuYTHdS/Rlc/aE7KHEYfd1lUgyx3QdrsBfoB+SdSSOVBq38PMObKcgI8/Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274935; c=relaxed/simple;
	bh=AdOmPXJg8zZHVEiRf3olZ41q5CFCGVm7wn2+MOpzjo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqil8HjFpgsAjPOpwom1wPQNLIIMw5RisZ240+mfY6U93uegusOtey2qCl9tPhQjnxQQR/VPfUmmUI/HME40o6skAqG6Q7Voy5dW+xM75R4cFQSiw3xTuqU4ceQg9T//T1KJCn35FrCPnxPlNUBjjLuGXBm/efY2f9Jl4imORFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcUhgEG2; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcUhgEG2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so4448100a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 14:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778274933; cv=none;
        d=google.com; s=arc-20240605;
        b=LL0xYQgOldf8+dlKXUq8qG+6MKOVh1tAld9SeDfXcuDZv7YYfXQajWXnfiyP11DqJT
         mp71wheAXJnNG/G4eaCqSsRtfxXAfptlI8KXK6Ahs7JNJg1DJ/q8znIbqf6S8lzBuNpF
         /WWTdt2aztJOaO6hC9ypVizrIwJbszfknofdvbFTKK8acjaDyMgoLPxhbw2A71VTRFvE
         aY0Mp9YGiBsfEdiA1UWmhPRlXMfe0m14TM8jsYHvjkkmaXiec9hxQyktjmpAFPaEQxDX
         /wDL/C+EQGyUVUdBwvEAUCxTv0AlYUnXqRNhNFBbz3bHSKp+COsaBEpaRa8zUyf9bHCW
         bANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        fh=mcGATtcUlLX0Z2u1Q8AZJsqPqctyVUX4J4w2bIZqTYw=;
        b=fKEEZNc/e8LgyP0Ub+0F/7naNoPd+GOWr5TQJcSilfSi0He7g8bQldnB1Bh87Y7hhQ
         ZULGVCoqFrbGU5M3NyhcTawDKXFxl8hoSTMepmjt3HU70/6gah7s3JV/+kHieThopIGZ
         pg9pz5RHrNh8FuBowQvDuCp1fuI9SOgkudb0nLX9R0Uu2ejjP3zRdkb8nDrOtGP7pqAs
         AcGPMSOKSozDDxl8bB6p7sK1f/R2w5vAZxKC0vLiREm+MUeEdbx8T0JpwFzPBrMbE4Sw
         XpeH7Y0UzFsYo23a4/BM5sl5qVnfBR1JSx8kizr90STJIE0sNiRRjf3AQkXS5Vx2/Dr6
         zMqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778274933; x=1778879733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=NcUhgEG2pfV1qvKToK2GQYj6dVnWyCXC9Lps2AT5eGWl1vvgjQb8RtJjNgTy1FUT1e
         F+CwuOpzsrlAem7rzLkhhHQeEOMYVw8tlPOpl66EZ09OiOGq/j2+8+1N62iSij1mMenI
         rifeA+svDtveqQ+g/WhyuiiVFANwJVc/+518F0EZyghACeRQqoqdb1UCAm6/Eb0LCcLJ
         nkggyF4BPYh8LJT5Xg2rbk5iWpNpFE6UrjEiWuiXmKR7sgr6zuVj8cQqTrDazi/QBYJ3
         1emkqDJU8j1a4eFngfA/KRVZXP1/BTPAyR+OKgo9nQwxp7hxmbn+7WmiK2tNQ0nKKygf
         /8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274933; x=1778879733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=gjWlQVFrt8VWXeWZrJwXcpyOJXcSLfWE6ubRbC7P7J1EBR8i4H4YBv+mAsNvfy2ctI
         skWClltl+YpCfGaFsnChfhhKjgJxiqoQqYvj/3/xyiFVCjshhaY8uqUj/xpldq7rXNDu
         REN+xpaKwZBfBIgtBvhlbuTzuZqy49wk6pfriPm42dlN0Mm9xCnsjEUWBNdbtKcnG0Bo
         i93kz0RPCbyQrAvnf1JwmGGGiyXWQImv3W2Rk/8CSwjr1ow+oluPWDuB+Cn0rv++34ni
         L808jimvOy3hqv9amo9tP55gPyrYTUBhM0m2Vctl9WtDEdklDSYYc318t9dTGxOGf6Ur
         syzg==
X-Forwarded-Encrypted: i=1; AFNElJ9et5yT1wGXBpQYpR4YI8pz1iqxAqxVx10vulcpswhXJxDqx4gW++QL813uDatLPNTAZq2MlfVHCDvKJr2FqIiCdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrM8iOcX93AdRoAOtkZdEYTArw5SpI4/BT5t/h2mcW9mSdapPA
	rYBY/fGej7oZeKAYfeO0rjGuEdXTHbW4On+FFIQYP6wepCGcUdG/dLvb/u2doRu2Ui3YLvvou35
	uxd8HVZMFAuPrw5n1bMYh175YPslwaQk6WAR7HW0LfA==
X-Gm-Gg: Acq92OF6cw1zaaagRcYUn+8kuqm9MRw3hEINa0G/1cIaa4j0SINtk4wt1yrlgyHN26e
	X3F5xAyfJ/b+aoEJVIHYR6tpePupbXZ/oo/kse5i0FlNq+Soc/fZRDkaQjj/WfjFRu69lCGzHVF
	no7Z/qyfBJIC8TKMsxDnrhJLe7SZgX567mf7Y3YrEZVMpWEpLZA57VylyN/4PB6G5I4Q4oRmPZF
	7wAmp6in30rm+xA+Dr2csdh+WNkQv40UHIOu1DakYT/Sc/Lx4bUGXOjJbqebzp36eI/HsvkNT8U
	5yzyPllrouQyPRoFmdAzokKfC70NPUJmvHVYXPdM+ce33cCHVRg2
X-Received: by 2002:a05:6402:1ec9:b0:676:9c6d:5c4d with SMTP id
 4fb4d7f45d1cf-67ef09b24c2mr2202764a12.17.1778274932823; Fri, 08 May 2026
 14:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:15:20 +0100
X-Gm-Features: AVHnY4INLr6tr26Lmd7iIN0VZuJDb4bQSnp24OgoULrQQwKG8Z2swPkqXTHOYdY
Message-ID: <CADrjBPqdZrpRJwgHknygW9rdB5rj1W69L26qoXwuHAgVcjrG3g@mail.gmail.com>
Subject: Re: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
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
> Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
> maintain consistent nomenclature across the driver (aligning with
> `txcnt`, `rxcnt`, and transfer helpers).
>
> With the member renamed, annotate the dynamically allocated `cmd`
> pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
> bounds checking.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 88a06842753d..fac88c427d2a 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -105,14 +105,14 @@ struct acpm_queue {
>   * struct acpm_rx_data - RX queue data.
>   *
>   * @cmd:       pointer to where the data shall be saved.
> - * @n_cmd:     number of 32-bit commands.
> + * @cmdcnt:    allocated capacity of the @cmd buffer in 32-bit words.
>   * @rxcnt:     expected length of the response in 32-bit words.
>   * @completed: flag indicating if the firmware response has been fully
>   *             processed.
>   */
>  struct acpm_rx_data {
> -       u32 *cmd;
> -       size_t n_cmd;
> +       u32 *cmd __counted_by_ptr(cmdcnt);
> +       size_t cmdcnt;
>         size_t rxcnt;
>         bool completed;
>  };
> @@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
>         /* Clear data for upcoming responses */
>         rx_data = &achan->rx_data[bit];
>         rx_data->completed = false;
> -       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> +       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
>         /* zero means no response expected */
>         rx_data->rxcnt = xfer->rxcnt;
>
> @@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
>  {
>         struct device *dev = achan->acpm->dev;
>         struct acpm_rx_data *rx_data;
> -       size_t cmd_size, n_cmd;
> +       size_t cmd_size, cmdcnt;
>         int i;
>
>         if (achan->mlen == 0)
>                 return 0;
>
>         cmd_size = sizeof(*(achan->rx_data[0].cmd));
> -       n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
> +       cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
>
>         for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
>                 rx_data = &achan->rx_data[i];
> -               rx_data->n_cmd = n_cmd;
> -               rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
> +               rx_data->cmdcnt = cmdcnt;
> +               rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
>                 if (!rx_data->cmd)
>                         return -ENOMEM;
>         }
>
> --
> 2.54.0.545.g6539524ca2-goog
>
