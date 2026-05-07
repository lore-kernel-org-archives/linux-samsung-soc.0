Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FE370D49
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142708; cv=none; b=fOFEa6+Y13GJicE+Uw2uTuSaLZpwno7Ik8AeBFZnhb/sCbOg1caD4tGQ4fI75t4CRYvX0inzE5fj+w6nVQePLhe86euYhvaeu4Dw8PQ5Wggxp2axywAn71jLiJ/3KxmDbgqS1PTRnh6L3SIpte8olRXBQq9SmNzG3wIu4RgL3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142708; c=relaxed/simple;
	bh=HY2FFHE79eV+IA11Pb0uI+HdibZTIMlzEsk5dl7xDDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frVs5aVbsMae7mWnfrtFjpJOry5sX1r9h532sYjgjjYtHy5U5EUkpj3fWCzjokyM2PiDiSr+2LmGRuJOJnl/x6Nyj82U/Wj+n1Gem1t7PkDyIBNUt8C4IwPUzFzVpKW+y+/jbT1B71ReduP1bjF+yALYAVPchbgXjd4Dlzsvo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6QKQ5ai; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6QKQ5ai"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so4954415e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142701; x=1778747501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=L6QKQ5aiPQXe3zDqeo7YraaNRyeEGKm2y9frDYIARfSecn9mEyW7NexBZKicaPknal
         bGa1MoXqYi4/ppvCQNb/s+S92ozt/Ts/bN/DUuL4oUYquLv146VFJ8gMBGqJ7l5TTQ1F
         o0jWtpJQueDrLCsBvV5IfLOFmBHQFc+lpv6FCxN1nL1r3uq3F9cD9r3uBAl77IVjA2u3
         PiB7yH/5O+Kaf2h1G7As0wvKpamlzTbcB3MGYhuCXgNJuZeCsYE0UlXhTXPsc/yMFUMH
         5aF15SEUPqFkd6gMnqBgb7EmywnN0CeoReOZVK4wIviFKHGQr9FB4Dk8OhnlRXo3FLGZ
         ir8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142701; x=1778747501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=CDfeKo+jAJ30ICLTLUU0dfvnu57FfDzngCVBKKZSORhocHUCogb3/YZ1T8P3fEgRW/
         alHuBkYpEjOaYavDtRBGdXCgBPbZ1VnuwVzTtG+FPXnxkKsMi6FFTW2TML3Te7esHnZ2
         /igyYtbL1jgaqpjsGxG+JicVwVAde2AVVm2xzg1RTAWTB88sP0ZWjgKLzue61wDmRbQc
         aHQrktm3AF0SLOIkQqbejkdD8GcO0aD64458CXW4CSIwO28tXJQDVeBLdyqS0ZaGFXa2
         UPxs65EqEMebaqhvWKQjOwxHF247v1U4vQMybUL1I7U+SKcCoELl8FXl936j6dvjaJ2U
         9Lcw==
X-Forwarded-Encrypted: i=1; AFNElJ8VFixBdeJgKOut4j0fVBm6KwuvmMZLjOYKV5oH0KSmJ0oqd+8/yGQEbQDBE+CxwKd8dtxHwzVLEh/7/tP7pouGbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmKYFVl1Q1Vn7qpSFP8T2hk3ovZCio0jsr6G5YMYjdUJ1mQTI
	Pjk2ZrF5cTCg6RydBtsO6K5heMtq/U3XUB05Tztdo8cxDefY0HWzmh2iV0HEQCKo5KA=
X-Gm-Gg: AeBDiesoU0XeetUVLAN6MNYqVL4Vk9Ik4EPCxeS4wofJ9p8U6qB64Dk2ugmLtwhfB90
	qbEOuwHe1X3JMEBnNyQsIH1WXppXyUghYXiiEWIXAYpKbKEgwuaqtwjakiBlarHH4Su/LM8KMmo
	/+NvNeJuKtcAvTKeLv4qMucC3S+AWBIuHk5+eVU8qIky4qcATuZb+Xe5vPiKh0CHF37/3E90aEy
	Cu2sq3RpAKGEQJfzfVGpxCewB/E8EHKZUmSja12h0m/H01xvz0dlcBAJBMZdECiL521yNKsOnzG
	wzmPUaR7YxRVBGBqL6APZVG9iRlqbxTem+BgoYRnzVas1NhfHyIfQlrw8/KrwYkE4Brfu9XsUx6
	Ak8XLhhO42xghYjR09tVeg/KoCr94cAZqJsIJM/FVB2ABWZcl/9Wlh4j9NMI0ZNyl/1lCnOkjmo
	AxGMTDak6o93Z+1CW9RXaoRTZ9w/Uq+Lc21q/6t/Rc7jk=
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr110121985e9.29.1778142699031;
        Thu, 07 May 2026 01:31:39 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm103806205e9.3.2026.05.07.01.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:38 -0700 (PDT)
Message-ID: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
Date: Thu, 7 May 2026 11:31:32 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/26 6:13 PM, Alexey Klimov wrote:
> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
>> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
>> through a hybrid model shared between the kernel and the Alive Clock
>> and Power Manager (ACPM) firmware.
>>
>> Add the protocol helpers required to communicate with the ACPM for
>> thermal operations, including initialization, threshold configuration,
>> temperature reading, and system suspend/resume handshakes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/samsung/Makefile                  |   1 +
>>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>>  5 files changed, 298 insertions(+)
>>
>> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
>> index 80d4f89b33a9..5a6f72bececf 100644
>> --- a/drivers/firmware/samsung/Makefile
>> +++ b/drivers/firmware/samsung/Makefile
>> @@ -3,4 +3,5 @@
>>  acpm-protocol-objs			:= exynos-acpm.o
>>  acpm-protocol-objs			+= exynos-acpm-pmic.o
>>  acpm-protocol-objs			+= exynos-acpm-dvfs.o
>> +acpm-protocol-objs			+= exynos-acpm-tmu.o
>>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
>> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
>> new file mode 100644
>> index 000000000000..c68d60b4c0b3
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> 
> [..]
> 
>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>> +{
>> +	/*
>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>> +	 * capabilities. Treat zero and all positive values as success.
> 
> ACPM_TMU_INIT returns capabilities inside designated error field?

yes

> What about other messages/commands? They just return error code there?

all the other commands either return -1 for errors, regardless of the error
type, or 0 for success.
> 
>> +	 */
>> +	if (fw_err >= 0)
>> +		return 0;
>> +
>> +	if (fw_err == -1)
>> +		return -EACCES;
>> +
>> +	return -EIO;
>> +}
> 
> Could we map these return values with better granularity instead of
> returning -EIO for everything else that is not minus one?

I think we're good as we are now. The firmware returns either -1 for errors,
zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabilities.
I can't tell if there are other commands that return capabilities as well,
or if there are other capabilities for TMU_INIT, I don't have access to the
firmware code.

> 
> Is this error code convertation applies only to TMU protocol?

yes

Cheers,
ta
