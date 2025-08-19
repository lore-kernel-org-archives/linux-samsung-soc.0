Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA326ACB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597608; cv=none; b=pq089osjfuUpNftaqIRMYtjNQFYd8vlEMmTBZiPS3fefAyEXurr+CZLudamMyucbmjFliB8IX6aLbAFIqCIDuxKwRahOUWnfclK4iVlXhbclffRi7HKAWEdgtyyDWDJX9lLROn2XwAM312StEifMq/xnniCU/gzhyb9vsr8xdfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597608; c=relaxed/simple;
	bh=jzGnOmF7Sk4LwrNAoupPd1iop6vJLnCtHUZ3GO0ffG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A0cNV2Lx41ewiUyqZVzG/ydroLBQSiha52Cb89LUxt07zv9bjv+skGF3kvTUoz5pgsUHYHD1pJX86amFczEc9CbvI+Lf2XrStFX0tp4iuouCJGvJycSvSqUziy85TQFzogBMCScIWiD03JnMk/YwcAu06mG/xYl41OeHqGnf96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdIooph2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdIooph2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so679965666b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 03:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597604; x=1756202404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjBR+kR0t8TJ8QuirCE4bg/F9pyLOUYw+FF6LSil2u8=;
        b=kdIooph2lqV0R4lJaAqUiRFto8KCbnHqUdqUc0UsKxtdmiVsbC39n6LkEaPrCqE90n
         OOacvCpM3z/Rw7dM37qltNglAAiOkGUgSVwnvkznYBsJaIV86sD8Hpu1zuixCRq4YK8S
         yZTjXVKlM1p3Rvf5xALrsyi5nF/Bi32snAOcQAGrPObj3tFC21T9OtG+cwxHbWYmhgVB
         WDv7gkVBlbKgo5PTQVyU5rbM/Dh88Ph0ubSBbLVD74Pjl/zHcY0Pfgss3c1xphH6aEml
         fU2IhvzAmqz+g1qB8FZBplSEbrG+iikKuLDrIou+LJIK3e7by/2XlJxWnxPURnWYtnrm
         5wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597604; x=1756202404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjBR+kR0t8TJ8QuirCE4bg/F9pyLOUYw+FF6LSil2u8=;
        b=bNc2SsLAvmHA2NsCr4ohAphgvCK9xin9dKVnBWEXmQ20Bm9UV41eV4FAd0et6T01dg
         0FNORqbL5Zb6VUOtfQMVYWn+nL7HXUxqEWAoz1WkENXmtKKDwtrNDra0MdiBVQ1o9JSP
         kDFZxC8vTV0PSjjUY8jHaz0BsiRxDMvVdG1nU4beJtocWxC/5Ikmc6DImSrSE3zRGPaf
         /rf9uNxbgZhU9VdyO5Y+3hGwRgeHl0UF51ZI6YN49uBhfuoE1V8rFMLLOq1t4HZywYaj
         unAnnexsZjVdgQCRmkM1KtoxuNjTDbatnhv+E64ekx4FIJCxQ/nS+ZCPkklYcoxsm4Mq
         d/DA==
X-Forwarded-Encrypted: i=1; AJvYcCW4KzJv6aEW2p3IcesGl/isB/HPiMlU3J4UKQ+ratXAX9BI4EmEBPVisrmLcDF694ZZ8GWZI18zL8ouDlqi5TptlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFDWnBILUzqnn14jvst3np/U2Q30xru7S95JgD37fda/0WXx7
	V8PegBTrTIe9La1XVzx5o1R/aojayM59LM2hfa0fpi9KJHrP6fJq+JJAv7BVrXhP6P0=
X-Gm-Gg: ASbGnctkX1LMZ2GG0i4jIKa0DO+svmzPrSBqn2Yc307OVaMK23SuPa5sQ5HiaMHG07K
	C7EQSAAzqXa5axCcB3RLorjhMq9kkwTdYAs5On9k8hwPUkL8bH5N32HM99DXGdvoD3wED79+F9d
	rDjpwaJ4BEcQp73jrC8aFj/nQwuoBs5CIx+hezcbxlgoDNg7IIamV5YM39sneGyHXbYm4MQnMei
	uTOJPYPpdqEo3sH13INF5MI2JByJsBSR2ZMx5iCkD7U25h5gOobu6uGr7V5PAHQIbsd4Bk8ygse
	tzQxehq0tXJJu9Tu45Kanlvj1zxxNF+glA8WIRJMvCq3L6oC7L2r/szTVVE6SQ/V+XEgqLsX9dR
	mgx5RD2+a4XRpHH13cGTrCmRbLnPCo7cLs+DqNdjWdBzA
X-Google-Smtp-Source: AGHT+IFPRArZTdTP+NLIy/Vie9G8nvUNWq182V7aJXvkqOBztXScKlilBZHnaP0cP/Vv2uPVCLOzAQ==
X-Received: by 2002:a17:907:3f1b:b0:af9:a4de:f092 with SMTP id a640c23a62f3a-afddd1caabcmr172982166b.55.1755597604424;
        Tue, 19 Aug 2025 03:00:04 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm977812366b.67.2025.08.19.03.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:00:03 -0700 (PDT)
Message-ID: <e55326b7-7f52-4497-897b-32d67f522cd5@linaro.org>
Date: Tue, 19 Aug 2025 11:00:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] spi: s3c64xx: Remove the use of dev_err_probe()
To: Xichao Zhao <zhao.xichao@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "open list:SAMSUNG SPI DRIVERS" <linux-spi@vger.kernel.org>,
 "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
 <20250819092044.549464-7-zhao.xichao@vivo.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250819092044.549464-7-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/19/25 10:20 AM, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value instead.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/spi/spi-s3c64xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index b1567243ae19..3a00f9e480c5 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1268,8 +1268,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
>  
>  	host = devm_spi_alloc_host(&pdev->dev, sizeof(*sdd));
>  	if (!host)
> -		return dev_err_probe(&pdev->dev, -ENOMEM,
> -				     "Unable to allocate SPI Host\n");
> +		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, host);
>  

