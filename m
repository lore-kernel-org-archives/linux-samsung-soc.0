Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4513C66F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711464515; cv=none; b=UUElx6CyYbwkA2m+Oe5UvUZZLF1yhiZs+lbcLaiLgtlYOphZtyO3XfL8K6Qk/1NQ1xH0ibB8Bgk0Q/thgmZZ1yobmdufpqQc1srPmC6VFb7IicWAcT3ssT+dil81vppG7wrdpAxb/zmQD0LpjrY+FSBo8kp6VNecAktabRr6A1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711464515; c=relaxed/simple;
	bh=nyOnMNk/fH+jvwDYAQaMxqpFfYbqHXAsFTWb8/syMtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbhfkYmpMkcJgSp2dDis+6a8Dd9dLg/m2XaV3aJQZgqHgvhrI99zysQ8KTUB9babVPZto1SMbu+EBgYoAxUpPPEfPxdWMmrp+CEMOkmFiH2ZYv/QCmB2NnNkuPOdTTyzFEVlZerJINwRgBHOZPJeUqvzMP2Z0Ybl/CJM4kRjyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNus6lVf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNus6lVf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46f0da1b4fso716889666b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711464511; x=1712069311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOCj3XrpHETGc+HuQ9wDIhJINMgt8oBfNRGdhrPmFYQ=;
        b=eNus6lVfepjSGyrb1BtBtqvM/DPY4sigiqjLc3Lx9W8Mf2vLRUIqf5IM+y0jaWwRfz
         E4T0Bvd8HweyWt0Jtjorq6NfSAlw7RxxY/h/xpHGkWZthGtcK/wN8S5KQUYrCC1tj5y7
         mLj2fHefrsbxWb+UdJw7qTO1E8c43pp9FV2oe8yIRrf+gbTZyCs2kbgvPf0EtJdGF+aW
         2LRCMQk7ZRTOVpeDZ8YMemazTdVdRxy0ZSI7ExJYC63UwpEEjVgVsRW4plFn9fApl3b6
         UXLepsqLA72U1wxZl1OAVvzzzLvsjdkXphBEHb1zO8appWplaCn/rGtPMTcvtUpFdKRw
         n/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711464511; x=1712069311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOCj3XrpHETGc+HuQ9wDIhJINMgt8oBfNRGdhrPmFYQ=;
        b=PlDbhHC5OhBze2uEprJflXmFxym/UGNu+C6ovKjJm2c5Y3H5oPuWEroJAA7NtX5EcJ
         9VHxPxk5CisisqOcSDuQbtt9GjBib/b/2QBS6RJSSZh3E7yPT/ZM3pFDXp422f8Rl/+H
         qW/nG5ZeLTpOxindJebRx9aKmrgFZzg4ceb87LSNSRKY/Ru3ZA9FPoDt40ZCfvdNI0jN
         lPfnvear8RGLIr8KAl22Bvg8FGE5ddXngjJr5PcjqfcY0j5XBU3rZLRnW9oVuX8KvQ8g
         MA1U6xS2YBs7sZw9GUK5RtdtIjqnlEVREmSKRmDE2F0eH9y0gNJQV1HiDPXMaXIit49z
         OBvg==
X-Forwarded-Encrypted: i=1; AJvYcCV2jTOfnRnlLrkpBF9NUme38IvG8FsPt/03yanwWM3p4GG33Ohnnu5GfvDNUpPvLO/NC7wLwTgAYCofGP7Cmg5vVjfDaHyK9gRDZNbymVBdZtc=
X-Gm-Message-State: AOJu0YwSeHNv16/D+//q7qdsoqyjiJLlH8ThaExmMfuEZ369VOOzxSPW
	8PhPN91duxZd9xUI/9qacKdOhAYebc1LPCVXVBoA7riSFT3zgE49H0LroOY4oVQ=
X-Google-Smtp-Source: AGHT+IEn3F4qFSE2zRXD6YJGP/lgKIuAi+CKEx91s3sQzsBeykwMumuQvgV5xJhAddsJ/SVpuQ7/BQ==
X-Received: by 2002:a17:906:528c:b0:a46:5d40:eb97 with SMTP id c12-20020a170906528c00b00a465d40eb97mr6690728ejm.70.1711464511632;
        Tue, 26 Mar 2024 07:48:31 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.252])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170906e95800b00a49856ae93asm2547723ejb.198.2024.03.26.07.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 07:48:31 -0700 (PDT)
Message-ID: <454b88d5-885d-4933-ae49-46eaee99d75d@linaro.org>
Date: Tue, 26 Mar 2024 14:48:29 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: join lines close to 80
 chars
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
References: <20240326103620.298298-1-tudor.ambarus@linaro.org>
 <CGME20240326103631epcas5p37bc95c57becdeb63b0d8b01ffc6606fb@epcas5p3.samsung.com>
 <20240326103620.298298-4-tudor.ambarus@linaro.org>
 <001801da7f6e$40545650$c0fd02f0$@samsung.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <001801da7f6e$40545650$c0fd02f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/26/24 11:10, Alim Akhtar wrote:
> Hi Tudor

Hi, Alim!
> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Tuesday, March 26, 2024 4:06 PM
>> To: peter.griffin@linaro.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org
>> Cc: alim.akhtar@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; andre.draszik@linaro.org;
>> willmcvicker@google.com; kernel-team@android.com; Tudor Ambarus
>> <tudor.ambarus@linaro.org>
>> Subject: [PATCH v2 3/4] arm64: dts: exynos: gs101: join lines close to 80
> chars
>>
>> These lines fit 81 characters, which is pretty close to 80.
>> Join the lines.
>>
> Does this breaks checkpatch flow?

./scripts/checkpatch --strict does not complain
> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
> For better readability, this looks good.
> 
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thank you for reviewing the series!

Cheers,
ta
