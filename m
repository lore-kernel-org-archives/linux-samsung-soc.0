Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7B1DA0E1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 May 2026 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638226; cv=none; b=cEze+nJQ0iYLbOll4Ky8cgBxQucV6Tu6MWuOyKVeirXcZTSq/cJaqmY3+Ba7CMx8/ZI6HuLUWHWmXquhM1XqfXwDHO5+ue/C9vcmhU9WbBoNWcasf4LNmErJZmlhTLESNCqTFNE4MNSHxR1LWJ9Td2/rNZtmWpjmNcagc405ykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638226; c=relaxed/simple;
	bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huirBr0y6w5Vbn0WOj//Fyj3T165s85LFimHlgSgPMfBpM+FD9/8uctlqaSx1v4gULPuQZy04abjJ47knZLL+Oz9H2dzwe+cMdhf4ShY+XeapOfMHeylrMae9g7zLtShNDKxXWlgVzIvmVgoW9EOrxmJpbzLqobYf6IfrPMsktA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+ik0Clu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+ik0Clu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so21879045e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 May 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777638224; x=1778243024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=;
        b=F+ik0CluLpFSJtAndiyesuImbqllnRpEN6xqrVzpzxHZPjGATMPrrxKDH9gPHEpgIv
         WebNVMJfAI2ZMTRzS+cgnftNLRuD41Kjx33oHzrX5nSsi9wNFH5LFaJWfITLf1rIeiSu
         VBQhV2gPncFMqIP9IUkI/kvnzYyqJpZ/EzSP/ZiVgabg96Gvu2Mui8QLwKgEfY9y38Wy
         F81rumDONf1IWtTXgZV5suU3a1QkSPxFLeRt7S6eKvm5kM+WX6YUFW7UsxvpGXgL242K
         aIhz74Vxdp+hJWeIJEeZj1OCIEYTpr3j9YPhcr1qz1/7PizBKW9kz7jr3wI0gyspbVIj
         afew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638224; x=1778243024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=;
        b=hMps2Qs+nZriAV9MB4B+JUysevEXxEglDpbnVs8vcWb0smOcXfaTZgLbtwdY5aXkc5
         aBBBw9pW8TSuW4n7jIppvprWVHGORHuxBEsFG/Dy4CsQFezuhiEhbuDWsoWNCcGZSPNx
         ZJe/yIozJ6YqaM1J3/nPt7kOTdQR9l8Tm8mSeF2JG2slGpr47aUtnto+iS3o7L6LZmMB
         fiKqlOdUp7oQiumYYVzrTO612WLDDBWzgiMYtN56zgzU+q4skU7XTl/l/cTbq5r+014c
         CHEVa7xqQqer3EZS/E7572lYjeqLrqrEQe/jLky4dQ46sNsDmNgJ0YaQhS5SJvv91xQl
         1Vyg==
X-Forwarded-Encrypted: i=1; AFNElJ9yj82yZUNFDcNNbCxy7gccguYHZpPIdkLwuB5dlcsf0LN+en9LMUNmYadCxXm7ggxxcDBRAi5cDXkPW3TztzXJHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0A+2kI6YqNKLczDohOxYtFRwpsNHl73SZ786E0fI5y9QNiwTx
	NR0mKZzTffRuf7Qy1nMo05AP1+iKuUB1PdbGLhmgjUSUYBemf/kSIjH0YYJjeAJZkUU=
X-Gm-Gg: AeBDievLfqCbF+1vqrVWh2aQcVQfOnI+NrBBFAEyLbFfnN2imAEgaqvk3/PC1UQYxQ1
	M5t55wBhfHRsk6qLYCOClY51km/3YrXDWwHMHy+bE/ia24ne4pL7mPsEs/+m6d3K3iLE3qc22px
	hHgdimU0NdWFU9oUYHqt6/DXGF24GCuLn0KDEJ69JZM19RjSPLrQc/iGvbUDpJKygu4Defa8Yig
	1+obKiJKBR2jhkUfUUx67HRfXvdF+OBxRbmmYTZ5DJSLfvqlmVnjwYzEjyvoVx/AgDbl8q1NDYW
	JaFQQunbAOcaMMdLRwO2lsT9sWVnWPqVxdVhyPlQpZDoSWKhMPAvXJJhHVlsLtGkz6fMf1CsJ+J
	VIWOqzZR20YiMmSdRPeVHlO/h97ZhqchSrWZb2dmAsNu/KSnENfRy55WwmMgl7zlOqoDSOjE3Gz
	nPRgX2t6RPIXtCAX0Mb+9wle2t7wsvdG2ZGy02ibyKinw=
X-Received: by 2002:a05:600c:4f47:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48a8eb61e38mr44018115e9.2.1777638223881;
        Fri, 01 May 2026 05:23:43 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm4869155f8f.29.2026.05.01.05.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 05:23:43 -0700 (PDT)
Message-ID: <00f82e4b-4e1e-495d-b0bf-b6e4563cfee6@linaro.org>
Date: Fri, 1 May 2026 15:23:40 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] firmware: samsung: acpm: Validate SRAM shared
 memory and queue pointers
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
 <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

After further review, I've decided to drop this specific SRAM validation
patch from the upcoming v4 series. I had the typical band-aid vs. the
surgery dilemma.

While the intention was to protect against compromised firmware
providing out-of-bounds offsets, implementing this in the probe() path
turns out to be an incomplete band-aid. I identified two firmware quirks
that complicate static validation during initialization:

1) Some channels seem to use absolute physical DRAM addresses instead of
SRAM offsets. Mapping these against the SRAM ioremap triggers a fatal
page fault if we don't explicitly fence them off.

2) Some channels are purely doorbells (mlen == 0). acpm_do_xfer() and
acpm_get_rx() functions currently assume all channels have payloads and
sequence numbers, meaning these channels will break at runtime if we let
them pass probe.

Trying to silently disable or bypass these unsupported configurations
during probe() makes the code brittle and creates a false sense of
security regarding bounds checking.

I think the proper architectural fix is to introduce a formal
acpm_request_channel() API. This will allow the driver to validate
parameters at probe time, mark the unsupported channels and gracefully
return -EOPNOTSUPP to client drivers, rather than hacking workarounds
into the probe and runtime paths.

I'll leave the broader SRAM boundary validation for a future patch
series.

Thanks,
ta
