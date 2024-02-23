Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678611C84
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Feb 2024 05:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708666642; cv=none; b=rK0c56ZQ5RCBdnmm+axLOysZS34TTFYcFjqd0ceX+v/r7UH1MxIP+MoOFwE2v167PagGUBikxhmMsM3KQKcidXq/DBopWmiNP9XAP54V0ZEIO5dQwqjiAeGzpah6ZsV/iZz2GRiUDEmxXMCLmQA9FNetfZrgw+u6ZPnU7L5tB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708666642; c=relaxed/simple;
	bh=pwC8vXe2BEi1HayfXlFAjE1clRdM+GtLEtZzzi5L3ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FV0D6eWGfONttISQiTJMKeR30d8AKc4C/0A3z8Bhkehe8eNS9Hlb7WlStpFHW1IjcsigUKV5/+qE8PPgjUdWH3nfna9h4JRevj1HoVaj+q0quR7CGm/6M2IPEOtFh8WXP+2HuCt833vHY05deHz3HbOnuCm+rHYs/qnAx2+syhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axldeQhc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axldeQhc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so544525a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708666639; x=1709271439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIjIrdX9a/D0bdP757W9xJG0ACMGs6E8sBOLS8lO3g0=;
        b=axldeQhcVjNNYQBYR9nxXZrGYuLtATUJBaiJsVwdK4zH3b0jisD0gJ0iEPzdIs7ELD
         XT9PaEhQxYxdeiR6plOThQPskBCHtkIy3z8jqbBc/NoKtkvAcA3Xth/GH++3nospiL/y
         CNhthpe8+m2Uw0VIsu9F6dx0176hsLg4gQcKSThLZ6+b24mxqd98dveWkllWdff7GgXP
         ucpnHyKahUotliUFcQREpEzYqgNJMkW6e0e1obluq+eBixdBDQsTfKkodKeOSXFQpBWq
         IMWoRdyheaW6P9xqxYe98FjFTW+kDUT2+IgzjSrc1rM2ALaK6HXqi9LnDdTxF/ulCFf3
         i5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708666639; x=1709271439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIjIrdX9a/D0bdP757W9xJG0ACMGs6E8sBOLS8lO3g0=;
        b=OHr/uXhQYld6O67EB9NJmU05caUzKDC8xdkZoxoj4PXK0d2x7Pi2CkKpkHdlvgSTWx
         nODHx7KP/tSX4iGRmOUg/WxQid29VZ3iVn8GENiymHHosDbHQWrzz/Nngx/NpHoiWbz8
         WiCLOz5167uTut3Ka6IEkcKbg8MZTvVL6r2ocRejgvzI4aP22BV2BMa15cz7DC6teJJW
         ypzlQoqyOAGIb5LwGF8Kvkjsm3Lt4Kt1M6pNwWoeXcBv/ElgrKk7vcG7q1t/WihFFyIk
         3Wn87SClXhFY1as5XfCZxvrhDWKKelcXK1o8O9x+gQBQ4gp6d457XSB/sl4vRlwt5sRR
         uOCA==
X-Forwarded-Encrypted: i=1; AJvYcCVBnLH0tUTJeec6gp2QAAxGoBIJUd/NtDyEKoLuE0V+ifFz9gFzYnEGAJCONCz0vfTyUPrZCKqVCkf3oVN35EkVBCr0WEh+LRxwJwBtNOGk7bI=
X-Gm-Message-State: AOJu0YzyCWN0jXTiUzDLomeTVJflTMn6JPJ27WukNsUDP8jIwr9iqbhl
	Um6gHRo4YEd7bAUWW5ySSf6K95dFusdYeJ6xF7SZ5/x3+uBRz/cK23zT8gVcShU=
X-Google-Smtp-Source: AGHT+IHp9u8FcNkO7Rs60RgvxCzXLWbsMKeEEJK3FbSEtsuAsk96erfXlX+cVzs0qQgntOe2IKaKhw==
X-Received: by 2002:a17:906:e0c:b0:a3f:9df3:2a4f with SMTP id l12-20020a1709060e0c00b00a3f9df32a4fmr469558eji.9.1708666638805;
        Thu, 22 Feb 2024 21:37:18 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id li14-20020a170907198e00b00a3fc82c49afsm203202ejc.215.2024.02.22.21.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 21:37:18 -0800 (PST)
Message-ID: <115e1e9f-2067-41f4-8642-43e9d6819798@linaro.org>
Date: Fri, 23 Feb 2024 05:37:15 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ARM: dts: samsung: specify the SPI FIFO depth
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: alim.akhtar@samsung.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, andi.shyti@kernel.org,
 semen.protsenko@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, andre.draszik@linaro.org, peter.griffin@linaro.org
References: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
 <be85edb1-4f65-4b5e-a137-76e4e92d8fe4@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <be85edb1-4f65-4b5e-a137-76e4e92d8fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/22/24 08:49, Krzysztof Kozlowski wrote:
> On 16/02/2024 15:04, Tudor Ambarus wrote:
>> Bindings patch sent but not yet integrated:
>> https://lore.kernel.org/linux-spi/20240216070555.2483977-2-tudor.ambarus@linaro.org/
> 
> I still wait for bindings to be applied. This means it might be too late
> to apply it for this cycle. Just letting you know, that I did not forget
> about this patchset.
> 

Thanks, Krzysztof, no worries. I'll reply here once Mark queues the
bindings.

Cheers,
ta
