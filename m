Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26CF17BB35;
	Sun, 16 Feb 2025 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698040; cv=none; b=Vp+GVUguPjLfaJxD37Jo9IQfjKvqxIlkxgxSmlQ8hY720mNx+obKxstWf8kJLNKkMMjyjJukR1yFc+PCpFdW8eC8G87u1kW7Xi11WLB3iE3ba3szchttTjKsLVhFMDmzjUUlrxeObB9WXyCG0w0bbn7lMIMhZZICMLbRZG0oTb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698040; c=relaxed/simple;
	bh=OukKaNU4mSVHReLc77MbcH8UQUtvvch03TNasNa5sDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1aLEjam3SVkkQvtnXHxwDi8wqKisOul6V02d1Uj4vQAij7s3ONz46lin5VrWFSW1LktiSWfZLEJws6rMF3QzyO6ESbKI+uBMKfmOmGkJ0H1nRapx+LVasil3mLUvko6v9KPM689tRGaSv6nrxR4IW07uCuynIPS6VzK0CC8T6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LA+/+M9P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LA+/+M9P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so20932275e9.2;
        Sun, 16 Feb 2025 01:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739698036; x=1740302836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0gaj4zFmFQRT8VU9mqYTsdQ0LPAUbckcaSOB8q/pi8=;
        b=LA+/+M9PgovQIf6UUzDKIaSrpEpXQsyTEo3+MiNgprrgk58oWTpOsx43du3/rKRzGj
         HuZCarAGlZ5ifYgAnRBmmusPJwK3JQ6BoBaDCUiea9MEaCf9s84DY4FE/CIlcM5+WZgZ
         JcfC3VeTFyUaI2To3PJC3v64jDniJNJLW6aV2vL02wZt2l8CQWQGe5biGErtYDkqAQWy
         e9AAmMv4r+axhvBu1ZRx3GIdVj6ogBSnL/rf8ZpwRFeBQjdCdSLjKfUQllap4ydOTSe3
         vl2Xz41h7K//DfTX1tvyhzBNl4vK35RrCyTa0JrBV0VWJsi/YG1smzYngk+8ZRKn7Jwl
         aJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739698036; x=1740302836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0gaj4zFmFQRT8VU9mqYTsdQ0LPAUbckcaSOB8q/pi8=;
        b=bbEOhXXH43MbSc47C5hRmkoPQv5YiSb248C8V2i1nfOak0JtIbV0yXnLlARdl/UEPB
         7a5fhDTbAdQoGBuZ/JJG9ASNFnPsShxj2pJCkcxszu3Y1i6j1eSNVCFGsaMHXn2HUajp
         LRWsxyyzHtuc34cR83fJg7O8INl6K1FH5znEBQbebAZnaqIsoCWuSBlHIHauYHEaxCD/
         vbSXZyDHNNXS2Fo1c1tBqDnGsbgXTDd/5JfFKha8ZRx+z05CO0dn/G1d0NvYIdA5bqua
         ADZ7bBjZ23bYbilLw2MHVPMcCkJjiZikjlfvpzNexQkUnePLkDdZ2rwEM7U7vY7lKPap
         w9qA==
X-Forwarded-Encrypted: i=1; AJvYcCU7JibfeYvOgdpFr/KdnQr/5/DGf4y68n5kuCOvLP/XT9Yvk9O9L/U35DySl7ktbLrSNXr8p4v6708G@vger.kernel.org, AJvYcCVwIfEqGwMeisdH30M4OPnHlzeg1RU9p/189gtP1nEN3aYrNJJFxYXLUbVHWRUAnMOJkTfhtxI+k4zrTKpviEW2LdQ=@vger.kernel.org, AJvYcCWqynsday6j/Sri0C3whuielAj7+1h9qkSdBi7lqlffEZPRX57KTXBJyuYPx/jpCQdmamKxcJ+Mcv+Vbsk/@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPT1gF7t09F4MdV7Smf0Uni9X1MB0HOS4iCEdROVJArSkJsRi
	QppCT7rrUaJMaVs5Ogkh6DXlzux/JMMIArNk31SIs67CWSHI3mC8
X-Gm-Gg: ASbGnctbMoNLw6Rt+Eyj+yCW0cEIyt8wLVkyRC8i83b6cRnAEdzFewwLxKqJSP8+5Ck
	vatYDyEzzxSDPxmrZ9ncxWPIldFFzPsIqRD9ESX4SQcae9zybREtoMQerXaIxCIQLtMYxnvI6Oy
	093+Sz27XTVZme436Mp55mak8ihCRqWJ9Sn1eV86djM+25qvPozGk++DY6Ws01XaZHoOte/XaMO
	hLIlGWM6luwhsY+ZnZNnfEkxFsDh4lM20UVJfFfctyzRUnd+gMWx0HWyItdmcTyecW9UiYyraSl
	o0mOZGEiJUL7mfDeWCI6PgYwOfSIVD5j9PFdNmsDM73R+g+jJ2HwonHreZnRElgB4Lzxjg==
X-Google-Smtp-Source: AGHT+IGChB1ddnC4aM/OIgP03GHT5PFBE/8ehdZ4vVVfa86O0qNjRbrFBXkT8twRRnRfn5eolhea5g==
X-Received: by 2002:a5d:64cd:0:b0:38f:295e:6331 with SMTP id ffacd0b85a97d-38f33f3d70dmr6112437f8f.19.1739698035732;
        Sun, 16 Feb 2025 01:27:15 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258eb141sm9037282f8f.41.2025.02.16.01.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:27:15 -0800 (PST)
Message-ID: <9c23e529-92ac-408f-a7e5-7cb7beda35b6@gmail.com>
Date: Sun, 16 Feb 2025 11:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
 <D7TR7VP9UPQA.2U5BL328HNSXU@cknow.org>
 <fc860290-c5e5-4193-a8b7-a53137dd4155@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <fc860290-c5e5-4193-a8b7-a53137dd4155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 11:22, Krzysztof Kozlowski wrote:
> On 16/02/2025 10:14, Diederik de Haas wrote:
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/samsung,exynos2200.h>
>>> +
>>> +    usb_hsphy: phy@10ab0000 {
>>> +        compatible = "samsung,exynos2200-snps-eusb2-phy";
>>> +        reg = <0 0x10ab0000 0 0x10000>;
>>> +        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
>>> +                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
>>> +                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
>>> +        clock-names = "ref", "apb", "ctrl";
>>> +        #phy-cells = <0>;
>>> +        phys = <&usbcon_phy>;
>>> +    };
>> Shouldn't the example have at least all the *required* properties?
>> Same for patch 2 of this series.
>
> Yeah, this wasn't ever tested.

Device trees were tested with dtbs_check W=1 but I overlooked testing bindings
with dt_bindings_check. Anyways this is rather a small problem, will be fixed
in a v2.

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof

