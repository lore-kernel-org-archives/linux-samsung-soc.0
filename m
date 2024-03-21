Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30458F5D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Mar 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711006642; cv=none; b=Q33Yzow7qAEwIgA62wzjYaykRT4UuN/cI/SrhIR+JvF6dIJKym1VSAb52kSEChgISyg6oV/7BGQXLYyEZRbFhsD2pR9peBOp6Ec6/oDDCtRaT7MIVmUKEL/+xINyPzXUZ3qz1gDoIJt6L2RF8HGH9qxWDe0FViWe5uvdnGZzeyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711006642; c=relaxed/simple;
	bh=ciHcBad6wsCdSKS72A2Ly6Kx9aTz0JsImGToTx/N7y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4HPODtcpQpOUW9iGQ99qowqfUZg+NNjbvO9uVf++4Heez9h7dKDg43YuwXHSlg/ELu2yZ/XIfT056jqlHy9oeqdAmn/ewMCQhDuiOBUMbLOGFwU8LzePUFDEQc7V3ckksdR8YfO8+374H89nj8N8JtqALBXXuo0bC19HSa2bhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsB1qpe0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsB1qpe0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4707502aafso114808366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Mar 2024 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711006639; x=1711611439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3GNcu9BT5Jzy1oYTCUx8B4xITMCawK9QqP+r49dVM2g=;
        b=DsB1qpe0ZGWtxmL3P4YHJ+IkRaKcZ+AVG90l0DZPJZd4JpZ3sQdHgAFs8kAPPFYDQx
         qzRnWqn/yOqa9LgETJ5ezy8fR9DKlX2jKIkw855NZ1UPZnig0GVAGoD+9Pu2K9MfKxCw
         1XCWw+zQnyTxOODlcp9TfpdQ+11Ca+qMiHoKdArRrWgCLb+xcshF3L4N0/9472DJNkKP
         c92P6aE7DMiP3JUzTiUML6NNb1CH1b+pj5XZD5vyoH2xU2kIH/OzP6qTydvsKbtdoiFY
         hacWI5hj6pTRo9D7m2H2banSZJI9t/QiGbgSCoLREabSCyq52KhAzWuSf7b4PysRgYm3
         SHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711006639; x=1711611439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GNcu9BT5Jzy1oYTCUx8B4xITMCawK9QqP+r49dVM2g=;
        b=PDGZJBANvsNRCizeoE7JdXJT5Fpi2XH7tUWNk8hZ1EV8a7F/NJludhKEe5lMD8Msg6
         VvG/A3pE+uFWwu6RZhAOqTFRD4vRLTXwdWukKINTwPYAEM3rWDRLwJnP7swCxQ1ajjZa
         QxLdnM8FQiHPvuNVN9kOqlLtgofJQxlMsoA1kYs32WGIE+lhl1EHczxV/g0B8x54Xpx6
         Oksbz674NO2DbiAp8zus5MKdwKBATQ6ShWFs+NG8Q8LPGdIRk5W2Vm6A4BpNVeee81Sf
         fQwsYvQF2NkKADAA8Mok7vlnUpqFF/+3liKj4qsMsu7HJus+JzmjsV4mZGkZHSKqkBen
         cTUg==
X-Forwarded-Encrypted: i=1; AJvYcCVwqRR9fE/8hZbXvRxzDYjoylVgpkGDY8NwkdZQ6vtRTiAEvDXI3xWjV9eY8kvyMl2wt6QjqiuZMl8sF5tEchPjn9SL0GhvQhN/krMy0O2dj9E=
X-Gm-Message-State: AOJu0YzI02y8lVmomxXisKVGFE3KItJ7e5Z8e1gX9/VqCykIGKq2DNVL
	myJHllLvJuXhF3VXSl/vyV8eTV7so3Je4nGK4WZJjnSFdwEzPvpBsA4gilpDdhM=
X-Google-Smtp-Source: AGHT+IEi72WHVP20TtVb4ggyrQbvRtsf3GcEruUMPaxm5tTV8wSS6dXHVovutQyMd8tm7W5n+MwbeA==
X-Received: by 2002:a17:906:b094:b0:a46:8227:2d0c with SMTP id x20-20020a170906b09400b00a4682272d0cmr1607684ejy.1.1711006638849;
        Thu, 21 Mar 2024 00:37:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id d10-20020a170907272a00b00a46647ab91dsm8092856ejl.22.2024.03.21.00.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 00:37:18 -0700 (PDT)
Message-ID: <90f0c8e5-01ec-4cb9-88a0-fe36d8d20443@linaro.org>
Date: Thu, 21 Mar 2024 08:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display: samsung,exynos5-dp: convert to
 DT Schema
To: Conor Dooley <conor@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
 <20240320-reanalyze-koala-4c086a24fee0@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240320-reanalyze-koala-4c086a24fee0@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2024 18:04, Conor Dooley wrote:
> On Wed, Mar 13, 2024 at 07:28:55PM +0100, Krzysztof Kozlowski wrote:
> 
>> +  clock-names:
>> +    items:
>> +      - const: dp
> 
>> +  phy-names:
>> +    items:
>> +      - const: dp
> 
> The items lists here are redundant when you only have a single item, no?
> Isnt it just
> phy-names:
>   const: dp

Somehow the convention for properties was to define the list. Unlike for
compatible where we use shorter syntax like you propose. Shall we change
the approach and use shorter syntax in general?

Best regards,
Krzysztof

