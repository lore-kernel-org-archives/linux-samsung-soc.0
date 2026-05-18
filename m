Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D673E717A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100048; cv=none; b=ma9hH20iJjlFRb775LdOnCGlXVd7bM5ttZQljbqtr82/jqwvi4rTJFAfIGel74KS9M+R9NN76F2vfrSwDRQZD6YebUVTUwAiMkmCnmCiP2ADcPw0nZ5R8lEk0ZkZ8Q+JcCxWS/tgMSlwLHn3xFVJsZF1/GM55Fby2fP9JzUHSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100048; c=relaxed/simple;
	bh=iV0yJhfhI1iDqjYTPkc7D13ggZb4VKds5NvfVEmjYBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9YQNX6qqAMILqJq5xaY/KNHUeGXReNf6hLcLM7QxIoj7l22O7dkbOKlzhlPlW5uoO+q4TpeE0zjpGQGlmFvIHNDQtSPRCMIOxgM65mtTB98LFa5QjxDeZE9XS3fXPDBSuM/QM8yeMrLcnCxh4JhXx510v8lbrbv+KyUNGNKk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c5cdq4sy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c5cdq4sy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so22821325e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779100035; x=1779704835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=;
        b=c5cdq4sy9zlUVFRdrSi5HsNiGaANx8yG68tDRfyOAOBiVKlX7hHzmI2bKQYJJKQ1vb
         QkP223cR3cw2En/kYzpcZ12PDe5lixCL5MqUOoytp75hje/6IG/+miZgfXHzM//gfWNZ
         nBEbPHkhPlY4lw0G/BXTBuVh8r8syPni7isFNrdyTppyfvreGEyzdLOWo4oj8QS+BoH1
         CNfyn94nVyl7AHkupwwaUHJZbGEKNCUQxo/m1Q7vZ8uLT09Uf5X7XSmHNCD4UDDiktTb
         3ml3lgsqfWfbCtb+PwaAzVgvSYMX6TAFMdHM/asDkOetMSoPhJhRc+LKX5GeTwPlMP3Q
         d3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100035; x=1779704835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=;
        b=RGgO367OKPdC7zXUGWSCi3T48o/fYsfGhIW1tta9wZvGgnsuCZDB2EGEltWwnMCZQv
         You2FLokauC8VyXcundnr3q5PPY4YMAFsVnNsu+UAtJMQf131tkw+Fc5mS9iugZZsSrs
         YjT2bOUBv/Bu/RCvAwWTus7eyENTleGE/QOz7Aw5GWINW7mrHrJl1lmfDnhKF5DpjBD/
         CCIIp/s5oE2/tiyr/e9zsnOK175jIS7OZNF6ee5rwPX/FkiWW3E4pnnxS3RHji2AQ4gt
         cNXYIPjOOX2vJ9etTyO7qruhKAUSiv4COsdI3mwS35cqIUqnVpgixKqHUVp46fmCakt6
         N5Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9nb/4XcQkuN21Rz1KhrhStuy5n4G/FKWRv+f5DGzAq4YHHJ0pw0Tstd5FBlyinNxRsKTwuuq5nXc5SFrDldr0C4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JMAH0lrwBBO651RAy8gwybuomiNCIs99AMlS72ZJ3sE7Qp5S
	GtEA/2WWFfO6c1GNkYUvkz47llTB2ad7A5chkEUCjgWBsjrw/nN1+jZBtM2LwgRUsi0=
X-Gm-Gg: Acq92OExJGrLmyWWW5j8fpd2n9uraFAnhWdM98+6SCLhga4csWHWlIjT/g+VpI5Shm0
	sE27/2Y5QAUb0mNCGrafhLWilVFjOms7OGTotRpjIOTQSef9Xc6N+4UGYHM0auz3oa6HjJhDz/j
	IHX90k6DaSNC61fydz5uor6PCgEew0XCi6QKf1tQ9xxtQGf4GRv5Q4zJC2iJGexVgkGoLSQw5UF
	sD/C2Hrxx2xwuMtEQSUC18+6+IOnv5XEkKtaRL9WYlzK5gEDCT68QNKgK5VMDG8owoGORiK5rZz
	D1bXVZ+i1MxrZDF343EUMsHz1xrT6OqSINtUjAWXVa6QOwP9zDeV5uwnb8EhvPNSBFQJRGEWCNp
	FmA0SetgZ22fZarhZ5Y/EIErgxtCkVCVVbPc+tGmDqS7te7eV9tVzjWMCslyJWZl08WvJosZIgw
	Zdhpr2XwmsJObFwjVqwzrZRg2EhUqeievm3JsLfeRGrA==
X-Received: by 2002:a05:600c:3b07:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48fe651e127mr216677595e9.26.1779100035288;
        Mon, 18 May 2026 03:27:15 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm37898451f8f.23.2026.05.18.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:27:15 -0700 (PDT)
Message-ID: <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
Date: Mon, 18 May 2026 13:27:12 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/13/26 2:12 AM, Alexey Klimov wrote:
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
> 
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation

s/initialisation/initialization 

> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.

The patch looks alright. With what client did you test it, cpufreq?

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> 


