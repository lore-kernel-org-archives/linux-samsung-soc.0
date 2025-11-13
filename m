Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFE350D4E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038355; cv=none; b=qYLLvSbHE1oli3CutE2ss6MLDSt6tg4LwK1dhCpIlRpyAMIaS/das53KrLt7Db2KTBPa8FQ3A/HJJEbHsPPuL+FFKmBlJFJDEfZ3zbMsuvahVwQX7ELAZsbvfb3JNztLyzJ0ekwqtmSGShyDSpxoqLoXWulJtFDfPzeXncMdcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038355; c=relaxed/simple;
	bh=6rf5XICqyYYUFtlvVo+knUPiKpsZJ2UtI9BoM7WxNHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWEBAYsBff/ol9ik3XfwkmmBGxrucQ9pzY2Qw+xRdRkX0G90aiAIfNSh12ydj+CbBVuPfXw9G92VJeS/c7NwXG10B7xC4dv61jl32jahhn0x1bt2fSiTg5tke2NQB8fMeuLT8Oo/jyDMpsjzBYKBLny1S0QlRGjBxhCQ03tj07M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hsUdmOXc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsUdmOXc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477549b3082so6846915e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763038348; x=1763643148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXYoTtDd3fqHx8jiPhi5RZA+APMZjV0IIjDW2SgiBMo=;
        b=hsUdmOXcxVfusS8JDOe8Ch+o1ahwXn8wpQ1i7zxYY+frevQwvxJtdKheol/ASrS2fG
         S/gi2Mn2QKY7T45RtXol7ETORcSCHeEM+mqLrt2WhexmM8rdrpidAwhL77+1P+y+o+FC
         OPK4f1FvJFuZ4Dd8a/YgUN74GgxWa+crLvDqmftpHQp2kFb8+c5VUCPKeKvuA4FdP+8X
         K+Eql/6bnYcLkYuuvqIlgtBSVRyZSLso3/VUBVEUz+AXZS5pTsI7dtFPCS7kYKSleWMM
         c4PVgWSnPdzOQ8PrM5hMRw6eARRxOysh5owNHW/9Zc8f3qaWfX2n2Mhff0DRcGXSaY4y
         dfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038348; x=1763643148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXYoTtDd3fqHx8jiPhi5RZA+APMZjV0IIjDW2SgiBMo=;
        b=G8CVW5dKInOobuIR3VLenQf+24nr3NGNmnAURMXTtUnwgI5KZKJaZA6gxlyMNwlDg2
         FSCq0NdfXmm6R+GOxgLnxAmTE5y8dyiMvYoGPFg8f+j/c+S0D7yJk2SoD5D9SKgBMXtJ
         Qq6QP/17yi3+sn37Lw1RM+fqJeInP3yXs+PkQfbPIar5AZZFoXHx5XoFEbFIKgs9PAgK
         kEwf4id6ogzIyeVw0nN+ksGyfm6mX16LjINtCPxXWDyk8wfKopaxEYEyJWRyzNfZW0kc
         IOaOy1vikIykn3sm7z+RcjvJkGMJCyGtTm+kvwXuH5kD4UQfbDU5X42EtAOapbzdR0lk
         7GhA==
X-Forwarded-Encrypted: i=1; AJvYcCWXaiU/eh5LkBNzqLccyzbQIBBxW0yFLabU53HXAjAaBtcE6Tli2NZV3fumTCFUDRhyBt0ChdVBab0zD0JzV1hn1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1vue7cvIB5X2Q4+fE/cO8FuC7j90Jno+8o/hYMEx+820Wu4d
	eI0rdu2tITKf5XkxUJ3cvUJ16qe3he/1RI+jXH+xHP/S7/Q6ElMz3x/j46TNz6WHMS8=
X-Gm-Gg: ASbGnct/dDxEjC+8Ef5aItfrzyzTv6DUSq74cGLrpCleH88MHuCanwjlnvleC8ZXkeq
	BTwH8nWeb8zqvprYV3C9KQvMZZblHdESORrptziX5Bu4NRHxn0shwHrabbRg8DOIkZOu8UeKmYY
	sWiaP6t1Z6wa2QdtKbumwGtmv2XeQFtPt4YmIUn0gPWIvpmnpFErnJ2O89dN9haj7Xc6aYKzEsA
	J1KY3vbBb4Rzkto4Riz9V5q5HjH1C2vvoUWs8+j6eK1/1D4m7N5vn3SMOHYTnRicVjxVWrAc2xh
	XdI4hJ+0vQUAzY9q1cT5CuOXuQevpzrrM4Bas2r1qD/Ta+0lTSd4hgdC4fMbyf6j/pwJG+yFkkm
	8gcLJ56z5e9cafqI7eUR/R0k22qET0g8JD7JNZb0gVIyxc93nmEZDpZbbB1jMSUJVX1DSQxNc3j
	FNRG9pRQ==
X-Google-Smtp-Source: AGHT+IHpr3MsueMipe4IlddXi4/Vzl0f21raKHfRPZH2whdQqJt5/ks7Bz8Gchg8IDQDCn7p4XbSfQ==
X-Received: by 2002:a05:600c:c4a3:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-4778704513amr69672855e9.3.1763038347935;
        Thu, 13 Nov 2025 04:52:27 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb30e3asm21086955e9.1.2025.11.13.04.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 04:52:27 -0800 (PST)
Message-ID: <8cb0b7eb-d958-48a6-8940-6672d01b7e49@linaro.org>
Date: Thu, 13 Nov 2025 14:52:25 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
 <20251113-benign-macaw-of-development-dbd1f8@kuoka>
 <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
 <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
 <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
 <62bb6c08-a1d0-4dba-a431-0d6ce49d66b2@linaro.org>
 <8eea72ea-c106-4dff-979f-c1acd6b0d617@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8eea72ea-c106-4dff-979f-c1acd6b0d617@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 12:44 PM, Krzysztof Kozlowski wrote:
> On 13/11/2025 11:26, Tudor Ambarus wrote:
>>>
>>>>>> this can easily be just customized chipid driver - with different
>>>>>> implementation of exynos_chipid_get_chipid_info().
>>>>>
>>>>> If the answer is no to my question above, how shall I model the device
>>>>> that binds to the existing exynos-chipid driver?
>>>> Just extend the existing driver.
>>>>
>>> So you mean I shall have something like that in DT:
>>>
>>> +		chipid@10000000 {
>>> +			compatible = "google,gs101-chipid";
>>> +			reg = <0x10000000 0xf084>;
>>> +			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
>>> +			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		};
>>>
>>> Maybe remove the interrupts because I don't need them for reading OTP regs.
>>>
>>> What happens in the maybe unlikely case we do want to add support for OTP
>>> for GS101? How will we describe that in DT?
>>>
>>
>> Ah, I guess you meant to keep the node as I described it in patch 3/5,
>> an efuse node with a google,gs101-otp compatible, that will bind to the
>> existing exynos-chipid driver. Then if/when we add OTP support, move
>> everything to a new OTP driver. That can work, yes. Unless I add some
>> OTP support now, to justify the new driver. Both shall be okay, right?
> 
> Yes.
> 

I'm going to extend the existing chipid driver. I looked downstream again,
and couldn't see any other consumer of OTP, even for newer SoCs than gs101.

Thanks!
ta
