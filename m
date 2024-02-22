Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08F17BA1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708587930; cv=none; b=MuazxfyNmUu6yBryVVSgU7OJe7upberaBI9Mu4nr/tTMIPZDJMPBEQZ1a+aJVnQr+tMfroWYx9cK81oty+Qb9ObL93PAiXI0lmAfDzesc8rZWdE0+2qJFeF2tMMksNQzobFwtkPBqyMNCBwRKm4sCdbcQRYj6q474FHvI2cz8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708587930; c=relaxed/simple;
	bh=l/IxJaf6axaZ8FVwz2ZxTwzuFtamRHPtqYYDgO0NVNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jyive7z/9S1ITjz82mCtLEjTe5gJtfeZVtnnfYuDBXyfB91TuIjb67XNWHDqsIhpbSPey000k4X1aF8Yo4iyIWjgB+hlB/U3s5lVVSab+ikEMvPErfF9HziFc4EwsFngFWrr2VnFwzDpjirIIQmwnhYvBsKTRaQ99cN3x9MnAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnRwR1ol; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnRwR1ol"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-565468bec51so141472a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 23:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708587927; x=1709192727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mG6Y8+7RSXjF1YaOJSoZA9NONPBkQg/FIATIqJdfjJ4=;
        b=YnRwR1olqB2ye9gqb5IHP0z7TK/8QBH41WDU0eHLhaRhlS0Xdu8TbZrsJS1kcE8U7h
         YKELw6mcJGk8y3yqk/PNrU3yKt1xMXRqMqR4rUjS43bZQKkrklCjwjdoOr1L2AzHWk+/
         Ry/rteWdq0MeaqINFJ71w+jDc5hEWcN116lT8a7BJhMDPKEY3dqlCVEKqCRCBFf1INv+
         dOPNc2H4dvXI/4jDmJVivT18NwDUwjduN26Ys1mtFftXgZaRC0DcUc7+QeXsyeZu+0zd
         +lbqQUCj34p+ESdgXjGzVdqv8lUeKmGe56yp6+cm27aq0xOs5h2idubYAhxUihLOvZdW
         Sr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708587927; x=1709192727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG6Y8+7RSXjF1YaOJSoZA9NONPBkQg/FIATIqJdfjJ4=;
        b=pPoPy9D69joSi9MKS6YP7q9JTK6sXtwAZ/VDVt/Xb2HrJ0YU1f0Lgw4ZP8patBaL0L
         jseQpnj94CXPYgtGXq+RtTL3EV61Xo6YImIXdd9M6KSYKHkeAGnxKiszNQoXs8HPF6Jq
         KnDST3yzlB7UriFpSKMwgyQcHRX+yCDTISZ6cYugeuXeIiagATR4hX6CfxQduIN2POfD
         g1XGFBhvd54+Iz0pCD6nsfO0AmOfGWRwvMUwnQ/a4B+Ty4FkvwhjnojHTsnQl6tpT8Pn
         nU58dcd57LmcZ5VZPTNNf1mhl4m/Yhe6QBE4JEyml/I5eL6Fry68vWUE/INA9HSStz9W
         9oWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNeEjkvey5tVZ233nTJr49c6SPtj1wAdEECfDSHzH5NFvrgEFO1/AwhjEOaDYVbqGZiW4ibCwdem+HDnlp5A5tuLvbzpnFKOpfEY2b4/1uB7k=
X-Gm-Message-State: AOJu0YyetTE4Ng76UutYQqsvnY5L+H8ky6JHSeONhEVthteIVmb0+ICT
	W/DtIBVpodt+yOGmyh1lmtWQLv/RhnV19cZ8VCkhbjKt1THi5dzUsGIuwV4it8E=
X-Google-Smtp-Source: AGHT+IFp3KlRLOquDS1qON7clUS013o+eb1EjJhials6/XFA+NM4rtzRhmwqRusKggKPATo3V+cTpQ==
X-Received: by 2002:aa7:ca53:0:b0:565:cf:2566 with SMTP id j19-20020aa7ca53000000b0056500cf2566mr1514539edt.12.1708587927070;
        Wed, 21 Feb 2024 23:45:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h10-20020a0564020e0a00b005641bab8db3sm5128141edh.86.2024.02.21.23.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 23:45:26 -0800 (PST)
Message-ID: <5f1ae281-7b81-49a6-82a6-37be20ea43e3@linaro.org>
Date: Thu, 22 Feb 2024 08:45:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] clk: samsung: Add CPU clocks for Exynos850
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <29090d97-9118-4765-a4fd-3bbe271a39bd@linaro.org>
 <CAPLW+4kmoCoqO=+zXbVw7VsGc-VB2At91ZnJfyTDRtVFmN4aiQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <CAPLW+4kmoCoqO=+zXbVw7VsGc-VB2At91ZnJfyTDRtVFmN4aiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/02/2024 00:07, Sam Protsenko wrote:
> On Tue, Feb 20, 2024 at 5:07 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/02/2024 23:32, Sam Protsenko wrote:
>>> The series implements CPU clock support for Exynos850, adds CPU CMUs to
>>> the clock driver and enables those in dts. This is the first step
>>> towards cpufreq implementation.
>>>
>>> The breakup by patch:
>>>
>>>   * Patch 01: Add bindings
>>>   * Patches 02..12: Prepare clk-cpu.c for Exynos850 support
>>>   * Patch 13: Add Exynos850 support
>>>   * Patch 14: Init PLLs to be in manual mode
>>>   * Patch 15: Add CPU CMUs in Exynos850 clock driver
>>>   * Patch 16: Add CPU CMUs and clocks in Exynos850 dtsi
>>
>> This crossed the threshold for a patch bomb, which is in general fine
>> for me, but then please put v2 changelog in each patch's changelog. If
>> the patch did not change, annotate it as well. It's not possible to keep
>> jumping between cover letter and individual patches.
>>
> 
> The above list is not a change log, I just tried to show that patches
> 02..12 are cleanups. I'll reword this in v2 to make it less confusing.
> And as usual I'll keep the changelog for each patch separately. Thanks
> for the review!

I know. I just wanted to clarify my expectations for v2.

Best regards,
Krzysztof

