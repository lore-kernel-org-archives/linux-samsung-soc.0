Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0891C0DE5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723027796; cv=none; b=YEjBOfuwSnD5AbVxi2rohCFSWzVY4i5Wia7POlbmT8gMoK8mHSSvNVhS5EUMHGUHgWmwGSv827+MQjWJ1FHPt8ErUkbrrS5V1SerVqS39bE/yCvgDUwXNHwv/ab1uA8xHNyYaA9TGJyF7Z73eEC0AvcGbSDc58hVIfVNwGx0DFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723027796; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bI1mATenPyK/+rS1VQtu2057cBYOlipv7M27v+ZDb3oQnqgNnUxr6cyVLhUiHnTPwIgjw0SKGzt18GuPfI0eYdCWbGzm10sG2bveWRHh3ZbgIhx6Q3bQUg+uMlP8lljVQnV5cqDVOXMM31AD/GmWQo+ckidFCLKXVIQIEIv7qMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWfDEtyM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWfDEtyM"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bba25c1e15so1115700a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2024 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723027793; x=1723632593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=wWfDEtyM/beeCPTbINvS4LR/qV0buUOnoBe/Qe95we9QrBT9LxnKyy9LB3UAi6Nm1q
         rq9uQq3q8TafQo6UAUJX2twF5mqjs5vuW2rb/w5YX6kZKJdwJLjPknZmC+rav6Lq2g2T
         Cz4eiZVXy1PCEjH8D07J2R7wCK1Z3c/w1LwEnVjlVvAZahXo0rRF+nb+7FIa5ifgvvMP
         sk8KoQKLwByVMUMAhu4crfSHGDoT3LIP9egLDkUKCCUv0F7ajeXjNq2MqLqTCNBpLJqr
         iZ7yEWOEYiJvVzk0l449gHdSwJGx1qf1qx6sMhyvaeMQ+8VlhDKw9DGzXOe0SOLvfPBC
         0Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723027793; x=1723632593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=thu4qP2KT6mIZIFwMJCAzuZOZpQzdBoUfxP43KWXQQnBZG77ovwryWnhnt9DOT6rNG
         0pE5+YXJHbjVnUHPmHeJvJf64p06wbpNYaptm7ZX+LSMe/BXX/mkdtJzJz+99NwY1Q83
         YFY/1OcOZeUPXINpgm/vv7XDLMePrNfrihwEiFDa85p7re4eR6F77Y9NuEK5LOu8dlIR
         eIQa1aFwUocZ4mhe+FR5a96KLwu6F6ByB4NnYBhD9Fda3KjO7Bn8gLHNFn+cf/Y+0hNI
         iCOhANxmpdN5aAseDx0mr6hFVEcbtwzebo5CugPA6GBoZJBERxnvWPjVAarHmcd9cPKm
         FthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOKQDtQ5gfr47nAxhO/92M2Eiu2nDyLzmSfIiH+bg+NfYDa3x5PGdOPx8i0/TRkDn4eC8gzyCqpiywxImCgjG6G9baaoP2sUN9v5s97kDG/ao=
X-Gm-Message-State: AOJu0Ywg2JMgFaYSO6k//q4Pu/6qZh/gBVEiwLYoisu2FCQMrb/A+Wj5
	cBObGINd+00WEFhZwGko6wboj2jj8u28/UsQSIJVabzSyUEg/g2oTDDO1iOU/hk=
X-Google-Smtp-Source: AGHT+IGNiGCq3xQ9xD/+A6JIjYRH2TLuxM8b00m6SfTS7ooJvqyRwtUE/xU52X3j9tq8YE70TwQltQ==
X-Received: by 2002:aa7:cc90:0:b0:5a1:a36a:58ba with SMTP id 4fb4d7f45d1cf-5b7f40a92d6mr13263700a12.20.1723027793303;
        Wed, 07 Aug 2024 03:49:53 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839716490sm6940820a12.5.2024.08.07.03.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 03:49:52 -0700 (PDT)
Message-ID: <7e18004d-e721-4223-a0b8-1f7453cc99cd@linaro.org>
Date: Wed, 7 Aug 2024 11:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tty: serial: samsung_tty: cast the interrupt's void
 *id just once
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org>
 <20240806-samsung-tty-cleanup-v1-2-a68d3abf31fe@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240806-samsung-tty-cleanup-v1-2-a68d3abf31fe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
