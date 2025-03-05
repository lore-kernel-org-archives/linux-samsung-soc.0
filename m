Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343BB134CF;
	Wed,  5 Mar 2025 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207039; cv=none; b=udTVjwBWpTwuSNzCabqlRC0/xESMgYDNoaFUcoH+rLbI4F2AlKNbweleeIP4JMfogyc9OVpPJm7RMjthnG1gaXCv+Nn2SKDicw/7vBuJFJhUF5KYOIRV+xJdkGOEudvkF+wF15jxCQcwJEB27T3DcVFZhwoubvZFdOevWN2GYuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207039; c=relaxed/simple;
	bh=kc8GnKy2/k0p40SmNBMlY8YXsE2cIHImyde1WkmdQgk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XlcSY/QXWLn1bHef3Urz1o5Ogwh/MyVc4I5zVr2VECFOJoGn+H9WW9DNgZJCdI3Y7MLIAdXqHvc7TjQe9PYNA1FFmmthyU6a/OGFLANqqLAM4tHhC1/N3T8xSP+t7aPkG/SGG28ZQeBKnlfaCP5jLi43HuNclgkwuFp+oj/KfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9e/BATt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9e/BATt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFFBC4CED1;
	Wed,  5 Mar 2025 20:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741207037;
	bh=kc8GnKy2/k0p40SmNBMlY8YXsE2cIHImyde1WkmdQgk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=S9e/BATt0zrHcP3OeKno3G5WCfyLYnsSZ9kd4u0NuysbnHADrvKJHWTt1fYBwH89g
	 opw0tBV7p3BurcsIYO2FkQTFc1FJ5T0r+b5OQx1fi2PRxH5zbr98B2pEXoWqdNw2tE
	 KMxERN6wJMzhPT+mQoUKpY7tQl0zq6bkepCOdR9ZYL7DTrPIjbct7Yjl6IaM8hi9wo
	 RaAuULk794YvF/aS3NSv0vvnlBLnaQzcq6ui6DL36oFxaIAeYoB62OWQN8gStp/nc1
	 /IElfEfhDDDl8tFlTIhUWZLV5jCU6bOUAJUiOzeoInmg9siTjibZQiqLO5NwyqBgJG
	 MuD6lyhf4j/8g==
Message-ID: <aacbf2c0-1fda-4ce6-a04b-69663a34f0a0@kernel.org>
Date: Wed, 5 Mar 2025 21:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: samsung: add initial exynos7870 clock driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
 <b4fb36bc3970293ebdf1ac793bb3d752.sboyd@kernel.org>
 <0a7c72cb-4b59-4146-8438-52d13b457a18@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <0a7c72cb-4b59-4146-8438-52d13b457a18@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2025 21:14, Krzysztof Kozlowski wrote:
> On 04/03/2025 19:16, Stephen Boyd wrote:
>> Quoting Kaustabh Chakraborty (2025-02-28 19:57:13)
>>> diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..2ec4a4e489be30bd1cd2e6deac006bb8ac5bdc57
>>> --- /dev/null
>>> +++ b/drivers/clk/samsung/clk-exynos7870.c
>>> @@ -0,0 +1,1830 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2015 Samsung Electronics Co., Ltd.
>>> + * Author: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> + *
>>> + * Common Clock Framework support for Exynos7870.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>
>> Please remove this include as this is a clk provider and not a clk
>> consumer.
> 
> 
> I fixed it up for all drivers.
> 
>>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include <dt-bindings/clock/samsung,exynos7870-cmu.h>
>>> +
>>> +#include "clk.h"
>>> +#include "clk-exynos-arm64.h"
>>> +
>>> +/*
>>> + * Register offsets for CMU_MIF (0x10460000)
>>> + */
>> [...]
>>> +
>>> +static const struct samsung_cmu_info peri_cmu_info __initconst = {
>>> +       .gate_clks              = peri_gate_clks,
>>> +       .nr_gate_clks           = ARRAY_SIZE(peri_gate_clks),
>>> +       .clk_regs               = peri_clk_regs,
>>> +       .nr_clk_regs            = ARRAY_SIZE(peri_clk_regs),
>>> +       .nr_clk_ids             = PERI_NR_CLK,
>>> +};
>>> +
>>> +static int __init exynos7870_cmu_probe(struct platform_device *pdev)
>>> +{
>>> +       const struct samsung_cmu_info *info;
>>> +       struct device *dev = &pdev->dev;
>>> +
>>> +       info = of_device_get_match_data(dev);
>>
>> Use device APIs please: device_get_match_data()
> 
> 
> I expect here a follow up patch.
> 
>>
>>> +       exynos_arm64_register_cmu(dev, dev->of_node, info);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct of_device_id exynos7870_cmu_of_match[] = {
>>> +       {
>>> +               .compatible = "samsung,exynos7870-cmu-mif",
>>> +               .data = &mif_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-dispaud",
>>> +               .data = &dispaud_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-fsys",
>>> +               .data = &fsys_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-g3d",
>>> +               .data = &g3d_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-isp",
>>> +               .data = &isp_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-mfcmscl",
>>> +               .data = &mfcmscl_cmu_info,
>>> +       }, {
>>> +               .compatible = "samsung,exynos7870-cmu-peri",
>>> +               .data = &peri_cmu_info,
>>> +       }, {
>>> +       },
>>> +};
>>> +
>>> +static struct platform_driver exynos7870_cmu_driver __refdata = {
>>
>> Having __refdata here looks wrong.
>>
>>> +       .driver = {
>>> +               .name = "exynos7870-cmu",
>>> +               .of_match_table = exynos7870_cmu_of_match,
>>> +               .suppress_bind_attrs = true,
>>> +       },
>>> +       .probe = exynos7870_cmu_probe,
>>> +};
>>> +
>>> +static int __init exynos7870_cmu_init(void)
>>> +{
>>> +       return platform_driver_register(&exynos7870_cmu_driver);
>>
>> Is this supposed to be platform_driver_probe()? All the __init markings
>> in the samsung clk driver look like potential problems if anything
>> defers or is made into a module.
> 
> Indeed code is confusing but still correct. This is called from
> core_initcall and nothing referencing __init/refdata can defer nor be a
> module. There are modules but, AFAIR, they don't use __init/__refdata.
> 
> The __refdata here was probably so this can reference __initconst in
> other places.
> 
> As you pointed out, probably the correct solution is to use
> platform_driver_probe().
I'll fix this and existing drivers.

Best regards,
Krzysztof
