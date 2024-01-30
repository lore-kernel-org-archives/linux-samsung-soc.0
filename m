Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF458133
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605220; cv=none; b=taq9yHtMepBGa5fruXQ4+uE00HkUfeVr9h+N/Xn8XrvDt+OIoD8Wvnw9FLFxDdmtbHEWtOhq931xq/x4BnS7lfvKwSToZHOSw2anX6bIRjyt5CxQd1YF3voiG6ns3WJs/s7je341hW1qHMSx+STjvksYswfr42q/6nwzyohM6Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605220; c=relaxed/simple;
	bh=TchTJhuSnN3V+faXCv1nvr5qgtMhSTqDaiAafcwJDhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du9eM5KwZCexJSrH1QqPoxeo8/sPmyEM0GFpAxQWRMs3rJ1p8epwnxvoz74h0ihWgNfqMJUplLAtpidqNEgHW4Kgz6nLsa1sCaOPc3yJ6DCdUqNJ49ELA4bk+vnoGEa+yg5sSTy3Niv4ksgJ65pduleZoOirSyF6rZrVgEk0Muw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TiXxLxYk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiXxLxYk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so3814023a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706605217; x=1707210017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhL/RwrrrFuTkcUoehGkisCUcv3sHGalEb7hpgS14ag=;
        b=TiXxLxYkv+wJ56ZJwGfudT2zlmAAyZPArI8inwVFZsVyhC2/8LN4bYJRh7bG8FhdBV
         8JA2s+nLvyfqiPkA4D7j0TebZ0/3dTftX8MKeZEG6L2LIyVU67qq5gTlCup3NHQg53Sd
         eEmvLGtsYajymGbkzgqBuZwLBW3P2BVjHxn1fIpey2F84Izixuj50AvufN8AlqmYt9n2
         LUhII0VrVObXeRlWSR92/kh0DA0s1+0evWiMoOQMkNtxt723Xc7k8KJ87nD9DWUVS/47
         xNuQ7pYU9hJRYCdPS+To/IRyf/4pMywpeiLYbbVWsd2Q85TWn9Q7PBMI/1udtY819J65
         4lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605217; x=1707210017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhL/RwrrrFuTkcUoehGkisCUcv3sHGalEb7hpgS14ag=;
        b=kGYYUj4pVycPPv3YBLoC4n9JkQKs1hRLR/FZtVZ0y13JghpAvtZp3/VVEJEDWnPbrn
         BAP0jxl4PcNOohUECQ8XvNpP5Z/oPbQFM0mISVCQP4bfISLRgl/bLx7yWE1CLm2APsXT
         zSE//pP0C3HLtjus8ofgF4Vn2i4vPIpuyr7vfQgeP5YGhmmYZBHft6A6h1M7+BfrXsaL
         U/Ohxvmc5SJJpVGVjtYtmbiqEMK73seXtjnWh3Qe9TSr6Sy8JhkQ6apdaExN+rSi3yCs
         d34hW7v+uT+ID+5xaIdg6FpuQYNIyI0Pwq+LNxIfAphNxOkGHD1hXkfI1UvtssMUW4bA
         rpxQ==
X-Gm-Message-State: AOJu0Yz19oTaYBM9wzsZ310WJtPPrdh+JoogOJ50jN6HcrAPs/obGSs+
	YQMRk3LyCvb0JOIOF1/GJA+x49mo1z2Muq9K9GFqm6+/RRi30wydL3uTHK7Ftt4=
X-Google-Smtp-Source: AGHT+IH8GLcfn7u5cLqn55BcZiPw3cv5ghUJUsIBz378REWJfPZ7UgY70S+5auyNl4/KqBplWNJkBA==
X-Received: by 2002:a05:6402:3594:b0:55d:2ecf:eb1b with SMTP id y20-20020a056402359400b0055d2ecfeb1bmr6230846edc.1.1706605217393;
        Tue, 30 Jan 2024 01:00:17 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402195300b0055e96290001sm3700180edz.27.2024.01.30.01.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:00:16 -0800 (PST)
Message-ID: <e434e7da-24ac-4f24-82f4-2ca52b2b5111@linaro.org>
Date: Tue, 30 Jan 2024 09:00:15 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] dt-bindings: samsung: exynos-sysreg: gs101-peric1
 requires a clock
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
 <20240129174703.1175426-5-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240129174703.1175426-5-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/29/24 17:46, André Draszik wrote:
> Otherwise it won't be accessible.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> 
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2: collect Reviewed-by: tags
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 33d837ae4f45..c0c6ce8fc786 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -73,6 +73,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
