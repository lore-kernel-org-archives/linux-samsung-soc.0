Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C37603F;
	Mon,  6 Jan 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147365; cv=none; b=MTKddJxUcOXMOC5PXD9/D6dUXJE5kuyZ4frP8PvHGp502rV5ttODV7XHnRsu6bLOGSGmyDWFh89mug1ytjZsxNOkvONj2vidZKoejlL18VsT+uMiclRvJoBRZv6yWlwGhE1opwC4reMKe6SvcY9P41w1/QZ3QpGfzTJZONzc4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147365; c=relaxed/simple;
	bh=CjO2S9MtDPDOia1Wtf6f9rKnpiazE+/yFOK6XWeWPCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4pOt5VVwqzGtbwnxkl5waDuIXkNopN+I2clE5ycpNk617JTlU2o8QrqJySNymFslUk8DGTmtKY3eRzR4+LpRIGpLj/60b4eMUwM+WUaSiBAn93hPL5xTMmP5Jg+hor2jizH9keuX55Cilfl2DDFQvifgxFXB+zrJSWLxCqBztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc0dEgkS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc0dEgkS"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaedd529ba1so1522140866b.1;
        Sun, 05 Jan 2025 23:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147362; x=1736752162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJYv/irnbrKeOm2SO/WNaq8WLKXYN6WD2CpadmiwPYU=;
        b=nc0dEgkSB0cCrZUQ9tH4H5m6gIJiWHPXnClSmHtC4yHNK7kRAzXCSESjjAPHQ2Ia+M
         sqWUaWMX+rgkH5v5YOYG4hEYDbX3SbLc8FLSgALYQHXmadqlPsb8qiKn6A0395RGHLx6
         w5BgVczaR06oIfn2I4qqc9cwiHSpBZUO+c6ZZ8QXlRE/bOYd0YBccZzy6MfTchFzoWlt
         QmWENPmWszXbEHjylvyNGAdsW3hzl/FLMg/ZfC+x34x1t/QWFSeF20AOLopV2OmFu4a9
         nfzZQq8ChBakciwFVEJah5zHPMhqzN9eTVhTs4uNNLhWsxhKthnRg8b9JhW6Satkjwnk
         u5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147362; x=1736752162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJYv/irnbrKeOm2SO/WNaq8WLKXYN6WD2CpadmiwPYU=;
        b=TS5XAQg+aGmJvyenSVKsycvSnaC21SviKPEbNPzB/g1WU4bteObJTLhI9CsfmIcoae
         Xbs1Vvw7fZ0rkhk1Vtp2vVrR/TdNCBH91CCghnVvYGDcO7hhq4mq/z7E1a7TdQZTETqr
         s1j+4VNCE6IcEUPpyuiAizxENeNv+qYXqqrf3sBpqkZn91fOe92FL9/gqc29CxysHz4+
         S/TsCfl/+kZE+qA0I8RcVkzjVZv+cpQtOfwSuvgzk83dMwg0FrkBnznPYx/La4Pq8Ul+
         lOUfRpUMH+yU7VdbCX5T/MrH1bvmZRectXQxqsiV/frTgvEdjeET4gUN4GbOn9RtZjtN
         GwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz7pZJ1nwiHb0ey/Wv0ZiIz72gawA9MYZM8JHZwEAKBrR1uxqcMr3sglD/GRMCt+S7xM1yh2M78AAcTLye@vger.kernel.org, AJvYcCWOghlP/6eXMxT2PUkX+Q78tNyzkdAsjd+HA20kV4fPoxXljzPeLZtGgWkYe/3vVK9M/a6yv8Pfq9Bl@vger.kernel.org, AJvYcCXDY8OvCILi7OSQWqvH01ZeZ59fsbKWhZEvK3yUaMAHhzSQUdpgDq2SJFGSUSeJUeWiMgXm9HOjqxptcUcXJDUnzFs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dHqBDO2MHroy55lV9v1IlYEMMviC0UuaZjlUl0gUqzPd+6GI
	uvWHCqPUawJBxNPV7ZpCGflzdqEi+mDCzPJMplGZQYllp/AXk2rV
X-Gm-Gg: ASbGncv86ZRRh2t1cI8NAsW7mlAFuOWtEcM5b7U2idjOTf9JIs31dtb+K8xYQ4eLxUa
	E43N9pf82KiqHp8fZMZoA6z8XNwIrhYnnAT5o+AeeSA0myIlJ2353ZzGNpWnsTwpUujuCRX6NZj
	5uI6PGdU0Qse/Imsjn1YldHpaFxZ01XyOQaMTveykiIH0CsyhpYmehRfSkaFNW3IuyZ7j5uzbGu
	o+oRrkb2mxewKOHn8qpjwVmuXfLKfHBZm4wlaKfd93kcNqmZ8st0j0Xpe/gi2ZK0Lxg2AA=
X-Google-Smtp-Source: AGHT+IHAFiPgS7sJrwvSXFyKpUNQUtj2SLgzf5q4uaJz++G0a5zVLij+EVZ0lC9fZ58fqkFtd8u4lA==
X-Received: by 2002:a05:6402:3604:b0:5d9:d58:bcfa with SMTP id 4fb4d7f45d1cf-5d90d58c161mr32069852a12.27.1736147359958;
        Sun, 05 Jan 2025 23:09:19 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe49e2sm2216603366b.97.2025.01.05.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:09:19 -0800 (PST)
Message-ID: <8d7670fa-ff4b-430a-b188-778d3922f905@gmail.com>
Date: Mon, 6 Jan 2025 09:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/25 08:24, Krzysztof Kozlowski wrote:
> On Sun, Jan 05, 2025 at 06:03:43PM +0200, Ivaylo Ivanov wrote:
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..b7c1406f3 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -9,9 +9,9 @@
>>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  
>> -#define USI_V2_NONE		0
>> -#define USI_V2_UART		1
>> -#define USI_V2_SPI		2
>> -#define USI_V2_I2C		3
>> +#define USI_MODE_NONE		0
>> +#define USI_MODE_UART		1
>> +#define USI_MODE_SPI		2
>> +#define USI_MODE_I2C		3
> This breaks ABI and does not build. You still need also:
> 	#define USI_V2_NONE 		USI_MODE_NONE
> and same for the rest.

Alright, sounds good to me. That way I shouldn't s/USI_V2/USI_MODE/g
for the other SoC device trees, right? Should I also mention with a
comment that the V2 constants are deprecated?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof
>

