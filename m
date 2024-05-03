Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE0149C57
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725406; cv=none; b=j6vMd4R2t982Gl4hLrT9uKLlU98vd5YaqguZk2ylNXyBLHqVqJ7m5gy4nWnRF859iogAwGcyqK63i4ZIBA7KoXWowOEuCSeslmZyPAJzT6M2FqfXHkE9GvSdpO+xIS6XPUu4MTQ6+txQyHpRTSiGCSeLbFkbVF65++s5EhvluRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725406; c=relaxed/simple;
	bh=4pd9FR76H9FmtKzHQvMBHKJMsGhMuFRTOOdXAn5sHB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+cqJqeKqvqgF5WSxEMdDm4Oyaiamn4kG78KQ8CqpArulb/yMSKoL69C74LZ2JEBYtL7mAHMpaZIqzj5YRC6OhccTnaXMvtvHTmEC7KIV+eiitXnZXayqZ6GOTsRJ4hBJihavq/AdgIGUN3Sa+9f2GxNGp82bQQyYfw6RZTRG18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1qIG7fB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1qIG7fB"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f57713684so1631961e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2024 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725403; x=1715330203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMMjGM56vW40JyfEhgKXdQgJQpR7USoxnvhtoid+W4M=;
        b=O1qIG7fB6mbItxm+8eOqTyS1S3X4FTvDziILYn1W+7u+muiVhwf+ICO2mdOWEqCZ+M
         13HVBV3n1IU7D6eE6KT6FTyHpR3Zilq0bAgcLDD8Nd6Qe8A/k91TcpLh/H34COkHScIM
         4DlzC49C5nXqYW7BsAqiaPN+Ml6oEUzw3Q75cQ7Mp34JmjNVG2lJ+CukEewwjNxHvNPd
         z26QiUL1a3qd3zC6fxvYrVCwuc1o0ouuPYEmu/4q1HiRoNpRYi7QUe/o8w1JBcNwOeSM
         tGOdmONB3t3haFruwNsdHSrwT5xOhlPLxZdk76/dcTyg1duWwt0P6K1AL7TG/w0wiNkZ
         PRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725403; x=1715330203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMMjGM56vW40JyfEhgKXdQgJQpR7USoxnvhtoid+W4M=;
        b=T5kWyHs+4pS5jgPh7TPETC11poxr5hD0m4Ir/2GHBVkXPrOpbo+BPLjr4/ktinbQvN
         27CYMS5LLX3Uy6et1blZt1vvIa6DUkUYLfBzXSDtCSk6HdszUBv8ti/ZbutJoyfZQTR7
         OIHUeJbIaydf/iNuPXxoXohJ14kRdQpuHnaRRzlNloQ3faczOuAPlSzmCNrce9h1Aqhd
         kMw4pB/K7VJzpaLvzottv/t31RQg7BYYT20VC/czqm8Aa3feepphdEofPirQF3uWwPTi
         IcARL190MXhJqZCGCi+lePRbmsikqrfHG1m97L1iIh2oyLcO1wZJTDmXTuKUbTMvdRPS
         EPSg==
X-Forwarded-Encrypted: i=1; AJvYcCUKZxJCaxE+dl+h0znTcjCQcqu9MTe/Ddsp6fJ39dPiPFC31B5L3fYy6nniQ4hmDLyOhS8VZglVA4r0leh7bkCDIYutecTH7YxINNnR0ftMN3g=
X-Gm-Message-State: AOJu0YwJEi34Q5c8jXZuwbKebegufQi+dLuQGGWuB88txmiLsQPWETPV
	wy5RESVohdXdP66jyqIO+wX0MIDI1UuI8hrVWm3Tc10gMc6x4RKtE7oZXiIxEwM=
X-Google-Smtp-Source: AGHT+IHq9bpEudJd3CENRCrNYUFdORPTT+c1B65e9gA+aBUpZ+KGL0potc7nqOYnIr8s8euo+S7tgw==
X-Received: by 2002:ac2:53b3:0:b0:51a:df97:cc8e with SMTP id j19-20020ac253b3000000b0051adf97cc8emr1393011lfh.4.1714725402779;
        Fri, 03 May 2024 01:36:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d5486000000b0034dc4d7cfbfsm3179695wrv.48.2024.05.03.01.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:36:41 -0700 (PDT)
Message-ID: <cd7f246f-69ec-4e4c-b0f5-3ed2024e214f@linaro.org>
Date: Fri, 3 May 2024 10:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: specify empty clocks
 for remaining pinctrl
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
 <20240430-samsung-pinctrl-busclock-dts-v2-4-14fc988139dd@linaro.org>
 <498ff366-b247-4586-b02e-5cbfba5927ac@linaro.org>
 <2287494109b15960db7de6217ebcf4612a8daac2.camel@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2287494109b15960db7de6217ebcf4612a8daac2.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 12:44, André Draszik wrote:
> On Thu, 2024-05-02 at 07:51 +0100, Tudor Ambarus wrote:
>>
>> All 4 patches could have been squashed in a single patch as they do the
>> same thing, but I'm fine either way:
>>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> I guess the patches had accumulated gradually over a period of time while
> more CMU support was being implemented.
> 
> I'm happy to squash them if that's the preference? Krzysztof?

It's fine.

Best regards,
Krzysztof

