Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6661F236E;
	Fri, 11 Apr 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744393648; cv=none; b=nrQqv1iA0XKO2VVm6wQeDKg+paVWMc3v4MqE4r1o15SdozffLexbxDlIW0lNH4MPm2WO97Vp9u0bwxROYFze2UnlXVrDNQ5d681i33n0T5O9orpqVfyJgMT+o/h8tyXrGVnpQQ7vMIaQC5lQCbuasrjbtlM+z+fBjA+HNUxFV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744393648; c=relaxed/simple;
	bh=0MLX+FBHtCEjzvR9W+kUND4AuM/q7MtU84jtYxyA+qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuN8/AJg7/EpOg1dU6XseN0F2xuaWp5OqF8jINImBX2B8eNN3GnQN+AoNQc68nnDmnfy3EtRXegfeGtnYcHHO5yxTGrHhZHvn/XW8K+N062Af9IwU5YEsLOJitrrrpqt2BE3J6YeM59L/t/Ud2fGFeuc2rKAI6cEIMNVRSYUa3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3q0ZZxf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3q0ZZxf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so16922905e9.0;
        Fri, 11 Apr 2025 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744393645; x=1744998445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2fznhoTGlfhy6bwDHoklI2QzmN6aCONWUMAdXUv1oM=;
        b=e3q0ZZxfwrFpsgJQSf5GaXN56x5jIZFoERxcJkNgtIu2YYwOgdGkHWs26a2XUuv+HJ
         OdkD8EzfGrQHOcLB/TuhTv95d7jPogPts94Lahs52yfC5EmKMldzOlK/CpvgzlTbnmpg
         hI1l3NCYVHkN333gWp8D8shOuCvzy4WrVyBuI0CdFLCfxvsxnlNPBF1Pt+6tMhw9SaC5
         62whqOWbmXUvzC2faFHzkb30eO70xo+TkPoDySAr70Xh1X61RQ+No0eus6YBu6j9uRT3
         5igpRFOFI92D/hghL6QrmC8mCzauxRASz+n5mqkNOZGpu0H1AXV0Jphcdr0ogDq+3PEa
         SZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744393645; x=1744998445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2fznhoTGlfhy6bwDHoklI2QzmN6aCONWUMAdXUv1oM=;
        b=d6TtM9hIJU5ZthMBUDNTD3DJNfkVqBf/1PwJI58lL2Ge5p2ZsJPMnAaAgSETvFF/pp
         5J2mAWhMJ6zaZRpDb9xrj/KTQDDy+iTZwLYjpRi3bKlsUdPz6qkokzxnNVhW4sCqzYUe
         gFwwaWYQ+8LUoT0PI8dBXkvfMgCrwvZRVdByxVY6GLb3BeQOQZR78efO0NtBhcvBbAq2
         lSpcYPvmq09Te6v+9vM1rmRClmpG6JWK8fclMBXr0vGoXXSMo9k3763KKN6ldsGYSLtd
         pMjjrZwfblPodcFJrj/Uq4ndvIjH1DhjnJpEjOWGRjuteT1lZYwPejwiJx0Jdi9ssVvF
         t5MA==
X-Forwarded-Encrypted: i=1; AJvYcCUBhrR2q6jPk8m2CSeKXKptS8P5y9AvyW1sioDJZmReEvjXwbz5WbN1i94cSM/oqxK9/9I1as8KWFrnDLYBEIVNu4k=@vger.kernel.org, AJvYcCWHTYztK7KDoNHsU3LHE+NlsU13Tjm2Eo/KwsWfifNNi6mUo4K18oRKGP4f2FWxIjISwN/NUxhVsWLg@vger.kernel.org, AJvYcCWQI9e4npWeXSss/LEtCv5eySrj+N/WVp1JZ4DS7rj2DtixfMYPIva+V7yknGOv86DWldQ36/ujDxgK@vger.kernel.org, AJvYcCWa2io+kqMCL1PVLO7bS+t9vClB41mM0djOGtRfcvBtLZrQjn2/1HzIyr+lMMJC2f/pwQzZwk7kduX284QK@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD2WKu+69bMt/vX/n6ny+xvsCfG2JeoRg6ydNFHyY7MtiO4pP
	6oo1b8HktDzPhCw1z0FwHHwsZ3XTqQ20VTzCZQqSLhQ9j7lN6Umg
X-Gm-Gg: ASbGncv257sU4c55VIXfceCJFp6iMLc3IlkjLWowynKu0fuBD2kOT0wCXa7S+OpXDOE
	CKt8K5H6Xb7UbmXL87yBTNvHDcVxnZK2Z6iqohanz6o56pY1Ao70wJMkicqOi6aenLMoHh6nVMK
	88HqDqy9+W9Vu+CLnJR8BuaJEWKhKbYIThbUp6+viGgyxnfaR5fV8odhYZ/XuHe59qCzXc1G8/7
	yT4KN1GL21jJlDanQaZ/Syz0jBH+n1VG/aHTR4trEmrMhtjzW6ygy9uTGVGdhsBlUAuFqoaY3OV
	R1CJzHI7x1uiVyba9ZfI4PJk8ZhgOCUy9H5l2JXtKZ8tmhxgjALeCp8VxkFeR43mQNxNhjKb2LX
	0BRzi3l+bHwFxFOErBvY=
X-Google-Smtp-Source: AGHT+IHKgxGk7ctx/4csBqrnqZpUz6mKKVmeIDv4j+S1OVFBpZaUYqHi1No3wJ+Lyfqa9wjViAwAPQ==
X-Received: by 2002:a05:6000:22c7:b0:39a:c9ac:cd3a with SMTP id ffacd0b85a97d-39eaaecbdefmr3169374f8f.51.1744393644804;
        Fri, 11 Apr 2025 10:47:24 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445713sm2624289f8f.85.2025.04.11.10.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:47:24 -0700 (PDT)
Message-ID: <7b5ef003-7a3f-4ffd-b563-b4b7f77ab011@gmail.com>
Date: Fri, 11 Apr 2025 20:47:23 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos2200 compatible
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
 <2025041157-stilt-sculptor-c978@gregkh>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <2025041157-stilt-sculptor-c978@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/11/25 16:42, Greg Kroah-Hartman wrote:
> On Fri, Mar 21, 2025 at 04:48:02PM +0200, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
>> the existing Exynos glue. Update the dt schema to include the
>> samsung,exynos2200-dwusb3 compatible for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
> This doesn't apply to my tree, can you rebase it and resend the series?

Yes, I will rebase this tomorrow because I'm a bit sick right now.

Best regards,
Ivaylo

>
> thanks,
>
> greg k-h

