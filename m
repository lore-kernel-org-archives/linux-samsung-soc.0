Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E0414373B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Aug 2024 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843095; cv=none; b=T/WHW9Mr9/BUjC4Vu4NlD21zwbM9xGiUqPL6koMrkAESyJxtOoFAkatkvfYCCOVJMV5/zN8JNWIi1RubikzWlqdMiRNQHGZ31ZYn4r5MxO8zN8HztkoNHxxY8KN5IH5fw5Si67f/Qpn8On84M9FO73CHuXjvu8aDTUVfMvEat0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843095; c=relaxed/simple;
	bh=liTwbFtZAMa0hVaE58YSXi4Z4fdL6DrvLF0V9N6ShI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgTGFavTa83m65JHblxILaXzn4THM3N9C9bpqbFmVchkJYeJGE7s5MmFwYWqq4zMODJn5dJGXy/jzhRw1qvGzCPAZB6CdLUfd6uNdCeUtbmdrYYL3hu0+OhcMLl1HOBS9MH2StueWWPUYDD8aDKi6Ntbow2XllfUM+qhvUvx+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvkIobk9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvkIobk9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso10398086a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2024 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722843092; x=1723447892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8uOdwEzsRx1BS/KnNQbenkp8BQIiUmNFX3uLIbvwz8g=;
        b=UvkIobk9xBsItOfnlXwNzvuECQrsKGZgv+WZrA0OITDEpgRzO49pVh9kebuIMVxk9v
         SNCcYCGHXvkk6BAMjwfykB03aOsqIB5lYwBauDAuVmC+miGTD66U/sgx5VVZM4g4l+c/
         PZ0HlxMk9w2rCkUKuJo6/Yf9VAlI2RVMVkaOfTVWhT7ZJzFijWt3llLeJJEleoL6lCJh
         yZbJcR2hgPTqBT1SnrOrD87Kqyx7z2ndf+/Xd+wf1Fas87XDyPJyGB+XqQlQpO3NfqdV
         sNdxAaxJYvZFuJZH4hh7l5CsR4wYcg7JoEYWNJrQMlKnh5GjYTYe2pBtCimaAMWxWPwH
         p2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843092; x=1723447892;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uOdwEzsRx1BS/KnNQbenkp8BQIiUmNFX3uLIbvwz8g=;
        b=erex4JkiqxuSO5rA+44mDjoABuvqK875NFPvFaCD6IwWtx/FHyWHlBWnY/ux4moTCr
         DLjq0HmfM/4V4e+7R3ozkxYF826pEVE5XCIEFzM7MDIGJblE5Uci8AnpTxP0H1bwlfLV
         0tkQ1kA9mJisgCa2O81XfPo5axuO79/nKEqJNbTYs02oOj3LvCzOuX3BBpGkYBdf01Xr
         MnSagqOHaXX9D7CePz6w+rH2oTi6RiDaUD8iU9Ib+ACbg15rq4riGvpIRUy2doSVcvD9
         XWIafmsV2nX2r0lZQtSXCw89lc9e6Wxn3jFKatAl8+TUpIaqWOu6dEiOxPpVrmH4P1Ji
         29SA==
X-Forwarded-Encrypted: i=1; AJvYcCX0XPXrcses0KLnuKJMf3ew2wI6MxXefbKyWkrgYgnJCN4q0LdFeEzD/OiUNiI5yVMR8gVRCg+t+27kGevE85iKBIQENQNMMMtdSDmDuf1/qAA=
X-Gm-Message-State: AOJu0Yy1aOygqUXZc51ToqoH8HvrKk1QNbm70gVVoOAka5WSx+tkfK8p
	Llzg7CpcJaBgFB0ALcKol3EMoqJ8IwV9U/aMSnUVGGMBQZcoIXtWv+FVXz0WWCY=
X-Google-Smtp-Source: AGHT+IH5wa6xDBLYJQS5crodBZUBZ/j46W8B5YAKpuycg5RtR+KOY5Q3w7TnSWpdR3KiGuR80+aI3Q==
X-Received: by 2002:a05:6402:14d0:b0:5b5:2048:ba8d with SMTP id 4fb4d7f45d1cf-5b7f3ad6ea8mr7511363a12.16.1722843092477;
        Mon, 05 Aug 2024 00:31:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3b99dsm4508340a12.91.2024.08.05.00.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 00:31:31 -0700 (PDT)
Message-ID: <f69f8d70-4e4d-4bf4-81ca-d344316975fc@linaro.org>
Date: Mon, 5 Aug 2024 09:31:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PULL] pinctrl: samsung: Use scope based of_node_put()
 cleanups
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbaGtZgKFFjxGcerRi=sC_WU=-fnGt0D5u9pFTh85+kRQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CACRpkdbaGtZgKFFjxGcerRi=sC_WU=-fnGt0D5u9pFTh85+kRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/08/2024 09:12, Linus Walleij wrote:
> On Mon, Jul 8, 2024 at 12:25 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Use scope based of_node_put() cleanup to simplify code.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> Link: https://lore.kernel.org/r/20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Hi Linus,
>>
>> I got only this one in the queue, so sending directly.
>>
>> Best regards,
>> Krzysztof
> 
> I missed this last merge window :(
> 
> Can you queue it for the next v6.12 cycle, or do you want me

Sure

> to apply it still? Was thinking if there is more Exynos stuff coming
> for v6.12 it's good to have it in your tree.

Yeah, I will have at least one more patch for a proper pull. I applied
it now for v6.12.

Best regards,
Krzysztof

