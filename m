Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABC1A4B69
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525552; cv=none; b=ICrXsvqNIY8APugr+Q93oBt3uxOTMujhtY6r62/l0PhOm9WSPMthbd004aSQ00vq8J5XWcxLQhhhopOXely8MSi+556gukSdoWE16KhIXdTX5+Cv5p1o+ggo37dWnzmcKh3Kti34jyD8W9u2kT1kFd4ncPn36pugE5YiSRRDXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525552; c=relaxed/simple;
	bh=ftEQ7+H9cEWQ8xte9nIlYXCpgu9GBSuDYWHjlylREKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzbNNnT7gZjgHx7SohhM+SC+fJrZsOxUoiPtsQFqDPpX93B2kR95T0fp2YfLutO16zHIm+owwNJrcC0GIVYnqAPCg6zmsdTXBtLGZZapDXiws2pRpGyRicmYcLjxwMhUC9feaRByBXSJ3qRJBonRHIakm+llf4dMh1kUvkXbVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPKKgXh1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPKKgXh1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862d161947so3117921f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734525549; x=1735130349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS7Pk4ioEjURDID5iONvHn6fwf9tn79746Vbx+cJWGo=;
        b=HPKKgXh10VebRubyPF0t3Ku53iW4tRdQ5Q2PY4IAeCeg+ORH+dmFh1bUT3FrML49nN
         SKj2r5OawfIHu+4eobMGQU4G46ei0jTK6MJqYQDJGFMa3GQCorqnmL1dk7utx2+QShJi
         vBvDQzUHej90hZ6ylvi3eAONWhiQCSCRXWEEoFdEwJontgyU8IsAbZvO8SHfsu6D56PV
         wwvoD0Y17P2oGIOX6WZVB7DxjX8R6r5srWvRbPQXqgySRoVEdRCfxY0sENWqXvD85nyA
         JSpGBE4N1tmYvKP1MzT9SrrgzWdeqTX+t42CLmTtWvL5HBuoo15tCq5ZGv06bu/ZFfFB
         /zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525549; x=1735130349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XS7Pk4ioEjURDID5iONvHn6fwf9tn79746Vbx+cJWGo=;
        b=cH4jLgHJuqlIlT2yAaACVq0MCe4gl9v8qjC9qwQp6WAfBMa5xitFtYlEsIE1V8W6Hg
         206x4J0V74w7046X0SiHrI6yAiYNazNucNvAdWOy+zwd571xqmN7yPLepyfzyMB7k9oH
         3dgqFhflmzNGLiK4bwKehm35lmGoPaZy1JIxmMTTmSGoGJRPZjOwxLynxyryF08f18C1
         SMXwjncua6PHBIsFy8tWx21lNljM2cPz1Xtl5Ha+SosixSgleBQk5h6oEgoDeB54phl8
         Mh8wNF8QMpJRbMwLJyUv4N7MxbIFxy2w5MEih9RQFiSRP5cr9NQ/qh9Oh6YqK32TCgCY
         dv2A==
X-Forwarded-Encrypted: i=1; AJvYcCWfAvvCJTlFaPY+cGS9DXvkYfec+yEMkOvvYixnjX+cXau2o+l9UpyDm3sNYl2VgdJqy5BCNu21f2x0kA9PAk1hWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/JNbDZXuFaShcifNw4uFj0NhPzRnajFkGyTEpYBi8wfk7HhQ
	wUZ44aPFLBpjfdtxWBhLBBLeIwo/hP3S2UQaTS0NAxsfpLeM8zQjHUsRZKHC1ws=
X-Gm-Gg: ASbGncvODZHDIkcJXhVLAh20FlXRvpqq7PhHU2mhVuUb4edyBynCAKVZx+WpU8tjYhZ
	GWHy9mWdIlpHujasICuwpixIQRfTvH2Fo5joXMusCZ1ZoPnWVUrEwu9Fj2kssKd6MTGNoFuYUpO
	VqEDDMOxEHbmP/s2ZDbdNiLSv6rm/LumvSIMm5cwFgaINNGS3o4Eo2VWvzXpTO/ZHFuKMqKsNBc
	+ilk1qi6nmkgymYfuBCjFl0O5zWx6hNdel5VnWrDpas4P5e+XhW3FeRIPrgO6rx
X-Google-Smtp-Source: AGHT+IE1tLl1Dcj53ZXYsfNVMFp4tWjeeQ7FoBjB4ziYdja1dw78rhY6qRXK/NpCpyfOFic1A6GtHQ==
X-Received: by 2002:a05:6000:2c4:b0:386:4acd:4d77 with SMTP id ffacd0b85a97d-388e4da5dcemr2689138f8f.44.1734525549534;
        Wed, 18 Dec 2024 04:39:09 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm18961965e9.40.2024.12.18.04.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:39:09 -0800 (PST)
Message-ID: <878f75cb-e85a-44d3-aae8-22ede6e7afde@linaro.org>
Date: Wed, 18 Dec 2024 12:39:07 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
 <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/18/24 11:23 AM, Peter Griffin wrote:
> Hi,
> 
> On Wed, 18 Dec 2024 at 09:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
>>> +description: |
>>> +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
>>
>> If there is going to be any new posting:
>>
>> The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....
>>
>>> +  generation and a shared register for passing mailbox messages. When the
>>> +  controller is used by the ACPM protocol the shared register is ignored and
>>> +  the mailbox controller acts as a doorbell. The controller just raises the
>>> +  interrupt to the firmware after the ACPM protocol has written the message to
>>> +  SRAM.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,gs101-mbox
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: pclk
>>> +
>>> +  interrupts:
>>> +    description: IRQ line for the RX mailbox.
>>> +    maxItems: 1
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
>>
>> This ordering assumes there is channel "2" in doorbel and in data, so
>> two times "2" and of course the same for all others. If this is
>> configuration of one channel, so "2" is either doorbell or data, then
>> type should be the last.

ha, nice observation!

> My understanding was each channel is either configured for doorbell or
> data, but Tudor can confirm. With Krzysztof's feedback addressed:

For the ACPM interface use case, mailbox is always used as a doorbell
indeed. Regardless if the ACPM interface writes data or not to SRAM, it
will use the mailbox controller just to flip the interrupt bit without
touching the mbox controller data registers.

For the other cases where the mailbox controller is used to (also?) pass
data via its data registers, I can't tell whether the passing of data is
mandatory or not. At least not by reading the gs101 mailbox datasheet
that I have, it doesn't describe the SR registers. However, Exynos850 -
which has the same registers, says that:
```CPU cores can use these registers for sharing data```.
"Can" implies that writing to SR is optional.

So I assume a channel can work in both modes and clients use mboxes to
specify which mode to use. Shall I still switch the order?

Thanks,
ta
