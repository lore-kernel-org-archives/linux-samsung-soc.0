Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDC235C07
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760863; cv=none; b=OJzkpatGN8ROYh7A13pz2AXQ+duHj0gGD+m0RQ+sl9caH/2UZRlAyKlZk5BEAp2xVOftTxtJKB4LwuHyggRaePF2P12po/dLPbO+FmAHhdOgTbGOfUZJix5B5p8eF2j0pcmAilXV7fBDnrkamRIhpfURLYwA4Lrs+1S3knYLtDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760863; c=relaxed/simple;
	bh=byGk+WV91vg1IroZxWCBoXTAvtlQ4F8Ubeg1Q7ZsOUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObISiRjME77scZuuJvTj/RxsgEns3x+O+IdrChXR2tD3dMJ1ZtUTM4dhM6/DiyXTNLAkbDdVBt3iXfDiW9QcpxIoF7Ji6LdmdSlpcImEWpqBsVI4ZvmbKT2h8iflsYKwFBTJ81QiVYoAp6YuAIdRL/oYWiHLpg0nrYUcgXgY8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIDTaIUj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIDTaIUj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so41394675e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736760860; x=1737365660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mcn9xoOYu8W8aqg79TZi7MJEchbnlTtS4s5gSCJbvAQ=;
        b=iIDTaIUjDa2oDYf6D9zcjzcAcS97vxsWGY65S3MG95OnCGV6MBr1O2H2PGbYoE75sq
         Gq9QrpSJVsEvZ/ov+/LEIlUz4b9IsgXN3mHDW/Co/2oQijiriwmP+rpo8kLKjC3Sp9qR
         F0yCHSn8cVGZZY7eBs2/LxniR/4JWXEM2RVxDnhzqLSt7HFcmQhomnS+/3uw4FcSw1uW
         0AuF0nEy4HweV2nbhFGBBChXJWZLzUfN/hW9SkV48CxjvxJUIpEx3hwcw8Z5wlWqnR/6
         FvzR1ncrEm21gkoEVdPGWyT6fx3tXPJD047/llC/WwQ83LO0XZsP9/wupj7NqIh1cR3t
         Q7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760860; x=1737365660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcn9xoOYu8W8aqg79TZi7MJEchbnlTtS4s5gSCJbvAQ=;
        b=oCwqcNc8MgGXjccNosRupOK48JkZhYEqosQwoqqMBHlXI6wdi5JVFNV+uTzp8o2CSq
         3hxg45GjQ5wLlH9DvY0tq/0SEQWJpIQrvknWcd+UU5JO+S479He1tE8bfvTHQivRA0+T
         i3GpMFhZVFkATp9Urp8josnQybfVS8cz/2KcU6qHk43NioUaNhDwuTINzXcHOF8ursOa
         pB7IPHNSRoH+oj1H1nvX6iLdz8ywEsjumRNB8svPEtPL8QLWi0kUPYWbykWL8kM8lrHE
         xw1ZX/RKfTcOy79mmXO8XK2WZh/c09Up64I6l+ZwJgwjaNR7tzUCTtwFeLAoO5jn19BS
         xdDw==
X-Forwarded-Encrypted: i=1; AJvYcCUm42afiS3lo6tddy1QmtpZEFUrwyIJ9QevtxXxLFpXSrRjnpoXhQNrzinO6rWZ9Gp2oTZjhEgyQQ2Byo+5fOr34g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOqLks/pxIl9MkGyNm06bcDZjf88nytodojKh8a1siJUsEszRv
	qEUv+r4dQguCS/So8I7Sr6jRtGmxzQZT9aguxJvNSRzXsUX/E2iCe0hVlzPqa74=
X-Gm-Gg: ASbGnctknGyG6DrZw21zT/7NTWYGFPJFW5qY6nS2QXyc4uLmKV63u/xHDjFMVZgssd9
	NvjnXjgLCgixG92fWjwfn551sA8lpaN52zWi6i2wmoD2CKjt7TTU9P/R1GwDef8buKtuNbWsNMq
	JVUxkAQPTuabTP3T2Gl1W+oesJfJurUprAaKUEvqizZ/i2v+jq9rM8QzJ4bwHTDGO3jb8gR9bJ1
	q22kFuuVzeJrgSvXS/scL9/o44eYNJcD2Qb/2NZxFWQsBbChCLvSJzX1FgRWpE8RA==
X-Google-Smtp-Source: AGHT+IGFH+x4nfdStxwZGkAyFCJvnk1LXrp25GiWHQEWRueM3fKqk/Y3Ijad7YFj8i45jHfeLn4/VQ==
X-Received: by 2002:a05:600c:1c8b:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-436e26a7e1emr197156785e9.15.1736760859971;
        Mon, 13 Jan 2025 01:34:19 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d69sm136986415e9.30.2025.01.13.01.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 01:34:19 -0800 (PST)
Message-ID: <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
Date: Mon, 13 Jan 2025 09:34:17 +0000
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
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
 <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
 <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
 <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/25 4:59 PM, Jassi Brar wrote:

>>>>> Then I updated the mailbox core to allow clients to request channels by
>>>>> passing some args containing channel identifiers to the controllers,
>>>>> that the controllers xlate() using their own method.
>>>>>
>>>> This is unnecessary.
>>>> If you don't pass the doorbell number from DT, each channel populated
>>>> by the driver is just a s/w construct or a 'virtual' channel. Make use
>>>> of 'void *data'  in send_data() to specify the doorbell.
>>>>
>>> I think this introduces concurrency problems if the channel identifiers
>>> passed by 'void *data' don't match the virtual channel used for sending
>>> the messages. Do we want to allow this?
>>>
>>> Also, if we use 'void *data' to pass channel identifiers, the channel
>>> checks will have to be made at send_data() time. Thus if passing wrong
>>> channel type for example, the mailbox client will eventually get a
>>> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
>>> misleading.
>>
>> Shall I still use 'void *data' to pass channel identifiers through
>> send_data()? I'd like to respin everything.
>>
> Yes, please do.
> 

What shall I do in driver's of_xlate method, always return
&mbox->chans[0], as bcm2835 does? All 14 doorbels will be serialized
with mobox->chans[0].lock.

I could use a list of channels in the controller and provide some
get/put channel methods, but the virtual channel ID will not match the
actual channel ID that's used for communication. I'll also need to
introduce channel ops, to put the channel that was acquired via of_xlate
from the list of available channels.

Aren't we better off with the mbox_request_channel_by_args() that I
introduced in v6? Or if you think there's better option I'll be happy to
implement it. I need an agreement on the overall idea.

Thanks,
ta
