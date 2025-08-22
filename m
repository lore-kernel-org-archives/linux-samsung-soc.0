Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC22EA74B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850450; cv=none; b=oWgFYrEuUwSP3lNFF9Kl3hknS3vGsX9oC/Lnk8uViaZcq74q1MqS25+llc/72WMXvBXuh+mdOL+6weehAqCAR8H1Jm9EimavpPWSgf6knn/r2An/m2A8cAEaxZY2hoUDh1yjfhuEoanencmn03GwweQwKxG5aVwQvedvSS1dDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850450; c=relaxed/simple;
	bh=ISKJzVPXu4k+ZO6I9/7b7/q2WElbo9A+JMC+LqnOasU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKwdol/YfemCnGk+O+A3FfWFzBf8DbXgxvGb7s2WfGMxZFYRDLvM4rQbiYMQnDdk++7Aoo1Y4uypC9OpOH1uJ76M92kKFbjuDupzTvBVMHCJkImVyamwtWYQVTr5V0gD2MgSh0yE4ArWEvojY6gKytJsLCvbl/YgDYF3e3haaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmdAC+0M; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmdAC+0M"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb731caaaso270155966b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850447; x=1756455247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=LmdAC+0MOvfF50Fuxs9TAbyHCdTDFlrQIbzbTUQ/F4/qTWpROoYBUX0dRV0vHEnGaa
         G2UdjJqlhQcveJELlToq5PXE/AzlsCnFZhyn0qOlRc57S4YPHuOMzwcLulZkD/K5potN
         ovOLU69OfOXyaZKKiMR4Ko6EQZFs+g2hi0b+MiCjS7mnX9EQneu/mNOe3LaBCtR6MqJu
         G/BFQaqrbVnEGxDpJtXbI8PiHN2nfAsEUWraAEfcKLrOd8JMtgBB4zJuITnTXcUDZZZ8
         laSRZFzGv003bbnZ6Wi5ZcR7mnXjq0sOf7K8yMbBpwuE2woAao252VKl6EINTL0uh43L
         cbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850447; x=1756455247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=gllwj5ehIB18d312LY9D2RvXQaQi1+Eyk993/zP84ckKsim2EQdqTqZJkuYFepAWhm
         3/EUDSO6zv/Fl73SGovsA2ECjybGLTpDe53JDcuPY6OW8VXZ+mkqSWPM5/50RgN9Sp2U
         N5PFRTQ+pG8GMjZcoe/RVWmDD9ARHmfuRhJ7VrYwZIM7gyv71Pz78jpHWmYBBfiT80ca
         I+myqPSJ7FkYn9zhtjlnHBnRGo8s1/DtTfebxGIMkurxesMGNI/UESlD8fpI57amIr0m
         QCzJjQvMS+GXF7+XlMXu6zyPVUGxqYxe8vxiWnCiSelIoYyHVzyYhkYRIUfbJR8apv1H
         mjVA==
X-Forwarded-Encrypted: i=1; AJvYcCUK8yg782FIH8UIoSSkuHGCs4uyyCwgFR8C6Hf5gG4sL/gA6urKKk6o7tiFPf46dSi1whmLHMGTiGG/NqezO0Gd/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyclaJ2s2DfuGDjnwg0MRkEwNCF8GPaslm1w5//FZEkw2muC3ji
	1wYE3LHyJp01nCjTkhA9+ku/7ctDWv3s2d+PTTmTz13lxdIj6Ful2/EwMBsaGD9M/iwcblbXY4k
	LvTfLyfo=
X-Gm-Gg: ASbGnctRlyCowXHL7Y2W4ntclgmHskNbtfqpRsanrp0hZMui4l6MO0sHk/0SojOgiGt
	HsMBPJo8+uSqMRD3X5i0riolQJ3yshRZ+I/WKVPH8PRFWqrlapsyuBk4fELBTcLZCc8rrXyX7sK
	8Z6xT3SXnw/ABLjlBINFenKeAR86yAjxVxlgyBTKggxCLg15Fwcnjmjd67rv3Rt11I5Oo4Z5cGS
	RQU3LwG+/0RlIXITmK0vumaqSUXB1BViyJa2YhLjckdP3p5svk5X0wOdZFK44q49jiVWESICrh5
	puh/pJMOCTyz2Iue99rmheUA9fB4AS+LehXDgiK3pjZoyQRdry0e8dBHMEjJNpA816uBdT6SqCi
	rfDGPJztD8kf/iJ1XedNYNRCh9BDYPWrR
X-Google-Smtp-Source: AGHT+IEGEVoS2KNiJz+rap9NchIlTHp1e7qqv0SERyT7o+gtgwKhQP2IflgiPn4RYqUiBzAj2fr7cQ==
X-Received: by 2002:a17:906:6a1c:b0:af9:9ab0:6f3a with SMTP id a640c23a62f3a-afe28fd7ec3mr185456266b.23.1755850447341;
        Fri, 22 Aug 2025 01:14:07 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded309ee8sm559576366b.27.2025.08.22.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:14:06 -0700 (PDT)
Message-ID: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
Date: Fri, 22 Aug 2025 09:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org> <aKdmurrT1pFtLSI8@x1>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aKdmurrT1pFtLSI8@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/25 7:34 PM, Brian Masney wrote:
> Hi Tudor,

Hi, Brian,

> 
> On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
>> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				unsigned long *parent_rate)
>> +{
>> +	/*
>> +	 * We can't figure out what rate it will be, so just return the
>> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
>> +	 * after the rate is set and we'll know what rate the clock is
>> +	 * running at then.
>> +	 */
>> +	return rate;
>> +}
> 
> ...
> 
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +	.recalc_rate = acpm_clk_recalc_rate,
>> +	.round_rate = acpm_clk_round_rate,
>> +	.set_rate = acpm_clk_set_rate,
>> +};
> 
> The round_rate clk op is deprecated. Please convert this over to use
> determine_rate.

I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
as deprecated and add your Suggested-by tag? It would help other newcomers.

Thanks,
ta
