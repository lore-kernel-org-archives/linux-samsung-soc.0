Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B9A389E07
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861266; cv=none; b=j0vxz98WWRIaU4Smnv7cTl/+9feuPvBzdH8bzg/gHNdAKgCsJ2QvYHuXTR8Pn9a4Vszi+sAtyJcwI0dIUPYNgWdw6c3SyiDMoC+1vssFf9hw059/cX6vqS5ep2lvOdkTybSQd+vreL2Ok7EGnmqVZmgmrkr7Nhk1V6cNTj31Yb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861266; c=relaxed/simple;
	bh=KwFb7Bzf2oJHL/u2nvrT273U5BTIwWtmn+TyzderBs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo6H2hsowJl7HEJkcKWj/DEZRpgavHuJjbKcgeHmF53sd8E3DgV/Nm4vplskR7lFFw1YXqdElaSODCHvjOACQMpfviQYWyMDequNC+xFkVee4kUMepZ0gKHUvkGjmA0vP7XyQ8OOpVpst/UYn8kaB0YIHIjcjNzVkzRVdMrC30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBuEvdLy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBuEvdLy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso4523855e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790861262; x=1791466062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2LslndYS37sl4b5GSkI0Sg/gLuqHVi110FMtZhTLq0=;
        b=jBuEvdLyOMXFULtK88it6Jq6WcVgcYCe10WcDmDCh/4PHUUGFuNt/Isonjn3beVcPv
         0dXBEDlidpHwD5jyCW0GbItXdjIxMXFjdUI5RrvgTP5pRp33YFE5VZcY4GtzcIu9P/9c
         la1anN5f+uPR9OC2Av/pgV7sG2jZmZNLSiaYg4sdVg+l1WTYkE7P00oksD2ebrAGM4zY
         XaAzEECKDpKoNtDPFJBLwPO2A6pyclZb/C53hSdOXMCytgMpSxKOYPzUe0DhfNuAW3mU
         amSPA2V180j6LVweuGwYre73FstRzz1HqbJ4qIdPffwhNtxyEyRmq0X04MXwAgBFGBOt
         riIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861262; x=1791466062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2LslndYS37sl4b5GSkI0Sg/gLuqHVi110FMtZhTLq0=;
        b=YNEXyA8MayIHp7VITB+DPylv4SFu63lX9Gc49bsQAA+BunqgQ0cCIUWk1gxMRuGDwH
         76RgMiwzGQsGsxXHcoBxBwhQKg/h/1rE9xxFawOnZ1qVZ7hI3KVcrDsgvZe/ir+HxZ9e
         wK65jEVZpMu2u8BhWOUhA/tinarBUmTMx1egvj5uBRFrop85aorMN6DQ6LYmfw3CpQG9
         iaVsVMjvyZwBnznXZ4qEiICnhNOaB5pjRyaYiUsH4t2/0BERy4u/G3k2gdU8CnMA7A75
         sr915VSuuTSndfhZas3f0/5rizeydOv/rK4/HmPk+vdkRZEoc89svbp5M30HugABhu8p
         PUkg==
X-Forwarded-Encrypted: i=1; AKwUvByuy6R4t4e+YiZ0/Mma/RtDGCNe2eBbLVhOFoZwWItMqfA9iT0QJM06RXhKbRzxAkiodSSjC6jNVq2GAQqc8NOneA==@vger.kernel.org
X-Gm-Message-State: AFuF++kMEq6dB9lYzcv1Cz9uR29Gt6MRx8Duf1vPspZsCO0VdxsmMgge
	8gh5PBwY/guVVyOTb9GJHznRJN6pOsVcwOqbrq14KTQVwpqNinRCpWRkkbYcuvbPPa8=
X-Gm-Gg: AYBFou3Ha8bWKjC4XekxmIcR25arUkbQiQgxUhnHgaEThI8BnZWmjvSmYBv0ULKw2Md
	j0XoLwwC+VjxPhG/6mEXCswixngAID8uk8pykPMPKpMHtjYj+G7VJinay7scqFJKQo6iFFnniGU
	vmf5mtk0JgTidlBahbC60H+y4EJaK0iHDpBOh5cQxLd7ccqUNNaz1JqkjP7MCppZlJFw2sDpKDF
	/TaOtrsWsQ2tYXLAqNAxvFBmSH4OyXy0DfSzPVNmwb3Futns/oyejQxpzL1M+T4FglgPcYEqjb0
	Tj3TcKu5p2xX/g7+x2eZV0HwNii30CH7Lj6YYKwlKvgmFR/lTaeB9kBp2VD+zk3GFmio4kcj0Rk
	mbMyLA6qpVdxqykxlW4E/J7GnQYoKrS+9jOEuMYxB1wu5hKqzh3x5bS90VCdKnCw+vtzvSRjJH0
	kqKfA18kMIum69tkwONh+Y5FrE+40pEtPgQ23r6UHmQj8P6CHm4yzb3d/u4oGzaaNvytgcL00Fv
	T8hQE8V
X-Received: by 2002:a05:600c:4704:b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a01b00f659mr74999905e9.21.1790861262268;
        Thu, 01 Oct 2026 06:27:42 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff64asm5360563f8f.10.2026.10.01.06.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:27:41 -0700 (PDT)
Message-ID: <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
Date: Thu, 1 Oct 2026 16:27:37 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
 <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/30/26 2:54 PM, Alexey Klimov wrote:
> Hi Tudor,
> 
> On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
>> Hi, Alexey,
>> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>>> protocol provides interface for all client drivers to actually use
>>> features exposed by the APM co-processor.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> index 8a4771899a8e..91c6cee8f483 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> @@ -11,6 +11,7 @@
>>>   */
>>>  
>>>  #include <dt-bindings/clock/exynos850.h>
>>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>  
>>> @@ -170,6 +171,18 @@ timer: timer {
>>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>>  	};
>>>  
>>> +	firmware {
>>> +		acpm_ipc: power-management {
>>> +			compatible = "samsung,exynos850-acpm-ipc";
>>> +			mboxes = <&ap2apm_mailbox>;
>>> +			shmem = <&apm_sram>;
>>> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>>
>> Why do you describe these clocks?
> 
>>> +			clock-names = "cpucl0", "cpucl1";
> 
> To link these clocks with ACPM clocks from this list:
> (file drivers/clk/samsung/clk-acpm.c)
> 
> static const struct acpm_clk_variant exynos850_acpm_clks[] = {
> 	ACPM_CLK("mif"),
> 	ACPM_CLK("int"),
> 	ACPM_CLK("cpucl0"),
> 	ACPM_CLK("cpucl1"),
> 	ACPM_CLK("g3d"),
> 	ACPM_CLK("aud"),
> 	ACPM_CLK("cam"),
> 	ACPM_CLK("disp"),
> 	ACPM_CLK("cp"),
> };
> 
> Eventually to have some sensible/working ->recalc_rate() for ACPM
> cpucl{0,1} clocks.
> 
> Which is needed, for instance, for cpufreq_dt because it registers with:
> 
> static struct cpufreq_driver dt_cpufreq_driver = {
>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                  CPUFREQ_IS_COOLING_DEV,
> 
> Don't know if it answers the question (if I understood it correctly)?
> 

Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
->recalc_rate(). Could you please clarify a few things in the commit
message (and below):

1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
   APM hardware, they are the PLLs that ACPM reconfigures behind the
   scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
   pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
   Since the DT node only lists "cpucl0" and "cpucl1", won't the other
   7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
   orphaned in CCF with rate = 0?

2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
   after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
   CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
   hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
   __clk_recalc_rates() only reads the cached core->parent->rate without
   calling ->recalc_rate() on the parent itself. Won't parent_rate remain
   stuck at the initial boot frequency?

3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
   cpucl1_cmu_info still set `.manual_plls = true`.
   Does that conflict with ACPM firmware managing the CPU PLLs?

Cheers,
ta
