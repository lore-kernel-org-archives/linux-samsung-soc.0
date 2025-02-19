Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5A1DE2D7;
	Wed, 19 Feb 2025 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739961013; cv=none; b=ODwRNXJOPDuTwAfFtn+bCPSsrNaukmu8EYXWQ4z12lfvPwsAlwxCJKLdaw/jIJ0hdOkEPnAdu+9rYmXmwRJ8J28rC7/Jth6wC2Cqdb6J3pzBbuO3iwDyFMMbO357plQuESwJdgHzKTckPvFd/G6v+GI0c5Tl31ZjmwwRXUE8piQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739961013; c=relaxed/simple;
	bh=ZlB6Fl20r1Gyf71CsikcN1lkjeaWcVEK4zgaiyqFfKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anDhFugXce4CUUEFIMjwUFRzfGX1mAxL8jpP5T6XDC/ns1+r8HSc+gAymtdn0Sv9aU/cCHW3CBFl4rS8704c+ACAkwLkj+jF1cNqx6lhNXXfzuTPetWim0Uuo3i1IbAHRMVbHwL8UJ4RY0B4LtlBLBAiAZ+OrhxQt1/OpqbHLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDfTXh7X; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDfTXh7X"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaedd529ba1so774562066b.1;
        Wed, 19 Feb 2025 02:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739961010; x=1740565810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqsCWWkSmH25LiinfK2WpeOAAuO01FXzi3yUfsrVLMM=;
        b=nDfTXh7X21aJVfhGqTQhZ0Nrs0nv7FXYA9mHE7CTVNX3VgG8S7aKQqb3HtuABFYiQk
         NiPX9bTtYyets8GcT/xYBVdNf1QqiQnkoEebEcbrXaL7yFHngA1KNhanjRbUu7ORbaBb
         BwHxPCzGUiNecFfy4spJnRVeBWPrk1pHlV8gHThxuIBoe8fNaLgllb7GoRzdiFxILBSX
         astxeeMNSz9G+dT+vJ9CvvYV3pzkjdQR19klxB027p72ELQ+OXQlr63tKvXw829RIUEa
         /EcpbYpNeAEIO/pUL0RtVtOHZ41tPgyz9r8PNbR6hIe+kuO51/oBvv79G53RUM/RtqBV
         9iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961010; x=1740565810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqsCWWkSmH25LiinfK2WpeOAAuO01FXzi3yUfsrVLMM=;
        b=HhOYY2VNjstiswNUgWDP+vpGeYdLpRXMYYSg+magVrzl0kzARAeSlyTUP9e8wDwDOD
         4yvLPNq5JeC5Hq5qMoL/oWDbtCnqv1adUUaipAxom0d6zWysa5kDU6uFM+2xsc0Ibpca
         ZUSX5a5DPnLkKIA+qJjT0oDEED1wy/hx50nCs9AYsLUw5NQan4Go9jLz1SbTiNiodxOi
         BaUsMoaObFHt6pK/BYGU8VqmXK0D/qyFz+1/bnrPpjZDd9Dz1ejmlhDjq0leYOqivRRo
         mC9sVVK+eEbXAznhqoGTfIBKAo3J4TJz7ImFj63Id8s0p3w3st6qIljNXaEo57A6iGzy
         buCg==
X-Forwarded-Encrypted: i=1; AJvYcCW5/TAefFP+DrA1rsRiQJrcphHZqWGK7aMXR+7IUuCT8MG9j6bZefFMAn7evBN6gbi8iBPni9SciUuM@vger.kernel.org, AJvYcCXKR0Q1kZwA6xw10pPcone+U7tE0LQAFIHT5PJeDLkgOtC4gzZf91k9W56wt/LuAYOjye7BoYqNwH+jTbtS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsNSDw6YO+2hLQZ/cYdtM8Uo2HQqiUp717nEgAAdsjfEcFrlD
	woi0Qopa7f1AETZSQ3HnAv5SHt/mQxXfT0l0ic6dEm7Z54T2JMzG
X-Gm-Gg: ASbGncvZcqQosl4dFDjx1kYw98DG4cdo/8WZPi9RkDwDRrrQ1Ix/DQah6I0l+NmJzV9
	s6LIYQ374pvLn2+HmS+9rZZA5vH9aSXaB7wH2XDPyDwqSE70+C/T2iUkepRm9UWUdjEFXZyMGau
	iJh7CxduiVfDtpPg7DLhuYa44LDG0YofkVma+KrlQsm8muj+jrRP0DLkQDM2KPC5Biqj7A/Y4uw
	HUP4kl9EjQSYBOFLVd1VRlrl/9oPqAtn3/JwP1ytTWMvDTlchtW7AMs456uhu+oawd5TVzfKN1K
	ZakQXpb9yVYWjT48CFqBk44GTbYiqvUyafzpcpa4XKH8D6pSDM+XQnMk
X-Google-Smtp-Source: AGHT+IGMRnJbqZGcoPSmmMe5Vij/8eD1w+eN1gparuJBfqUiWqQu7i9iee9bfZFQ1AHQ3VeOe6iFJA==
X-Received: by 2002:a05:6402:3710:b0:5e0:7cc4:ec57 with SMTP id 4fb4d7f45d1cf-5e07cc4ee69mr14087611a12.31.1739961009458;
        Wed, 19 Feb 2025 02:30:09 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm483479766b.35.2025.02.19.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:30:09 -0800 (PST)
Message-ID: <c39e6058-0649-452f-9a21-d9d5a28ccc06@gmail.com>
Date: Wed, 19 Feb 2025 12:29:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: samsung: document g0s board
 binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215130500.170738-2-ivo.ivanov.ivanov1@gmail.com>
 <adbbd60e-c72c-46f3-87e5-198ab1d49d9f@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <adbbd60e-c72c-46f3-87e5-198ab1d49d9f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 10:35, Krzysztof Kozlowski wrote:
> On 15/02/2025 14:04, Ivaylo Ivanov wrote:
>> Add binding for the Samsung Galaxy S22+ (SM-S906B) board, which is
>> based on the Samsung Exynos2200 SoC.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> index fab29f95d..bb3f6a0e1 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> @@ -45,6 +45,12 @@ properties:
>>            - const: samsung,aries
>>            - const: samsung,s5pv210
>>  
>> +      - description: Exynos2200 based boards
>> +        items:
>> +          - enum:
>> +              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
>
> What does g0s stand for?

Samsung started codenaming their S series like that since ~S20. I'd actually
much rather use something like samsung,s22p but since 990 devices upstream
already use the weird codenames, I've decided to do the same.

I'll mention G0S it in the commit message next revision.

Best regards,
Ivaylo

>  Sound a bit cryptic and you did not use it in
> commit msg to explain the origin.
>
>
> Best regards,
> Krzysztof

