Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F31F8BCB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275033; cv=none; b=GYJatv+Q4FOzIYEuQ/90rONXe7wFUNQZUvJ02ROgoIdxi/dzQTEMo2K97MTGKvrQZBRPVYG7oJfTtFUMnAuhj4+HdkJhn1sOOmOot7siDBS9d6JsA1LuS3VSBOopLIAhG29qMxGXbanyH8nbFHT2Dq+yrW2eRa/vU54KYtOh1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275033; c=relaxed/simple;
	bh=vpI+yV0dwbmZFIhRaRGyW8a5HVtO/K90AaYY0HmkYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0njscVrczYzzeAO9xXFlhG1OroGxQEbcJiu+VP5uj+yeQITPWNG61sEfCpr2lIUv1pUZuUfkCxfw8ahdBEQoeNsOJotoxHCz6aF23PjIfmxbYqkpa9OcH8smS24NWOKK6fmOmOkKqH/j9GmZSn1h/HqmZWfPK9oxv0wqVbgxTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIyPVGkJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIyPVGkJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2837831f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739275030; x=1739879830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=AIyPVGkJlgcML6BtskWNgRrGfUuf9CBdc6cgkcsCoa3i+KMlwVsOueaISXXdmgZcDZ
         0sTXWYKKIBPGT4hPQFRacfzfSE25L0sysAGAYvi395QM7JVcmuZYRDRhckGII+KrZP7R
         2uF//yw2DEXlSY5SmpOpJUdBEKTvAp6/ZmfWE3S6wF8HtOC1BeJrN3P42cHtK+UoAYFK
         hJQ5boYIUIUz8mIr/Mcb0NNHccZ3Skd6fJlAahADpL4HANcN+rId25PuFwEBTntX+/iM
         dcJCf88NGq80TBAMoqJehV/iBPum2qpifWIpfW63refMjwOHU8RxNrk4bIVaAzU/mFL2
         Wnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275030; x=1739879830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+/rKU8hND2RosjvAKGWInz1qgNkLNHLXSblj/1XFjg=;
        b=KiaPhLTcy7yEIi+iWihiN4h30p6fAcKcNUTWCLbvrRZHzWnUGSR6NAzDDQeBKkRdPF
         WbsD8E4xTKhP72hozKsj8+4DtvscKXzUZ8ixACGcJaZugd1w5m8DkDRbIi3RQSfep3Uu
         IxMY2ITzAFHe0LyDI1iTEiK2UQbE3HzPdemfXHsHjahYMchEMYvHJ8iD2Mb+xhcxrxjp
         kheUIo0MvdtC/N1m70CTOjXL8G+GQzPQ7AaKJn9UdMHiNGwoZ74FTEXFoR0VaOJ5Sq/e
         lZ32oH3bNR7mx0oO19H7Wt8rP7B4ke08VjZhWOolye07/waLeWTYI1tloulAj01J7x2o
         /zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMrZcMHYFQA667e+vd3pfyH+lxLoE+rCQXmdRkaHOjYbn/pzk0YOMWM4kYoIG4FpWKEB4ocqQ0luTDALKQ2gNeoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuj4533FyUQNYNUmws19vkHiqOwC7uFme/+L7uyUX2I+UMz+NE
	6i+W/sKcw4pz3z17zul32rYA1JkJeAEZJ3q+eqLeYJpZxq7XMlhPqbEEiOporCA=
X-Gm-Gg: ASbGnctrCZohVtj1v7WaCZfJRQDzpdTJsPgIxS8ZTfm4F73FwF4zO+mDbWPRdDYyPHC
	QyrtEQvpjzMSQqHfnX5QgffyR2f4eLaMwY6aSsgpR5Ohos0BOLnJN5cN8sa2hss14XbExWWI6ZX
	ZShUF82RfVXlmxNYQwXbR0ZUl1EEqZAE8xUPf1mgq2uH8sqUqefJd2oFsBpXxMpe0yKRS5kV0xR
	EXBvzFMUuoSi3sA2BHXLHbYIfpts4eg3KU9zh3ygIoiE3f3IzjFLyM72ikpWu+UlpZFNItS5Qdl
	p5DJTJNFFO55OOtdqtiVbyF8
X-Google-Smtp-Source: AGHT+IGEDbZ4F+KtHnkoF3QqtYj/Mv0BkaXQoyniQIaUjtGof6BuGlXWqpwnecn1thdzCU0aThGJqw==
X-Received: by 2002:a5d:64af:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38dd0cb6a75mr11977488f8f.22.1739275030079;
        Tue, 11 Feb 2025 03:57:10 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm14314088f8f.95.2025.02.11.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:57:09 -0800 (PST)
Message-ID: <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
Date: Tue, 11 Feb 2025 11:57:07 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/25 10:36 AM, Diederik de Haas wrote:
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> Shouldn't this be ``(GPL-2.0-only OR BSD-2-Clause)`` ?
> 
> AFAIK it's the recommended form since SPDX 3.0:
> https://spdx.dev/license-list-3-0-released/

It should, it's a copy-paste error.

Looking in the driver patch, I shall update
include/linux/firmware/samsung/exynos-acpm-protocol.h to GPL-2.0-only as
well.

And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
everywhere as "GPL" indicates [GNU Public License v2 or later].

I'm going to respin everything to fix the License mismatch in the set.

Thanks!
ta
