Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9906E2B4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624798; cv=none; b=V4sHg7vgMW4rb2FT+ceg+lzcC4CRcdKYSmipM68TAdweby7F8sBWEZYY4PAouH51d0SD6iwrOvoWCPoJpdjCgDuEmj9Q2mflVekHVsPtz3lOgpDAgfNBwhwdO/+nKpZnlVNhKy64WGByAoA/hJtA1Zj7I+LfAm8XgOgd6Bp6ZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624798; c=relaxed/simple;
	bh=6SxcscwJ02W66kucwGjrzcTQYgAcEPZEts2EeTJOSvM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FKah37XaFwwzXS+GjLTDrZp/EzzqWFiti3JG0z6dDbl+LqFv6nEpnx7nvgujFEIKW9dknmPAt7RUKNvB7wT1cEuOTTDTcqtvsLJ403tUA1CLWyJ441ekd0I6Q1S6i0Los+DWm9m2JUbBUvkmHqLPMbgakBpd5hGJQlgprrK9udo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uePqYmja; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uePqYmja"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a30e445602cso1041300966b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706624794; x=1707229594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DDY5BZPpwt2yEgG1novZg5W6XI+10gjIrY+RC9/lc9E=;
        b=uePqYmjaodhA0aOEgPoow4wfv/TCS300RGcSEZz4n+0bXCjPojdj7CITLJ4kEhKDnD
         KjP978Co0++itNdc9zbC4ltsTittU6fRCEleBmHoy4b706q8weGnJ0cPoYbv3j0CeqN/
         9j2g4xjBfaT5hjvDY46K6wpVADrhW6IGL9PFqn5iTr0merAAw0EUauaaFHmdjT1Z12mB
         YRN290vS8l3Cg2NQ4dScUaBKrielFz+HyP66P4Yc6AsG6OZOz6ZRqLpqqT84lvPr2bGN
         JQJ2XRDChXsUY55hx5YyrUkIpmyHIjL5M8kY8XJ1tZkiMt4RR/hw21aLjaNGZGS57z7H
         6i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706624794; x=1707229594;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDY5BZPpwt2yEgG1novZg5W6XI+10gjIrY+RC9/lc9E=;
        b=ff6K/IdxzQM9AmrVeKiQdvpyLT4kcc9Y52uX7t3GVK9Z/V9Tkgex/9ks5gyBBnFF2n
         QjUjnR9mmccoC3cyhifVB5Rq4EI0BCkwmXifRJeBFasVEsXt/6DmaM/6fUyhmxK8VNYV
         /p4RG9Wg1SmgjrelDVXE0tzpvQlXW8ys7apLK3DTXGBvIIoAj8n9K3JuaZ7DSHH3GgZ/
         Fx5R6erINU3nFE4GM7CQHRRv6CxYSuLxckrHEedjDsYCBa71wn9SqoCKACTe4nf2L05K
         6apP7sTzGaNDzmElSl2tLuiwA3T/Typp1v/fyyAsVaTmGx8X4ierK2y9ShNN8I1QODuk
         JBnA==
X-Gm-Message-State: AOJu0YwEmr8jjbaWS4GgqOmvBFeR745XvOotKnXO28FOfZQ9LRp7yUAm
	QGSuP+xSLd4y42iXxm6zzhMeiQx9vK5YAq3mem9GicBO60VWnP4xGgKGa5Nf52k=
X-Google-Smtp-Source: AGHT+IHKrEZ4om+OBdWRZH5oKJE0WSGxbfIyd+m1044NYjgLqDiu65zMczoqWTTghRLPlml654VT1w==
X-Received: by 2002:a17:906:12d0:b0:a29:b31d:1dc6 with SMTP id l16-20020a17090612d000b00a29b31d1dc6mr1729410ejb.6.1706624794564;
        Tue, 30 Jan 2024 06:26:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVtRftE6PLTgI8bvywEI0uVNLcH1R8WafendqZxuGLV68A6+J1LkMCRHLpr83vhPTnMSUAnXB5oDJCMH23Qo7Wy33jPJG0tJUF0+53nxrVZSWcLvWN3T/pYJ1qHboCt+yHkZ4ZuA50cye0M093nkIOgqbKNq2i1IQhnn6NZiIPG2Y8O4fatOn8KQO85ijjwj69pDCucUhO6UfkrEkRvMieVS4zSC7SRGcHHE4sZTbo/QtJnvrvLqx5TFX1dzYpl44pnzMTYjUP5ccLGqvgOcQKB1UaDMQC9KzdtbAqY5Cs7ehGfu7P9V2TkTKzJCsUUZAQ1zaAmyrPIY3Sor1OzSk0UKzM/q9jS0zydS0mgsQzbTTUmhcCIQ92jLk60Bb1dfkq/SLXqtQt/qzkZvnn5gM8QKA0yGxD11UQXd4DklRmClNeGYXhEgiu+PL5WR0UthhtRinKPd5/u7e5+ZCpKctwwq9gz5JhinI3Mg8tZMC9QfX9QfmuQPkp4XKAGTBr9TVV5WMOfiiyhEu56k6qEjr3wEULn/v4Fy+PSr/i5U6jJ1W/Y35rsUE9bbBW849bPxt7rTaor8ZnUEI5KB+g=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id k4-20020a1709061c0400b00a349e943828sm5148913ejg.75.2024.01.30.06.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 06:26:34 -0800 (PST)
Message-ID: <bb6e3546-a596-4748-92d9-7cfc1f5e2db1@linaro.org>
Date: Tue, 30 Jan 2024 15:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
 pankaj.dubey@samsung.com
References: <CGME20240130125754epcas5p2edd5cc52dc58add09299d3aa5985a9fd@epcas5p2.samsung.com>
 <20240130125748.54194-1-aakarsh.jain@samsung.com>
 <9a8cb901-8021-42a3-a13b-bae10a645011@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9a8cb901-8021-42a3-a13b-bae10a645011@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 15:25, Krzysztof Kozlowski wrote:
> On 30/01/2024 13:57, Aakarsh Jain wrote:
>> Commit "538af6e5856b" which convert s5p-mfc bindings to
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
> 
>> json-schema is already merged. Remove "s5p-mfc.txt" file.
>>
>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/media/s5p-mfc.txt | 0
> 
> Why you did not remove it in the first place? Your diff from
> 538af6e5856b is so confusing.

Also, add fixes tag.

Best regards,
Krzysztof

