Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C4B20DC3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328649; cv=none; b=kr+I7WiJfCFSYflzK+qOldNIsAz5FzRFXkkB5VFONhZuCqHZx1uIp8coK4MdsTYKa1zgXdPyaVtJJ5jsWwnRDHdgvcNf3vOFLaw45qD81/AW0FcW1sQcfwOpx8CZaQjylrm1rEmGKzWcNaN3hWXAQ4U5dyWxH1fzhhNUpB2OfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328649; c=relaxed/simple;
	bh=1Ta70GP1nnD439v+4CJVk9YoHvnLjoNFAemUeQfqtTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkgvXdwQq12r+Jwd0ts7tfEgBzyghP2wFYRxR7VkeleNZ9VoutUbPt8FJFL/uYrBpE6prC20dHjf0JqxkX/cZsE+DkTOwRWJKfyWU2a+d8/yeBMXO0H0EvPWONorZ7wnDknY6tSTHpAEYSa65znlXjSNWCk5IJSwOIbc6VCDHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDO6ltCB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDO6ltCB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41263dbdfeaso6739515e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 23:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708328645; x=1708933445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmUCMf+Jzxua4LuTLILa/z8mk2QQ1R6z63zWnqrV0v4=;
        b=JDO6ltCBeqk+5vdA0yIB86wUkZpAlL/vYUWN7BuGI+ox4tn4PNbr42qMSxHdJy+Tsa
         y61NyHIfiFo59KJcSVSraad7QZhuxA37MLwvzx5onvIat2U6MMT88c8m/+7S040JFc/C
         YbX5vScIHNa6nxuQ85spAWz1EWjVR7OAk8uv/yKxVbtuKCIbAEdc/ZCYc+fpY8HQ639I
         AfRgsJV5oa9AI7x3HfG7y8aEHzu2J9vnAMbM+xCTpvjgdZupjAMH3oCdIGKdSvWFf1z8
         XqV/9AcWH8BJN+75tvyZBN0XtodzT+zBIIDEmsIzpQi1vmrfJ2RREo6hT173Cvg1f3M0
         en+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328645; x=1708933445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmUCMf+Jzxua4LuTLILa/z8mk2QQ1R6z63zWnqrV0v4=;
        b=NQz5JnoOGk0WAbPdC2nmBPaFeFLKJQzXkBzetaa8TWxZzKeImesvmZikRqatmLgd0b
         g5RcV5EBq7CvUPD2r1qDbqzcpliXFVDtdhWOg4xGQMBC/BSPcVUqgjqegYMWXGTmczx/
         8mHFPVzEDAd/s+1X8kmCpwBJNQ2fFL7ltVXwaXYs/FLGwkdI5CqKjarsPSRGlDNuhBVk
         igAwLhRK1vTErLFV5A+U+U0zqKpXmMttSmC16CWbEs6mxuSXx0JgkcRrgjPj64c0EmpM
         RD401hBZ+hbSB1Ux4Lp8RdgDJtbHKKSo1lzWkjKSrb1wN+wpwBWzhmilMDWL8eCFBBKE
         eQXw==
X-Forwarded-Encrypted: i=1; AJvYcCVa5yJycUtByQMcv8W7oC5eoGvOLxWkEAuE6+nFdBRa7+tdOZun0BzIxrxe6fr5ODFJuPR86CpfRVuBCrHud0v6dTaK5s5S2pD+5pZGnySnUag=
X-Gm-Message-State: AOJu0YzBOU2zNwOJKh4iIYOtZU/JV6zGyWolwyGPmYfdnlFxhhxYUOyj
	AbZYutTrZW5OqJi4t6hIUdkHn4PhGzHM2Dy9swqmapqJ4xirwHtu1SNfmsTBsAY=
X-Google-Smtp-Source: AGHT+IFXH7/htO7V0rIHLecmCOqPGVexQMFWZ7eah5AxMfC2qCOJoTYJnm35OwnizDe9PMpGOmNd/w==
X-Received: by 2002:a05:600c:19c7:b0:412:3bff:a813 with SMTP id u7-20020a05600c19c700b004123bffa813mr6107513wmq.10.1708328645575;
        Sun, 18 Feb 2024 23:44:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b004126170a23csm4501357wmo.7.2024.02.18.23.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:44:05 -0800 (PST)
Message-ID: <15ab6aa6-fb30-4970-9c50-546afb933e03@linaro.org>
Date: Mon, 19 Feb 2024 08:44:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: exynos4212-tab3: limit usable memory range
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2024 20:02, Artur Weber wrote:
> The stock bootloader on the Samsung Galaxy Tab 3 8.0 provides an
> incorrect available memory range over ATAG_MEM. Limit the usable
> memory in the DTS to prevent it from doing so, without having to
> disable ATAG support.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> index e5254e32aa8f..9bc05961577d 100644
> --- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> @@ -45,6 +45,12 @@ chosen {
>  		/* Default S-BOOT bootloader loads initramfs here */
>  		linux,initrd-start = <0x42000000>;
>  		linux,initrd-end = <0x42800000>;
> +
> +		/*
> +		 * Stock bootloader provides incorrect memory size in ATAG_MEM;
> +		 * override it here
> +		 */
> +		linux,usable-memory-range = <0x40000000 0x3fc00000>;

Applied and dropped:
 chosen: linux,usable-memory-range:0: [4611686019496935424] is too short

Does not look you tested the bindings.

Please observe that we have dedicated subsystem profile since a release:
https://www.kernel.org/doc/html/latest/process/maintainers.html#arm-samsung-s3c-s5p-and-exynos-arm-architectures

Best regards,
Krzysztof

