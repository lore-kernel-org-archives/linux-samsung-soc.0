Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514CC1862A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528507; cv=none; b=c/VeTNIFVJywSPF4vtC0Duyh4t6s7tJoXYKmQkiahWXHIYCOA2eEl/3mRBQKUuyVeNrPUxUQ1iZSOlzSQYG1EbfoemBfIIOzlwaW16kj/5gZSWXwRMJ/PE3tN/18L5t8d2X3qQwBZUqAxk011jXsl9qtl5jnp+D/XNfKxu9NAaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528507; c=relaxed/simple;
	bh=wKzv8JjnWV5gBG65VFCZ2zPm9xxHlHBRT8kIM6tUCBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFWNyQ1irAUYRpGRX2nb4Qtx+2jIne2MBjKlqUcmq16mBg9Mht9NpN50iG22FVt6bMisVa5TdqUyYNsw5VbQvC02bv7ZkEM3ZbYKwh/hL0rpTHb3JxfS2sV1/cHyFLplUb4G2fzGXDimA4U9TlxWz+nD7tFRs3FXclsTYj3Bq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5+HF9S7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5+HF9S7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837584120eso38716015e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Mar 2026 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772528505; x=1773133305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xKcWF7NPjeXU/Yo9Rn3BptYJg8YH0is0Fv10MXJEt8=;
        b=w5+HF9S7SpRWMZba5sOz4lNbxVM1DShoNulBVR9GGxFlErxPJAQIB1tNRAoWMdSf9C
         4BQawI3ab20j7asF+paexzPduMb7qjwh9hq1tq23FAwz3VLgUEjHntxUJLgcFMkVXLms
         ZjqZoRqfWx5XWsj7PG5+UmShQlKIhGKOaQpzTzyIsMPk1iLbgnWdm9f3g6OcBdl5ARw4
         hPxMlFP3mbZ/0b3uVahPv3nIW9eJeMuqGARhNAOpjhht2yD2DU0pE2Qzt26m2fGqAnEr
         SRfpD4Pre9Svmd0Mm+o43o+qLWIfHVbPYYM8BeczfOir0/EhL6Rca1XiFSiWQXosLsLu
         pYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528505; x=1773133305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xKcWF7NPjeXU/Yo9Rn3BptYJg8YH0is0Fv10MXJEt8=;
        b=DBUSD21SY7Wfw02SjYW5Drl3hjTab+X8XZW14RFFHLiztGitRVSXYmIwB14Mt1Vwmu
         I174rHcoyph4xARyh0GqZpCSvQLVnZPkvRqWfEz6aX92JAcCrH3p70EaHgnMY4cur6NO
         n5/bcOFs0AlvrJYT65e20I60S+ToYzPsoQZmRrxOVkDV1p/r+jqNa3pasAtrssjmnNnT
         2bZgj+2EaJ+UF+g5TaFr3T8+YbF6nx+C6eVfV/cu6aQxdVKH/hVyjjQIz99t44YyC4pv
         C9FSi0ufqZrOiyEd8NkJMr+Mq9tEqJORRASi4UwiJl3T5BeJVn92WKv3yk3Cf6MGKegB
         xztw==
X-Forwarded-Encrypted: i=1; AJvYcCUO+6biecxeQRe9o+YS74IKPVE+dJICyr5I+NlHJMi6r91nT5UxUOOMY+sN3swn9EwDEZ5LLykVOd+5c2EXSKOJsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWD9ioqdc5WtJ/mWXI1HpTRYYYrFf/V8qEqejeknIFawhqoSJC
	SDVnmPeCQesUCZ6KqRRunH0h/yCXpMrnqJxuOAbOaswFScv2kF89BQgpwjCf+XmYBwE=
X-Gm-Gg: ATEYQzwlkEVdV2wU2pc9cyK+OYv9Ns+d0k5FNLWgrFrN5JSYNv8K2aJgPxJxgEm9Ue7
	8yHdB2udzFbXeR5I3jl0KhOu2KKNYI9WvFShY5yorPnZki4pS9doTNd0Jjn/GnSfgBMu11kUM9e
	XI7KmNwTJjyFc56ALvwV6MQnD/qbZb+/1x0j/ATsP6cqWGdTN6fJk7+39KPvJqCgIqmzkr9Jqax
	CsTQmJVwhTWW2I2aQvKoCGh2vsxtyWy7dBsMB7oiNaxKSODIUE4x+lnHVCNFCOXcJJDsQ0uvtpC
	kfTQs2wgMMoUvaNYO8mQnGUzlRk1pfFkAUPiDhumgiGg1N6MDD3y57FcQ3lAz9iI/E4/8YhUNQ/
	iv5WZy5oTe7oqCOP5dIkgSi1UDOPksIGYT4GDPbdw+zm6Y61gAmbnt1Ci7UEJqK6lEvmUFH5rkp
	21GN5pQ/4OvAAbQoZnKl9/4Gq9MKTarK4=
X-Received: by 2002:a05:600c:6385:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-483c9b53c9cmr291863355e9.0.1772528504551;
        Tue, 03 Mar 2026 01:01:44 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm312924805e9.1.2026.03.03.01.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:01:44 -0800 (PST)
Message-ID: <b8a029f1-1229-418b-895e-b8dc0319b545@linaro.org>
Date: Tue, 3 Mar 2026 11:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/2/26 8:30 PM, Alexey Klimov wrote:
> Hi Tudor,

Hi!

> 
> On Sun, 1 Mar 2026 at 02:26, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
> [...]
> 
>> ---
>> Tudor Ambarus (7):
>>       dt-bindings: thermal: Add Google GS101 TMU
>>       firmware: samsung: acpm: Add TMU protocol support
>>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>>       thermal: samsung: Add support for GS101 TMU
>>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>>       arm64: dts: exynos: gs101: Add thermal management unit
>>       arm64: defconfig: enable Exynos ACPM thermal support
>>
>>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  67 +++
>>  MAINTAINERS                                        |   8 +
>>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>>  arch/arm64/configs/defconfig                       |   1 +
>>  drivers/firmware/samsung/Makefile                  |   1 +
>>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
>>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
>>  drivers/firmware/samsung/exynos-acpm.c             |  35 ++
>>  drivers/thermal/samsung/Kconfig                    |  16 +
>>  drivers/thermal/samsung/Makefile                   |   2 +
>>  drivers/thermal/samsung/acpm-tmu.c                 | 643 +++++++++++++++++++++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  30 +
>>  13 files changed, 1275 insertions(+)
>> ---
>> base-commit: e2211f5d980086dd9fbdab3bcd86b715e12cae13
>> change-id: 20260113-acpm-tmu-27e21f0e2c3b
> 
> JFYI, the series doesn't clearly apply on today's linux-next:

okay, thanks. I'll submit a v2, but right now I'm dealing with other
higher priority topics.

> 
> Grabbing thread from
> lore.kernel.org/all/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 18 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 20 code-review messages
> Checking attestation on all messages, may take a moment...
> 
> Base: using specified base-commit e2211f5d980086dd9fbdab3bcd86b715e12cae13
> Applying: dt-bindings: thermal: Add Google GS101 TMU
> Applying: firmware: samsung: acpm: Add TMU protocol support
> Patch failed at 0002 firmware: samsung: acpm: Add TMU protocol support
> error: patch failed: include/linux/firmware/samsung/exynos-acpm-protocol.h:40
> error: include/linux/firmware/samsung/exynos-acpm-protocol.h: patch
> does not apply
> 
> Was it done against mainline?

Of course, yes. It was on top of what was the latest Samsung SoC tree
at the time of development. Internal kernel trees may change,
depending on the maintainer.

If you want to try the code while I submit a v2, I pushed what I
think it was v2 at:

git@github.com:ambarus/linux-0day.git, branch b4/acpm-tmu


Cheers,
ta
