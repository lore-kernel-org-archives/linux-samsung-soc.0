Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A77147C8A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714723735; cv=none; b=jUuqFqrVYSDsNpLkiWg0Nii8Rs04CDxUOHtaJ0/3wju+BqT4CtAUdVx5apY1MJmtBDek0bbUDxLQceH8idXt7597q00Qj4A2yBiksEn6tIq8aQhkWYmQpw2ypV20KBkwiKilw549Mfgfmbv1w6CEl9YCTbkhXsYjv9eBuszoj94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714723735; c=relaxed/simple;
	bh=7qQTzG9i8KLzJJyyK6v5uKKev+BF4EWHDk9zrcLv0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WYrVA9l8JYUw2YKzk8tqcrwGAxoXLeGZ24hqYs805T/1vZK3+PnadKjiSM/gZE1X7KaejhFtZzKE5NLTJCecLC+tdvP6EHaJK6j7UAMAtDRMCGFF7k6rkZksW4Xbflz/hETFN7DHjAv351GtJxuiTnnE0QvCXETT+LLEIL/IbXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkMRn9rF; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkMRn9rF"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so58745521fa.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2024 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714723732; x=1715328532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=PkMRn9rF+tpXpYn2yYPeTlN0KUIZGIQerhBQQ33P+TJOAxT0Iey/nbhLiJ6dmD2DdH
         JViZ+tIzWlzUkxV3gkjIGVh1ayzYy2usZPN8CDj3tJUFa3iU44BP0ukqhvT8/9FwMvK7
         psMKjDC/GPRq53BEEHQxGpaFP7CC/oKmrCY/q4Plf4Aod+YQexyZnvwEzb+675PPozvb
         EirNhLy6p6BOJv3n1B1JFKY7lx4/vd7Ea5i6BofxOGQi2NQ+KvdYb9YGvqGgmA66P3qB
         cfxg2oZq5TXSf1mgjbchm7NSgy1zrRp7WLrtsa9lgVPbyLX+msvh0bb+vnEXp0puWc/H
         NMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714723732; x=1715328532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=VMwu61SjfWFHBhzKD9RbsaPVMvK91wXIjwXrx6TZcXuzIb5mqdi91IRksUMB/U7WJf
         Crus1oTQ/bZttSF4BQg6exM4aTbUOgtMRfEIgUzP+dMiujoZn6SDo6iVP9siwJxit/FC
         mHN9xA5iivzV3oX2HLlWYoWCjnH75YH+yiZTH0gcb9fqRRfDZzZnt7c1tZzWJ52fF21b
         7NDuw8U1INVYhxR9TSPPkjgvgMK55DsZeyAI3PwDLc+kPUt8OLdc3EixFTVODgwtdoth
         2OxIaTgA7dXd9VWVVLAEj+1bk4IKuJdRdxF78Y0qdkI7gKhuVL2PLYdNGSNTr+pAb/gt
         p6TA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6hBmjWqj1yE/QI8zi/5tx+Khz0aVrMi/nJR79HMCKkL8oF+bnsAKXTF99q7v1tSy3+epEkD8c6SlfRXEZqtP0XAyiAwLGLEk32UvkAHfP3g=
X-Gm-Message-State: AOJu0YyK0F481eGsYIM2z8Gz3dQi+CrvWpE/k5As/9KWKJNbVNLyfgmo
	nZ8oOyy1JDqgTNz8m5nAA04ExNYWQ5NMiOInf1MlWPUeCZeIaFJL8mFJpWqlQ5I=
X-Google-Smtp-Source: AGHT+IEyVSxtgBjxgwR445qD/sr1uxqCDskSMlyg7yV9YjhIzBtojmFjs//+3uZsQR/8QqR1GYTL8Q==
X-Received: by 2002:a2e:b0d5:0:b0:2dd:7712:efcf with SMTP id g21-20020a2eb0d5000000b002dd7712efcfmr1255172ljl.10.1714723732369;
        Fri, 03 May 2024 01:08:52 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b0041bf21a62bcsm8456940wmn.1.2024.05.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:08:51 -0700 (PDT)
Message-ID: <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
Date: Fri, 3 May 2024 09:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
