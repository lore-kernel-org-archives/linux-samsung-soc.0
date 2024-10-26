Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11181D5ABE;
	Sat, 26 Oct 2024 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945092; cv=none; b=U2Z/1HlDPqKgQvCMv00WeKS9HPZMojemyWtMwFd1UJM4nZaSy8YGbF84DDaHNVMkvwukbWaBBvYui9GIOLdBuljmARtD/WVdoSAw1lXtNpRe3INnt+rwnormMoP9ohJ6YJILkRe6YH5Gtykbn8tKcZfwdm/4nNYMQJPKMxSpAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945092; c=relaxed/simple;
	bh=McFyV9hd0zvF83FfWgRWq6Igkamoo1JqCEDwrJwkG3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmM0iSV3ypUlQO2jvb3j8c7ovr3hlYjGcRkLHSsnsb8cvYV/EX+GzyIn/04YkIsnS6fjn1STWNt/62C/f/3HrilzXe5X57fglzB0okyvsfHdpxDz6A0YoVm1PKQw7dM6uHejG8l6JgPezusW20TOeKzpTk9JCuXtGblv4z06NM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0jQrECm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0jQrECm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so3994634a12.1;
        Sat, 26 Oct 2024 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729945089; x=1730549889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yH+o/HY3JXmwHdmBgupIEIWVJlcQTGn4DbO6wqm5C4I=;
        b=B0jQrECmznv6TLc+9N1y+g5fZoZh1U11tg+/XVWO2p27MFNUINJkUdLe4NuEznJtmC
         DPnaS/xS9htXAUn7kHgYkgnio95L1rdSMSJREYffnIeCGNXWIapZHUi0VOB5Et6Sg3ju
         YTS1nWXe6yxtWe6T2uzD8pVYYdVkkGCg75mj+/fyw/JNfOGkNY/QCG8J2u2K/SAOLe5S
         ng/7u8eArbfJK5Yu2uo1ir2nSYtDGOFQb0qiO6YbyZseYQDZYs5l3st2WtYY/R6f8ZGW
         rq0/RfpdN2pza+AcTC+zy7izzmAl3FIt10SWv8G19XYOKmWJNLs4KkNMscXYpZekTrRT
         LBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945089; x=1730549889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yH+o/HY3JXmwHdmBgupIEIWVJlcQTGn4DbO6wqm5C4I=;
        b=cQWbE7zbPvkg3bwDh/WH3PiD9BULhE8eTaWo+3/8hldkzdoV/Ty8mZkeZLuu55k+Mk
         eIj+tZzPcWBOA9nX/K2YFsY46TJkMHTzl9wvfz4k9oiy09ulP8aaIqVeFGUY+Terye2Z
         aXK4NuFm7t2p29zQ9tYxN2kpgK7DKZ2dfr5L/UIBsIhuvFjOZfA8EocT3Qh3L8mSMyV4
         ljS1prdDOA+xLYZQolrG5w/KGe1v/mw2fnvwbgTz+Q6v061dvmyeHEIevPpITI8lLvyT
         M2BYskfyG+1HyzZ6MdnTVDkNlOFWqSOSlgsRA6qLBd1whkYExw2oaMhIVcQZ7wN8ln2y
         2+CA==
X-Forwarded-Encrypted: i=1; AJvYcCWYf3jdDw6cLTlpoLxO98wcsskraR2cfrjf3j2AMN3E0kfUgF6iznddkZvz5M4ZbqDBxE5ora2OuKWrZcQF@vger.kernel.org, AJvYcCWlJb0gauYfdhCYCnUYq+F5qmtzBNTOfNKj58BWvhokg3eN7LFOs1DRTzn7axhF6DBA1fHjcCRLKWgg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DtH2Gqhrnck8fikO1YZskqNzSFS8zTgZkbGHVbm60pobaKNk
	T8sXrdZb3CQKZJr2+/+86vjDkuRHKcsTiNR/rD1G+qhRntd62qpo
X-Google-Smtp-Source: AGHT+IFYyYwgZquxy67wBugI4PFcafIe8a40Si0QwupoEmiT4JdDegPMKfAYvoQS+vjZC9maXdtMqw==
X-Received: by 2002:a17:907:7ea0:b0:a9a:17fb:4c40 with SMTP id a640c23a62f3a-a9de5d6e1e7mr178998366b.26.1729945088794;
        Sat, 26 Oct 2024 05:18:08 -0700 (PDT)
Received: from [192.168.1.102] ([94.131.202.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a089278sm168124866b.220.2024.10.26.05.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 05:18:08 -0700 (PDT)
Message-ID: <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Date: Sat, 26 Oct 2024 15:18:07 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 10/26/24 15:12, Krzysztof Kozlowski wrote:
> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>> Hey folks,
>>
>> This patchset adds device tree nodes for multiple clock management unit
>> blocks, MCT, SPI and UART for Exynos8895.
>>
>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>> have been implemented in this series. Support for USIv1 and HSI2C will
>> be added in the future.
>>
>> [...]
> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.

Alright, thanks for applying the rest!

Best regards, Ivo.

>
> Applied, thanks!
>
> [1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
>       https://git.kernel.org/krzk/linux/c/e54eb0465e548a7c6115e336ec5cfec04bbe8747
> [2/5] arm64: dts: exynos8895: Add clock management unit nodes
>       https://git.kernel.org/krzk/linux/c/fa986d1073805154888a788eda38d46a796346e8
> [3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>       https://git.kernel.org/krzk/linux/c/9ad6c3bd1bcbb73e2a5723e13b9d06e2296b07e4
> [5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
>       https://git.kernel.org/krzk/linux/c/a5541d737c8de71948bcdaee912bcb6b0781af7e
>
> Best regards,

