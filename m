Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1848C40B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809520; cv=pass; b=CUQPDqROwhuD5BbnWL827N/zzoEvk2ndEJNOffH8K6fG/rmoQJOXVCVvNU0DP9bjH54Tx2MgrdR9QP1HTRlrszLEp7QcCfk68Ru4jkMKCudPndVIO7fk7l8uoJgZIjFs8m6J1Ws0zNplvjzcm3pAaQqh21zta504kga002+JkFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809520; c=relaxed/simple;
	bh=2KR7DmFwzcGsB2zw950Y33EdphHhQHSGdkvtcPhQCcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipgqBAGSCn1bGB01QZbpufNUbj92VBBDPAxTJoIIan1ENoM0I4v9Hb/TGADRrAMu506zJkfzu8OsMvO6qvla7AF/hDRzwDpnlNgvBpc3jKfDRpQdD6TFyYvCrFLCnF/KfFHcdcnoyIru61eTrOivH20J/Y9jAR8GHQUDCzXQtC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i7i+AjfY; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i7i+AjfY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so1006415a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 05:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784809517; cv=none;
        d=google.com; s=arc-20260327;
        b=RvA8K+YNacH+Epps6vmUTAVubvHmivMv2oUzfkT5diHOLtadGeOeIyFUviNvHcbi3r
         EoArjXW+nu+4sFxARi7UxNtOtpn2NOdqCf11XvdvPr0gIQwZr3YDgnpGCDU3V9GOOIOY
         PpQfJzOcVfV6IZ9zVA9o4GsjXUS/h0LehbwrRHsPmweYLVw2db+LXUxi0KB/bbjcZIzN
         2iWXX71xkio/ghKNsXLGDFfYUhb+Z1115ChP1IMJJHIXof9/ofDoFznwzCLxB4ea4XyZ
         rhZGtPTm4FFx03nepCNfvKqfPnbMz/hcz+t/pWlmLOoJZlVuq5RB65AMcr5FsIxijIpw
         hSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        fh=iKfnOOJzGLPzb+uzsyr4hy8dY05IhS8VzdXqLIPUTUs=;
        b=bD2DVUxSum9y9us1Lx7Z0TJ65SvNNdygB2+GqAZABz8x/64wgVXwlC/CDAVwe+dc/f
         gN3KfyzFKksfhJFDHJdeHlnAuoZtA7N4RVEIz+eaCPsyY1S+ky13/p8GvldheTlViL3r
         r9v0vdA0ikVvrw6Ki4ElxBl1GA5xQenmdnEJ5SgroPIScjtfmPd7w3fqYiDlNaReQxCP
         qM+wfxsKclHvvHKIYjU7vd/uShP6sMBlUJgzE9X+ibsTQ4dNGS0EFtNCQikO6gQD/Ud2
         /mMJ7cC1KEd94IrTXkmuYsmpIPP8q7Ih6IOTcqIZkeuIl6+/MAEYYofgfH8WID9/GCFd
         n01A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784809517; x=1785414317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        b=i7i+AjfY6edFhK1KVd31916WACOIGuXCg3Kl4niSGyptx3VPqhPEYLmFwUCi4jSZuS
         JNqLCLEBgFaCZ1xZLWCIIRRf84uAzKhOWuTOparnfiJ7OJlOu1OBAk7syWR4tsLmeaLE
         EUmcbz+jZJkpVPuhgwvrFCdJzFfKxxFLkqGW7xbKR5Ell7lqg21ECuyB6qRv0ZK/bvYO
         W4rWs1mAjI1y+M+vvThf5lA29N82ZI5Hq/CpWr+4FuXu7S089G9kWAYncZIXpAXG71n+
         CEHwV2bBym0bDxt+iEeAT0aQDhzfYufLNxGrt2WzOpC1b34qMX24KRBJW9yns0Pm2Pex
         mERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809517; x=1785414317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        b=ZPjXM7fLkmD2gQQRcALhxNw2TXC8l+ACbHtfUuKmEEqQw95ozgSfFWDyidK3e6tCJp
         I33qNa2evw4MFmx/nGkcRmAn836+ZS1Jut+QmfBGQbN+2PxqkpsqVsmtpUGpwxAyGDGI
         APPz0NblrGK/sIGUE5+WYAvSv+b6TpGubbAJ2OfWBkLJBf2ySoAmaB/LQ1qD1d1v8JUt
         u8G9NutpEtX+yZdPzoOpejPdLCggcPEIdqZtv0d4GIhJwET4e4SrKTeGPPz9Y+2dAN9g
         qOwIbzmUHBLZHLf743ErzZrhjthgO52xkSPyb/xmqeCn637mzcWvQnOoVKrtY5FyWgVn
         bVfA==
X-Forwarded-Encrypted: i=1; AHgh+Ro99Qm2XQ4PPC65hYkMlRc3ByZEC83O/yJU8CfBVyvJE3L/KjsxF+O32CKA/yj2xBXhZvtn3Ag4/oQkM0v8hHePfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDR0mu01+SuWL4iuogU5do5RPvxPNRvOHK+FMls3Bow4zxYBu
	KVQ4K8+CurxTHATVLYXhAFg+0EweAREnvzkfs/QYpgGRRy2MKQ/t83G5Cl/HPLDF7ZdV3h/81Sa
	mzHPxaQf4n86IbZCSaBThQWZgnwqhB8RVAtB051E+Mw==
X-Gm-Gg: AR+sD10uW34qJ93mpu/OAUkcfmdL2b62KpqZmZtyW5tqUt6vjSL3MlkgsewkS7Tmzme
	qhKwp+foygm77torGn+O4Sa9nFeloaz0bG/B/J15GI8zPSAiJefm7gV/ffmJfBWM78xzQpwv1F4
	teuL9JYJCu7hwyqq/i4QyR/UkUXIhixaxGaZILKrWbofH8kxSuPiqEajthuuE2a8EJvRMucJwSN
	29z5lIUScH6Z3Jv3TKts5X3HA6XY4dH+6MqbWHyB1sTCSTMI3RpFHx3boP1i4AdWcYjk9OVpm27
	8GmrxwTlUSDyOIemMG/U
X-Received: by 2002:a05:6402:a0db:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69f6d9e12b5mr996909a12.21.1784809517384; Thu, 23 Jul 2026
 05:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org> <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:25:04 +0100
X-Gm-Features: AUfX_mxKHXmvgZNOprzFkOSU6fVlzJ5mLmuhFNF7QD8eikBR_HNCKQLBJH8wlno
Message-ID: <CADrjBPqHcXgAC+AdMAKZRa6S6ZOaYKnwhj-K+wXdouuV7oVmkw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 15:45, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/mailbox/exynos-mailbox.c | 72 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index fa02f18948cf..ff75c1c7633c 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -24,14 +24,60 @@
>
>  #define EXYNOS_MBOX_CHAN_COUNT         HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>
> +#define EXYNOS850_MBOX_INTGR0          0x8     /* Interrupt Generation Register 0      */
> +#define EXYNOS850_MBOX_INTMR1          0x24    /* Interrupt Mask Register 1            */
> +
> +#define EXYNOS850_MBOX_INTMR1_MASK     GENMASK(15, 0)
> +#define EXYNOS850_MBOX_INTGR0_MASK     GENMASK(31, 16)
> +
> +#define EXYNOS850_MBOX_CHAN_COUNT      HWEIGHT32(EXYNOS850_MBOX_INTGR0_MASK)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @intgr:             offset to the IRQ generation register, doorbell
> + *                     to APM co-processor.
> + * @intgr_shift:       shift to apply to the value written to IRQ generation
> + *                     register.
> + * @intmr:             offset to the IRQ mask register.
> + * @intmr_mask:                value to write to the mask register to mask out all
> + *                     interrupts.
> + * @num_chans:         number of channels the mailbox can support (hardware
> + *                     capability).
> + */
> +struct exynos_mbox_driver_data {
> +       u32 intgr;
> +       u32 intgr_shift;
> +       u32 intmr;
> +       u32 intmr_mask;
> +       int num_chans;
> +};
> +
>  /**
>   * struct exynos_mbox - driver's private data.
>   * @regs:      mailbox registers base address.
>   * @mbox:      pointer to the mailbox controller.
> + * @data:      pointer to driver platform-specific data.
>   */
>  struct exynos_mbox {
>         void __iomem *regs;
>         struct mbox_controller *mbox;
> +       const struct exynos_mbox_driver_data *data;
> +};
> +
> +static const struct exynos_mbox_driver_data exynos850_mbox_data = {
> +       .intgr = EXYNOS850_MBOX_INTGR0,
> +       .intgr_shift = 16,
> +       .intmr = EXYNOS850_MBOX_INTMR1,
> +       .intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
> +       .num_chans = EXYNOS850_MBOX_CHAN_COUNT,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +       .intgr = EXYNOS_MBOX_INTGR1,
> +       .intgr_shift = 0,
> +       .intmr = EXYNOS_MBOX_INTMR0,
> +       .intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
> +       .num_chans = EXYNOS_MBOX_CHAN_COUNT,
>  };
>
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -50,7 +96,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>                 return -EINVAL;
>         }
>
> -       writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +       /* Ring the doorbell */
> +       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +              exynos_mbox->regs + exynos_mbox->data->intgr);
>
>         return 0;
>  }
> @@ -80,19 +128,31 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
>  }
>
>  static const struct of_device_id exynos_mbox_match[] = {
> -       { .compatible = "google,gs101-mbox" },
> +       {
> +               .compatible = "google,gs101-mbox",
> +               .data = &exynos_gs101_mbox_data
> +       },
> +       {
> +               .compatible = "samsung,exynos850-mbox",
> +               .data = &exynos850_mbox_data
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>
>  static int exynos_mbox_probe(struct platform_device *pdev)
>  {
> +       const struct exynos_mbox_driver_data *data;
>         struct device *dev = &pdev->dev;
>         struct exynos_mbox *exynos_mbox;
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
>         struct clk *pclk;
>
> +       data = device_get_match_data(&pdev->dev);
> +       if (!data)
> +               return -ENODEV;
> +
>         exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
>         if (!exynos_mbox)
>                 return -ENOMEM;
> @@ -101,8 +161,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>         if (!mbox)
>                 return -ENOMEM;
>
> -       chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
> -                            GFP_KERNEL);
> +       chans = devm_kcalloc(dev, data->num_chans, sizeof(*chans), GFP_KERNEL);
>         if (!chans)
>                 return -ENOMEM;
>
> @@ -115,7 +174,8 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(pclk),
>                                      "Failed to enable clock.\n");
>
> -       mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
> +       exynos_mbox->data = data;
> +       mbox->num_chans = data->num_chans;
>         mbox->chans = chans;
>         mbox->dev = dev;
>         mbox->ops = &exynos_mbox_chan_ops;
> @@ -126,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, exynos_mbox);
>
>         /* Mask out all interrupts. We support just polling channels for now. */
> -       writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +       writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
>
>         return devm_mbox_controller_register(dev, mbox);
>  }
>
> --
> 2.51.0
>
