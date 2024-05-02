Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A91CA84
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714632648; cv=none; b=F9fXomb+J0uj5WuY9eviKuDsyqhCrnzMDEsBukXHi3ugcLQftVM0cQ9ajdw9gK67dF2gGq3jA2GmnvvcujO6WECNyBozbvIrXvj+uWeMXWAXAv8gW1kR2Y6WJcD6Da8lEO5RZPGtHN0sk2w/BXZYwPaZM+tnFQn1eWgyI/c5OAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714632648; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBEsl/zg7ED0pVd6E9ii1/D4539aF0AOYzhcel4Ut7O+Fv9771WPtBqdYKHTLAPYVhmr/HayC6U1JGiPM93S4SRDY/Qq4+jnV2zvY64IgbKKiQUF3wq4fNFXAMQ9KJQ3b1kxUIOvEONSnLDoJucDRG4hiU+1Joh0XIF7b6VALMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjHdj1sw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjHdj1sw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so640472766b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 23:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714632645; x=1715237445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=tjHdj1sw4LmVaCMs0X8OaPrJwin9CaDOJYFyQVAgG+gu2hHuv33O3MklYUx7JV/Fp+
         GnvQVZPijjfRU+7ym1NRUWVmREVpSjyk1CLebYNQxkHmaXQwETj1+dtqb9wQaGReudTr
         sNr7k+tKIDMUQkVdteSt3VRxhOdGgHNzy5e9kA5bOCLqQcraCkakgNPYE1Qjgx1jfHqa
         EqF03Xvv0zJIC93xcKuawdemULKUt8e2zK3IjYuI0heJFKwUWaS1JSkwYIPt5/V52Alw
         ugRNaJl5YOO56myAgnqtE5NfCcloR/OhJVtEI9CwOoMPKohsnj3iVsFe3Rx3kejLLr+r
         Cxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632645; x=1715237445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=EdnMndErxi3Vdi0GSLjacF4TjuR22EV9PV8kWUWQTSLba5vgOYQQYJQ1eaL/IImRFr
         1ibTC8WwYQY8xo0WAY4lfanZo7JItEJbykeINqhmHC1CxTMIND0Bjov1HDn2hFB3lhvV
         laclEl4o3d0HPNyqHwZ8Ioz8pnFL6lrbWq1yqieW4GoxjaInlOqIojnwzuDV+99qNs3B
         lBpR0jvDR4Y3tjbiwNZoLJnx6QX6JNkhk333/Wro1g093n7Zzs6A99RA8pd6/9ZhzaX9
         Gvqz1I+DR3p1AZOFfS9XokY/4L/TapFOZ9VM151Ld9w6m6d65KHlEOtbsF8otQ1XK+vy
         4pvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9a3TQ7jFDTe//DNDafMtyPEJdvuRjGYUCAR+3x0muntBai6Bn/RXiuwk1TISkdlRZA3T01dqyqSsfRDxQg5MhoMz8ZM9pBcnweQWqIKJ5O6U=
X-Gm-Message-State: AOJu0YwCln3wMWUB84PSdnCLfaKySM3XpbjIZ7mVHYFSSit/h/kKUYq7
	aaxf0Ygal5OYhHT3tgdd7KCYsnOkUFWT4jfhElUSvxxNV4pLl4KUvVPFVR/0fhE=
X-Google-Smtp-Source: AGHT+IEm4hxtYeUITzy9KskvdEwvovQTQ7goiMjdbtjJXbgiREClpPvtcTNcEi0/QqCMuqRmWxzfgg==
X-Received: by 2002:a17:906:3510:b0:a58:eb98:6806 with SMTP id r16-20020a170906351000b00a58eb986806mr2983352eja.32.1714632644997;
        Wed, 01 May 2024 23:50:44 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090624c800b00a526fe5ac61sm179547ejb.209.2024.05.01.23.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 23:50:44 -0700 (PDT)
Message-ID: <29eebff9-04ad-4c4d-a3be-2f2da7a9a280@linaro.org>
Date: Thu, 2 May 2024 07:50:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_hsi2
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
 <20240430-samsung-pinctrl-busclock-dts-v2-3-14fc988139dd@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-3-14fc988139dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
