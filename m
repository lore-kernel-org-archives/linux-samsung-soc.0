Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED118F2D0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130499; cv=none; b=CcqN443zy3HcqJ0m+FqpoKvgu+GlTPVWOd5RuXdcU+PgyA7KJjkevSYiKHjKI9PAijbXei/NxZIkE0RrYlnRma/KFsqkHITzbOSEoJDmzIHoeIEmqkUnJzcJOSjpqPcuyPT4jo9BMkTRH+R8TPW37dsZrn1odCKRRJ3XNgLxF38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130499; c=relaxed/simple;
	bh=6t2GNlGWIEG9ecqaLbHa1qjQNEEEEPcu98wGzRjCjbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/5q6Rv9j9tMSyH1oYpZmdZ1W33ojpFkFxAmTvIXPEAjIZlCMUI/SaFlkXH1uHG4RbE52+JSlBP/n+bvkQ68Y4W0zerrpQoSds2Euj37trqhCB82c28ZqkzXczymJaJcabZAIyd5TL6XlsEWo4k4ynfPLQdM2H2aPOSGWp7y6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcurXwRN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcurXwRN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42816ca782dso8201835e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130496; x=1723735296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8tx8U3NfgjvkNO5nI6Lcfavyz3p9zDlhTVj9MN+quXs=;
        b=WcurXwRNOXTNsQ2O9uedXRG41o7pq8iq33XB7BDDf0UZJG2xD/CEWR1713FWV01QCq
         r1BJsRGxPNqhhtQ7ZF2lkciJC/A21ISuAJ7lLWHeiwdntPvMpEWFf9Rzwdxt1pwxO2YC
         X5HunSDWGHtPafsmomP/k3Vdf/iO84uUoF9WCpKUWiKRTw1IEUSM06nMP9U1h/29r3KN
         Aoa/yFhbRIlplVDhXD1CqaBUbznttVGSLHBW1nY1tsQRMgNBNf1TOeoaZKLhWzuxDGO2
         sgYp+J86yFnbJYv70BxPFmfSLpLyts6oNI5ALK0tD+fvqo23aedormltCoJHupdHIg6g
         PwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130496; x=1723735296;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tx8U3NfgjvkNO5nI6Lcfavyz3p9zDlhTVj9MN+quXs=;
        b=HVv5Qw/L4+9I2cWJJRGZtk5kofJaWEFTJ3ZIw8V3rbL7TnTVFmA2HzgE/1nx4f+hPk
         DvObGBgoW6vLsMDaBUKaYb0SZ/sTS7lBvxCsffpsAeIy4NDvovytOJ8Jdl4gLMIG6/MU
         oqyqncbqDFXvILrweVAU3Ntbeew3FqOBHcEA+h4a3D+LUFNyWU0225nINTE3PYhJ8dJO
         ky9IQVs9uvsxr8gwvx3zVshhiDFMqXxJogmmQwN0VyNDXwmDhWZw4/Hi/X68NER5Sgg3
         JEXIAZQBRZ5d6RCTY4uBJNk1b5kRgoqZCmuRmTIJK0+AYTt35m3751MAgZtKfCCARE6D
         HnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoJNExdjN4zGAcyhEFgwSbEtn9o+nAQKKl46/tqXCq5iqWEZjyMC15hKccsE/NMaLrS8ZMXjmXJdVDDYVS0Gu04mzQXf8bHNSYKqgKLeE+r6g=
X-Gm-Message-State: AOJu0Yx6DH/d7v/go7CMpcxYqGnY3QCi5PkcL+ICKKbnWQ3BaqueWRRP
	Rimi0c/DWjTRrOtVZgmeG521uSPpX1mkSDH/0kp1UWxUqTSD24IBLIuQqIy1FwA=
X-Google-Smtp-Source: AGHT+IGAXmvI4yb3N10b6JTBbWeNhFwyp8BQG7lBzV8N+Qg6XSePSYsf7wFhC+LC5w9NszhAeFdlWQ==
X-Received: by 2002:a05:600c:3541:b0:426:6f31:5f5c with SMTP id 5b1f17b1804b1-4290aec9ff4mr16562595e9.17.1723130495560;
        Thu, 08 Aug 2024 08:21:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c72d55csm28705535e9.4.2024.08.08.08.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 08:21:35 -0700 (PDT)
Message-ID: <8c7127c5-e8f8-4ba2-b39a-0c9ada871977@linaro.org>
Date: Thu, 8 Aug 2024 17:21:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
 <20240808134432.50073-1-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240808134432.50073-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2024 15:44, Aakarsh Jain wrote:
> s5p-mfc bindings to json-schema is already merged with
> this commit 538af6e5856b ("dt-bindings: media: s5p-mfc:
> convert bindings to json-schema"). Remove s5p-mfc.txt
> file.
> 
> Fixes: 538af6e5856b ("dt-bindings: media: s5p-mfc: convert bindings to json-schema")
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

