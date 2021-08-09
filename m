Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0940BC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E18D761040
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbhHIKo1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:44:27 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:40442
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234680AbhHIKn7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 06:43:59 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 320E240662
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628505818;
        bh=IPLYHYrcTvcr3N2BS3b/UySmy02vL1KdV7I/69UXWUI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=L55iuP7kvNY20mEn9XUP0PyF9IbEzOTimUUDo5c6YmmVwEdj7HqtkWoLeSincjo9h
         QioorTLRLcq/Ksu91h4EZ+xW8vbkXGY8z9+EyGZJJofGYfSDt98j7OceOhjLqx/l6c
         HFqCjUVD/JvHtf9U5pkdx9Hu5rJ451PZ+7zx6oTZ4r+ojgmwQdSUrvn/VQnxMuj1P4
         qSbyLmqVhvfdgF5x2SIWrQP5l5P0eh8psv9GNq1fB5wPhe+m63AIfG96GFio9CMVul
         jnbSNGDm0gskDkWR+tKXEuvJgJUTUz1fWIPQ4Og+24U9v2FNMtETBNeum9e6hQ5VmZ
         Kp9r/W8DhFpAQ==
Received: by mail-ej1-f72.google.com with SMTP id q19-20020a1709064cd3b02904c5f93c0124so4359577ejt.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 03:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IPLYHYrcTvcr3N2BS3b/UySmy02vL1KdV7I/69UXWUI=;
        b=goRF5cTZaMy5sKc3m4FkV4mi7GcOK4k/eYVc+4iyFRYyGZcZE8PGnNH9dIPOTbY3b0
         2QhamyCu06c2iQU0TInwV1voS0L9SQn0bwGWaF6gcVjJnUhRC9jj5Qxb/TCNW7gs+StH
         tXH6ZN5FbQ/gxnK5A7VyxPJhiHHvro2KHO3IUwZiIRBXq5COsZKhCz6Shv3g969qh0k5
         UHTItwHgXCfiJtYqcZ0QBxWE3AQ++tAIP+PruNHr/KAAQlRvoYFdA1rgeRzD4AXMOHpv
         yUV3p3SG0XQiMXbu1xNrkpV9e8x0tWZjqQAv8a5WokDIe/Uf+eQx+GsXyj0muk5lLr/S
         mYTQ==
X-Gm-Message-State: AOAM530Ci8F1PJPHcguhy/9yeAIhgrhu3qQ2RU63XpSeWgkCbRxFDNLV
        tUyy5JjvfuwWqkwo8Zzfv5JUFwSIGo8V5O3oUcyopxm7TeeYnshAKvm7c2iKZ6m1XiJfzh6amxL
        3/+RMx31zMGjNzP7UNTWmBbBg5G1XFc5wqd5RzmNNJvlZ+B91
X-Received: by 2002:a17:906:49d5:: with SMTP id w21mr21635352ejv.30.1628505817763;
        Mon, 09 Aug 2021 03:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeNB2nOwNQ2RTsxvcfdbkUiLXo+n7KqpIXPP7gExD6iWzJv6eNEGkp2pebUUGDoXYkBD+WHg==
X-Received: by 2002:a17:906:49d5:: with SMTP id w21mr21635314ejv.30.1628505817517;
        Mon, 09 Aug 2021 03:43:37 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id g23sm5798803ejm.26.2021.08.09.03.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 03:43:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] pinctrl: samsung: Add Exynos850 SoC specific data
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <407ee65f-6004-5173-9fcc-99023c85db4e@canonical.com>
Date:   Mon, 9 Aug 2021 12:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806152146.16107-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/08/2021 17:21, Sam Protsenko wrote:
> Add Samsung Exynos850 SoC specific data to enable pinctrl support for
> all platforms based on Exynos850.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Removed .suspend/.resume callbacks, as retention registers are not
>     implemented yet for Exynos850
>   - Removed .eint_gpio_init for AUD domain, as there are no external
>     interrupts available for that domain
> 
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 116 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 +++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  4 files changed, 148 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index b6e56422a700..3157bdf0233c 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -40,6 +40,24 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
>  	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
>  };
>  
> +/*
> + * Bank type for non-alive type. Bit fields:
> + * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
> + */
> +static struct samsung_pin_bank_type exynos850_bank_type_off  = {
> +	.fld_width = { 4, 1, 4, 4, 2, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
> +/*
> + * Bank type for alive type. Bit fields:
> + * CON: 4, DAT: 1, PUD: 4, DRV: 4
> + */
> +static struct samsung_pin_bank_type exynos850_bank_type_alive = {

I missed that part last time - this and one before should be const.

> +	.fld_width = { 4, 1, 4, 4, },
> +	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> +};
> +
>  /* Pad retention control code for accessing PMU regmap */
>  static atomic_t exynos_shared_retention_refcnt;
>  
> @@ -422,3 +440,101 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
>  	.ctrl		= exynos7_pin_ctrl,
>  	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
>  };
> +
> +/* pin banks of exynos850 pin-controller 0 (ALIVE) */
> +static struct samsung_pin_bank_data exynos850_pin_banks0[] = {

All these as well - initconst - unless they are somehow different than
rest of such structures?

> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> +	EXYNOS9_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> +	EXYNOS9_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
> +	EXYNOS9_PIN_BANK_EINTN(3, 0x0A0, "gpq0"),
> +};
> +
> +/* pin banks of exynos850 pin-controller 1 (CMGP) */
> +static struct samsung_pin_bank_data exynos850_pin_banks1[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> +	EXYNOS9_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> +};
> +
> +/* pin banks of exynos850 pin-controller 2 (AUD) */
> +static struct samsung_pin_bank_data exynos850_pin_banks2[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
> +};
> +
> +/* pin banks of exynos850 pin-controller 3 (HSI) */
> +static struct samsung_pin_bank_data exynos850_pin_banks3[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
> +};
> +
> +/* pin banks of exynos850 pin-controller 4 (CORE) */
> +static struct samsung_pin_bank_data exynos850_pin_banks4[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
> +};
> +
> +/* pin banks of exynos850 pin-controller 5 (PERI) */
> +static struct samsung_pin_bank_data exynos850_pin_banks5[] = {
> +	/* Must start with EINTG banks, ordered by EINT group number. */
> +	EXYNOS9_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
> +	EXYNOS9_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
> +	EXYNOS9_PIN_BANK_EINTG(8, 0x0A0, "gpg2", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(1, 0x0C0, "gpg3", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(3, 0x0E0, "gpc0", 0x1C),
> +	EXYNOS9_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
> +};
> +
> +static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks	= exynos850_pin_banks0,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks0),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +	}, {
> +		/* pin-controller instance 1 CMGP data */
> +		.pin_banks	= exynos850_pin_banks1,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks1),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +	}, {
> +		/* pin-controller instance 2 AUD data */
> +		.pin_banks	= exynos850_pin_banks2,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks2),
> +	}, {
> +		/* pin-controller instance 3 HSI data */
> +		.pin_banks	= exynos850_pin_banks3,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks3),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +	}, {
> +		/* pin-controller instance 4 CORE data */
> +		.pin_banks	= exynos850_pin_banks4,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks4),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +	}, {
> +		/* pin-controller instance 5 PERI data */
> +		.pin_banks	= exynos850_pin_banks5,
> +		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks5),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +	},
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
> +	.ctrl		= exynos850_pin_ctrl,
> +	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
> +};
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index da1ec13697e7..595086f2d5dd 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -108,6 +108,35 @@
>  		.pctl_res_idx   = pctl_idx,			\
>  	}							\
>  
> +#define EXYNOS9_PIN_BANK_EINTN(pins, reg, id)			\
> +	{							\
> +		.type		= &exynos850_bank_type_alive,	\

Having the prefix EXYNOS9 is actually confusing because:
1. There is no Exynos9 support,
2. The type is exynos850.

Let's keep it consistent, so 850 everywhere,

> +		.pctl_offset	= reg,				\
> +		.nr_pins	= pins,				\
> +		.eint_type	= EINT_TYPE_NONE,		\
> +		.name		= id				\
> +	}
> +
> +#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs)		\
> +	{							\
> +		.type		= &exynos850_bank_type_off,	\
> +		.pctl_offset	= reg,				\
> +		.nr_pins	= pins,				\
> +		.eint_type	= EINT_TYPE_GPIO,		\
> +		.eint_offset	= offs,				\
> +		.name		= id				\
> +	}
> +
> +#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs)		\
> +	{							\
> +		.type		= &exynos850_bank_type_alive,	\
> +		.pctl_offset	= reg,				\
> +		.nr_pins	= pins,				\
> +		.eint_type	= EINT_TYPE_WKUP,		\
> +		.eint_offset	= offs,				\
> +		.name		= id				\
> +	}
> +

Best regards,
Krzysztof
