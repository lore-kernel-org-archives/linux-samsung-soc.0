Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB01CA90
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280055; cv=none; b=OvL4W6uy34RHL7wv5OaDL9uI0U42o03cEi2lg2K54JldtWh1tvLnoPxecOXOACPpqrbg1PzJYJHXoAiNzxrLiemdBOcj3nALyJmKkhk+K3LJujwOE2eefs/mAmYpLJ70lTAkKMYF5Xz8wKyUpsrOee3cRoROCsvSfYAcqB7vcTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280055; c=relaxed/simple;
	bh=ToHVwMkA2rG2Gf0KYv54/WgPDP0igZrev5cweEZsDRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdcR70+iMxB94jcBPDzbhP+RriFlshDqNCqaGy/HqBHU3mEmqE3wCgTLbjroRVKGYheHu2KlD86xWwFOLkPezioYfNs5omrU6Y0K5lIhQkPDbnM8RCbO25YDEK9KKnqW/BfqgGn4IbPf4RCL8lfDlhKCcuGGYl9/ijrD/3qx2FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTS6R28i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTS6R28i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso7873975e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706280051; x=1706884851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I68Ldx2ZUNdKEgzY5p5+0BlL/e7BiQBE3Me8iSEys3Y=;
        b=aTS6R28iC5aD98AAHMU8Z3bdzm3/Mx1zv8KDHe20ZpqOW+pHkgiUvpBfX/+29f377+
         7fYACAkkMy+aAVO/TFf57VonxbdDbnL4K5c3y2KlJRGwTfTirfL08Dz5weLj81bqN2FD
         Nt7UWTLFcNrxVo8cm+2dIMFyzhlsyhaG2atNNqqzYyGwQjPw798d+UTlXbKvzXdnONom
         9D246YgWNWZOX4wcZdJpR0L1c1oWw2VtANFHtbbOq4NCvw7WvRWjVQhPm2v1SVoe8jna
         Btry7YXpuoZh89esrVERtHkzx4qbVU0fo2NbL+3HGxWGcV6/aVKHxacRbJ38NfLE7L+V
         xyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280051; x=1706884851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I68Ldx2ZUNdKEgzY5p5+0BlL/e7BiQBE3Me8iSEys3Y=;
        b=rZk0cwRaxws2sAcpYIuNmnYAertFCXw/SXOdBWii4qLt4u0TmCHNZtaTr4bDsNmzoF
         7B4nEp+SjtPR+e+kfXOZsSA9Tmooy01k3Y1wMKum7yZgdPvPvDY/A5MecYW87C85DbSV
         woLzzhFOT8SIwYP/MxpeY0bqU+UvuW/nxfdtE+wM9MeFDDq01wpLkpJaWZ5l4bNQWnOY
         VlEImJludnqFFiTLMsTWZlio+ErWfdXMHBe6NPrBsSNE4lDx44alq8lgCDWgaAO2XTbb
         MAl8FM43GKfINDJeFTng5rCswmdYbu5pXHe7fPTv1rCOJeXNF6zVk+uHymK2A0sjC8rA
         rWZw==
X-Gm-Message-State: AOJu0Yw/5/23gUe/wiOOoPPonpLXIemh5PvHbnoiAMOO/81kpXMMFAGK
	nlKdCfga7juAn32MRD/AAp7Ydegba9N4/pdJOI2tcHKaA9fv26Jp7rnt2muPVBY=
X-Google-Smtp-Source: AGHT+IHXzEf5WgqfPoXBoHkDPWdpU3hY9J3uxc6EbtcTE1L6QxNs5WVrS+kXB19hcycpSon17cfgWg==
X-Received: by 2002:a05:600c:580f:b0:40e:d45d:ce41 with SMTP id jz15-20020a05600c580f00b0040ed45dce41mr922611wmb.186.1706280051105;
        Fri, 26 Jan 2024 06:40:51 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id i13-20020a05600c354d00b0040e45799541sm5957740wmq.15.2024.01.26.06.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:40:50 -0800 (PST)
Message-ID: <68e63f98-366b-4558-8819-e37f58e1e3e9@linaro.org>
Date: Fri, 26 Jan 2024 14:40:48 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/28] spi: s3c64xx: explicitly include <linux/io.h>
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-2-tudor.ambarus@linaro.org>
 <CAPLW+4=kEhMz5eUCTLO5e4RCK23g+EWqRqcGQ-V9FNnL6jaFtg@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=kEhMz5eUCTLO5e4RCK23g+EWqRqcGQ-V9FNnL6jaFtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/25/24 18:58, Sam Protsenko wrote:
> On Thu, Jan 25, 2024 at 8:50 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> The driver uses readl() but does not include <linux/io.h>.
>>
>> It is good practice to directly include all headers used, it avoids
>> implicit dependencies and spurious breakage if someone rearranges
>> headers and causes the implicit include to vanish.
>>
>> Include the missing header.
>>
>> Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
> 
> Not sure the "Fixes" tag is needed here. AFAIU, this patch doesn't fix

fixes tag indicates which commit failed to include the necessary header

> any actual bugs, seems more like a style fix to me. In other words,

not yet, but we can't estimate what header get rearranged and whether it
will cause the implicit include to vanish.

> I'm not convinced it has to be necessarily backported to stable
> kernels. The same goes for another similar patch from this series.

It would be good to have this in the stable kernels for the reasons
described in the commit message.

> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/spi/spi-s3c64xx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index 7f7eb8f742e4..c1cbc4780a3b 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dmaengine.h>
>> +#include <linux/io.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/spi/spi.h>
>> --
>> 2.43.0.429.g432eaa2c6b-goog
>>
