Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8663FFAAA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089117; cv=pass; b=qHymorFeagt6yDLGYldP/JwWEG7vbU30jctkxBmyZg5pg/S43WpraUuFwUZFUtsVDmQUXNMkG4BkA1J0ct/pjI9VGB1osIqDNLZFyjdvViUkdEQTreIJgUgWGr6smqSNKa9Ho3OCXz9dagGLPfkmqfsQMhgRXRhaXwTyEznpagE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089117; c=relaxed/simple;
	bh=IsH/o3sokzqOos212l12PDYiFKlklnRFmICJnS027rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjjRg5d7mcGDBo6kYb63B7Fwv1y0Hd5dM/JyG1sVnezHZ6/kc+VhsDxLQeZ3/5XjyJCJ9jp48FWfKO2G2l0h1gZfuclYRTD9gesWxNhFMVCxqlVdgUNyDeUI9VaMBBM1QgFm99cWVLhGHxxDK613+7VIb4bJyIcolYhyprmA8j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7rIU4FO; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7rIU4FO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so13165277a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 03:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781089110; cv=none;
        d=google.com; s=arc-20240605;
        b=Xuvjln2Kgb7zXNYwalLDdFQUQ9AKSlWTyNrJAHT2md+nSJHMTbhfALO2ubym2ycQGp
         fG7BvdR+eCWluTnLGpisrwJw0ay8wl9T8rj6DIGpUOUb4FBsn+nA2nLAAv606wNVgyHE
         pbV8KO3idN4qe0bDyMNoeQ3yluO3pPJgiWx776W9BBlcSdHjaCUtgLFcAx0kfkps+Ebp
         +ESdF7d0Qd3xsdMF62k4miU2cL/6Pexlln32oUzGOGF8p+RNfImLykCrlcvLsOQprOxT
         IKhwJTCsHYdAT/bZbE8ekXEs2YimUfEOhK0cNkBjIpE+71wUAHpGb7nlbsvnPNpAImQB
         N3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        fh=XhqeRnWdElzjJMMxwgSY/AlgK2Ew7eNEfgLDfnLjY6c=;
        b=FrzlU2dBfnemT4rAt0Ha7XVEPGL2w1sIUKRqMuZ54pmPB09AwhvE4EINeIdA+wKFae
         yWV7zAk8hTO9zL2tRGOTSSY3ESRMg58SMyHDVmNmCaodyOjyxCyjaqKZ4cOkT1Du2t/O
         Pa/MxRX1HdnRrJdEnjW/QTf5Gw2zjFXa3ZGLwNDqZp7L5b/lM06zvi9U7Xt6P225K4Ze
         Tjm74WrIqq6BOK6gkX7MQvMa1ksGkpPhE98PGZkaGl3MzAsX2i7Na0ebHiB9G1dp08F6
         n8Ec1qGgjKZq6MrjVAsEhJ0wRubazGPSo94tgeYA15OGUeTEyjnVbRqj2NifuHboFGCX
         cBmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781089110; x=1781693910; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        b=r7rIU4FOd7qobXnqxhwQnjMwuijY0UTSRUt+Q80H+ICNXeK6ut2PpyNgZvjutvci2W
         4kNIt8pWtdJlAEwDffMehiElVm3t4JFVd73zR1eGXFMSh4V+wvwzueV3nDVx0R0wvfcy
         KpLjvp2yihv/pSGFKcbNmiu7IxkFT+vG8rZgrMxQdpuJuwHfE6IL+ZUGNkD+rfvNTGL/
         Y9HkI8nFqEFmT9W4vcDPErSuU1DepSIq51I0u256eVvecnL8N5q1fzNHatTnLX/mGaQA
         SPTcBl19eb1R1SW8+wurKGUVunm4bG0DwYV5s8AYPzM/bNs4/M592hr6Av8CdD0w+uUx
         FvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089110; x=1781693910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        b=hOA0LXhHoLq2nLjX/AmW34TZfUmWm/zEmU79Rz7vbWWnfxLz2zUkHj4xitjgTQOsnW
         sUHf1iQ2EEFZxJ4g9Bz/BGhCYdk0jxz0EMdEfg3dPqEgXJyQ9bMO7vxTKpn+6NaQfFO2
         sznpxhJdZ6+h4INPoG1jRl0LlfEzDva3XT9xZRJYU//Rzj8y3FCXKDU5bWzh+qAodsVa
         g1CsSP8LV5oemny4n2AxWOh3yglLeZ+5QEE7ERQEb2MXk/YFT8/IfbO9UQvESA98YNWX
         oAw/1Zh19bSix3JF/O8g4ooNylvCEyJNZWT/GpwB8I4RNUkp67L4FJdzxZd+wq7wmsFH
         TZ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Ys4xZSnWsxkaXcb3dH1vXraFD8aKMeI1t3O9y4KF7wUV0QxMykVviTqNw02lOe55Vjrqx8InA0YrO6rw3DDMojw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDbyWYBxhQZjDdvV1SrxkwYy7U3PGSUZdG9Gq0lhgM+pNw7zf
	HwozMYBAEgoh8HbjGgzPPmbhXom01HLVnAl6xQpVULeN9Fc4iG9pWUfoUlFbLb0PgRyI9bpFECO
	jLWELa9SZ7M+O4x3AytWkpN0Q7ZwGGe9UhtBOAz9VLQ==
X-Gm-Gg: Acq92OG2L2gIt2Lv+7vfSQeTFiUGhX6GoyHhvQtLgRrrjb4z0ZHB7jH8alwkK5Zq5Os
	mMPEFp6+KqbjKvUx/mWR+naI8mktzfBOnfImUUMllWm32J/UEczI3elsBbGMTBDt+6NOLK1HHWi
	UuvCBFR19cYS0/88HPSCafngOtksJNNKouahBbgKjkYKLcUYUvDzswhfocl43zPVstJPmJuWIec
	6Rnf0GCA9FCm7BFkPaGgKlDKtomJ8LKOFbtI5LgFd4uqkd5NYXBs0UzTV6tNKkJwmgjZT22abAY
	bF2+9xzrXWWzb4mSxvafK0VhazIimQNHIh434DP72XT2OCA8rRb9
X-Received: by 2002:a05:6402:3711:b0:691:ad29:ea20 with SMTP id
 4fb4d7f45d1cf-691ad29ec32mr8237260a12.14.1781089109643; Wed, 10 Jun 2026
 03:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 11:58:18 +0100
X-Gm-Features: AVVi8Cc8CtqeDsBexbU73aNUL0ZdHbMknGnH8Y2ORIFe_Si6C0zGr-kM3HOWHug
Message-ID: <CADrjBPoHhiNTfBsEam+=AWVc03mbQt+E6gm5Dw0fo=pH-w4Uuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

Thanks for your patch.

On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The setup_cpuhp_and_cpuidle() parses the device tree node for the
> interrupt generation block via of_parse_phandle() and decrements its
> reference count using of_node_put() immediately after fetching the resource
> address. However, later the intr_gen_node pointer is passed into
> of_syscon_register_regmap().
>
> Fix this by moving the of_node_put() invocation to after the
> of_syscon_register_regmap() call, and adding it to correct error paths.

I think  using
__free(device_node) = of_parse_phandle

would be a cleaner/simpler fix.

Peter




Peter.

>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 6e635872247a..9636287f6794 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -428,23 +428,30 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>          * syscon provided regmap.
>          */
>         ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
> -       of_node_put(intr_gen_node);
> +       if (ret) {
> +               of_node_put(intr_gen_node);
> +               return ret;
> +       }
>
>         virt_addr = devm_ioremap(dev, intrgen_res.start,
>                                  resource_size(&intrgen_res));
> -       if (!virt_addr)
> +       if (!virt_addr) {
> +               of_node_put(intr_gen_node);
>                 return -ENOMEM;
> +       }
>
>         pmu_context->pmuintrgen = devm_regmap_init_mmio(dev, virt_addr,
>                                                         &regmap_pmu_intr);
>         if (IS_ERR(pmu_context->pmuintrgen)) {
>                 dev_err(dev, "failed to initialize pmu-intr-gen regmap\n");
> +               of_node_put(intr_gen_node);
>                 return PTR_ERR(pmu_context->pmuintrgen);
>         }
>
>         /* register custom mmio regmap with syscon */
>         ret = of_syscon_register_regmap(intr_gen_node,
>                                         pmu_context->pmuintrgen);
> +       of_node_put(intr_gen_node);
>         if (ret)
>                 return ret;
>
>
> --
> 2.51.0
>
