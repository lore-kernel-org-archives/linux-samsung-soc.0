Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3441D5AA1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849495; cv=none; b=QDTuI9JM0IoVIlgl5/Paka3ikkcZLohfceGPN0MqJIgTrc8vJRIzXJnmlyIZ2Z4BkMgs0HgcNP1kHTjtyyl+Ue5uAHk0YD0EmcXhDZ1wdIBPyfCS4SVgOkNqa9Qjm+SG3jsm4iQxDx8pyMv6Whx3ZBVggJ40SJQLJSA+yirOIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849495; c=relaxed/simple;
	bh=ZafInEDb0XvZcBle/B3yP/da0xFDIROyRvCkN9TXFGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nabm1H5burPn/shEiKXErkv32LZORye5f2JC+MbZFobkbCWU70WOKBoolCKMuONiSmDHkv6pfWV60W4DP5qRCiKUAEfGKKyz1n94fWmVhO263giGoG45JxYKD3d2Dnalfx2EoGn0e4wNUqq9sKmQHOMj5gOyzsvHmFImqWXfYhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fl07+xZf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fl07+xZf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso243405966b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729849492; x=1730454292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV3rdZguaCClNEqVe787I0Vt/8PGTZ52ISSdbaUDUE8=;
        b=fl07+xZfAB1VcddLviq6Nf/eZBWnkA6V+CjTgFj0eD/zTuOVGsxsp+TC5oXAjXAaaN
         kyIJ6yd6qrhv8lCbnjV3b4jRMfF+SNdMUHJkY92XyI6LvMoFvg3HWEtmkuUmsR6xLZxV
         qc4NLTysRAQ+PNX9MutJId4yftQHjWQYRLi17ttnzuNyLRkZjbJkPv4qaJVdX3n+csA1
         RIyRgjoCQ6EbS0HVc8g0N9vkUj6j88xX9pjjlep7cUS2WZ6fXhGL4ZK+B94GebVxqhaf
         i6tF/Acxuqzl0bsExl+NQDRJMa9c7ScqCTt4y50qA3m2/qvIE7ccQ9sG/l/MKTOy3PFP
         Hh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849492; x=1730454292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TV3rdZguaCClNEqVe787I0Vt/8PGTZ52ISSdbaUDUE8=;
        b=ce8zIYwJvSG4OlL+kUuRH/MM1LaXzDPjLUq4LvMkAwOhyyx9/hdm+XayEyAhWGKqMl
         vFYtyKvPBDpYZlz0eRZZaqRLWeObGkq/MPwNcARwmCZCJpNN6hNdBNtOFewLIrun6FQ4
         2rCcDoem3YrIvsMWVPWOPLHzclDAKEWbqA+SMVxP3VXIQALhq0X20GOTNbjB3uHR3qL1
         0H8/44Luv/EbLnT5Jyhf5s95Lj/FJbuK2QIh/fv/zJGYQArkKJFoXKTLa2y7hEmxNb/O
         5HXbTIrBITp1EUhhD8ydV2rbmwxf8kdY+oeSQ8LYhaS7Dw63w9dDedXkhF9ZbImYDQAu
         7tVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV08OBpCDZRpeK6+ow8tFQrYXskWgY4PrlXF+5x8ZsPKm5tsq5R7nhtoCmwSDFAYrI4j5TyjELtc6M3qC8s27u78w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQaNHNd8Be/iKxUDfwwsxgiJBsBJn8+laTDV1d3Ejlu1a36/ip
	yCaTMoDxL0fN/JHzMosTalWT8hcLOKxkqdlIOv2987DQznCVwbCk21HgfnN9Gn4=
X-Google-Smtp-Source: AGHT+IGvMaHhp0yBItJqMrGnh8WZFy1BosQ2JJpGEG7L5fd6mP/jhMEMMgdVrFkbCial7NwjOHcdTw==
X-Received: by 2002:a17:906:730f:b0:a99:f8db:68b2 with SMTP id a640c23a62f3a-a9ad2730a9amr471160666b.18.1729849491793;
        Fri, 25 Oct 2024 02:44:51 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029511sm50430366b.62.2024.10.25.02.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 02:44:51 -0700 (PDT)
Message-ID: <c889ceae-f605-49e8-8aa6-e6d7fc78a641@linaro.org>
Date: Fri, 25 Oct 2024 10:44:49 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org
Cc: mst@redhat.com, javierm@redhat.com, tzimmermann@suse.de,
 bartosz.golaszewski@linaro.org, luzmaximilian@gmail.com,
 sudeep.holla@arm.com, conor.dooley@microchip.com, bjorn@rivosinc.com,
 ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org,
 kernel-team@android.com, vincent.guittot@linaro.org,
 daniel.lezcano@linaro.org, Jassi Brar <jassisinghbrar@gmail.com>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <CGME20241017163705epcas5p1ead3359adb4da5eda00310f93a882971@epcas5p1.samsung.com>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <0da701db23d8$ed5684e0$c8038ea0$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0da701db23d8$ed5684e0$c8038ea0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/24 5:47 PM, Alim Akhtar wrote:
> Hi Tudor

Hi, Alim!

Thanks for the review!

>> diff --git a/drivers/firmware/samsung/Kconfig
>> b/drivers/firmware/samsung/Kconfig
>> new file mode 100644
>> index 000000000000..f908773c1441
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/Kconfig
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config EXYNOS_ACPM
> 
> This looks misleading to me, as you mentioned below, ACPM is a FW which runs
> on APM module, and 
> The proposed driver is a communication method between Application processor
> and APM module,
> Which is via MAILBOX.
> So preferably EXYNOS_MAILBOX_APM is more meaningful here.

This seems more accurate indeed. The design document that I have refers
to the protocol as "ACPM IPC", so maybe I shall stick with EXYNOS_ACPM_IPC.

I'll also need to prefix all the definitions in the driver with
exynos_acpm_ipc_* which will result in long names. But I guess there's
nothing we can do about it.

Cheers,
ta
