Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184DC325726
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192134; cv=none; b=c7ETw3kf+lEmukm+rC7vgou9A9TKXRsI+rfGGGFyL020/PaPjMqNP9KYct97WT3YtcjjkXmBPQFO/0nnTI3WezJ10aGhQ+1HenUWJEa9Mk0/7tTqy7Jbzf2iYhBchGvXhMbjZNJITYLGkI5fVWlfxkBrV/2bXcqjvivXvLRqFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192134; c=relaxed/simple;
	bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsfQhJS6wCqVHHpvQG/6lE2N/4YNJ8GZwpgvZFhLFwWlTJ/O5uDIABxCbFEQrPVVpcGO+tziOy9dhSMXfTfwGMRmpKit5q3vC7FE126K1zFIDA9yfevdZUCeIu6l8dCQfbG2HjFD7GZ1k+5V75GdKVhksloneQNgBp94DjyFVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqsqjurU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqsqjurU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953ddae026so10259895e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784192129; x=1784796929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=YqsqjurUv6lGo97/Etd5lCTtR67wn/ynkb133RYsfuhEwzblhfW3r2g6XHgRTGzkYP
         RiKCKlz9l/oldWWtg3VpJKuqKVv7IdPE39T7rbJZ+MuyshbCA8xKMYLcD9IzshXUOfkn
         hxlm1u5dMSaMtMF6epVOfw1GH/6mgAk6dzotivOg9rhLoLnuahe6VWqPQOSgNEzFmquY
         +SZyGMg1ISHHNvPrgk7Qge6BgXXm6EI7rwPJ+qm8ZJxfxbILEHocVccsh5MTE+bZyE/7
         UHo0Q4fhggOHCZjFLOvXcIwtB/h210Pl8NbEgf/z6zTGGCF/bB91mLHFV7+vrSZBsew2
         PeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192129; x=1784796929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR48iTZj9uxDhqtCD4NZ2LQeM36qJutty7MPFCO35nU=;
        b=guQsiJ7W8gA9c3VDhbD4Dnfg0AGqCFT0Y1P9TrypFzQ8yYmeZQaYpEMKeZ05y8HXaO
         Z7Tv+36wLHVotgz25AdAXgXezwRezoBgO8y2S2aIIw8DbNHUH2LsaSrv9K1YI4O6SCJC
         /AvFyL0GnhwHCpC3Jej7AW9F1fyBBHAbJkS5WMoSNLbqxgElabV4MjyG895dfI1LxM5d
         988uERLavHVtmSN7NH86ug2RsWs8ODVOl4bP+CSbr8X+O3MOpH6NNTfiwPmu1GR2AALp
         o9IfpuaItnhq2MN/JY57a9g61X6qN7FjRU3EV2/evq3AbWQg6d9c2MwcGC3HlLiHfPec
         U0Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rqap/9SrPxFxKdvr6FpMSOzs//oqyMZVHZWEFJj4hXl1tXwpx0ZVdws7B18HENPiOgRM9/I/6L/w1osCTwbJXvo1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz75UnpiSntCTwNLtA/pdMv2ytM1s2QaD2MDVcVjqN5JsldiGi
	qeW74bAnxurRduaQjzT046v61WETSrQf0AmAltpgJOrMc5yNoCtar2pv2wA0sQozGus=
X-Gm-Gg: AfdE7cnooTGtdqX3SiMrgBZHBfIgJbbDP7wMOVHuJiSvCqsOtWrcMf+EqC/HqFO5rQp
	1OOHYBoY7dbCcvMKvY6P/g82Tv//YgUYQrvi+sHC+M1OgbBAdPICVe7LcCG0F0j/eUvDWxTrwHV
	6l3LD2NsvE38hzXE202wxYc6XLYahwBlFidvxyF2IYPsZ4173w/7lgzfgB8UX0AjlAehgCfalK4
	XxFk8dnvnTDnWIufuLcbz/niwkQ666y+dPB+wVwp5LWF6YC1w4LFz0yJUkBEWslPxsS6dLkZ1cL
	r0A7Z9E7eqi27lA7MoACkZoGaOFr5VSs5qABCAyhRk49vZD782hQll73CjLhrxc2XjRu+ZlnjYG
	8n7TOfOCqhlQUafSzWaUbrqFPi5/puF6E5H6N+KePsGzsEfgUykwmCQMyASkjO9qr0R/bZhKIfV
	tygnp6nRpTra6/mp0tqap7UA==
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr212192825e9.6.1784192128515;
        Thu, 16 Jul 2026 01:55:28 -0700 (PDT)
Received: from [192.168.0.252] ([82.76.204.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c6ff429sm77947945e9.1.2026.07.16.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:55:27 -0700 (PDT)
Message-ID: <18b363f2-7a10-4e1c-be12-9701b8ef3412@linaro.org>
Date: Thu, 16 Jul 2026 11:55:24 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
 <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks, Alexey!
ta
