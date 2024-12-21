Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04C78F45
	for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Dec 2024 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734763533; cv=none; b=L67D6FtDzSopOfHw3Nxu8y2P4lHmp43hl3gGDMhy9FJM9chdyWvW0lWmrOtCF3kluKcDfFOPeFPjmQuSo10DY+JOI+fH2vYV3V0MCOAzCPCSVCtnBdDQ0Obr1rFjjikQciv5xLe+dfUp7FQf616gZwEmDGrUBMHqiVN2a5z3upE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734763533; c=relaxed/simple;
	bh=V0RVyuweq21SL5gs9YeAt3Dl+Hes3ezKihJJLa1DyIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIDCqc/cl6DM4QY2XuitOhhCV01RnFxG/EaSuOsWJ4Jrz8XXtE5y/DkNL4WGAb8PFmdz1DlikmRb91Gib4P9NrTIVD39N7pg4Y7lLK1+Xo889WtkTajxtdoUynj4yv78Kh7ttkr+5nSv7pHcxrM0Ri3FjU4BQtReLC2FITeBtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4pZUstl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4pZUstl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361c705434so19112105e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 22:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734763530; x=1735368330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPQisv984Skp38aX3x/aVAIVLxylAjAYHdHkoJQnBu0=;
        b=j4pZUstlrB4i2u4XOws9m+LhPj2emSHYnozbx8aMgfRcFlTwFB91Btfn/EHcOF+UBT
         pYv7T7LQd1ILslGdjCEL/Kax8s+YztBiREpZAVfEyn0o7WH0KwWoYieIiGBaKJOOlnpz
         7HMXOe9dkyiMm5DH0MoAAnrMlRs4dHazWnCl0Cfy2xXWgf1wxtYAmiwOjxxyuiPlZdSH
         ZqNIUPjdkojaG4SGWoEm+0SS/hYSzmthirXl6ac8KpT/LLbNj7mCb/Zj1egyfHH2VNw/
         vtpGb3ZcqL/tUjhej4AZyzYQfdpu645N3Go3WBfsgx34xd5WqFR5yrW2TW+G8zmkQa5b
         ePJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734763530; x=1735368330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPQisv984Skp38aX3x/aVAIVLxylAjAYHdHkoJQnBu0=;
        b=NVfwhoWtxx/JW3JtSPOED0Z0L/d0YMrynt9ikhaxyXZ/gMEj0AeyiMNJjvwOBkzNbK
         0s94OrlxqCGch7h9zfJnjE3F8WGSQzrQZH0950h/5Q0R/DrTMiXIePU+RLPaTyH/CXfA
         nCVCBiPhUENFge9+WMuIeotH9wHizl4QKqYnuTd3QcwDSoDsGV/6RN7yRmZyck7hHonM
         CSsaOSuOdriwOC8HfKE8tdLSfNCkPgJ3pFEgSMieyMR2ScFTY0iweCZkTHf32UEI0xB5
         NyjRrid+WbeW9gNB8J9l0akjInPLJdMzbG/bx1S24AnMFB+wgMllcA1C9DrNDd6UzbFD
         5meg==
X-Forwarded-Encrypted: i=1; AJvYcCXdqEIrw4lh+zDGQN7KKulq8E14VeLNDhTqK3LY1knC05BUuFkO0jCa+z6fxtxDG/wikq+aEE5p3ECyUUQf6wkojw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KsTCD4GB6n77C70v7Ovqe9DTA+XWIqxhIO4/OzsEde9hYNqr
	eGJXa/7s+4OUx9JMXqOvGl0eGLFtjNfGa19lw6QlLpyx/3cLpxLxCnDFfk5tfjA=
X-Gm-Gg: ASbGncvTvOO5Dq2FYQW7Q99LAldjjqD+K4TW+hCF8g7h4EwVniQ8NgqeqGMReH+xqvf
	V32JQymEUneKiDATUAEfxx8ImESGC34VD4OKxnT4lC371nRWLPXudlZpv8ReTg+VlWjbR8F+fRs
	tU2ziSiHugNlKb2gzeuJHEHIaAhCDtFwNehwwmIqobNA+EVEhvfErT+blKnCdQ4uEa9O3VdqjVX
	8aX+my69CXKB/xLUpjhXJ08oeuc4odhtNDvx3qUBFFIUptlGfXz0HRKrfaB9r04
X-Google-Smtp-Source: AGHT+IHd7PMiz4uKlhm1NQRKgVjjpCH4CEyjHfmUTjmofAVFid+yDl4ahHk+jtqJk3h5IK5+ah+FCw==
X-Received: by 2002:a05:600c:1c21:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-436686463ecmr47004425e9.19.1734763529975;
        Fri, 20 Dec 2024 22:45:29 -0800 (PST)
Received: from [10.11.12.107] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm66468295e9.32.2024.12.20.22.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 22:45:29 -0800 (PST)
Message-ID: <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
Date: Sat, 21 Dec 2024 06:45:27 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Jassi,

Thanks for the review!

On 12/21/24 2:19 AM, Jassi Brar wrote:
> On Thu, Dec 19, 2024 at 4:51 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Krzysztof, Jassi,
>>
>> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>>
>> cut
>>
>>> +
>>> +  '#mbox-cells':
>>> +    description: |
>>> +      <&phandle type channel>
>>> +      phandle : label name of controller.
>>> +      type    : channel type, doorbell or data-transfer.
>>> +      channel : channel number.
>>> +
>>> +      Here is how a client can reference them:
>>> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
>>> +      mboxes = <&ap2apm_mailbox DATA 3>;
>>> +    const: 2
>>> +
>>
>> Revisiting this, I think that for the ACPM interface mailbox client use
>> case, it would be better to introduce a mbox property where I reference
>> just the phandle to the controller:
>>         mbox = <&ap2apm_mailbox>;
>>
>> The ACPM interface discovers the mailbox channel IDs at runtime by
>> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
>> specifying the type and channel in DT is redundant.
>>
>> It would require to extend a bit the mailbox core to provide a
>> mbox_request_channel_by_args() method. I already wrote a draft and
>> tested it.
>>
>> Do you find the idea fine?
>>
> Looking at v6, I prefer this version... maybe modify it a bit.

Just to summarize for the readers, in the end I chose for the
controllers to allow #mbox-cells = <0>; and for the clients to still use
the mboxes property, but just to reference the phandle to the controller:
	mboxes = <&ap2apm_mailbox>;
Then I updated the mailbox core to allow clients to request channels by
passing some args containing channel identifiers to the controllers,
that the controllers xlate() using their own method.
> 
> Even if you get the channel number at runtime, the type (Data vs
> Doorbell) is static and needs to be passed via DT. You may have
>   mbox = <&ap2apm_mailbox DOORBELL>;

The ACPM interface uses mailbox always in DOORBELL mode. If it has some
data to send, it will always send it via SRAM. Do I still need to
specify the channel type in DT?

For all the other mailbox clients than ACPM, that will reference the
same mailbox controller (same compatible if you want), I'm thinking that
we'll update the #mbox-cells to have an maxItems of 2, where they'll be
able to pass the channel ID and type via DT.

ACPM has its own dedicated mailbox controller ap2apm_mailbox, thus it uses:
	#mbox-cells = <0>;
channels IDs are from SRAM and type is always DOORBELL.

All the other mailbox controllers using the same compatible will use
	#mbox-cells = <2>;

> and in your custom of_xlate implementation return any available
> "virtual" channel. You could use 'void *data' in

Would you please extend this idea a little bit? What is a virtual channel?

In the ACPM interface mailbox client I request all the channels that are
advertised in SRAM, each mailbox channel has a 1 to 1 relation with a
h/w channel ID.

Cheers,
ta

> exynos_mbox_send_data() to pass the h/w channel-id, instead of the
> index of the virtual channel.
> 
> Thanks.
