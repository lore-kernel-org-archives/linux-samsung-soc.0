Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F32550D5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777460752; cv=none; b=HSdSJnJJcdZrlMkUyb3hinBWF/LjCfsqgXOw/Cay0HOxTIDC7XFDLpJDMzP0Cmp4sIRDwjOhXm7LcQq3Zj7iBnEaxtUGxu9LRrcZo4zGLjIdasGr1HUyVUx/5YAt8IgytB9maIcaNkICo/gf5UvlU81WdHpUUT66Rayl1d2V50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777460752; c=relaxed/simple;
	bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LDHAlDMHKtPwC5UL9YFAO5Tqg9R0nnHkdi2YA4823aYH/rpSQKf09+6J4Lzxjt2HSasF7mmaAHDHepHL6jRygid451zUtPPOlu0VHcr29rBxKcMZ7upI1fgcO5ivuKegUEy31vy8SZEuSVuiW9393EsWwYa24LZnuIBn8tv3jFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWYufu1s; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWYufu1s"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso130106135e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777460749; x=1778065549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=;
        b=VWYufu1swCOBuEEd05vaIFO4jenyEWf5BPjkF3Vu7DA3spFRBvDjBSYwSVsdtLShc5
         tNOCcPZV+TOgDFrfcPjMIIPl+XIlo7D5l1hJ2KKyi3rN5+wih8P1Lnn6/Eb/UR1v8xoM
         7g4JYR4qIkH138hsr3+i+IJrtffSpYF8lCMsUyLviblNPytasDBKOAOKW/cPe35DJUAI
         afMqxck7ZhFycnsJdgf43cs2MIpgIRLbTa36CGcvM+llLIL/tpMu3PAMkO3tJrtw300S
         5ngBvoon63E/wFl8Ead53JBukYSEu6C85wd3O3/7GB0Rr2zYvkDeZXQ6zXhx+6F/SUdD
         J2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777460749; x=1778065549;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=;
        b=i9UAARtLVSSSmqB+RIrO6ZYQlSfoeqYeSyuKcQlVLbxn7YSaLscIeSXGVgxaEEVogO
         px2pFUxoFyMu8/ydBOCzc78qrElhm8eaeNUewBWpwZyNIDWiHiEqdABrDU9amFtbtuOa
         ivLHUkHb3+14eKLslg8SJt3Ax/wopciW+Q8ska8bJiHoOmhX6myX4T5rljfvMIAMy4j2
         krVVKuEK1jvYtAlwA0Hw2eg1VkK/SXOkJfeYnKbvc2ZtGnInLoKrcrTeTLt+i+OMFS1a
         NZRHYXTs+WyxCHkz4RrMzAQiLf9JBaJAkAVBrBDf8E4ZJRlJSc+lMU6PhBNjrpUmXK6i
         MTTg==
X-Forwarded-Encrypted: i=1; AFNElJ/pDwiBN55urkVQ4wtPFJVv1ZgLFdGOQCBENzjw+kPK76nJkRIVGSTZszc7XHi4hDx/bRugF4lHT/W517udpqFldw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOC3bnvjDpabHbs3zMeqeSiC7VZ7KMJhpo24JZDgwHfFpaQwBn
	LnDu+rUa/FeeZ/KcySgyRjig3hm7Qayt9OQQ1RjnAKeIAmfvRvkquHradAsaxHqRqkg=
X-Gm-Gg: AeBDievCeUnn/gWqtiZPo4kDHvQd6HaaMZ32vJhMQqokNxd6BDOYYR35wnNmqGDf6Vh
	hjG/STsABaQZJS5Th/MqObC6heWnq+CkrmJCDnsbd0ytEexMfBVqKQgJ4BsDuvUQB3yFeqEkUon
	Qz4RREpt4weYHbDTU9HMEb7oRABpIDe7CTOgQOEqVSOLX3uHF4it/X6MQcTXYznZFA8oMhyTVe7
	12LYaLPiSNmbGDHTkKgoIcmJ/VQtv8SLt1QZZivz5BKRpnKoa8JEQA7OBO999pfOtUbUnOvpoaZ
	+Old/nkcAhPkYQQJsAvQ3ymAUbgZG2KEVRlqc8vfBPNTnDvJFPcGln8wXDfWMUJAiHGRWLFtIup
	ljc4Yrwxx+XC7eoLsDhpbF8YlPaJJxXsuHWBxly/cCy1hdXH3XvnrhhmOlSy4kyv6fuFtz9oiF1
	/MNM2ICL2csUZ4eyjt43VAcNv8tX5FZMfLxy7X7F4qzXo=
X-Received: by 2002:a05:600c:4f92:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a77ae5430mr109685855e9.1.1777460749283;
        Wed, 29 Apr 2026 04:05:49 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2fb999sm23367655e9.6.2026.04.29.04.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:05:48 -0700 (PDT)
Message-ID: <6d21cfc8-4686-43f2-a320-1b9505d38338@linaro.org>
Date: Wed, 29 Apr 2026 14:05:45 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
 <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
 <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Content-Language: en-US
In-Reply-To: <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/28/26 3:57 PM, Tudor Ambarus wrote:
> Another thing that I thought about was about the reordering of memset
> and set_bit in acpm_prepare_xfer(), but even there, the internal
> execution order doesn't matter. Both are guaranteed to be completed
> before writel (wmb).

I need to correct myself here. While the wmb() inside writel() does
prevent the hardware from seeing incomplete state, my previous
statement was slightly misleading regarding the local CPU pipeline.

The wmb() alone does not prevent the CPU from speculatively trying
to wipe the memory before it actually finds the first zero bit in
the bitmap.

What truly prevents speculative execution here is a strict
Address Dependency (implicit barrier). The CPU mathematically cannot
calculate the destination pointer for the memset() until the bit in
the bitmap is identified. I will add a comment in the code describing
this dependency.

In what concerns that set_bit() in acpm_prepare_xfer(), we only need
to ensure it is visible before the next TX thread tries to allocate
a sequence number. That is completely protected by the tx_lock
boundaries. The RX thread does not care about set_bit() at all — it
only blind-clears bits based on the rx_seqnum it gets back from the
firmware. I'll add a comment documenting the set_bit() safety as well.

Finally, regarding test_bit() and find_next_zero_bit() in
acpm_prepare_xfer(), they are functionally equivalent. Both are
relaxed, barrier-less reads. The non-atomic find_next_zero_bit()
introduces zero concurrency problems because this phase is strictly
a read-only search (if we read the bitmap just before the RX thread
frees a bit, we simply skip to the next available one).

I'll reorder the patches and put this one as last in the set, I want
to have the find_next_zero_bit() before it, to not touch the same
code twice.

Thanks,
ta
