Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB081E990E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761285488; cv=none; b=ZvjUibbigq3FoX36BmEg2HAIdczhI/gihcKYALmir68SVbfQTEOizvCUJFCbrzvjGrj49Uq5iX0oYE+C5w2hvgGjUyGYvW1RU3/+rkYa/GIdcQbwAJIt4EEG4k9+xktUkgp72EQbgj+SljaOKfmKvvs45bsyDBOxFk3oD5+ADnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761285488; c=relaxed/simple;
	bh=NmsrupTRkisYQFGhFjZ0bRbIdltnfvRER/RQe8hkLqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hn7Zk5C0DgqGI7L7dlButkg7Zv3pngNnvoEmXc4UCgrLOMIbGtxtK5mrmh7EIk/n3WFEF8Hh3IdrPBbRlm8KpW8OqRvguPhIjPLqPIrWQyNHDQaxZVUBY4RkTgmQGblOS6qSxQ3MZ6d5M9Y7C2eZm3Yig8H5dVkQkk/HIkHkOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PH5RI428; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PH5RI428"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso796051f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761285484; x=1761890284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlbgzRvJgE4Sx6EeAuF7s2GqiVQJOvGqllksow3opC4=;
        b=PH5RI428SNOsHpUF7L5WveuXG45u84EWGn778+3Wr8bMdv+wkVkqB49ktt4SK7xIHj
         Tncr5zM4G6R8tSxbmhiHD6juJAH2sQxz2za0S6PGE4mXwEaNctpDMKkn6STQASqJme2e
         pMIv19vxtvk/unKYgHvS5Dg3InBKAt9dmXDE2huuB1GxdXvdHTY8+tFrsNES3Rf382ae
         Kqgfv+/8L2sxsOqv9QtP2utjHEClW3Txz9Pup/PpINbpc/XbsbrLWgRsXHjyRAf8S1fG
         DbDFc+11K0EfswLo1VmQyR7wLkTmePf4g55KqAEzGPySCRFmcXzID++dMRKkWq8vhBoz
         FkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761285484; x=1761890284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlbgzRvJgE4Sx6EeAuF7s2GqiVQJOvGqllksow3opC4=;
        b=BvjNfE6z7DmCVL15WdZwYyLs4ci6rJuSJDIxPU1tjrAj7N7AeRNMfO1LqZL1EyPJXb
         kx7W/CBeSerkfz0jPKQq3tLGC+hDzmXe0Tw6/RuExeYzhONb9sM4JRwKRw+viSpnYwOU
         ePh5YEnwujOpMLSzGGnxDkM65D15GuyCNoIEKZ3bTGyUQqwT7ZM98sIrb9fl2aOxZNPZ
         X/NTRthZkuj/aRM0Yat2suAq+syHNuD5fdMbf7FoGLJBiyT2zFOVrTioY6njNk7Gyd/G
         SvQEBd4JJ7a9tPWFd0bxxIYHmPHKVxR1NsnBbGGC0WscmU6AbBD/bmK86K7ObrF4EX8l
         LThA==
X-Forwarded-Encrypted: i=1; AJvYcCUcqMwhf0Whosvb52F3zj6BfZNh8FN3NHX+exXlClMb07mFAxC0eG8+ULuClmCET+ixpL0zYxJr8xXbYaPOPlSTIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPnQmHPW3Lk2A+udpbruX721tuaEBquSOQw5Xpqulk3rFq3M9
	E6BF8EqFgsc9ZSoOQLpdLK2OWf5v17P86FE0mOZuQZE7oD0lIX5f+jtdgeRPyeDUajo=
X-Gm-Gg: ASbGncsA0x7/LtOke7/3W2TV2Vi0xXLuCyszY6D0Rz/BBWgN8V4t6tfo6197PD0ID2U
	6SgNuiF8z0pDhMph8apxD7ONYCEQNtcKmk9oktgOYI1hjbutCf6UASQSJe6XFVoL1CKbhwVvZjc
	vdKzpZuI/amgARP/lBQooYRiUX5NhtDw1WztF8mCgxuFWnMIzdHdvYDTQfKmCcTwBqTRX9b8o8J
	ERv8kbdEm9Uz9FmzmxNV2shd/WhOmy/5WqNzJG8cfYLxEu5iQ0Wa+2C7DA/frzDR0QQWKTHLEHR
	FmgyRPK/v+XkBMz+tagAjBV+78uMtqtZIEHmVV+grKe8lsSyBCi63aeU52VJtDnsx1CnitiZY1w
	m8mHXA8mA/ezcyxe5RJncc2ajPWv7J2vySR1RD47WfmOgjHXFpptxZxLOXXyEFkc8lWfYdqqwlV
	T6U41g4vDlTywRnRwOsd4=
X-Google-Smtp-Source: AGHT+IF4FcOKkucmDNCM2/KKpneCA+i1yPeXTsA/LVynPTPJC5AXKg32KTh4dcKAlcjbp/p6c5h7Xg==
X-Received: by 2002:a05:6000:2387:b0:429:8d0f:e92 with SMTP id ffacd0b85a97d-4298d0f106emr1607568f8f.6.1761285484311;
        Thu, 23 Oct 2025 22:58:04 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c14a26sm76466825e9.4.2025.10.23.22.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 22:58:03 -0700 (PDT)
Message-ID: <b1b6271a-1f75-4cfb-9af0-4d60b578f2dd@linaro.org>
Date: Fri, 24 Oct 2025 06:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: rng: add google,gs101-trng compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
 <20251022-gs101-trng-v1-1-8817e2d7a6fc@linaro.org>
 <113ee339-566a-4cc2-9786-89252ae072e0@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <113ee339-566a-4cc2-9786-89252ae072e0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/22/25 5:31 PM, Krzysztof Kozlowski wrote:
> On 22/10/2025 13:19, Tudor Ambarus wrote:
>> Add support for the TRNG found on GS101. It works well with the current
>> exynos850 TRNG support.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> 
> No power domains here? I would prefer to see such additions together
> with the compatible, if that is possible.

It's part of the misc power domain.

I'll add the following in v2 and keep your R-b tag. Thanks!

+  power-domains:
+    maxItems: 1
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

