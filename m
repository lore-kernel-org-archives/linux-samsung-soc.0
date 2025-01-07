Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F331E32B9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247006; cv=none; b=TUJrS7RjZKPZYnz11TT7AGEcwO3lMOPYTWj7gE4N+Qve7rkOXgXHqaQTI214HozUv7XY7xoj3DCtyVSJl/nisNIezyzagMZwrGAs/QEx81uhYucdnL6uRXQ2keyEU//hdXyBmyXn1NvwcH4dYNNPwc37r23Vg5LlkxEzTjv/cWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247006; c=relaxed/simple;
	bh=OHGq9fkaJJWtR9oYDdVO29zOPMvH6rWL6D6NLYJOWk4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mLU8cg+Cw07JT6aZgcCALcRPhoq/vNnD+i7r4k0R1GQl+I5hlD1umvhGusJ3Gq2Go5aMsB0eCC2Rb7uM5f6W6Tn1HhF9prbCGI1DxIk+UPMGR4HufUMhV/QmJe85QYO/RIfJn2SmiVI8NRltcM0xAiw2fn5a+zDrgfVm/5b8DKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6mNrljx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6mNrljx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso110969565e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2025 02:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736247002; x=1736851802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FvZr/dVKDpLXbb03C5T6q3T96NxB6hILwFKtXlC/Ynk=;
        b=h6mNrljxE8sVetJXPXJ94WEZEbJKxI+CNCpDCuHYOGrUYnR8IDylzvS5RagbX0YESo
         3PLg3H2fa2iiKuo7LmY1Z8kwz3biQ+MEUvAYo+yBFOgUmvXqfZ2palllxDlfRT8Z2HPd
         wmsrREsyutVZQxPlYLUG0Eaza5eiuOjbYfo0mfOqe2gCTaNl0bnrPgHU84oBYUqiUSku
         UVfALcdEKCgEmozsZ94h2kyFBNJLkL/YGylH5oN0jfZvnGONz17tnDtjDYkg9MRKXXex
         AdMQhIEAHNr53TogB3UxSQxL3BpFA+WzS2yaGvTUhsqmxkvrjGDKQJMbkywQVfDqyVPB
         q4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247002; x=1736851802;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZr/dVKDpLXbb03C5T6q3T96NxB6hILwFKtXlC/Ynk=;
        b=Y4ACsm5d/pVV9rIS1F8xKmYW2ywAu1RMcoBVsduwTrqjAqRLFH5CS5QJbGEUPR7vPo
         HQteKyt7lQQuNOyXVQno2EnLjMdj5uN085Nctk2uZjNAnD7A9vzGck6k7MHlCI37JP+Z
         D38+1AIw2kcki+kSAivivVAm+Iig3sUFs+GMcLIDeyOj0T0ZGMzQqI2bptE5O8WNmtim
         8afeOomk0ceBywnIHJASb4PirChf26U+LcMfRxnRnwz0OWHH8AB+cSKcCbbBKqOwWYUb
         263u5INK9hbdNFrAPkS4RJ9u1LXE1WYW1O5fS1Y4rUSxLLG7C1VvT2UnBhwPwufiOawA
         hGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTtx3TzpKfOMcdz6NMs3kD0ly/rjK8dv1fnp+NchYq2PGwshPOZfmnoTxQMa1hODCSVQVDM8h/BpK/TteW+WnPBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt/I3ZPVCFNM9XGQFU7i/el7EaR3khecaUoVJihlEhrtPnN4UL
	KR8WrhkyUj1M8zhW1G4+kMzOyy1sqxd+gq+47ovpIbZMYEcD3lfCP2Q3EauPuEk=
X-Gm-Gg: ASbGncuhn5r2qTZV4neFxfQ4Y/PjgOvAkGK95wKdqMvd2pSwGPX2IYbt2mIQZ4UD+v+
	MHntB5Bg88mDC5xl7AOIexKi5KZpZOeqWcD62nP22Mp3C9DJwP0GEgitvA0oAgvuu1JyHP73bNS
	ctU0pHRgMUHzBFQs3kT9OfhXtBNs2IJHExeFuNDtT7p1PGOd245gMXx5vCjtBq4JTSrFKP9cog4
	b+H2HxufoxIsfZkuM8ifV++eZX8264N5s87NYXFbufOsst53nHr1RFKXLHZypRB
X-Google-Smtp-Source: AGHT+IFWWsclrAudf9l2fMtvDlof68qSNuL9I0XDi2SzEiGNLoR/MT68Eprzp2TyquFNjFKf6bXUlQ==
X-Received: by 2002:a5d:5885:0:b0:385:ef8e:a641 with SMTP id ffacd0b85a97d-38a221ffb82mr55164693f8f.28.1736247002474;
        Tue, 07 Jan 2025 02:50:02 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119d7sm626870095e9.20.2025.01.07.02.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:50:02 -0800 (PST)
Message-ID: <366ab35f-b881-4694-9d36-573f9922175d@linaro.org>
Date: Tue, 7 Jan 2025 10:50:00 +0000
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
 <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Content-Language: en-US
In-Reply-To: <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/6/25 10:20 AM, Tudor Ambarus wrote:
>>>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>>>> +						     const char *property)
>>>>> +{
>>>>> +	struct acpm_handle *handle = NULL;
>>>>> +	struct device_node *acpm_np;
>>>>> +	struct acpm_info *info;
>>>>> +
>>>>> +	if (!np) {
>>>>> +		pr_err("I need a device pointer\n");
>>>>> +		return ERR_PTR(-EINVAL);
>>>>> +	}
>>>>> +
>>>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>>>> +	if (!acpm_np)
>>>>> +		return ERR_PTR(-ENODEV);
>>>>> +
>>>>> +	mutex_lock(&acpm_list_mutex);
>>>>> +	list_for_each_entry(info, &acpm_list, node) {
>>>>> +		if (acpm_np == info->dev->of_node) {
>>>>> +			handle = &info->handle;
>>>>> +			info->users++;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>> +	mutex_unlock(&acpm_list_mutex);
>>>>> +	of_node_put(acpm_np);
>>>>> +
>>>>
>>>> You also need device links and probably try_module_get. See clk.c
>>>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>>>> perform both operations, which I think is necessary.
>>>>
>>>> I think you could also avoid entire list and mutex by using
>>>> platform_get_drvdata(), see of_qcom_ice_get().

[snip, irrelevant now]

I made my mind, I think the solution is threefold.
1/ use kref with a release callback so that the firmware drvdata will be
destroyed only when there are no consumers. Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e7c57355a3bc617fc220234889e49fe722a6305

2/ In get_handle() after kref_get_unless_zero() succeeds, I'll be
calling try_module_get() for supplier. Even if kref will make sure that
consumers will still have a valid supplier drvdata, I'd like to delete
the supplier module when there are no consumers left.

3/ use device_link_add() so that when the supplier device unbinds, to
unbind the consumer devices as well.

I'll implement these. Cheers,
ta
