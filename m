Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98B1F37D4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Jan 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329094; cv=none; b=m05g2arHtkfTu4xg9Tf1fE+Yih34Q2guKfpojwkh8cor0ltkSvESNSxbQbYNTXU0TnNPkbDl7FFJ/dBXjw5xa1IMqaB+EaToUgTzZC+f/m2K9vw+ObtN3rJP5JaNIuz2CyJC7HFVPE3GN61+9FLPoBS6iTSULESG4T9WF6S3zEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329094; c=relaxed/simple;
	bh=mxY3hHGAPD58iSFHT8K2AinLWZdc4QdiH7ZU1sxLT3M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gMEXkslBlQiwB1SlANNfwsuVUjNqXIbr/twG8Jc7sghqFjuI79aH7D35tq4nLf5Dn1N1eaPf657gajUPmUtPWnXgvOxZj2G21T/w+anGKVg7kXL1MeefxzH2rNBmlFwng6s0CoosLR9AkCwjgYrvN9AwFEuI3zRDkFnMmxXWI+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHn8Wzvd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHn8Wzvd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so6278987f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2025 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329091; x=1736933891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRu1D7dGFpm2VosF+UybZYQj2P1M1/nlzDOmVqBRd/k=;
        b=EHn8Wzvde6aXxRcflEoP7Uuo9Czxfn98+78YepMwjt65CmvNRqQlVfmnY27/PurK8r
         01JU1r84PlU9vy88rTNsZ/beKQ0VhkTOZNrENARCnvubsITYROY92FinSGuIxs8EUpsb
         5nBMJDu6fzzzB69bhoH6guHnkm3SvdphRh4rwjKhzyL3mnZ8CTjLi1x76xe6ItsQnWag
         KNUBaqFmF44BsMOuJtIITUVKqSWbIww6rtHyEbfb+0DOwaSzsiZm8pIjn2/opBkAoEYj
         zHpu48bldcq8bNy1g+IhupdBDGG2mMa8StlcYNS5RiCndlQIVLP26LrmVEtlX5NbH6to
         UKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329091; x=1736933891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRu1D7dGFpm2VosF+UybZYQj2P1M1/nlzDOmVqBRd/k=;
        b=IoDe2vNQVD1bXfMGCPrLKJBdHa6mNEbl48Eo/Ca58dw8JTJOhsfgZIZyI8GFQtwGLH
         Th8Gmpve12prWGgNhvYtFY+t4oWM4zzfcUbhp7wkoM3E1gERO/2mY4wllCVOalwvnexN
         ScL9VtohkSVy38ZpyJzpePlHRWbIX4OBsRCoUFbAWlVVkpJviq4c1EfhmEUV71lOGg+W
         /srup3dI7erVPd6GfDAQUta7HIVT3DHCo93AJzfxJzCJeIn64qNTqyyHFfS3K+yOCy8o
         eDRGHJGQU2g2bFA1NmZ/2YCFW/C+GilyIsXAa3B110lvoCHbcWaxFdi3WfylUIL7acI+
         M1sg==
X-Forwarded-Encrypted: i=1; AJvYcCUg3QUXhl6b0QAHDXCN5lWEvZ+UKPWl/8g3+CFiaa6TFS2qDD5AqWDyH4A/RiJIS2GDq5Yi//qTcuGJC3oGIMi4fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHodlnFdiRi96ZlfuUXfD+7AcZar7OFmWQjQvkIvuiYRljm7g
	0kdOSVkzFZzwdyMId1Lf3sndglO5iOuzSLUuWjkZ4Gx5CVHc0gAkB4GgFxL02vI=
X-Gm-Gg: ASbGncsJSSZFqzwFBm32y1lyWBv/FY/P1IYuc+kXrC0gEutFHRILEwTXK1nq/QAGoKt
	VpU1Cwn8wSeXDM4OTSpcNzImabkdctRa8H3gUtU4QFCj54NtM6r0ut+6nDmm8uPADE7KjxhDf/0
	+69TFI0V+xUtx+1InmdYX9rSZttORr6vxaC/KsHUFpElgfv/TezjRWR/yjrwA3kGhG1TefUr6x9
	6BPCtX+RrxUNFuik/6A0KjK/ebe0JqgQ+Udibk9Dnvemo1T/MKmjsqtPai/RpBR
X-Google-Smtp-Source: AGHT+IEgum97jZJPYPy0T8bJnOriFmAqzwKIgHxRt19SfRXXojRd9i53LcCXOyDAxP3gnyZZAo45SQ==
X-Received: by 2002:adf:b1dc:0:b0:38a:88bc:ace1 with SMTP id ffacd0b85a97d-38a88bcadc9mr703276f8f.34.1736329090756;
        Wed, 08 Jan 2025 01:38:10 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd1682e4sm23612385e9.1.2025.01.08.01.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:38:10 -0800 (PST)
Message-ID: <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
Date: Wed, 8 Jan 2025 09:38:08 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
Content-Language: en-US
In-Reply-To: <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jassi,

On 1/3/25 9:57 AM, Tudor Ambarus wrote:
>>> Then I updated the mailbox core to allow clients to request channels by
>>> passing some args containing channel identifiers to the controllers,
>>> that the controllers xlate() using their own method.
>>>
>> This is unnecessary.
>> If you don't pass the doorbell number from DT, each channel populated
>> by the driver is just a s/w construct or a 'virtual' channel. Make use
>> of 'void *data'  in send_data() to specify the doorbell.
>>
> I think this introduces concurrency problems if the channel identifiers
> passed by 'void *data' don't match the virtual channel used for sending
> the messages. Do we want to allow this?
> 
> Also, if we use 'void *data' to pass channel identifiers, the channel
> checks will have to be made at send_data() time. Thus if passing wrong
> channel type for example, the mailbox client will eventually get a
> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
> misleading.

Shall I still use 'void *data' to pass channel identifiers through
send_data()? I'd like to respin everything.

Thanks!
ta
