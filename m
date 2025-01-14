Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573B20B1F5;
	Tue, 14 Jan 2025 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891954; cv=none; b=I3IVouKq8UWo1ggUyphUXvDAajQEdfQKwzc2W9TX39sjIdLCtqprymbvTN8ZglE4j4DBmol9iSXa+f1o+ych4CkGnfk0ROhbxoddsHn9S9XNeVjemJcKeKwVLDBcT9lehRSKLaoQOYajbf2s7LCT3ZEK+UTYMoW2oylAvVtgLE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891954; c=relaxed/simple;
	bh=AfvAA3xCd/e/r2sXTEWgcKnocZaE+RNQKS4l6cVb1qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbQ1bw5rc/ib/3eRaTyXjeMV7gGYKkeAzrtZz5Pl5vamXEBczOGwi5+sQTDAD6gMshCl5SKrHSTwIynwnFzTEs+MJqyfCni0hOWZJlrIPs/lTBode1VI3rFZXmfx9mZ6cSe+qFffoF3NxL67CgTay+ic+4/HukZGUvmM8Zv55y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HshRtkn4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HshRtkn4"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so10269881a12.3;
        Tue, 14 Jan 2025 13:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891951; x=1737496751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Tx5cPW7mZjp2byL6KcYB179kLmiMyaom1bGbtVbnFE=;
        b=HshRtkn45fEUoZCnRPnJPBXsLH2JNtm/aiB96pw+YYoxbqqZONPrrirrQJNm1/1BAQ
         Kqptx/lVNVjAdyB3763TOwZ5EeBKphgbpyDXfhc1AoQu8ztvZQzJtQFk5NH1iR462DDT
         S8yzahAn7DHvvwOL1sK0L+V7wAQUC+kBacgR/U5tyctjPLICxBs2vwDfbiVWAKmFSEYY
         2/RrIA2vsCqKauOj8p4dfMawJf/koiq/Nu9rBHNb/b9ex7AEUtmXyEha3o0dgvbl53yT
         tduDn64O9GquCJL0isWUfh1IevYj174TW+wKp9hhfnPMiY4/eWGcqi2P3d9Xc/ArLYu7
         e+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891951; x=1737496751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Tx5cPW7mZjp2byL6KcYB179kLmiMyaom1bGbtVbnFE=;
        b=SeGE5mBezyNMEANBD5GgVtlLH8b/fosRpOtTLY8PIdCe6IxWybjjvnzbARt9deNDgv
         CujuAZTHYJz4ozTvZ4ZY1rIEVkJcHCkl25WuAJD3DpBWjvxS5DfHk4SV91LCSKLTzDQx
         LAHTEqZbFyNLOjOr8cMmsG1xrpWYmmhLrxeRoRkULue/HooHfZ5BRJVknQgkTWgX0sMJ
         F/M+yG3vEt3Wgx/FTFI7SEb5FUcwwn/Id/PGCPjF1YR2gOPWP70zKZ2kuS6ozuil5B7w
         +mEhAevRGqXgaWJcpw3SZtbE4xthJNAlLPvCQWz0Ei9WaP3kPEB62+zAKJz4pX89Kw9X
         1yuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV248/mHKdRLKFT9dBxutlEBqe98wesjErQf94uRF7ZOK6Eqvzl/rbc+5e84rSDDmGqXhmb6Q6Kg38eY2iI3gqxHhc=@vger.kernel.org, AJvYcCXp3Dz+AM11WXkXtz+/1+zyiNVwlC1b7dbp1iHCuZn7e8wWJUru9t2f2JeToqS7tuyLdpkWAY/CeGqOPaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuviushhNh+uG1gDvxzARPiP7/3MJYf7yyLZ/LcJAtOsBcGCN
	AE6LrlTMdPW7I92XdtdBQtgBisJXrSQMrcnSpFw8Y28n4uKBwlie
X-Gm-Gg: ASbGncuadMH14/CBY+X652iGq7DXVxBbK4+lfO5h62iVygnEHUewCXaFvCo8+F97Lzv
	Ncn3SzIe193b84YXBtBVy47ioePNn8dE9YmKnHjVvHPTOzkvpxg2bTdYYG8mhl4CBEKierhK7KJ
	TGGLOKC1S6MkE/dlXODkOMRNPtTt0wyDbwDzoabuvmbb/ZByTIxe2Z2poK993SqNJJplfimXzKh
	7ARfxWV+p79GESiRZ9GE9fLPM0aOUR2ZmV+52/Kb76XDGtzPLGjE5eKXgVQgi4EnkR+Ntyt/Sbu
	6Ug/e/Wb8dRZCMdWZkjKPFqd98D/El2mdaU=
X-Google-Smtp-Source: AGHT+IHTUgwmvI+n/QJgpjA7ic8+1DMhG5ovcobNcW2aiVFDny7CFv7UZWlT2Bj1wOcE+v17sCID0w==
X-Received: by 2002:a05:6402:430c:b0:5d3:e45d:ba7c with SMTP id 4fb4d7f45d1cf-5d972e7148bmr24049816a12.29.1736891951312;
        Tue, 14 Jan 2025 13:59:11 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c469sm6729176a12.5.2025.01.14.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 13:59:10 -0800 (PST)
Message-ID: <23d2ca03-5578-457c-ad80-778ac4347c04@gmail.com>
Date: Tue, 14 Jan 2025 23:59:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring
 the ip
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
 <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
 <26aa96ba-36e4-400c-a982-48344f2096e4@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <26aa96ba-36e4-400c-a982-48344f2096e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/25 19:59, Krzysztof Kozlowski wrote:
> On 09/01/2025 10:03, Ivaylo Ivanov wrote:
>>  static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
>>  {
>>  	int ret;
>> @@ -251,6 +268,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
>>  			return PTR_ERR(usi->regs);
>>  	}
>>  
>> +	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
>> +	if (ret)
>> +		return ret;
> You should not reverse the action before the action actually takes place.
>
>> +
>>  	ret = exynos_usi_configure(usi);
>>  	if (ret)
>>  		return ret;
> Registering cleanup should therefore happen here.

Alright, will fix. I'll try to submit the next (and hopefully final, if that's
all the critique you have) version in the following days, but I'm currently
focused on working on exynos2200.

Best regards,
Ivaylo

>
>
> Best regards,
> Krzysztof

