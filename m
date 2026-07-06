Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE03859DC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324657; cv=none; b=qY1/VBFm/m/z86LkQ4W+6DXlFAYRTbcIkGQbticv3Lomjg2AAORX+8PgXrUFB+LKqGSLxnRi5zY52ecMM7dibQb3NawYdU2WlxPOGGD0H2T00emeiT2S/AOD5LHU85pSmH3aKQCAjM5l+ojkdvNetyRdCp9Ud0h4jmTJ0zF7zqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324657; c=relaxed/simple;
	bh=9rUAdY1bqdroaIZBNoRnWUT1ZjWTBEwO0TyKfjFIbdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDr4K+MwLqtoWjPziSNgjYl8h9bNZjfIEGUG3TyVACJG94hK/9r2ussO1GvX+LEXxEzKSDaE5VUNHIjQiOvd+OYFnpOkDajjBsxCE4s/ipM+1ZgV3aHNDlNpDDB2B7AfgXScv8cZrGU8eU2WAmmJHVlunaWkcM9bB8Qe0OaFOmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIER4XnP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIER4XnP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c733f15aso27587455e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783324647; x=1783929447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=tIER4XnP4CRpLZw+G8woC/s/tsQ4yLnPO0NYINiXSmFo4IC3mVFzfFo3SOpHFUpKKU
         4OcQOkFJDJ09cBSdNmVw8jtNJ8g3CDOVrglVrYXXeEDi/C2bZjgpqQavHOoaWErbgy5j
         9BLeG8QAPb4i+DtUcgaMZAdMKpkaUsWsVthLZlr0dF5aAbvgwcE/Q2Y7EXlK1NbCNLs9
         kWAv95Lfqm9K0aUWi2VQQSOq165qDeq/sE5MUua7QVU26kYaGv6wlv5emtB5dgs/nz24
         AcTztPUTmyfbC9eeH6twz7uV0LMzpXVtcSvnBdaOAtCH4CxJ3Do+czh7KUKvx7/nXzrH
         ZYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324647; x=1783929447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=ER9LUGqKjMR6wc4k0yWaBtq4128LQlKIuXx6La+Sc3bEb7ZHD8hWHYGvifBP8QRXLY
         CByLljysV9eNiqqrjnyKta1p71wnKhK6ufoE/Shh6vd8ywd5naK2M4jBXiJpCT/BRAqk
         87P1zf3md+DFcYcuBDuli5GH9O+I/VuRyq3yuNxSgV7kKb7N2s4hKG8KO+QD7GdPNiaQ
         +EI7VjVEw8NEr3yMQEgEiYG5yI2ECavGxdl26NGMH4dPKgj4HJDJapXMKDd8OoyTVLzW
         C7qIXfknUMFvBBX1z7h6+/DbZdjsiZWkzcumrd+Bk2VydPc7BnJtgnMRzazWyvh7T8hy
         ioZA==
X-Gm-Message-State: AOJu0YzzxMxtQN8GY+hKRyF1CQQeMblvVHtmmMAulsdlaoknyFQqoeI1
	aC7h4RlPpK1+Y4sm7mVQOLeQ5OSdLCnIakdTLEDNo7850TRXWHVMFJDB
X-Gm-Gg: AfdE7cmVbbI7HN2Rm1AwFbpkp38ud4x9CecCuQn/Gq9GgpXWSp1cYDZ/9rp9UGiXCb3
	oIJigPPfVXUWqObgz/3v9tC8g5MUYQWdkCWJlsSRZWtc3J8X6dANNWVXgzarxjfaMl+jdtp/8nU
	FpwxWIY2gsS6jlWp5dPycMCUUR2KufaNRuQMztWjGo7TCHm4IAT1EkpDn/eRlJW8EzRVO5gJN+2
	SKSyhVfcREQkqdr0621G0aEy4q9h5szDWHtJe/thByosPNiBTGxV8woQPZOyM14/3ugNf3Q3Fy5
	7Hnjvuik6GaLcI0a21JR55sBMCzqp4O0dkmYRh9TWYkgER2Uju5G7yqUwZfGAXTNCYMezXMUWzF
	/8c6MCStRT10OmA0BBckPChQWqNj4ORmjh9oZY58/uwCxV9uj6NMwMpEOBvgYjQBWv753ZOX3ea
	MPLwMqaUzb809PZ3DpvredvJLtdijBpf/aFqhPWr9fM6EH16SGSaMWawUhKgU=
X-Received: by 2002:a05:600c:6087:b0:493:dcad:84ee with SMTP id 5b1f17b1804b1-493dcad864amr16118265e9.0.1783324647312;
        Mon, 06 Jul 2026 00:57:27 -0700 (PDT)
Received: from [192.168.1.107] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce03fa1sm256320455e9.11.2026.07.06.00.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:57:26 -0700 (PDT)
Message-ID: <c0e3a874-0d9b-4fc7-bfe9-23ad9d339918@gmail.com>
Date: Mon, 6 Jul 2026 10:57:24 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
 <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 6:44 AM, Alim Akhtar wrote:
> Hi Ivaylo,
> Thanks for your review. 

No problem :D

> 
>> -----Original Message-----
>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Sent: Monday, July 6, 2026 4:11 AM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
>> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
>> linusw@kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
>> hajun.sung@samsung.com
>> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
>> Exynos8855
>>
>> On 6/27/26 20:12, Alim Akhtar wrote:
>>> Add Samsung Exynos8855 smdk board to documentation
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> index 753b3ba1b607..273464400477 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
>> boards.yam
>>> +++ l
>>> @@ -235,6 +235,12 @@ properties:
>>>                - winlink,e850-96                 # WinLink E850-96
>>>            - const: samsung,exynos850
>>>
>>> +      - description: Exynos8855 based boards
>>> +        items:
>>> +          - enum:
>>> +              - samsung,exynos8855-smdk         # Samsung SMDK
>>> +          - const: samsung,exynos8855
>>
>> Is there any particular reason for using "exynos8855" rather than the
>> commercial name - exynos1580? We've already established using the latter
>> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
>> exynos990) rather than the development model numbers, so I don't think
>> breaking that will help anyone with the already painful model number confusion.
>>
> The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).

I see your point but I'm not sure whether exynos-based platforms like tensors
will follow this. Afaik GS101's development name is e9845. So there likely will
still be some deviation.

It's not really a fatal thing, just a nit imo because all bindings will have
to follow that for the upstreamed SoC, so non-revertable. But if maintainers
are okay with this, I'm happy to start using chip-id names for future contributions
too.

Best regards,
Ivaylo

> Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> 
> @ Krzysztof, Peter 
> Any input on this? 
> 
>> Best regards,
>> Ivaylo
>>
>>> +
>>>        - description: Exynos8895 based boards
>>>          items:
>>>            - enum:
> 
> 

