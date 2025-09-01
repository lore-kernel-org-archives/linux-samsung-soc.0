Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CA7259CA3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710377; cv=none; b=ZzUb1+m0y2EnJU77M1k82NUniSawBeFAeRSzU6Ku/eRtig59ppQoiSrTncKNA6SasEzUb9p/KuR7QBchc7X+MlapwL7iRHf7l8mG1HXO+NDpAjkmZrieYiyb55jF0156ntLpdSssBBWaw65Sdv64dpu5lsk/x1j5JKSkfJJSbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710377; c=relaxed/simple;
	bh=ghUkVbbL6fSFFM+VnU2xLQumO120VvySAdwvS0T6ve0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5JVG2QuGO+z9n7wFFWPrAAnCCiMuCR5Wh9Mgw4CQKbootCZg6uA0YjyIC7e1swFC9Lq9DP9NIaHrqmR+6qLE37UuTIV5XaIbnLVZwTQchp7jZV6CYi2bQqQeEWnMmkvdRxI385CTZkRnX5nefPAPeKk7GxicZt7J0y+Qu4S8aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5V7s0Hc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5V7s0Hc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b804ed966so9881135e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Sep 2025 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756710374; x=1757315174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=L5V7s0HcpxIN9ySwa+9k8bvQSXh6cl0hgNZll5XItb+IdlZ5Vu2bJDbABBorJxKxF0
         UzscACIGYpDu4Np3yOwYzXlypBbXq7lXYdPo/SNf/vWBrRBfkNm3V5Ow3BgEI+qEntL1
         Tr904zYYYwi/WIO7yQduQExd5GVJ1lhGjnyClNX4+cuYikU274e/6Ek4ZmQRjEZwTPlH
         cajgmtQiOwddI1CWRuSaJzNIAwSKBK6Y/69Q4Zr06iuFf7idqzFEtsm/ap1F3jX0Dc8S
         4gZMLk1w0TGZ0cxhmKra/aIVjvHz6HccPzM4IGvEJM9qVthIB7lOtmUpymMXydjEGtdG
         VqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756710374; x=1757315174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=JRmteasiMO1TyloMdHbJ5XWrtVFniusjWVgzWMl1pTV8uexJQsBlLU+3iwe8Sxj1+q
         bcRibS0Pt96oiQC25pzfPLMMxDJBgdjgB+U/fI/nswRX66wy7MqvexvHNvhgymOGzOVh
         H/5+/q5Ap9iGBvG8MAn2ybNzmQ+nMt+/wnhk8nEYKzpY6Y01KlpGeEIURM0A5RgTIall
         FoDCoWPZlZDrdblcam0GEMjpsapsgPDoSXAUJP+KayEK9dHYOG5bQwCgKbvefSrK39Uz
         lnaRtJ8lbMVk+GCDhln7FHbYySdq+qkjU+J1UQxO/WF1oTMlA/xj0WYTOY3A5IMA7zNH
         QRqw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQe5Nl0FCem+M5WyfsADRy1e2SHntidUXhpHDZry8ScAowHITagzg691YN2oQ0c+pywsMyQQyidvLUUZp6z8ybg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNVyWdN3y7ciQXjKz3uaiWNecZx4vWyGDtZhgKbYQlRsvZtXW
	Tn9QuADjMim8+D73PhFZjqlEQi55XAbtWB8mccRpnu1NHdzvvogCHgTX9Ddrj5V4Er0=
X-Gm-Gg: ASbGncuBcP7BrMOEMWrod9BatYMDO34y8ZMcahpFEsPhZT0an7Tn2O3ESasgwDO39nk
	xWmtjBTIqbcwEIG8Uy91XWch2Ad2Bk+G1oEnKrtnKAcni4YzfBj4W13mfMkaE0FlEUqdTkpL+bc
	ub5/IVkhx6eNIx4Ml+iwQXAHyCXin0uW64oU5E8nev+xiQN+p9hSjAYQWPxs2jHsu4122gx9ulf
	xdjfc0FLSlAs19zmsrtlGot6jDfu8oIAGAa2zV5kYAJS2tur1MGajhn6m8JChnHKCoNFOxpdqhB
	9+SEEzBXY39LHcogOcl+9ok8Wk/Gbn3wzKmnw9aWBRtIqaphsqUFGRoD8H53Ac03tGP7ikvAsUn
	mkAV524JhG5HimJznE9slxWX4U9LdnCsHbNpvVQv0
X-Google-Smtp-Source: AGHT+IFnBbOE5ba7PQ9iK6x0QBC9gheBMd69i0QeCPDpf2UAKrxEuZOeM6Cz6ka7pF/Dx8JiLhhRIQ==
X-Received: by 2002:a05:600c:a44:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45b8557c68cmr60349155e9.25.1756710374198;
        Mon, 01 Sep 2025 00:06:14 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm541692f8f.54.2025.09.01.00.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:06:13 -0700 (PDT)
Message-ID: <73674a4e-2397-4470-8743-763e0fb7435d@linaro.org>
Date: Mon, 1 Sep 2025 08:06:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] exynos-acpm: add DVFS protocol and clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 11:42 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
>> are variable and index based. These clocks don't provide an entire range
>> of values between the limits but only discrete points within the range.
>> The firmware also manages the voltage scaling appropriately with the
>> clock scaling. Make the ACPM node a clock provider.
>>
>> Add support for the ACPM DVFS protocol. It translates clock frequency
>> requests to messages that can be interpreted by the ACPM firmware.
>> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>>
>> All patches can go through the samsung tree.
> 
> You really should have explained the dependencies instead of me trying
> to decipher how to handle this patch. It's really not trivial.

My apologies, I forgot. If I tested individual patches, I would have
remind about the dependency. Something to automate for the next time ...
> 
> You do understand that clock is completely different subsystem (Stephen
> Boyd)?
> 

Yes, I do, sorry.

Cheers,
ta
