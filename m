Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3672613
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315744; cv=none; b=ZUcZnm6YVXgOMmiXUA54Z7LoBtd5eOw8TahxpcQDjSP4THUQnlnkxy7SC/tbJ/J26ctw7yh8mTJcwWkT3csi+uE7BCc64POGUlfS3BHGDErRzigpvLl8Zieegy6pbzYFhetBx4Bat6MxV3hVh44ioyi8wLEXn557qXkvc+IqzVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315744; c=relaxed/simple;
	bh=0OxqwkoXyk4pMEZB+3Be/QzVD7EbaVm3mM/XisR5KNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUs+b9bWeh9e/MLVDWkqNWaOY4zDrNYGcEKQCiM2eY8TZp1OobY0jtSuj9GCpymElQrSDcaYCO7fwBllbWvlgaLODLnlSqzC5zAMslqu3H6uJglcXebQO1oI/U9xB0vH7b98wjcDo43ZVUhSe+02CqroGkewzgc/UEcl3rUKOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nd2vWg9u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nd2vWg9u"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c99459e9so6183155e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747315741; x=1747920541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXeqa887aZIuoR48uoN7BEsLTRu+NlEEvV/bSAfKqmQ=;
        b=Nd2vWg9uzonXvn3Ku+ahyeMH71CjBYLgnEdSYTMmCKCRYemS31Q7u3k8+JXO23jx0G
         tZIRiuw5f1jTL09JElIeNLFxAzH8hZu/W/bD0HVUabJZy/um+XTzVEprG65dstApHKp0
         Uzk26kgx1KunmPcYVcE5TifN0yiKLQNSs2iTNjEZE+ZfSvWdE+5bFdQEX3Fm0rxH1nZe
         IUaPXtYONcU3PvuXZszy/et9nCs2+3ncRwEPwK0MqBIoKE7wfxccoPgwM2oHLC2cosNE
         cUsUd/uRf4vbEVU7hEy59y67kCzzHOk6eU1ajOOOZ9mfKNTCt4EUmHJLZUpHNQXZdJNX
         /M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315741; x=1747920541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXeqa887aZIuoR48uoN7BEsLTRu+NlEEvV/bSAfKqmQ=;
        b=Y+m3+KDub0PmAhxxECLiri8EzOAoYnP6slF9DyAP1ZaO5O075imPnY/VitsEMySfmB
         KFREYzY6s4kgLzjhZC9g3H0eLyfw+f1nrSri8m+saRKkmCDs8b3si7uupfF6ZWrk+U5+
         BNbkMeAZKlZGyYvpp1WuZCklFU0IcUUnBFasvSc7+1HmUDsOnQkyd1KkwN2LMnVoHAP5
         Hn3TuJOtDJ5iXVjVBLiZujUpPTVg9TAHOqpYzOcduImhC9PkpOf+/2HlEMoURdoJ2ae0
         vk4Z2HGFwNdS+Fk0ywThg4iSnbj/TxRQlw4L1jdDxjEM+74e5d5FkLrfh/3ye0fhvim3
         4Gcg==
X-Forwarded-Encrypted: i=1; AJvYcCXH2FpvKe6VzNo2FgGokLCUNIwxRODf5MqdctGaQXe9znWgSGNcCsReowOXqal1IzgQjjgNgTpID4txBbxzfFWBkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhaxB0iOtUjYZ7GOqZ9Fa56bePyfLh/3Akr3ZjbGDYqtygh3/
	+SR781kcUUCoT7AfA38UfwSvfHJKc5NW4dVsflcigKecMyxHDyJn6Zb3ytMLlXU=
X-Gm-Gg: ASbGncsJxxp+ySloJrPjG+rfoc9asUgZq9RRBIsQx/OJji6iSaaz/6HUjPnD31rEueS
	glfww3OU3eq0bPRndh+dnbwapw1zkWCnd6y6Apg1EBtyIuxOizmuk1wlAjc6KHxuw0+oKmAk+n5
	Gb61ba7rhKAz7JAdJyO6K7nTKaIxNTZlvyewMatM4uyHYrUg+AqIKtjOEw3x6nm+tYndHT/ZysD
	spIr2XLQMPuDdFtowbT9+ndESyjn1YOeFvehw8t78x4neo3swWyGq6meBZwna1wwa2e6YdRLRPY
	R62nXVNUd9Ohszno8SrQHxwJX5jIzHHSg67pOlxArq/R/Elo5/3oEkcPNUH+8p0QDi+USYKoGI9
	EvsnW9MoF6WRTQ93kDqzGpNs=
X-Google-Smtp-Source: AGHT+IEjQRVUhGojBwI+97YBtdmsQnt5mRPLvJ6XJl4UcLoxhfGfGLJJ2ddgeOKQqlG0CKXA5mxG9g==
X-Received: by 2002:a05:600c:348a:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-442f20bb25dmr78852185e9.2.1747315741090;
        Thu, 15 May 2025 06:29:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm73524575e9.8.2025.05.15.06.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 06:28:59 -0700 (PDT)
Message-ID: <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
Date: Thu, 15 May 2025 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
 <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 13:10, Anand Moon wrote:
> Hi Daniel,
> 
> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
>>> Hi All,
>>
>> Hi Anand,
>>
>> if the goal of the changes is to do cleanups, I recommend to rework
>> how the code is organized. Instead of having the data->soc check all
>> around the functions, write per platform functions and store them in
>> struct of_device_id data field instead of the soc version.
>>
>> Basically get rid of exynos_map_dt_data by settings the different ops
>> in a per platform structure.
>>
>> Then the initialization routine would be simpler to clean.
>>
> 
> Thanks, I had previously attempted this approach.
> The goal is to split the exynos_tmu_data structure to accommodate
> SoC-specific callbacks for initialization and configuration.
> 
> In my earlier attempt, I tried to refactor the code to achieve this.
> However, the main challenge I encountered was that the
> exynos_sensor_ops weren’t being correctly mapped for each SoC.
> 
> Some SoC have multiple sensor
> exynos4x12
>                      tmu: tmu@100c0000
> exynos5420
>                  tmu_cpu0: tmu@10060000
>                  tmu_cpu1: tmu@10064000
>                  tmu_cpu2: tmu@10068000
>                  tmu_cpu3: tmu@1006c000
>                  tmu_gpu: tmu@100a0000
>   exynos5433
>                  tmu_atlas0: tmu@10060000
>                  tmu_atlas1: tmu@10068000
>                  tmu_g3d: tmu@10070000
> exynos7
>                  tmu@10060000
> 
> It could be a design issue of the structure.or some DTS issue.
> So what I found in debugging it is not working correctly.
> 
> static const struct thermal_zone_device_ops exynos_sensor_ops = {
>          .get_temp = exynos_get_temp,
>          .set_emul_temp = exynos_tmu_set_emulation,
>          .set_trips = exynos_set_trips,
> };
> 
> The sensor callback will not return a valid pointer and soc id for the get_temp.
> 
> Here is my earlier version of local changes.
> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
> 
> I want to re-model the structure to improve the code.
> Once Its working condition I will send this for review.
> 
> If you have some suggestions please let me know.

I suggest to do the conversion step by step beginning by 
exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first 
cleanup iteration


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
