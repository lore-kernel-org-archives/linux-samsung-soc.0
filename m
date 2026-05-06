Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4623E4C80
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056167; cv=none; b=N4MRwXDmhpdLsvI0Hg26Euj9+joHJ4hfnIET3m882CRb9y/ox73jiXMrxY8NqmINUKg2CoLViyBtNEIfRzptL+9bT7tbbjQbuKAmG4BKeOejvIJ5NoHnTXJOKXtA8y1+69zoPPPp//Hmzx6Yf7cSfzkZAH9lUQnJgajqq1Vyuyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056167; c=relaxed/simple;
	bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dva6NxCbdXruZAEzlxyKw4v42YPIXQBaQkRuYjPXlS+7Ua6MwY71mZhaRlMjYFMyO5UrKkd0UPbJPkOmSCgb6rx+iDlxdQzkbve8kb3YKwVthqoYXluefTosDVikTwLA6rYWRngjwmf+xpIW3fEhcKeiK4mFCAhan2l+B0afe4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJv4/28i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJv4/28i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso33300025e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778056164; x=1778660964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=;
        b=lJv4/28iUAmR6XxtA83Vk4dtDk4H7X6xPtswT7GtfKb6jVwsqklUGK2RYGO1DeyKXx
         U5rt05nn+YsQnqq9rj3DmRfruC9YYuHVrTgwugjj/GONJNcPSRkSU/YosBB7V4y265bp
         W5gaXGDe/NTSHeKp/r51YR36ifoiK8piRD/ikUUrx9sRhAFav+qWf7/rql3xs4gukLpd
         BGE1PzRkgrl5NYQdyIeCyYW2X/tac0nWPxJ9xhztctkYx3AIyUuwuIySJs3pjuCO1fBO
         Fi4i2cSpD7FRwKdQkAu8Au3TL5CWDP1TcTs/Vrjf8ayg9d+4cPQWxgrRSkYFKthPw3Il
         Z+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056164; x=1778660964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNjDpuu2hwLIB0IxXf/2OHG10BiZJ+z4qaTrgnV6E6Q=;
        b=Sh7eolVW+3bPcIds6WV/Eaaz3QotJz7Lk7Je+ln20uDJx0MgOlZSdK/CEWHnu+FR74
         VcyqFUC3khWDa/G3v79MU3UCcxkdlRMoKOKj52o3WJzjLxNxx2/lTrsbMV00yAZUwRFC
         RNTZ8UYmXn1l4N/Z4XbTnSD/kBFdhaOu3UWLckBP2LC2Hmiy9dbFqNd0Ls82mB8O5uhv
         saVzsgRAEwI9GKbq4j5GYqdE0GMYDexVq1qNmwwx8D+Uny4cHHlLCBUGsIqFFPRKmOCr
         v7PBsx/Gl5mRm2iXkUrHWZQpLwATQ7I6N+6L9WHQSDV8FhRolDKGKJmJLLP+zRaaR9dd
         v9EA==
X-Forwarded-Encrypted: i=1; AFNElJ8C52H2wqbMDoEqZzNLm4M8K3rNC49/CbxD+KuAGJgYPTVswJHW3v6aTC87VNXBClYVSuuXPyXdyd6jDSmTMR/kSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNr0bTFhgXF0wjqLY0r61h84FVG9DFY6P8/3ZaipnVlhXiziGb
	WQNvt10Z5x5c1aZUcvZFj4gblgur9SFEAPH7szyKskWI6YRXYN83E4rDf4ha20LNccU=
X-Gm-Gg: AeBDiet0tdQgjybXZULIAsTeqX2W8flNe+be94/LiKrO/QDU8pM8YC5XUo/ZMZ6iSGj
	oHWHA4OfsZX5DCTKtMCXGfUcNELnKu5K30s5phV01Z6sgCOL68O3WYPWjQHdICTy2UNrGWYCx3O
	OQO2wqeS7vEpaqe8Wz8/jLMV4Y8SkuWueKaAtHrX/ANEpX+uu6AchF//dLtJij9iCi8t7iTVV2u
	kv4BpiTX5/YXzCveQT6dOKOMdHavM9no+VQpKHeLhl9+ZOSqdFRVwwoa+CoQ0+9bn8T6Ir/jUBM
	d6TbffiBNr4jbsOA76Z2q2HJa1loW34NloX6R0sucW6Ad28iYxAMJ4DWjjAykJh+HJchwZ9MG7/
	AOwbpU4ItfjFczv60KL4GCVJSo5KM8riTOhH8bWdKnCU4EShdiuPyF59TH7kOpovcgN65Z2giW9
	ZrcWG1fnmMIUAYiYuveq2a4ugd/IwuIM2VBKge4YiOr9I=
X-Received: by 2002:a05:600c:354b:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48e51f32a7amr41967685e9.17.1778056163955;
        Wed, 06 May 2026 01:29:23 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10276212f8f.18.2026.05.06.01.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:29:23 -0700 (PDT)
Message-ID: <8dd42c4d-2cf4-4118-b2ba-99670cfc94ed@linaro.org>
Date: Wed, 6 May 2026 11:29:19 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org, Titouan Ameline <titouan.ameline@gmail.com>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof!

I checked Sashiko's review feedback on the set, and in my opinion the
set is ready to be queued. I'm going to send the cleanup and the
ACPM TMU helper driver patches now.

Thanks!
ta
