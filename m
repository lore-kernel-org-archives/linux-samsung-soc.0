Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC21D63CF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158846; cv=none; b=jxNsoDpLxi9T6ic/JuF4aOmzA4EcIQNIkE967rwIqQ8+IZ3RGNvUBgfkZTkrm19wfcjkhTh8WKZ51PFZYHA8xN8U2dkoyBJyoyVCApUZYlZSb4q3I3miJhEPSwTEXHOQN/gKO4JWhOkeXi9eazwXDh4EPRbyWsJWTt+hQPv1biI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158846; c=relaxed/simple;
	bh=ZkoORgT34UgE2Vs3eAVs1SE45lE0SteieEH87tYlTzc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hnqmpp9HXloCZzZRBxzixJtiKNxoqHVppBsBfC4hfJA0GPQG+HHf9xt8WeHcJ2lZeVd9vOiyDbJ+3+EuwV6kc0saphiys3gLeo/n8nPv4lusPVLU8QswnVfKs4OmryYVJyn8S59+ZDRDkQVWaNM3JGI5H101d9UwJjCtajPhZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJDN6rZr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJDN6rZr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a34e8410bso4618287f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736158843; x=1736763643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8X068z0NbW+UCr4NJbVvlYn7QHVQGnW6I19hKbAd32M=;
        b=GJDN6rZr8MBhwRbN4niBLDjIOsmuBWmoDLnkE2eblvZfRjXPMV6juBUNUwQk1x1nlJ
         iWhUFWMKtytFYUoJ7mzrbNhJz7gqA35+a8dKhw/FXekf7YVwAEEy/WXFRwLqehjEPPmq
         P6hDozgweqHrKcIjlQD7oI+I4MRSz8F1giY27eWmQ1M+VRdfBij+DBYfOeCgnaD5iz8n
         75arxcMtPIaK06dhT0BxKCnxeQGlJx9JiUjw41Gau5eAsacFFMWHkNj8MhKaT41ltFHh
         udq4Cu1ABq4SC8vJ9GVRVL5GAdJ+i5b2fzKPAyLUh/e6w7RxaU3pYzEtmTyATXQ3M3Re
         OVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158843; x=1736763643;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X068z0NbW+UCr4NJbVvlYn7QHVQGnW6I19hKbAd32M=;
        b=CfuFb4TPl1n5RC7N1jamBexXHm7gOIeVve2/5kdn7kzTui813y2fHwHQ0Sm4n6GESu
         zvBvkULMb41WkW2JEpu2u+J/gydnaqeuTQyqOpVenHqatdVwUChqq1w0NRzLkS/mIoB9
         HGw95Cqp0oCJCsWteTFb711xAV23pHYZQ4H7hZiJWLwh4sBaqTE5vchho9X4V1QPep+K
         3vUvH8DNKKG9CuCidBM5cInedT19T3q9+EF5KxOa9tntCMhw38totqMDUqVHRpVXvyWN
         qQdfY0xnVZsIDDElBrX1FAL1J09XacduClRJ5dw5FZKNUoVzE8uWGuZTQUNH6Py11fg7
         JO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXceTWG10yERx83unxNlPd0j4/A3Ysu4KE81gSzRKNzLhQmhIYf0459q97BQSbKr9I5UNB7y4HJxgnd8HxLMAEa7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+sIU6wpNc8Ai1DzBLP47KEUyjCVymX4vIan/vVTiumqZjQho
	vujMmRQ/U7Z5me+OomEaGZWRcdPIC+8oZZZ7UjvW5NVzq5X9ND14KvKobN5qNiY=
X-Gm-Gg: ASbGncvD3ye51JVyzSU86H+dh3sWa8q5I6ZOtl1D7cRxB9PQ/qD2ZcK+X4WdSZjttnM
	us5vwCfkXZHSZOYjsQT66DjZq2DDXerzsPkdK5WPaPyW2jdy6N9sbWoMbiXxXbRZW4DUMr8fso3
	H2YWf0YqSeO/dUj87NxB36Q5hk4OytIIchQ0k6dXQR6XoRzVuKyr0utBVabv2i+tX1f4yyHdIl8
	O+/rH3ShTmmizMB8TSWtNFT7hhZvDCOLshovpuNm4WjQQ2BysTaUjDQskVzJ+vY
X-Google-Smtp-Source: AGHT+IGIQDLi1xgJhO8rn+2nlOJ0KwWuo5zVeFcnrcbdiIPBRkk+WzLUuK03bXiGURyPSGYNm5Z3Sw==
X-Received: by 2002:a5d:5848:0:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-38a221f2f00mr54847241f8f.10.1736158843338;
        Mon, 06 Jan 2025 02:20:43 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2311b3c8sm44640950f8f.25.2025.01.06.02.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:20:42 -0800 (PST)
Message-ID: <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Date: Mon, 6 Jan 2025 10:20:40 +0000
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
 <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Content-Language: en-US
In-Reply-To: <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/6/25 9:33 AM, Tudor Ambarus wrote:
> Hi, Krzysztof,
> 
> On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..750b41342174
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/samsung/Kconfig
>>>> @@ -0,0 +1,14 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config EXYNOS_ACPM_PROTOCOL
>>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>>> +	depends on EXYNOS_MBOX
>>>
>>> Is it build time dependency? No || COMPILE_TEST?
>>
>> There's no build time dependency, I'll drop this line.
>>>
>>> Is it fine when EXYNOS_MBOX is a module?
>>
>> Yes. When the EXYNOS_MBOX module is not loaded, and one tries to load
>> EXYNOS_ACPM_PROTOCOL module, the later will defer probe when requesting
>> the mailbox channels, but that's fine.
>>
> 
> I'll need to select EXYNOS_MBOX, I explain why below.
> 
> cut
> 
>>>> + */
>>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>>> +						     const char *property)
>>>> +{
>>>> +	struct acpm_handle *handle = NULL;
>>>> +	struct device_node *acpm_np;
>>>> +	struct acpm_info *info;
>>>> +
>>>> +	if (!np) {
>>>> +		pr_err("I need a device pointer\n");
>>>> +		return ERR_PTR(-EINVAL);
>>>> +	}
>>>> +
>>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>>> +	if (!acpm_np)
>>>> +		return ERR_PTR(-ENODEV);
>>>> +
>>>> +	mutex_lock(&acpm_list_mutex);
>>>> +	list_for_each_entry(info, &acpm_list, node) {
>>>> +		if (acpm_np == info->dev->of_node) {
>>>> +			handle = &info->handle;
>>>> +			info->users++;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +	mutex_unlock(&acpm_list_mutex);
>>>> +	of_node_put(acpm_np);
>>>> +
>>>
>>> You also need device links and probably try_module_get. See clk.c
> 
> I find these necessary too, will add them. try_module_get() must be
> called when the module exists and is alive, otherwise I get a NULL ptr
> dereference. I need a module dependency between acpm-protocol.ko and
> exynos-mailbox.ko.
> 	select EXYNOS_MBOX and
> 	MODULE_SOFTDEP("pre: exynos-mailbox");
> shall do the trick I think.
> 
>>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>>> perform both operations, which I think is necessary.
>>>
>>> I think you could also avoid entire list and mutex by using
>>> platform_get_drvdata(), see of_qcom_ice_get().
> 
> Using platform_get_drvdata() will simplify the code, thanks. It still
> assumes the platform driver exists and is alive, otherwise we get a NULL
> ptr dereference when getting the drvdata. But we'll be safe if I add the
> module dependency.

Ah, MODULE_SOFTDEP is a soft dependency, so I can't use
platform_get_drvdata(), because if someone removes the exynos-mailbox.ko
from the file system for example, the acpm protocol will defer and its
clients still get a NULL ptr dereference when trying to get the handle
(where try_module_get() and platform_get_drvdata() are called). I'm
better off with the list and mutex.
