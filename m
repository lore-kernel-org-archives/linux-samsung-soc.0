Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDC194AF1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Jun 2024 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717676222; cv=none; b=eO34zNcYe7rpqtuQD+kkCYrg2XjWAGQy3HLS6ag/Lw2dVEbFhX/aLm/U8HvFH6zIeYQk6olzSPC2m2F/tw5qAdwVwNqEeTyGmBReSnYcHcHjBAv8qpY9r8dIMPmwNsTXzb0vku17W0A96Qr+iAF+ROUz1Q3xpTrZjAst+lQqE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717676222; c=relaxed/simple;
	bh=saW5Bm5m3DbYvBF5Mio+quiZabvPeXPkZXZjlsMXATs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqP30p5uldw0Mh9FpE7Ob4nvsfOjH3vMnsXFEXB6B4yybaCIR8s3VXXp+JmcnzuMDzuRzOzNh37yWD+eDFJlgD/yny2L3YQrhC5egk6isJ9tefmL2yANDK/N5veXlo6nsapK4KGtX0pqb0xQWE98Y9XBcoqmwnrX3pZMyfN8cGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=outQRGy2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="outQRGy2"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eacd7e7ad7so11193961fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2024 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717676218; x=1718281018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hp8zTN6GAyn/5QygJpsnE9NfAvQzaWOA5Ikx+6pcgEs=;
        b=outQRGy23O2kFC30Uh1jsE/63VWDF905RL1Dx6v3CEcoxkRbvA6VqMT016N/Z0FcwY
         ROFl/rfygsv4q29UbBrc76M4KYu2FGRswh9cV2BaoWAndg5kw7GUteL0l5b0oo6mlyWR
         Hz+t/4ZKJJKqyF7+2E/a9WnQN0PiNRnIc0OJeS9z3IOLNJdcxEw5Q2ybYtNzj4teFQWB
         QsCUlLnnv90plYAYSXM63lWNpXC8mkPE5b5zzfoYShSA9XLjumWwuHNPonXkF6CtjuA3
         2yAAPtbWDsPWqqx1i9jjc56K0H2GHHDMDDmFqYN7TIzIm1RhpDPLzPL4qY4zdj/b5zpS
         YwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676218; x=1718281018;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hp8zTN6GAyn/5QygJpsnE9NfAvQzaWOA5Ikx+6pcgEs=;
        b=h9PW7WC2T8T/qSAGojWCNwx+d8ozxuQmm0nRqe0M22XGNu7FwJKTAMRkWbdC712FYH
         jqStzIGkB5NCc4t/uUikLw6D0FJE91yNuq1/uhqnLO4KcUmCkB3ZyF4+Pvlc4bCR/bLX
         rv1dhbxORT9intW8UKTEPKkv7mpNTxjKM9uaBlbVzgYrLx0sWg8RxoGELTJ2g5c4n6lN
         jymNeVD3HEvNck+T2H5DAi+VxDsb7Hh4GYY2MmPshZPlP7eFZxrVmWTiAeGZBmMzKMUF
         kBmunFkrM4nMK06r9GwsGpc1TOXCwehGLKDKvsPzjtlLpNbAffAE0TfKpLQvhO/72t61
         mgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAbyjwjbvgAA4mg4Jf9jXWwI8p9DmT3i2q1n3b1fb/iZz2arfIefqvvGsLmOKrxpyXQs5FUCuaqvgzP5N/G659bqCdKvzGvD3zePqfRrKbUqs=
X-Gm-Message-State: AOJu0YyUcKKuckmDTsCXccQcE0WpAi6pirEQzR8KAKtuYBou+LL9D25j
	nXDRM/i/j/7zOngHUoOtn83S0RYBNnS4tk85LO/EfiYjyppvQj1yl9Xi7JHwEXc=
X-Google-Smtp-Source: AGHT+IGMx6pa64JGPxhUPT7SMeYwMcT3LI2f9u2FoMY0ixSw2MmcT+yMI5nTfkQL0d8JQuAJmdvMpw==
X-Received: by 2002:a2e:6804:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2eac79c3350mr33762401fa.11.1717676218298;
        Thu, 06 Jun 2024 05:16:58 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d66d0esm1400028f8f.51.2024.06.06.05.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:16:57 -0700 (PDT)
Message-ID: <ed215b4d-0d6e-4638-bff2-4ce22359c134@linaro.org>
Date: Thu, 6 Jun 2024 14:16:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
To: Swathi K S <swathi.ks@samsung.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 richardcochran@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
 linux-fsd@tesla.com, pankaj.dubey@samsung.com, ravi.patel@samsung.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 'Chandrasekar R'
 <rcsekar@samsung.com>, 'Suresh Siddha' <ssiddha@tesla.com>
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112612epcas5p275cffb4d3dae86c6090ca246083631c4@epcas5p2.samsung.com>
 <20230814112539.70453-3-sriranjani.p@samsung.com>
 <b224ccaf-d70f-8f65-4b2f-6f4798841558@linaro.org>
 <001201d9d00c$5413a9a0$fc3afce0$@samsung.com>
 <baa64cff-885a-2ecb-8a0f-3b820e55e1b8@linaro.org>
 <000101dab7f2$1aa41320$4fec3960$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <000101dab7f2$1aa41320$4fec3960$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2024 11:14, Swathi K S wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 18 August 2023 14:57
>> To: Sriranjani P <sriranjani.p@samsung.com>; davem@davemloft.net;
>> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> conor+dt@kernel.org; richardcochran@gmail.com;
>> alexandre.torgue@foss.st.com; joabreu@synopsys.com;
>> mcoquelin.stm32@gmail.com; alim.akhtar@samsung.com; linux-
>> fsd@tesla.com; pankaj.dubey@samsung.com; swathi.ks@samsung.com;
>> ravi.patel@samsung.com
>> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; 'Chandrasekar R' <rcsekar@samsung.com>;
>> 'Suresh Siddha' <ssiddha@tesla.com>
>> Subject: Re: [PATCH v3 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
>>
>> On 16/08/2023 08:38, Sriranjani P wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>>>> Sent: 15 August 2023 01:21
>>>> To: Sriranjani P <sriranjani.p@samsung.com>; davem@davemloft.net;
>>>> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
>>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>>>> conor+dt@kernel.org; richardcochran@gmail.com;
>>>> alexandre.torgue@foss.st.com; joabreu@synopsys.com;
>>>> mcoquelin.stm32@gmail.com; alim.akhtar@samsung.com; linux-
>>>> fsd@tesla.com; pankaj.dubey@samsung.com; swathi.ks@samsung.com;
>>>> ravi.patel@samsung.com
>>>> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
>>>> kernel@lists.infradead.org; Chandrasekar R <rcsekar@samsung.com>;
>>>> Suresh Siddha <ssiddha@tesla.com>
>>>> Subject: Re: [PATCH v3 2/4] net: stmmac: dwc-qos: Add FSD EQoS
>>>> support
>>>>
>>>> On 14/08/2023 13:25, Sriranjani P wrote:
>>>>> The FSD SoC contains two instance of the Synopsys DWC ethernet QOS
>>>>> IP
>>>> core.
>>>>> The binding that it uses is slightly different from existing ones
>>>>> because of the integration (clocks, resets).
>>>>>
>>>>> For FSD SoC, a mux switch is needed between internal and external
>> clocks.
>>>>> By default after reset internal clock is used but for receiving
>>>>> packets properly, external clock is needed. Mux switch to external
>>>>> clock happens only when the external clock is present.
>>>>>
>>>>> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
>>>>> Signed-off-by: Suresh Siddha <ssiddha@tesla.com>
>>>>> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
>>>>> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
>>>>> ---
>>>>
>>>>
>>>>> +static int dwc_eqos_setup_rxclock(struct platform_device *pdev, int
>>>>> +ins_num) {
>>>>> +	struct device_node *np = pdev->dev.of_node;
>>>>> +	struct regmap *syscon;
>>>>> +	unsigned int reg;
>>>>> +
>>>>> +	if (np && of_property_read_bool(np, "fsd-rx-clock-skew")) {
>>>>> +		syscon = syscon_regmap_lookup_by_phandle_args(np,
>>>>> +							      "fsd-rx-clock-
>>>> skew",
>>>>> +							      1, &reg);
>>>>> +		if (IS_ERR(syscon)) {
>>>>> +			dev_err(&pdev->dev,
>>>>> +				"couldn't get the rx-clock-skew syscon!\n");
>>>>> +			return PTR_ERR(syscon);
>>>>> +		}
>>>>> +
>>>>> +		regmap_write(syscon, reg, rx_clock_skew_val[ins_num]);
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int fsd_eqos_clk_init(struct fsd_eqos_plat_data *plat,
>>>>> +			     struct plat_stmmacenet_data *data) {
>>>>> +	int ret = 0, i;
>>>>> +
>>>>> +	const struct fsd_eqos_variant *fsd_eqos_v_data =
>>>>> +						plat->fsd_eqos_inst_var;
>>>>> +
>>>>> +	plat->clks = devm_kcalloc(plat->dev, fsd_eqos_v_data->num_clks,
>>>>> +				  sizeof(*plat->clks), GFP_KERNEL);
>>>>> +	if (!plat->clks)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	for (i = 0; i < fsd_eqos_v_data->num_clks; i++)
>>>>> +		plat->clks[i].id = fsd_eqos_v_data->clk_list[i];
>>>>> +
>>>>> +	ret = devm_clk_bulk_get(plat->dev, fsd_eqos_v_data->num_clks,
>>>>> +				plat->clks);
>>>>
>>>> Instead of duplicating entire clock management with existing code,
>>>> you should extend/rework existing one.
>>>>
>>>> This code is unfortunately great example how not to stuff vendor code
>>>> into upstream project. :(
>>>
>>> I will check again if I can extend existing one to support FSD platform
>> specific requirement.
>>>
>>>>
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int fsd_clks_endisable(void *priv, bool enabled) {
>>>>> +	int ret, num_clks;
>>>>> +	struct fsd_eqos_plat_data *plat = priv;
>>>>> +
>>>>> +	num_clks = plat->fsd_eqos_inst_var->num_clks;
>>>>> +
>>>>> +	if (enabled) {
>>>>> +		ret = clk_bulk_prepare_enable(num_clks, plat->clks);
>>>>> +		if (ret) {
>>>>> +			dev_err(plat->dev, "Clock enable failed, err = %d\n",
>>>> ret);
>>>>> +			return ret;
>>>>> +		}
>>>>> +	} else {
>>>>> +		clk_bulk_disable_unprepare(num_clks, plat->clks);
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int fsd_eqos_probe(struct platform_device *pdev,
>>>>> +			  struct plat_stmmacenet_data *data,
>>>>> +			  struct stmmac_resources *res)
>>>>> +{
>>>>> +	struct fsd_eqos_plat_data *priv_plat;
>>>>> +	struct device_node *np = pdev->dev.of_node;
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	priv_plat = devm_kzalloc(&pdev->dev, sizeof(*priv_plat),
>>>> GFP_KERNEL);
>>>>> +	if (!priv_plat) {
>>>>> +		ret = -ENOMEM;
>>>>
>>>> return -ENOMEM
>>>
>>> Will fix this in v4.
>>>
>>>>
>>>>> +		goto error;
>>>>> +	}
>>>>> +
>>>>> +	priv_plat->dev = &pdev->dev;
>>>>> +	data->bus_id = of_alias_get_id(np, "eth");
>>>>
>>>> No, you cannot do like this. Aliases are board specific and are based
>>>> on labeling on the board.
>>>
>>> So if I understood this correctly, I need to move alias in the board
>>> specific DTS file
>>
>> This part: yes
>>
>>> and I can use this, because we have to handle rx-clock-skew differently for
>> the two instances in the FSD platform.
>>
>> Not really. Do you expect it to work correctly if given EQoS instance receives
>> different alias, e.g. 5?
>>
>>> Another approach we took in v1, by specifying the value to be programmed
>> in rx-clock-skew property itself, but it seems it is not a preferred approach.
>>> I can see that in drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +436 common code is already using this API and getting alias id, so I can
>> probably use the same rather getting same again here, but I have to specify
>> alias in DTS file.
>>
>> Getting alias ID is okay in general. It is used to provide user-visible ID of the
>> devices (see mmc). Using such alias to configure hardware is abuse of the
>> alias, because of the reasons I said - how is it supposed to work if alias is 5
>> (this is perfectly valid alias)?
>>
>> I suspect that all this is to substitute missing abstractions, like clocks, phys or
>> resets...
> 
> Will avoid using the API to get alias id to configure the HW. Will share the new implementation in v4.

That was August 2023, almost year ago.

Whatever you plan, expect having same questions in the discussion
because we forgot everything said that year ago...

Best regards,
Krzysztof

