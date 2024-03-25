Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE7134A8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370742; cv=none; b=NWRh7d/4+4tkmGgOpGKzXe/d7CQWhZWRQztpQNqEnHe2WP59oCC4/6KpjU8Qw3z9+LaJE/KRPP2Kwx+o0+PGdB3hBMby+BhqaeZhKCyp4DP6D7Z3Q+/YkzZC+4qOZmeL+E4655ioA/gOJS+/+1Sy/Kk/C3FOySjf3OeNsKj0eiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370742; c=relaxed/simple;
	bh=jFAJJBZ7w2HGxEoQD4IPOO+YemTNHNOU01iTofesezQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFGrRBXlTrBEZA8QqkLzBNg3wD4jp4xzxGpNzb1T/ucF6QiRBysw/hCQD8cHNzz+1HN8F1UQRNrcP2dLs0kq8uRJmGA37P22jD7iZR+vDABpfcSn2Yw5VHmJzAksVLj0Ma7jQhNnkjBY9BKyubVW+4rIATrY83kx5FKErzqOc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHh6WPfN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHh6WPfN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4148c6af2d3so147125e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711370739; x=1711975539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mr094tqbb7t0gaddbBeDzNaAJNuOic0uHzVPON5hPTo=;
        b=aHh6WPfNuxDdhzXgqDBwQyzelK4BBytCAwJqgpIvCYL+lsl2I1In/QMrXUuaKQj+Co
         y2TCJpWJNuXdv/cfWFD7lTL3NlvoM5l+Le8nc5G4ZCrSf1771RN/QNLixQuDLIpE0rjm
         VIlaiXaOARzd/0KzVhkBseDsqf3vS+knGUmME1ioxy9ufu7mwns6Nlay4W4xDYvKo255
         klI8EnqB6gVXCDePDZO/fyb9sUGck4zDAeivTKZFKlRVhHIhLaCFRZ7AS9mHTFSpx7uJ
         SW4NAu4LTrAyOporDj/sD2m60ZI0p/fcdp26e9nvSW3BNzQGclOKTmpHOD7N7+uy9sMc
         UTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711370739; x=1711975539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr094tqbb7t0gaddbBeDzNaAJNuOic0uHzVPON5hPTo=;
        b=IyaaVGJFR/CIQroJ6lOapHIANKHjpAafa9fd3Kxn3UTzQir4VedlWezVtXthe0cw9s
         WrEit9FU7KwGtc3WtKQO3rd37uU4peBA1ts3pTJyQCxaLzKcaW82cczTxg3I7fG1hMI2
         WaDo8jaw1FWt2/6asFrerml5m3bCySiNEkUMIkyGKHd4m98ghoDtkcsO+2B8JvEwFi/c
         fjECQf2zXuzr/ZooyzyUuYitVi8X6568hBcX7uuk5JodJhiIatPq9NngdsGY65MVZID9
         nfqj9t5XAsbl9vg1Np14SHxH5DdaKgAnnmJcTPL7+MfsEpCdtvAVrkS/Ubp9b2TodHyf
         JG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6GsUor+7qiDJ3U2G0XfEyKxu0Mjcvt7s89bkqtUV8VwFWuDaA2pPQ0qkQOyHzXJ2xrb08Q2lVN8CayNC53R4W0pR9LX9rQYkZPqFno0FZqQE=
X-Gm-Message-State: AOJu0YwIj3u7xuRJEGzxNHtZny8+nk/t4uaE2J7VQ/J/f75fnVF4swEp
	PLw4u5bsHZYlzuXzc0LoOQNd1ipX9wC3tfJeDBa2ua91ibtk2mzUUU8BjUtg2oE=
X-Google-Smtp-Source: AGHT+IEdhASmhpgpMn0JRksM/eo2Hqq1dK9CQwhtcLk2Ko9opS+KAE+Y9nF5MLutxyGPWmJ/PyVnow==
X-Received: by 2002:a05:600c:1987:b0:414:8865:bf99 with SMTP id t7-20020a05600c198700b004148865bf99mr2767476wmq.27.1711370739088;
        Mon, 25 Mar 2024 05:45:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.252])
        by smtp.gmail.com with ESMTPSA id u13-20020a056000038d00b00341c934ae4asm4402949wrf.75.2024.03.25.05.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 05:45:38 -0700 (PDT)
Message-ID: <a385246b-bcdf-4fd1-ba28-06a5d2d64e21@linaro.org>
Date: Mon, 25 Mar 2024 12:45:36 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] ARM: dts: samsung: exynos5433: specify the SPI
 FIFO depth
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
 semen.protsenko@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, andre.draszik@linaro.org, peter.griffin@linaro.org
References: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
 <20240216140449.2564625-6-tudor.ambarus@linaro.org>
 <1d9f160f-e155-4d2b-b598-d1dc76e49110@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <1d9f160f-e155-4d2b-b598-d1dc76e49110@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/24 11:13, Krzysztof Kozlowski wrote:
>>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 5 +++++
> This and next one has wrong subject prefix. I fixed it.

ah, s/arm/arm64. Thank you!
