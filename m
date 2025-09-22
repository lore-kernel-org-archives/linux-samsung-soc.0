Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CF2F745F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2025 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527938; cv=none; b=ZWiFivbXDPAKrjz1LlArbJe/O6TC8gVL8/lSHFMOfRVXPvr7EI67CYz2sIYgbjJ6GNqyVveU7wTsGGHf32OHH674MoIaDXXVvh9+yoIVvqEJy2SmcgwiZr9F2DLB54uraVEB3DGyaCQ+QPfXNttIBFJs5lqjmbgcUNHWF4lxLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527938; c=relaxed/simple;
	bh=VxFoXFJfLJu72VUQI8PkapTjFSVP1bwVeJjNyFvSU6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HM9dv2EeePtPIApIymxgWA6H+RZhNKPzP1Whrir794Gb9EN9GatEnUVNT+jS5BzUcNpWy6sEItRbE96xZigvGSLaTivsFQKIfoMeKsz7fi1d+nIsYy+JJPt2qbDPgEcAZt52n0PgNFlA7X+HAKt+4UzX4oAnlIPDXaDRIBP3lsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0LtMm4K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0LtMm4K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso35764255e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2025 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758527935; x=1759132735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQRpOTdPlsJ/I3ie9xITMLFON03T608didGjNtYqmd8=;
        b=A0LtMm4KGe7kf1WDxajMfqTBr3JGx9o8EdpYa+ejdHZrKrlF6Mi4lLBtiyGDrxRmaG
         hTTlfQsAZWd+dKrcx0eV5ANPokbJp2z8/lq/GTgXh/ygBrbSTjU2XEMnT6W9jFpeXTXT
         yKXwNIbflatbA9lo1tNpsxitqPh39dzWVlUKG5dBCJr/geLe10jlMqU8sYM09YoqKzKN
         ZZG+JYhbAiz8TX8+H13XhDtvGvmhd7XafBB2ZfRPhcqoGkdIVB9iaNgHoCKXbMcZ/Fe9
         aKYVfhl2fze0MOruqfugaS3D7ZEnSmRadwuoW8NQ5OM5sIY7r2hTUklIHgJImfr2hXV/
         KDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758527935; x=1759132735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQRpOTdPlsJ/I3ie9xITMLFON03T608didGjNtYqmd8=;
        b=BKEKJoBilMcF1peUcy90qa31wxLO2cKsSj4jn8w9fbWDEwz21Q4szSfusv6wG2IkWk
         0VyNAlLWvxHtE6n1EjGM/xRdurx6NLpbgOkD3MsXLF//MGocTm3GGqdtMxje7IcHR6CE
         HSdMQyqW1EuHvIomWOyZpUOXC29a5R7CdGz3rcTqDLFBhMJ5/fGQCqmnGkxNRC4pKIiP
         z3rBtqfwiKYaz2vEqThkWypFDR7YkaX8WlCIi4TRbyPz6PQtcS13rO7NyemyNpuZW6u8
         +2FOsTqxn+Z0WEOKZNShOkqLWfBeT51qNoLIAB0hqY435o3xMH3L+CMQiX3OgHe+RAI6
         4zXw==
X-Forwarded-Encrypted: i=1; AJvYcCWn78bBxgUbDGV7AyMkGwYWf2E6/Pk2gRtMyt+b+xGS2GEcb37cBPhAcAV3JWscW0x+WxRMRIEaG4Fm38r7UbHa9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45d5y7ss0/trbVEbOiyJxkRVylDb6przd74J+AA6QVJTNNAlI
	vifaphE7vzJPFuNOATTIxLgW8QefbeBFfrM9YIfcyLtqpcN5BF4vFaSQ3MaOQdeY7R8=
X-Gm-Gg: ASbGncuy5LmH29Oz1T5NeAEqMt7+xvk9Vf7Wx/ixtOyk41S/RVwndkPZ/APaXg8YWYV
	gCJT1aU5oG5velxMIn1cQmE2vQfMye+ity/kvDSJEADoX4wPo57J/WZsmLgW47cXA/hQivx7paX
	FIXCKUwjx3tHC4cGl53WwWIqW8+OACepsdCJW41IWC54LrcAPbEH/HCKgEWdZER5/X+NYRsR3yH
	JxktPV2O6JeatkIjHHl/ESTAmKwWMJaNcKqlHW16mBhKczIJH/OOt3Zj5wU5QigmPWs42/aKtFY
	xAMTEXt1xrLuGs7ALFzEZVX+FPxyw2cymDq2XdtwhmWuiiv2NLmbGr8YYr8R9cR1dhgqDxfkJxe
	YeI0Cq8Mzzgeb8i5LmzUqfTu3mwzVnHsJ
X-Google-Smtp-Source: AGHT+IGv/gvgtd+VyFOGRY+JKmS6raLqaaGrk4Saz9mqQNEkVwU+lxnyBc+9ONztYTEGxxuU7e9nsg==
X-Received: by 2002:a05:600c:3555:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-467eb048bafmr104267165e9.26.1758527934709;
        Mon, 22 Sep 2025 00:58:54 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm186423945e9.1.2025.09.22.00.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 00:58:54 -0700 (PDT)
Message-ID: <905d8c89-56d3-40c9-928f-d6418a0f9193@linaro.org>
Date: Mon, 22 Sep 2025 08:58:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] clk: samsung: add Exynos ACPM clock driver
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
 <20250908-acpm-clk-v4-4-633350c0c0b1@linaro.org>
 <175848703636.4354.2936744718103927060@lazor>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175848703636.4354.2936744718103927060@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 9/21/25 9:37 PM, Stephen Boyd wrote:
> Quoting Tudor Ambarus (2025-09-08 06:12:45)
>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>> --- a/drivers/clk/samsung/Kconfig
>> +++ b/drivers/clk/samsung/Kconfig
>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>           status of the certains clocks from SoC, but it could also be tied to
>>           other devices as an input clock.
>>  
>> +config EXYNOS_ACPM_CLK
>> +       tristate "Clock driver controlled via ACPM interface"
>> +       depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
> 
> Why is COMPILE_TEST limited to !EXYNOS_ACPM_PROTOCOL?


otherwise on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

> 
>> +       help
>> +         This driver provides support for clocks that are controlled by
>> +         firmware that implements the ACPM interface.
>> +
>> +         This driver uses the ACPM interface to interact with the firmware
>> +         providing all the clock controlls.
>> +
>>  config TESLA_FSD_COMMON_CLK
>>         bool "Tesla FSD clock controller support" if COMPILE_TEST
>>         depends on COMMON_CLK_SAMSUNG
>> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8566495265ee3e06dbf370f9e424d5540f5c7457
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-acpm.c
>> @@ -0,0 +1,184 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Samsung Exynos ACPM protocol based clock driver.
>> + *
>> + * Copyright 2025 Linaro Ltd.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> Is this include used?

ah, it's no longer used, I'll drop it, thanks!
> 
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
> 
> Are you avoiding kernel.h? If so, please include container_of.h and

I tend to include just what's needed, yes. kernel.h has some things that
are not yet needed in this driver.

> device/devres.h to avoid implicit includes.

Will add the two and recheck whether I rely on implicit includes somewhere else.

>> +
>> +struct acpm_clk {
>> +       u32 id;
>> +       struct clk_hw hw;
>> +       unsigned int mbox_chan_id;
>> +       const struct acpm_handle *handle;
>> +};
>> +
>> +struct acpm_clk_variant {
>> +       const char *name;
>> +};
>> +
>> +struct acpm_clk_driver_data {
>> +       const struct acpm_clk_variant *clks;
>> +       unsigned int nr_clks;
>> +       unsigned int mbox_chan_id;
>> +};
>> +
>> +#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
>> +
>> +#define ACPM_CLK(cname)                                        \
>> +       {                                               \
>> +               .name           = cname,                \
>> +       }
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
>> +       ACPM_CLK("mif"),
>> +       ACPM_CLK("int"),
>> +       ACPM_CLK("cpucl0"),
>> +       ACPM_CLK("cpucl1"),
>> +       ACPM_CLK("cpucl2"),
>> +       ACPM_CLK("g3d"),
>> +       ACPM_CLK("g3dl2"),
>> +       ACPM_CLK("tpu"),
>> +       ACPM_CLK("intcam"),
>> +       ACPM_CLK("tnr"),
>> +       ACPM_CLK("cam"),
>> +       ACPM_CLK("mfc"),
>> +       ACPM_CLK("disp"),
>> +       ACPM_CLK("b0"),
>> +};
>> +
>> +static const struct acpm_clk_driver_data acpm_clk_gs101 = {
>> +       .clks = gs101_acpm_clks,
>> +       .nr_clks = ARRAY_SIZE(gs101_acpm_clks),
>> +       .mbox_chan_id = 0,
>> +};
>> +
>> +static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>> +                                         unsigned long parent_rate)
>> +{
>> +       struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
>> +                                       clk->mbox_chan_id, clk->id, 0);
>> +}
>> +
>> +static int acpm_clk_determine_rate(struct clk_hw *hw,
>> +                                  struct clk_rate_request *req)
>> +{
>> +       /*
>> +        * We can't figure out what rate it will be, so just return the
>> +        * rate back to the caller. acpm_clk_recalc_rate() will be called
>> +        * after the rate is set and we'll know what rate the clock is
>> +        * running at then.
>> +        */
>> +       return 0;
>> +}
>> +
>> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                            unsigned long parent_rate)
>> +{
>> +       struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
>> +                                       clk->mbox_chan_id, clk->id, rate);
>> +}
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +       .recalc_rate = acpm_clk_recalc_rate,
>> +       .determine_rate = acpm_clk_determine_rate,
>> +       .set_rate = acpm_clk_set_rate,
>> +};
>> +
>> +static int acpm_clk_ops_init(struct device *dev, struct acpm_clk *aclk,
> 
> Maybe acpm_clk_register() is a more appropriate name.

okay, will update.

> 
>> +                            const char *name)
>> +{
>> +       struct clk_init_data init = {};
>> +
>> +       init.name = name;
>> +       init.ops = &acpm_clk_ops;
>> +       aclk->hw.init = &init;
>> +
>> +       return devm_clk_hw_register(dev, &aclk->hw);
>> +}
>> +
>> +static int acpm_clk_probe(struct platform_device *pdev)
>> +{
>> +       const struct acpm_handle *acpm_handle;
>> +       struct clk_hw_onecell_data *clk_data;
>> +       struct clk_hw **hws;
>> +       struct device *dev = &pdev->dev;
>> +       struct acpm_clk *aclks;
>> +       unsigned int mbox_chan_id;
>> +       int i, err, count;
>> +
>> +       acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +       if (IS_ERR(acpm_handle))
>> +               return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +                                    "Failed to get acpm handle.\n");
> 
> Remove the period please. Most error messages don't have proper
> punctuation.

okay, will update.

> 
>> +
>> +       count = acpm_clk_gs101.nr_clks;
>> +       mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
>> +
>> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>> +                               GFP_KERNEL);
>> +       if (!clk_data)
>> +               return -ENOMEM;
>> +
>> +       clk_data->num = count;
>> +       hws = clk_data->hws;
>> +
>> +       aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>> +       if (!aclks)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < count; i++) {
>> +               struct acpm_clk *aclk = &aclks[i];
>> +
>> +               /*
>> +                * The code assumes the clock IDs start from zero,
>> +                * are sequential and do not have gaps.
>> +                */
>> +               aclk->id = i;
>> +               aclk->handle = acpm_handle;
>> +               aclk->mbox_chan_id = mbox_chan_id;
>> +
>> +               hws[i] = &aclk->hw;
>> +
>> +               err = acpm_clk_ops_init(dev, aclk,
>> +                                       acpm_clk_gs101.clks[i].name);
>> +               if (err)
>> +                       return dev_err_probe(dev, err,
>> +                                            "Failed to register clock.\n");
>> +       }
>> +
>> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +                                          clk_data);
>> +}
>> +
>> +static const struct platform_device_id acpm_clk_id[] = {
>> +       { "gs101-acpm-clk" },
>> +       {},
> 
> Please drop comma here so that nothing can come after.

okay. Thanks for the review!
Cheers,
ta

