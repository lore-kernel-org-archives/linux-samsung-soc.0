Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ADC21A05
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705506112; cv=none; b=dpi+SMf2pC0ILqMiPEUIsVMX1zVNLvnQV7cCOQ1FEiC4cYZ9p/owVFDXUwL/vgeFS4JgTSm8GxmIf5oWYRct9ts39CDBJP8as/XezzZalr4ycmGRqThs/KmTIJg00PN1jGfIM0DkqYtuYAbhzuiCbvVCHwMMTD8ptEXSjgVv//k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705506112; c=relaxed/simple;
	bh=vHheadTKQnQTYXZrVwuGynn/8EJeowYAzDnoEsdgR20=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=W48mY9PY6EeYs0Hfo7RYgW+nwEOiMjNyoixPW5ImobW+gnh/74SaRLfHU3gOLRJoUE8R5kR0y6yOud+bpcPCQLcwzwVfiQtSK5BwhNZY7y9Us/e4R15WhpL8N6RkterJ9B49wsOPf7YK8/SsOAvpWXpvHlDtSgYTf6cdPGsxrBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbZPYEKU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbZPYEKU"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2dc7827a97so405217066b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705506108; x=1706110908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fQy90wubVF9sUgzIcE4yEfTB5Nsm0VF+3ircigyYGQ=;
        b=lbZPYEKUjyrplCDkOIMGTAHXfTVuKWQfPUYmPUPNusA/MPMljYyMX9KMhYaFHmc/L5
         GLufz+L2KDPkP6+Qbymg4ef8g3eQ87DlMnSYXgKG4X53umV2wkk17s/zwuazy7kWYx1c
         I05bqX6DODANH1K9mBZBesATdbMtdY4pncPJaNo4dr50Ey3PXRC/aAZg3ugcCZL0UHAo
         5s/zR5EcbQGAg9HHINJTWProwDhKh1xedxhwcSaz5tfekv245+J10CgUiicOIPfW4Bsd
         rYvfF9JMrjO3jtSVuUwAjZMctxt8QiCXsBcSF7KZG69MdaWCvRHPhEfZotYQDguT2VEw
         kcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705506108; x=1706110908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fQy90wubVF9sUgzIcE4yEfTB5Nsm0VF+3ircigyYGQ=;
        b=m17zsgQOrtq19+ST2+K2HY4nk5QRXv+m62bJ5rB+lElJq6wxzMPWP3U8stHkDoX/4j
         UclzFw8EtCv9J7rU1vHnri/0Dg/fpMxA/p0VPn26QzlijEyzgiwh6U7H0TtkKUDYGAgH
         gnhwbuDV6M1T50oXyELfcsHkP3XkiRo12Pdb7O7ZDTyFVzJGHc8xYU0WyYFUbDrC58xG
         vjL84g2XFJH/AcK2s+e91kgY32qB/8SQRUQNCPLoE02m4GoKfONzxL+efEvUWfeBtP0U
         wrz6NVkm0g9eehnKo6yt5UDam/ABUktQMLVWy1ZfaotJvNTbeI/sn9F0/znUUQGV/9sV
         Uj4w==
X-Gm-Message-State: AOJu0YxJEuLY6i6bDziUb8xQA+zKPq5YwXDMqMSdCeP3d+axbs1cKRt8
	Lw4K7Z+HdQrvO74+cQi/ehTkoTM0R2fHVg==
X-Google-Smtp-Source: AGHT+IH6sUZYoZLyrdAyeTyHowfW9FJUNk/hfgFlCDe53Ai+kvCACnfWXb82GjAet9JFj6uuOuoFFw==
X-Received: by 2002:a17:906:a08a:b0:a27:361f:f604 with SMTP id q10-20020a170906a08a00b00a27361ff604mr3995772ejy.47.1705506108050;
        Wed, 17 Jan 2024 07:41:48 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id wr8-20020a170907700800b00a2e08b24ea3sm3240579ejb.174.2024.01.17.07.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 07:41:47 -0800 (PST)
Message-ID: <6b6b1512-18a2-48bd-b284-8f4deff84309@linaro.org>
Date: Wed, 17 Jan 2024 15:41:46 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] tty: serial: samsung: don't compare with zero an if
 (bitwise expression)
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
 <20240110102102.61587-12-tudor.ambarus@linaro.org>
 <CAPLW+4mKBwsc9VLrGTd2k6d0n-K9TZAjH6M8trcK3Av8TQ2Ngg@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4mKBwsc9VLrGTd2k6d0n-K9TZAjH6M8trcK3Av8TQ2Ngg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/16/24 18:38, Sam Protsenko wrote:
> On Wed, Jan 10, 2024 at 4:24 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Since an if tests the numeric value of an expression, certain coding
>> shortcuts can be used. The most obvious one is writing
>>     if (expression)
>> instead of
>>     if (expression != 0)
>>
>> Since our case is a bitwise expression, it's more natural and clear to
>> use the ``if (expression)`` shortcut.
> 
> Maybe the author of this code:
> 
>     (ufstat & info->tx_fifomask) != 0
> 
> just wanted to outline (logically) that the result of this bitwise
> operation produces FIFO length, which he checks to have non-zero
> length? Mechanically of course it doesn't matter much, and I guess

that's a bitwise AND with the fifo mask to check if the fifo is empty or
not, it doesn't care about the length, just if the fifo is empty. IOW if
any of those bits are set, the fifo is not empty. I think not comparing
with zero explicitly is better. At the same time I'm fine dropping the
patch as well. So please tell me if you want me to reword the commit
message or drop the patch entirely.

> everyone can understand what's going on there even without '!= 0'
> part. But it looks quite intentional to me, because in the same 'if'
> block the author uses this as well:
> 
>     (ufstat & info->tx_fifofull)

tx_fifofull is just a bit in the register, in my case BIT(24). If that
bit is one, the fifo is full. Not comparing with zero is fine here, as
we're interested just in that bit/flag.

> 
> without any comparison operators.
> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/tty/serial/samsung_tty.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>> index dbbe6b8e3ceb..f2413da14b1d 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -988,8 +988,7 @@ static unsigned int s3c24xx_serial_tx_empty(struct uart_port *port)
>>         u32 ufcon = rd_regl(port, S3C2410_UFCON);
>>
>>         if (ufcon & S3C2410_UFCON_FIFOMODE) {
>> -               if ((ufstat & info->tx_fifomask) != 0 ||
>> -                   (ufstat & info->tx_fifofull))
>> +               if ((ufstat & info->tx_fifomask) || (ufstat & info->tx_fifofull))
> 
> Does this line fit into 80 characters? If no, please rework it so it

it fits

> does. I guess it's also possible to get rid of superfluous braces
> there, but then the code might look confusing, and I'm not sure if
> checkpatch would be ok with that.
> 

I find it better with the braces.

Thanks!
ta
