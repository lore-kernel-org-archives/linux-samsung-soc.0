Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2338838C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119347; cv=none; b=SdfS93eyzp6Vc6L1uv0FeaNtjS5kQitXx1AFzTi0Ad6O/W/CCDOB++5PiLrxSG/dJ2MnkuYdyKRXIEd0qvhXQ/p+BPgl3AznBxK2EZEnHr5VM1rKb4oa2FmK8G0w7TWJ8bj0a3obNNoojKy5m7bZFJV5ZB869fIMWsY85SiUu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119347; c=relaxed/simple;
	bh=fe0lhWm1wALvygtsmqfZ8jXmQNpf2RlsQm58tinNTy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBtWOLVLAkk1+VV0EXACTmw0EUoQYMolBaI8WwdfInUunHXblNONNWsE3ozd5dY4WcltVLvRBjVZneeuzX1zCMAGHVNvddPUQO3/5zyeP4LqbHgjy9PYH5s6uou+qKRLqEDKBZUllQkbS+XApjYcF1T1F4UFwQkPBogXFoaEKaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWcftB4G; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWcftB4G"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so5278355e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119344; x=1775724144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sa+a3J0QrBn+R1u+tNno8i6NoeHdBvME4wJq3fMgEs=;
        b=EWcftB4G5u+hd21KuxGidKSETfB3/WfAt1A0dlwUx/++jqRj7SyJhzN008b0JCdnEq
         EIAvgrt/EOSYgNU6GbckuDF7zkiucdvW5YdmuZ65PbHwUOF9JBgGUbsXqlc3e7kSEKuj
         OfIaoVxdh3soR9CU6htHwppWQ7QRU/MMNXAi7eVcABZK2ZU+AJkQwOUqR9FDSaGCq1dI
         CeTfGPIUdUSV29easpkiiyWiwbfG6zyxHhyCbaqwz2EC0rMKklkDIYigPTkwtiwcmGpM
         MiakL+Tzh2B+Kun7eCL4N/SL7MP+5QY4ldiLdA1GqSy5tKfFgPVIQLTLvMOfRI+ET6+w
         mEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119344; x=1775724144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sa+a3J0QrBn+R1u+tNno8i6NoeHdBvME4wJq3fMgEs=;
        b=Ltci1+07juLlMBHmCdpUipNE+wp8wt3ondhnQGiA8dfqkM8wQx8GmwEzZ9wTx06IDk
         mL08qAAQRmG3scjHBLnCCzsou0XbcO5KRA8Zk5qz67Avuxo0t9FxS0JwCtjPLLp9cAs6
         JZ19fmrU2cRU6BqgyMibIUuyycHNHhFXqZyWFuamMYDjUQ3ymID7Kw/9i4TJJpAbVHgR
         wnY2EYWokzyb2HodrefVXPNEg4xqF9voB4XYp4TIrYa4ZNx8sgAt6f8DsTaMNt33s/Pk
         C6/JGFBe1NI7QRe1eLr6WWpWqwmASDPQvSluNpOOphB44nZKtQYGW1P3mpBpziwwFDY5
         ulmg==
X-Forwarded-Encrypted: i=1; AJvYcCWhQVHhrMr5UBtdJWxQIaxS77CBWtA8tAllNWosIQGP6LQ/AHdzReHpmoEWw/V2stmW2KiVUnih5ewjpqvSyX9uPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMwtVH/3PCm0+AhH1xsfqS96w7SCwMtk79H4Kbb15Ha2kWKVV
	VQmFSueDIQc9yXswSOcqQjFhR2yW7FR7cRDBAhqx0rU5SzpFh6ZP0WSHpbM+opqvHXE=
X-Gm-Gg: ATEYQzzWC0Q/SJ30h9j+1LebWMYoQ9syxHx163NPNXMZAYXlyxrgxuRMGaWjCIiP9Qg
	D7tf3yGLFT4d2ps6ineLO23rT+3Xb3TfdbhBtBKTv03Lmgowre/G+w1BYovKb4y5KqxxJ+mupYT
	fM3OSP6OzSfxyzubs1g708JnSNLD/fYn1ixhrTmxdmTbfyCvC6eo4xr4s8SoSxG5IoBxT2yPzFr
	NEpgBMy2P/MMS4uU2IlH8p4qb8BvWiCgmhktqK1R70MyC32JaLbEvPFP7xivSU2a1rBlsaNHhEu
	gfRzF1YY7Wvx3HxW2puFFUiSsANFAXd9lKWTqBiGt+C6wjj77rTMOL+fZsEs5oG26o3GX237aNi
	z4UkDSAjbT3j7nYErdgL9HBXUjzS+mSkvs6Wt1UizKJhAivwEHKDAj3tVqakmWriaedwp5Bbwmn
	7CcUW8Gx9wwn4T8mTJLweOlE9ygmp8pRk=
X-Received: by 2002:a05:6000:230c:b0:43c:e7a7:9256 with SMTP id ffacd0b85a97d-43d150513d6mr11820588f8f.12.1775119343977;
        Thu, 02 Apr 2026 01:42:23 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm5989362f8f.31.2026.04.02.01.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:42:23 -0700 (PDT)
Message-ID: <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
Date: Thu, 2 Apr 2026 11:42:19 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 4/2/26 5:20 AM, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index d2355b128ba4..f9c59c07558a 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -31,14 +31,61 @@
>  
>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>  
> +#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
> +#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
> +#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
> +#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
> +#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register 0	*/
> +#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	*/
> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
> +#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
> +#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register 1	*/
> +#define EXYNOS850_MBOX_VERSION		0x70

Please consider defining just the registers that are used, to not
pollute the driver. You may drop the unused gs101 definitions too. 

> +
> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @irq_doorbell_offset:	offset to the IRQ generation register, doorbell
> + *				to APM co-processor.
> + * @irq_doorbell_shift:		shift to apply to the value written to IRQ
> + *				generation register.
> + * @irq_mask_offset:		offset to the IRQ mask register.
> + * @irq_mask_value:		value to right to the mask register to mask out
> + *				all interrupts.
> + */
> +struct exynos_mbox_driver_data {
> +	u16 irq_doorbell_offset;
> +	u16 irq_doorbell_shift;
> +	u16 irq_mask_offset;
> +	u16 irq_mask_value;
> +};
> +
>  /**
>   * struct exynos_mbox - driver's private data.
>   * @regs:	mailbox registers base address.
>   * @mbox:	pointer to the mailbox controller.
> + * @data:	pointer to driver platform-specific data.
>   */
>  struct exynos_mbox {
>  	void __iomem *regs;
>  	struct mbox_controller *mbox;
> +	const struct exynos_mbox_driver_data *data;
> +};
> +
> +static const struct exynos_mbox_driver_data exynos850_mbox_data = {
> +	.irq_doorbell_offset = EXYNOS850_MBOX_INTGR0,
> +	.irq_doorbell_shift = 16,
> +	.irq_mask_offset = EXYNOS850_MBOX_INTMR1,
> +	.irq_mask_value = EXYNOS850_MBOX_INTMR1_MASK,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +	.irq_doorbell_offset = EXYNOS_MBOX_INTGR1,
> +	.irq_doorbell_shift = 0,
> +	.irq_mask_offset = EXYNOS_MBOX_INTMR0,
> +	.irq_mask_value = EXYNOS_MBOX_INTMR0_MASK,
>  };

I find it strange that the SoCs use different registers. Are you sure you're
using the right direction? i.e. ring the doorbell to APM and not to AP?

>  
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  		return -EINVAL;
>  	}
>  
> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);

Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
a shift.

I would rename irq_doorbell_offset to intgr. It aligns with the register name
from the datasheet. You won't need to prepend _offset to the name, we already
see it's an offset when doing the writel().


>  
>  	return 0;
>  }
> @@ -87,13 +135,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
>  }
>  
>  static const struct of_device_id exynos_mbox_match[] = {
> -	{ .compatible = "google,gs101-mbox" },
> +	{
> +		.compatible = "google,gs101-mbox",
> +		.data = &exynos_gs101_mbox_data
> +	},
> +	{
> +		.compatible = "samsung,exynos850-mbox",
> +		.data = &exynos850_mbox_data
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>  
>  static int exynos_mbox_probe(struct platform_device *pdev)
>  {
> +	const struct exynos_mbox_driver_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct exynos_mbox *exynos_mbox;
>  	struct mbox_controller *mbox;
> @@ -122,6 +178,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pclk),
>  				     "Failed to enable clock.\n");
>  
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	exynos_mbox->data = data;
>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
>  	mbox->chans = chans;
>  	mbox->dev = dev;
> @@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, exynos_mbox);
>  
>  	/* Mask out all interrupts. We support just polling channels for now. */
> -	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
>  

and here I would s/irq_mask_value/intmr_mask and irq_mask_offset/intmr.

Cheers,
ta

>  	return devm_mbox_controller_register(dev, mbox);
>  }
> 

