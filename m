Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D31DA100
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156020; cv=none; b=UBlaFvfXZNWMKKeq2RbyBJt43XWjFU4s1Hq1mSIfwOeq9x20GKkShRw6EoDDuXB7m2TkyBNJUv0Y1NtYL9CzlOjyKhllwX/u+/Hn16BKfNJQafmyoG1doG+872+XY24JSn7HzWPBXv07F/msmOmNny4aHWFtXIRPAKu0fme6vhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156020; c=relaxed/simple;
	bh=1VZM7GWiea2SQcW4YHU9Oj5lR4cp2HgEavww/VYd1ts=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kscksXcC8JsXOce29xUgNZfwP/J6y0xcUcszz+gUECPIesB9zQGRFw9bC2HzJ7VgsTGjwIjbvFc3A1Y/wrNx1G4ZfvBHdXqDBQF+STlBKrxz/14RgnUVlHX0hxVyPavMOm0JQiMU8QpcCKS2xn4Am3qdTBOxylS5KFDdLmh3LaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QdObt22v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QdObt22v"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so148472655e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156016; x=1736760816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meQf3tOwA9v3KvEUX4FJM9sq2n/e26PkRGC26HXFjcs=;
        b=QdObt22vh6W/PClnHiVMjiSlOSGhLeEqNsjtXvlXDZNlE2wLOojOxHaeSZtFTD/zGB
         MgXUp/5EnvNWUEVotD/YWMdXIrxhvF2gvFR8uPZ2EpzIzgbNaUT8lzYZ4mz7vynQ+scR
         b0zSsfbTre1wMnNpd1JtVdl350kWy73vpLPaNmT3ytQ1zWQdvxbds6Ka0+W7YaVyy1ic
         DuYb8dlZD2MBN234/K6SuYBABQ/XVfu2JDKUzglw8wGJM+l30DsuGeZJ/+iW8f0rFkeE
         BCUyF8RyT3Ky64SO8O2U1iCu2plx/u2MDSNVSoBzuw4VkX3Zv+UAfdmr/XUVqSWhR4aT
         ACtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156016; x=1736760816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meQf3tOwA9v3KvEUX4FJM9sq2n/e26PkRGC26HXFjcs=;
        b=jjD4sUUgAq8O8vs+Gh03mLHs80EmeICLx5y62y7fFQU0z63gsf6zEeuGFv6uu6SuJs
         5hob+vbKJfJ/cQPRozMWKN3Cg9jQCoXp24W75mbc893Z7gdXgRYEveyr7+dAFYtbpgOs
         zjIXYOSpE5IRRCnLOwq/aJqxlr79WCvDuS9OlGd4QyHsLym9ZAxqPQdCa2S3mRcwLT4t
         xXBVrrzXwmikGwYseky5s1uzQ1CVfPR01trquVJfQP1EQPQ1BTWB992PkmV6eebP/J3s
         FBWwnggRkFydTnnKtJFVVLpp5tOBo9T478+m2+zbvlkQprL1fESwu0NN0V0BCcs6jeHi
         F84g==
X-Forwarded-Encrypted: i=1; AJvYcCWSeJ8EbuVKVMuyFEEECUGHtMK3zolGceCKB+QJn6lXVXC9FOVRw5WWzwim/zWpiJ2fprSsWBwCcBUKviy1tAiOmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvzMV7dvNEpHC4YPEu/+ETmvaFcRGTeSeVhzNwwsG/fvCgH6Q
	3HHpKPokYQBD3s3AEPmH6crAInyb/R9lJN+m+ptiSIUyz3Zl5LZqVULq7jOd2ts=
X-Gm-Gg: ASbGncsLpVSjDzYIkOmFDCzCPghIpZ3bk5jixOU+xBfjxDLYdBSXPpusMws1MqsI2qh
	EgCiY5x2bNsBGV0AVN2IPX6BmS5ZRs/r750OE0IypLFeSPqdeF/o6ptJ2K1h9ThN1Ac9NRLiwAt
	iS3OlffyRGOCdTo2duIzxUPQRj0gZEyy6my7Z/TZ55fM8CPxfECfn2UTxXWGn4oOMoxt8OBZXMz
	qYvvGJEPQmO4OZ7EtGQzKxn1J33xN8B9QoAMOubpIiW+U1eJJaB5C/9XOuGuES9
X-Google-Smtp-Source: AGHT+IEICTKjwcxXOZH5s08dwKlYhgIvVtZ84xC4XqDe0J96RAHSiziM8JeT7xKen2US0pmWaX6DzQ==
X-Received: by 2002:a05:600c:458f:b0:431:5632:448b with SMTP id 5b1f17b1804b1-43668b5e0c3mr428467285e9.25.1736156016496;
        Mon, 06 Jan 2025 01:33:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm570962605e9.21.2025.01.06.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:33:35 -0800 (PST)
Message-ID: <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Date: Mon, 6 Jan 2025 09:33:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Language: en-US
In-Reply-To: <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>>> new file mode 100644
>>> index 000000000000..750b41342174
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +config EXYNOS_ACPM_PROTOCOL
>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>> +	depends on EXYNOS_MBOX
>>
>> Is it build time dependency? No || COMPILE_TEST?
> 
> There's no build time dependency, I'll drop this line.
>>
>> Is it fine when EXYNOS_MBOX is a module?
> 
> Yes. When the EXYNOS_MBOX module is not loaded, and one tries to load
> EXYNOS_ACPM_PROTOCOL module, the later will defer probe when requesting
> the mailbox channels, but that's fine.
> 

I'll need to select EXYNOS_MBOX, I explain why below.

cut

>>> + */
>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>> +						     const char *property)
>>> +{
>>> +	struct acpm_handle *handle = NULL;
>>> +	struct device_node *acpm_np;
>>> +	struct acpm_info *info;
>>> +
>>> +	if (!np) {
>>> +		pr_err("I need a device pointer\n");
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>> +	if (!acpm_np)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	mutex_lock(&acpm_list_mutex);
>>> +	list_for_each_entry(info, &acpm_list, node) {
>>> +		if (acpm_np == info->dev->of_node) {
>>> +			handle = &info->handle;
>>> +			info->users++;
>>> +			break;
>>> +		}
>>> +	}
>>> +	mutex_unlock(&acpm_list_mutex);
>>> +	of_node_put(acpm_np);
>>> +
>>
>> You also need device links and probably try_module_get. See clk.c

I find these necessary too, will add them. try_module_get() must be
called when the module exists and is alive, otherwise I get a NULL ptr
dereference. I need a module dependency between acpm-protocol.ko and
exynos-mailbox.ko.
	select EXYNOS_MBOX and
	MODULE_SOFTDEP("pre: exynos-mailbox");
shall do the trick I think.

>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>> perform both operations, which I think is necessary.
>>
>> I think you could also avoid entire list and mutex by using
>> platform_get_drvdata(), see of_qcom_ice_get().

Using platform_get_drvdata() will simplify the code, thanks. It still
assumes the platform driver exists and is alive, otherwise we get a NULL
ptr dereference when getting the drvdata. But we'll be safe if I add the
module dependency.

Thanks,
ta

