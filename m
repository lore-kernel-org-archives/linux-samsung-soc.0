Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D21F09AD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205581; cv=none; b=q03M2MVLpJC9vZktLAR7t299J45ndqDqlmeNOPrxpqz1XNIryCbnvsjYV4ywfcl5ifGSSOP+cR6wbfW2HORAytW7n2Lu/96+lBuYuRuIK4SVzhHTW6uhb4a7rDL1ktCiGcDy39gzyhgJilCHWtm3DV09egbBI+9xZt2c4q6Sj8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205581; c=relaxed/simple;
	bh=5T+dGixDG5fmBL/dmq6WzOVfoP6DUYuLr5vjU9kA3wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIEYe8O0+i8CkGlVqpBJKzNI+riFLa5r2kAFFTfGMlJne6cXqlgJxTnmyMen+Liad5jgtzvW0iotgDQax9mC6We56Q/+uRRBdvL9z4szzMypiv31NVFVkVTSf9av7qLOFSZRAxe95BpoDMyf6ic8MWZhFKaCwirJnjWz1+J5Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5o5p2/u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5o5p2/u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso27909085e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2026 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779205578; x=1779810378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=P5o5p2/us21ERwcjXlCUCV3w2XDJiLvqzH3sMy3g5u0Czyl6cV8Td8hygZfyob/FoR
         wOb6omBvdJiHNXdlyvXkKW8QJ8ud0MwmMbKxmTtHlQWruz7RlIVQ3mybtTIVCB/JzC3k
         dmVpguypTG4gTmIKSshCHQYku/40bKcLmmt/yx0Ozro4uV3ptJhVh75rIzkjVLM7W1S4
         uWR7+w45Z1kQ5hxT0WybTKy3oi3eiVdHGMPcwm0Rtsdq5Ia6RgEXXrjz893+oLUJRlS2
         9gke22KZeRV3V/KAcvri8HyCCre+sTTR4Y3hujiuAPEM/uBlbIspea2JfFfWt2MI2Aj6
         gVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205578; x=1779810378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=N/vUmhfAou+26Z0X6Qj7TmN5pcElXo6TWMdFyAOEfA1DIcHGKL8P007AaFejGaJDTC
         6M/hQJ9xAxhmOImbyVHB4FZgitCHKwdxCCfRs8v3lQsqpIsvRGFZwGFE224w1dcqqeLR
         R06msKrTBSkVUeS8sQPc2CjjAn0Y6kVUDFdjWy/qzCFVzTSOW0b+ruwpCyHfiZmYOT8L
         MWyM2obxN4ilFosbscGQH3//vbaJyavPQlIe3Q8IjFmqyqcCA+2b4yUszHheRm1hkqvQ
         jDU/SIbRm5S6X8pXRwRnkRu2LexldPs4Xsecsy5SaqHpd+OjEdVN4jkXmBg4uNJ9CI0e
         4DWg==
X-Forwarded-Encrypted: i=1; AFNElJ/OYgcJasr6v7g7KWeSyMXTrjVe94055iQMQt+ATKmCCRDw3XcX5ovXf7zWbdjpMMo9aMdNgyp07T8izDzHWDt/hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2ncaCZadaPkh2aUqwNhTTmpDZ28IhX9Dr6Df1esxlHoDXR5H
	OjTK0k14aLE16PO5NMigyN2UDdQcs3AzxoYVa9/Hzp2Y8dGHlT/az8I32tL0OMKmPwnRwGB27X0
	JVGnz
X-Gm-Gg: Acq92OFkmynYXcKEG+dCJOyRnw95xmI5ZBEdo4vgZO/6QQWdj8RHpOgPyF/HE9L4UbS
	vzQvjlMSpUH/zXqJW+1nFaSWFHC5h/cMDvzc+syNUa3A3zK68U1Q1zHqBSlxRj9pJpmTkHJ4TML
	s85CHcINcAcR2n+gPi+LAJ7sHVTNmpC/o3a7b6AXWuGIYxSRieDp38Eo8TJxj8AkAZh+NIfTJz3
	z1k1RMg1hpCyXzptf+Zr4kFxLtytx7tNi7pPNv71ENO4jKfysJsuy4uN1AqhSsfZB/HZ+t4mfk1
	lAXOWil7K2VoqpQwjcRXQoUwWJcnT2mfazDQXR3Vw5xJ+c9i6JlWUCmVttOsjEePecN6AOCnQA8
	S6N3bHPMqlXzZh/nmePJyYO7sDn6Ja0HUsDfHYs0PLxxpB7F59bYBWRbj0GR4IQNAGBuWenmEgG
	1MsBismDDz8hU0dbNkY7FO2DX0u2h0pOI=
X-Received: by 2002:a05:600c:34cc:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48fe59af1cemr336906785e9.0.1779205578122;
        Tue, 19 May 2026 08:46:18 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm333119405e9.0.2026.05.19.08.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:46:17 -0700 (PDT)
Message-ID: <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
Date: Tue, 19 May 2026 18:46:14 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 5/18/26 2:24 PM, Alexey Klimov wrote:
> Thinking further about this I'd humbly suggest that even
> 
> 	if (fw_err >= 0)
> 		return 0;
> 
> 	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
> 	or pr_debug(...);
> 
> 	if (fw_err == -1)
> 		return -EACCES;
> 
> some debug message would do.
> Perhaps we need some convertation, for instance as it is done in scmi
> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
> data for mapping acpm errors to some human meanings.

I did that for the pmic helpers. I don't need any debug prints for
gs101 TMU as I have clear instructions from firmware: 0 for success,
-1 for error.

You may update it for e850 later on if you need it.

Cheers,
ta
