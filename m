Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30C21D5B3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572913; cv=none; b=kS9bq2j0q8xcB3yZb2g5IXyK6OOfnAOW2M6L9lE8vjy3sobF9DnHHhQh5qlOavvqqwFU7wtZOEqT/7ZC1i4dGopLr6IPHnyHgbqG8oRIo4Zb0MTzEor35RUnMXANxYtEpaYcKX5rZtHn5rHlPr5rC3Vzc+QaMplm+aTpBdQd8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572913; c=relaxed/simple;
	bh=+Cc4XgcuRnFG3ImbtI2i0gsz68YEAnCa9wPNZnl32VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzGHnpeu0x944/TjFfr9KrEUnDf5JoBBzTXvJyGe/TGn+qWqVnrBe6NTElFy201troaZRCDVT1Zyk14KMzGUnvRcTLBQfG/51zkFNt9PpgmuPzWDS3WQ04WrFIToa6IASiLM8ArH1yNM/HnYhNNHcsn4wOf+e6MJJ6LDysGg474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaXMq+RT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaXMq+RT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so2525586a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745572909; x=1746177709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=LaXMq+RTre51+C41fw0TjupVjQB99fe5H4CUP/5fwpXlMg+Nlq3UV+RxTk/k9f6mel
         pkUnLL8MrBbE8CGlaHhIgApubipKUmIURhgEU/V2bfksoFgbud3E6FwZ4zk0Waq4TjzN
         Jq4UqvBL0mWJYtadQR2ycny4ROgOUQTXzsaXEPbc5WPg52C02V2pmk5C6paqVLL5Z04O
         eUsY1gKhiKGKrOB8NIUi5y4vhZ7/BeIk89STEKw9XGbg7hJPB2PPPrk0/+g+WGAa5FkM
         q3ceHI6Wi17eJfqJ+9MT4RmPEJ4VpeOhLP4vG49bCHowIVAXZWWR9tOvSMt4NV1QYZrg
         lTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572909; x=1746177709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex7ttFFeolAsCiQiimZfezkN5TbzPUbUsFH3429aqKY=;
        b=Cifs6Jnzqyvr4+hS1CNjPzLIYV2Y6mnxXZS2gUsIOOkoBuhH5dAPs1yQRC6cbl+4Mh
         bSUvOb9p+gpUelOqoaaa+AWYP4rUZ7yBHU2HYoTU2Wx4QK7imbDQv97r9T1CSf0iMj6x
         IbWwj4wP6BXJSWxZtMlDVj99TZ6zguZ3hm8Aw889ZjUiVrOkhxTevUVFho+u0fcKpKZA
         BX8sJqGOuZ9FeyAMnG+mJZW1zuzsRxYguuYZO38nYBeDL+/qoXssSuikNtTEn9L8kCOC
         7He08h7M0RyG3e1imweve4rYnP+EJMAC5uWISxkumDlQvyLqvfDA5Zorb7HACMOBw1YC
         +7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXLjX2tn98+13TF+x66wD7o8zRje5h+JV5zMAn4j7JEcXQmmjk1VgcCUFhd8rB0+cfw2ufdjP0TlTJHQlHAlLy3rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrA6ISkcQGg+AlR1SYL0eBoDTy2CTKBkJO5Fw2fhUGfabvJT/9
	uBhN+uWyIv5366S8i1nTFvYhABNvBBJG3/ynl2joe9obnOU9sX78axu3vleI+oTC7vDiPpdSGbk
	c
X-Gm-Gg: ASbGnctRyfcvCz7psrRwX+nXZmy+2fU3i4LUzvDjim9Vw11ZhTyih5RlnNHBa/pA09v
	0Z9ex4E+L8cgsdxXsi8Ko0dUc/fdIbvS55MSpNvowQrDGFu0JXftuE6rsNBivnC+k2/lh+sEvKe
	5HTpkXftmnI0avNxa21GJXB82UqBdYBup9Y/AmjcJwymF0j4KnU9ntPJ5k4xjljaCYTOJxsusH8
	EzDEnYB4E1Vl0ZxPA6QxKdzT79jcJmycPTn6sER7cJsp7a1lAFDKaRDc/oLL0mv/mW4mkbu6XkR
	Tmdm3vKkS3wE7mYKfmEmsYZ0Cg7ZAIgZooYlcmgY61CwHefJqw==
X-Google-Smtp-Source: AGHT+IHN1tq8lZGPw+yObmv5OBFBiAlAdlprz4LzswEniu88fbB371A57pfYn5r7p7hN7qREYYhCSA==
X-Received: by 2002:a17:907:9721:b0:aca:d5e9:9ce with SMTP id a640c23a62f3a-ace71047947mr108851466b.9.1745572908825;
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e726dsm105543966b.40.2025.04.25.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:21:48 -0700 (PDT)
Message-ID: <8b222d93-927a-4685-a44c-bdd5d7b34c74@linaro.org>
Date: Fri, 25 Apr 2025 10:21:46 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use typical
 np argument name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/24/25 9:33 PM, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> While touching the lines, change the name of device_node pointer to
> 'np' to match convention.
> 
> Fixes: a8dc26a0ec43 ("firmware: exynos-acpm: introduce devm_acpm_get_by_node()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

thanks!
