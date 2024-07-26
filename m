Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154DE168C7
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007039; cv=none; b=B2mkj/zHuk6DV/JvAtrxcYfN596q+9WlH+nWZ5rU33V5mgCXckwZWQWVwSx7ubefaqJkd7G2OuBox4wp1xWicGLe4LmYAs/iYqgB/6vl97O1M9IQSkWfetYdcbcg2WRoU6Cj/eTcYCalEpfZt+L9V6GsXWy9DL7tIroTTaYWQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007039; c=relaxed/simple;
	bh=Kh2EmKRnIzKsX1QsBp0T4Gqr6Uw5Lr9ktVvyTCM4dyo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ND3jL5ewIqCMQ54DbxEPcqudMGF5V58O64j0N2JkR1uAVKLG8UA85DRNlV8iVk03nT0TfTCc9Xw6unXRXHiSU6Pzitq+6KBSTJbbouLRyzFVUgOWF4LHjGj7m8GtVEduyFKUjhmcClyj2qtG8UDbG4cuyTZ+9KFzcmUtzdhJ3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VApsODoC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VApsODoC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so18396165e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722007036; x=1722611836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TX38zlb9MOxIJNDEgb9YWH7GVDZ/sgMkCnZQXoDOuOM=;
        b=VApsODoC6OQAp1GWBq8hGDGcEaRJy0UdhHMAirZn0wvt+zJBQ7F4JnXRF02PvOQ+M/
         HqEU6syYURrWIMQM1+sQ/bwWyGXFdIEAC+vfP897w8pJvULAA8T5osNDjzUsnopco5kL
         iqzg0kkuOKSzeHcPh5CoeWGI2eiwXi59w5vqr0dLmbOja3NxaM/KxyYLkW4XxksvFBEd
         rkvGPovafgOILOLJNvrhQY8scTnch6M0iSc5NPJd5GHIDshhE6NB87zX8sAq1qFvIqB+
         MZZOcdIOsDac+U4fiosQh44Ss8NLbhF8ybbZt0gwCSlGI5C+Hzd5x2DGNIUCOVVwK1Va
         KpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007036; x=1722611836;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TX38zlb9MOxIJNDEgb9YWH7GVDZ/sgMkCnZQXoDOuOM=;
        b=WorSzglT5oaSlhyqKQDruEVlTWvysX2nkRTX4YOeuaIzbzBu4VX0OzP+qz+lRk1UZb
         MIJWYa3gv97iKvzpfdoj4qNlX7Wi0EzUormIRwoE/vJgMTHJxD9UWpzGxGWZ+GsVuPNR
         BcjFZ6yUuKxy3KeWlfTRpi4OZ+a2uYjJgc62OLKSfJJno/pHzqEr8TQbjuyRDpMDExW5
         bIX2AXSc0rSq10hOj+eUhxHZHo+JUQ33qTS8cDcZi8uHxi4WFDcDW+zz/oQmHDkM3JbO
         Niga5J/HR4LPxqrygU4uyU1Jq4IVwgU1gcM23ab9tjdcyoR9orV3NGcJC4sJhfD1eapX
         K5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCRs9aPw13J6xwogVDquiXeh6dVOONwpgqvl7U+Pcji9p5b8wtSjTPZtjskaKVhorDJY62sk0Shc7aX+n/wf4GibJZ+LJvN023UbllToSchU0=
X-Gm-Message-State: AOJu0Yw2cvIJpG2lRITC/+wjfAnM+S19gaUVHesERda38pJL/m6+ldnY
	lx4B04MA3lAHXV4bhTQ9Z/CBL0jUmpYF1B6zKe+Mys/q0U2HjR1RJrQHJga8HgE=
X-Google-Smtp-Source: AGHT+IEiSU2LED1cE3t9Ou/VFGjstbNy6SUV5w3usiuVDiv0mt877k6eAW3qFGh9ZiTt/EzcGcEUCg==
X-Received: by 2002:a5d:61d0:0:b0:36b:33eb:f0d6 with SMTP id ffacd0b85a97d-36b33ebf24cmr4630428f8f.2.1722007036220;
        Fri, 26 Jul 2024 08:17:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d9576sm5528350f8f.31.2024.07.26.08.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:17:15 -0700 (PDT)
Message-ID: <ae202942-fdc0-4913-bd37-c167440807af@linaro.org>
Date: Fri, 26 Jul 2024 17:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jaewon Kim <jaewon02.kim@samsung.com>,
 Mateusz Majewski <m.majewski2@samsung.com>,
 Henrik Grimler <henrik@grimler.se>, David Virag <virag.david003@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Raymond Hackley <raymondhackley@protonmail.com>
References: <20240129204717.9091-1-semen.protsenko@linaro.org>
 <8659d79a-e18e-4591-be9e-817d0ab63b75@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8659d79a-e18e-4591-be9e-817d0ab63b75@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 08:29, Krzysztof Kozlowski wrote:
> On 29/01/2024 21:47, Sam Protsenko wrote:
>> Add maintainers entry for the Samsung Exynos850 SoC based platforms.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>>  MAINTAINERS | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 939f6dd0ef6a..77c10cc669f8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19281,6 +19281,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
>>  F:	Documentation/devicetree/bindings/sound/samsung*
>>  F:	sound/soc/samsung/
>>  
>> +SAMSUNG EXYNOS850 SoC SUPPORT
>> +M:	Sam Protsenko <semen.protsenko@linaro.org>
>> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> +L:	linux-samsung-soc@vger.kernel.org
> 
> Sorry, but I am still against individual SoC entries in maintainers,
> like I replied multiple times and pointed to the updated
> get_maintainers.pl script to fetch emails from boards.

I retract my earlier statement.

Some background: I was really hoping that scripts/get_maintainers.pl
patch, which adds fetching emails from files (e.g. DTS), will be picked
up, but it has been few years, few resends and there is no conclusion. I
don't think it will be ever merged, thus this email.

Since C files do not have in-file "maintainer" entry and particular
drivers have MAINTAINERS-file entries, then why DTS should be different?

I'll take the patch after merge window.

+Cc few other folks,

I understand that with lei/lore filters one can easily track patches
sent for particular boards or SoCs, but being listed in MAINTAINERS have
a bit bigger meaning. Therefore if any of you consider / want to add
themself to MAINTAINERS for particular DTS, then go ahead. By DTS I
mean: particular boards (e.g. Galaxy Tab 3 family) or particular SoC
(e.g. Exynos850 like here).

Best regards,
Krzysztof

