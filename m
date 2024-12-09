Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E791A238D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753961; cv=none; b=U8w0763vXGys/CpLD4ClKV7CoMpYffoqcR8dsqpsdlD04+dbRUF23m2UZ03IqHFam+GQI2thwnQvBjoUtAlSRxRoA9JMpfkiwIf4TgSX83hKweQUVlgmhEK4CBl30bXwe+PdRDNy11rc45N37+wR30Rb2ZA+kjgUN8HY+mZ1ex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753961; c=relaxed/simple;
	bh=oJeg0IDLiudQCx+r40Nks4t9ti82fc4uLX5xh9nxdw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct2isbjZMo7TPz1wRRaGto4hNtAUp6+8/QO5TopVnsZsqI+qGxxG5BDmndio6H5ZdX7MtGYybC2jw96yUQnhXEM4XHt1QPrAsdAWbL+9Gx4hMuDyl7HZQE7jYYseN9zX8b8JnvQ7AjqCf9Fo4kxq2AReYUZRS7jV+bvevVvoSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/ojBdj1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/ojBdj1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso6464227a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733753957; x=1734358757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKGxGVFQL+Og6kSlKUo67HxrazoGKfS5bm5biJspKWs=;
        b=a/ojBdj17hjrP9wFWoyGlap38lL5qiW4MVGskcjs5qhiKA5FHiT/Q7d39MJ6F8DXMT
         HDMrRKWnEWz03ZgyPcHYRrEAu1jcVVGqTcXREKuY7LVl2KtvEd1+7WBGR2KQgNoSc8JP
         XQieSWnit1AL/3t/i+1pWLz9VOJtbh/T/NJFGbeZd2Ovx0bRVPVoswN8RWaxI1d8R9h8
         IZdJFjF7NmvZAYXdnDDbi7tPiNeSmrzKe+npcVAV8ZbB8IRdw96ECWWDJuuAAIqRzzXh
         LFu8AAVD1H36Pv8aWaPnqzXoDwrlFinY4L3m2n9AqzUybNpe603zb27Hqtex6mznfe3N
         Z63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753957; x=1734358757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKGxGVFQL+Og6kSlKUo67HxrazoGKfS5bm5biJspKWs=;
        b=eMs3TVMOZXVw8j/4gZX0HmVn8p+Q7ntkl7Wr2CNu3nQtvhOjW7GyKmzzuqkDJA5aBU
         XwXpdZTpXBa8H/CeJ4m0hsbUmPbhMIW09MPTYZT7U85+/YrFGcTVZzyw41CoAh/VH7x7
         0YNZ6trIII4Kfvfq5AZemtg0RgkngJCej4lowKJGk0FsJ0Oo/yS/Y43vax62LvbFSM+K
         rHs+GZ3M/VAiqoLxCg5IU2oZiJqf/IJEFw3tGVJyWAOwlUiflp6znqX2wey7HUtH2sj/
         yjgXL4dYqyyXCvtilN7ssYGk5yhgAseKgU8njrmV7XwqATJjne2pJbh2eTShs9vkjTpL
         qI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7UlWBpTO4l3vLcPFfE0+onVCxgvmE0w6YYwKywEOdYUcNQYd6r7Ag0CFHFRsnQKZZVC3YcajJ3LNd84wXl65RDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybUeWchEoxlyzk+18N40pahXKxbeqObswVeLELud8XYQqrMqTF
	GLC2fRzZOS/wXISOPF0p3A4uSdTJZTrnwAcMEPRRo2LrV+GfAOZoz45g1VPw0s0=
X-Gm-Gg: ASbGnctj6T/fTWJCF0B85BxUxufhhoD/qvIwo5fhqzKT0DZ/kV6YFnJF+JN9HI9QdaY
	cBvoKit1nPzrSMzCEVAbZgrDLmEMVbvkHwa6RSYPbFt/O+JyKA1Qu7BxTPYjcnviNH9QcfT06rn
	6+jMrgV8xTKjt4lnY7Oo/JLnAZAzzhKOu8iBmeYvKpuJOlayavW8WdEI6CGWfDUSxG9h7gc510l
	yJSsyEsqEmxujoQZCpEo/s5tV90dx1fg57DkIBgbzkyohjBJijhA4vJDA==
X-Google-Smtp-Source: AGHT+IGFZ72A7topG3h6HtsrPbQ9uANyoeaAttq9LuCfJvMZl3glvlTz4zo8uXTpVfHH3Pb/FsB6eA==
X-Received: by 2002:a05:6402:50d4:b0:5d0:cca6:233a with SMTP id 4fb4d7f45d1cf-5d4185305aamr1118156a12.10.1733753955375;
        Mon, 09 Dec 2024 06:19:15 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb7722acsm2780231a12.3.2024.12.09.06.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:19:14 -0800 (PST)
Message-ID: <38e6687e-c2ee-414b-bba5-483150ba7baa@linaro.org>
Date: Mon, 9 Dec 2024 14:19:13 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
 <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
 <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
 <58d62506-de89-40e4-a3c2-bd27da515a45@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <58d62506-de89-40e4-a3c2-bd27da515a45@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/24 8:33 AM, Krzysztof Kozlowski wrote:
>> I'm thinking of using the same driver for both cases, and differentiate
>> between the two by compatible and `of_device_id.data`. Thus I propose to
>> have a "google,gs101-acpm-mbox" compatible for the ACPM SRAM case and in
>> the future we may add a "google,gs101-mbox" compatible for the messages
>> passed via the controller's data register case.
> Good that you pointed it out, I was indeed wondering why this is
> "acpm-mbox", not "mbox in compatible.
> 
> This needs to be fixed - you cannot have two compatibles for the same
> device.

Will fix. I followed arm,mhu, which differentiates the transfer mode,
data or doorbell, via compatible.

For the fix I'll use "#mbox-cells" as <&phandle type channel>, where
type specifies doorbel or data type. Clients will use:
	mboxes = <&ap2apm_mailbox DOORBELL 2>;
or
	mboxes = <&ap2apm_mailbox DATA 3>;

arm,mhu3 and fsl,mu pass the transfer mode in a similar way.


>> Given this, I shall use the more generic name for the bindings, thus
>> maybe "google,gs101-mbox.yaml"? But then exynos850 has the same
>> controller, shouldn't we just use "samsung,exynos.yaml"?
> If exynos850 has the same controller, then add it to the binding. Anyway
> then use samsung,exynos850-mbox, because samsung,exynos is way too generic.

Looks the same, yes, it differs by the number of how many data registers
each has. But I'll stick to "google,gs101-mbox.yaml", as I can't test
exynos850 and I assume we can rename the file when we'll need it.
