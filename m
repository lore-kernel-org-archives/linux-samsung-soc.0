Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56EA2FC52
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736149001; cv=none; b=i1x97NTJ4T9VctdOMHdSKNIlxIfgIOA4JZ6WIjwMqLJlUOY9xA/naU1q+iVpNs7jwFobFeRQ47E0EJPrMi89MmHQwLDNSJU+MYH/1HJNm/q5FG5bxFacD8z+BpIG0phYTiQx4b9phbTQ+sR30ge0Y1fEwV36vx1jjkr5OkwH9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736149001; c=relaxed/simple;
	bh=GJJnKeyq0AyCBYfSfuuFWtq4NCpFzu0b937iGTQC/yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNOO5LbaSTKXdcAQY8ojM44PQ94GBNsZTlint7Q4bck0bcR36O6+KCv1sxwlYOSPH+vPAWsvkeN9P/qBs081sinRb3sD6psCr/Rf3BuEj1VXd/um8W0bViaSJv/uQVkOPG9WyuVcYtOQ9kUPnTIjp+cBmLrH9yiMV5WiuhTNGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h1OeZB2b; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1OeZB2b"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso100331725e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jan 2025 23:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736148998; x=1736753798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuH/NxHgypHXTjjjbglqsSTpq7IdJAHxtTHnjuWbs8w=;
        b=h1OeZB2b3rnPJobtwXyvNNBIE/G+skB9YVld3FJd980fgaVqm+mfdyeuH0xwggRxxf
         /mYC81x4XyiHLZ8CugEOlc34YoHedrOGnlgMuHtHSLEJ5qaz4gaU+1xzxIZ8VwszFxtt
         5f0vLqX3LnM2kPMFBNDU6S37vSBj8RCJnjFNoy1igzPD6x8aDqIp97kt4R3cer9GWwAS
         yPRF9CPmaSwkNJm5+8yo5gGa2EaQk0Ex68tx93PxQKGsGA5FI2Ny5zqfs4qP+vLqaSwF
         9wq/3yTV0FcyEiX/lXDF2pAwUIN3acTNmEfXwm3PnhiYvTV/XU7Y3N0ytD5vRHlONqTI
         lHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736148998; x=1736753798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuH/NxHgypHXTjjjbglqsSTpq7IdJAHxtTHnjuWbs8w=;
        b=g5cPhQeZ+CyyI6r+bCdGjLXSoKT90NPSSUFMombNQqdARWvNeXL/KRDK9WUnL9Z7d7
         nEwfxhrAhxJifmRc/5CWi9fQ+/KRplUN51ACZGnb4ztinZJN+7lSispwlzBrKBGCmoLM
         pZK6rR2E/0Rv396rgRNdXdkhLMtFJPvMTVG9KyY33mNZSRIuHyvMdlvNcrTXlPRMdA0W
         KTs18YApMAnZ7tcLNkkNHY0OBLj+NXw5WCy4VODht4M4UQbN7vZDeG8BoyFXydozHUh5
         BJJSn4G+htqROdB9fqGzIVeClwwdvaJ9QvUTWXs9yVUXGOa/3Lrrgl6egz6YUW6rOETy
         XLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JBppePCRUAVEkk8JOBosUhwN1uvXXuyOHC68CvPPRws0tNKIrQ6f2pFnELlXglFe/tuvfQFlwP+MMKlA5wZFgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynxyH5npuW6lz379R6XSXcamvH6FyRsIWhp+QmzUI1QL5VHU6e
	DWYsO33GZm5lX0zz+smlwTgOxIqjcGKlQIqKspFxRpzHKwnTcMj0J89M+jCSR00=
X-Gm-Gg: ASbGnctMXkjWT1TXcTfzT1tzw/cQWSqgVLOEVRXClQ/XqxvyFXxFhHpcD8CQ/xmRUTM
	CmOS2inFTWXUNkCcbC5opnuKv6rdn9er2H5kgm4yPbyY0xJqNI7klpQ8SYO1AD6PzHXcwO2DMQW
	FmbT45WvoA9FZnXN6OJtVelk5LuFJt/yTzkClY6hgOMz0BI0BHPYDF3GhshpwXA9BnnJL8wwWt1
	7y2gyDuVuK0vj36C/yPmwJ2iDdtn7RUD/+Cr5It2cBxe/VABnaZZWSxEuoFFuCG
X-Google-Smtp-Source: AGHT+IFQI0rLosE0iSZMKHi92uLdrnY3vwPRxWC4Uk5UIaHJ/DUMhfH+TpjawDUP/rxJQinNEwLVnw==
X-Received: by 2002:a05:600c:1549:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-43668b78cd4mr451383175e9.27.1736148998319;
        Sun, 05 Jan 2025 23:36:38 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm560190565e9.38.2025.01.05.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:36:37 -0800 (PST)
Message-ID: <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
Date: Mon, 6 Jan 2025 07:36:36 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hiya,

On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
> +#define USI_MODE_NONE		0
> +#define USI_MODE_UART		1
> +#define USI_MODE_SPI		2
> +#define USI_MODE_I2C		3

USI_CONFIG register refers to the protocol selection with USI_I2C,
USI_SPI, USI_UART. How about getting rid of the MODE from the name?

Cheers,
ta
