Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2782C1E894
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705654568; cv=none; b=hpnIGrdsGkl9pV3EJuNRjtQiAk7Rnfc4IYLZeQ3NlXzXjj184ZKQ3K5rIT1XXzVV1weLCkpGCZ8LPxb5THT5UNYGto7xtDbFfWVug/IhJa76LRjFFYODhWEFvbMSuSuThLiunSex3NPqlIJmSQS9PmIYs2G0B8QXWS5iiqGgGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705654568; c=relaxed/simple;
	bh=A02zxz7byKxzPrYpMPQTWD4E7H2WLd2KSeOWDy/LnWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INNr36OrKtmES2cRpSDy0li1ewseQD0NyrPxacfP3dyCXug62C4cNEBZVZi39uQYTlAqfNcJB+dDaUPoP46UZwaV0VBmR45nZdUucy5avJMlTtdz1gfjGxHbT7fxbfr9Z2049SERAIwzu47vSNOjiqlWj4wUgk55Kr2jDlN3aMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8gXkrSR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8gXkrSR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-559d95f1e69so514787a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705654565; x=1706259365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+5iWpv4RNX3aTa2gciiFG/5iPbkcLKE4JhyWvilR7g=;
        b=S8gXkrSRUbak/5l4dKKQuewxG+Z+Jc9KgdMYABYJ9jn5odBDA43SY1y6gF9kvjGQE8
         /CXVaCTszbflaZ5AF8TI7XJimNBF+OiftwEJwzmJqnn2ITVwRYk77pE8nUU0u9Rim3g3
         5yUeqrbb70EoOQGOoBdA+yV7jmmEB+J2/eygrOkIevtgreeRk9bhe6pOsOJPy81GaImH
         i0Mio144Srzt4g57DXcqIA4dKn91Wyoxeu036LKdpuv3EpCcEyhZNc4lszIVjvzY3MgU
         vY0kd4fgTRfgjj7776LUmdu6RBmCWc+5lAwfRVNYH97cgJzEu2uhDn6EI8BBUjaLgKEP
         t4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705654565; x=1706259365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+5iWpv4RNX3aTa2gciiFG/5iPbkcLKE4JhyWvilR7g=;
        b=oOyCYKoLUzxcK+pfmUyu8505FjRIxAaSyafVmHkfXGOPqtdpSGB0LZGcoV0n0q1/HP
         aCyNVQAJDd9zJK2+7FyNt8wJ6z4GFr+sINLQuKzwP/PCN/sKRIfO4IWY/tw4OoWlYhVy
         m7p6xJDLxxbefIT7cQGMA++mN04qGHLWmeHnW0ZTd5iZhL78xAi4GE2V4/sWatAYbYbH
         6CbuLYmABQjUzIIMxpnuAiWuOyW5z4ySmckhN9/pK6XCmeIvlM+QG9F6dTW81TZrHuxp
         pGiwb2MUjjX9gpDH7+3zptKgre5jZ4OgSgPRRxT0tWCmMQAyhUdh/rbs3Tabu5b5xlo8
         FMkw==
X-Gm-Message-State: AOJu0YxzWlQiwCOpdoSiq+Q16MK1l/JCeyxAf2pRRQy6WyYg4/7ySwih
	f+O3VOeyXVsZRbRbEBKA/tBI3PbBHxlOaiOEK76ouI5WoS7+G5wTi1s+V+EBew8=
X-Google-Smtp-Source: AGHT+IHPyUvK77qcjbOh8LTZSP4vhj178tjGxGpiqTKDEbcDysDbZxH0AgFAPyPq6BOhC+rhntL1rA==
X-Received: by 2002:aa7:d890:0:b0:55a:780:2d8f with SMTP id u16-20020aa7d890000000b0055a07802d8fmr1153845edq.56.1705654565265;
        Fri, 19 Jan 2024 00:56:05 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ek7-20020a056402370700b005594ad2235bsm6233549edb.12.2024.01.19.00.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 00:56:04 -0800 (PST)
Message-ID: <76e1dc42-cabe-4925-8aa1-c8f733fb36a2@linaro.org>
Date: Fri, 19 Jan 2024 08:56:02 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/18] tty: serial: samsung: shrink port feature flags to
 u8
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-18-tudor.ambarus@linaro.org>
 <CAPLW+4k091328krLB_KdHyobG-pR--Rt5WaN6c1ccpgdV8ry7Q@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4k091328krLB_KdHyobG-pR--Rt5WaN6c1ccpgdV8ry7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/16/24 19:03, Sam Protsenko wrote:
> On Wed, Jan 10, 2024 at 4:25 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> There's a single flag defined as of now. Shrink the feature flags to u8
>> and aim for a better memory footprint for ``struct s3c24xx_uart_info``.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/tty/serial/samsung_tty.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>> index 5df2bcebf9fb..598d9fe7a492 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -90,7 +90,7 @@ struct s3c24xx_uart_info {
>>
>>         /* uart port features */
>>
>> -       unsigned int            has_divslot:1;
>> +       u8                      has_divslot:1;
> 
> But that's already a bit field. Why does it matter which type it is?
> 

If using unsigned int the bitfied is combined with the previous u8
fields, whereas if using u8 the bitfield will be independently defined.
So no benefit in terms of memory footprint, it's just a cosmetic change
to align the bitfield with the previous u8 fields. Allowing u32 for just
a bit can be misleading as one would ask itself where are the other
bits. Between a u32 bitfield and a bool a u8 bitfield seems like a good
compromise.

I'll update the commit message with this explanation in v2 because I'd
keep the patch, it makes the struct look cleaner. At the same time I
don't have a strong opinion, so if you'd like to see the patch dropped,
tell there, I'll be fine with it.
