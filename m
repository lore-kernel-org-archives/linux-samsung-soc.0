Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF13D75BA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296771; cv=none; b=hXl2PqvN285s0OWK2tojmrcf8uVJKFf9lXCqykN5F6X/uPocb+sSXF7DWG0xh7dH2csyQLYuQHvW2M/pF/DmjYbksB3D71SylWMSzdHFaSIaY2bQBTlV8fb/7m/UYmZ+20QezSFk+tDL1OPPQnl2lobMfdLhGrTEtgaLIVlOKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296771; c=relaxed/simple;
	bh=mcz2c6xCSZH8Cz73VyAV8G27FBQYEh60TbA365Y/YLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRDQsL11Vx+OayJilgXft4C8zqH8uRpcRifamYwNZSg6+7JyZggRO/XaUAQkI7V7WNH+CqzFFwNO2y9z8YvEdVjeT/DuAMSt9pBM8lhFIayie1JtSNewBsMj4puL5h1indf2MZ9zAN7KVaMXfApezMuRW/cIRosy7HiGWaR3MBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEr8OgIs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEr8OgIs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b150559bso39820915e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779296768; x=1779901568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ2IHJqYxmFCyCy0y/0mCJBJ621zTHkH62ufit0bSyQ=;
        b=iEr8OgIswwT7F8cDi3KyXvqO3GIAPkkOv3TN7ocGZUea3cyTSCa8r9ig1o48WhqhPV
         JKg7GPagiwwSkx2LDecQtdaTbz/JPkODQrDBxNCFoQCoBpKE5afdFgWy5L+vVYD9xhXI
         IFRDjN+5NRKuKcMozZUseJXW3+0qHohOq9iQNBCIrgqRR8VNsiDJS+vfVyC9mkHVtACT
         4obhtUWQAinSK5/2Db47TWq0oHiOt0M3MxWW6pAcZRLkcUn8DNVzTSJ/HYBZ5XSAhCsE
         rzRR2yqeEgKaYqnm7WGwlmk9OiljRnujSmylmUxt7+Wjvx1v9GYenMvFdMGukY55Blce
         Qgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296768; x=1779901568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ2IHJqYxmFCyCy0y/0mCJBJ621zTHkH62ufit0bSyQ=;
        b=pDj5wJbN1Hu8lXghy54+xcJq5VmzFzZSsaeLAK1yMScNVz4DWzK20PuPNIqng9nSdR
         B2IotnYHJXTzkekinF97pSBFttipi1daYKB5cOZpLsAu49oI2DKDaXLl7PtdXwDHnGKZ
         3kSgoj1Jk/v6cf7FPhiZnMIFSQlTmXNNr82h5CscGlviIQcR4SwKXS4wZFsSHrSbCzp2
         FNKoC2UOhH70FrmdAEV+rp32yGa6ti6b2razkcPcpaiFMJgNV/vJl6cpQLtkOWvPXzXC
         TvNqfPZGls4TEQbQn7OBJSz2PByMWNR+pIqjFcrqY5wz/GILravJjY3Qo7kJJFFY/35A
         GkZA==
X-Forwarded-Encrypted: i=1; AFNElJ9qnq5gD6XWYFBjNlACE5Qk1bHhRcG6waRBw2hWH9BH9GqcB6KGe3uHnU1M9OYA82A7iaW/4cYk0qfhcRjqb7VnBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjceuvoqezGrWtPsFTbazSFuTwWTV5FE288DCm4bWbUC58WGUs
	VHrUOmd/drqoY87S2mEGGgBUm67hibaGGRspUjfgmedp7SstLrAsk9JRqJlHHJCgZhw=
X-Gm-Gg: Acq92OEStOcWZAv2I+ENs5Jd5KA7rVdOqqhGSFhvqIaFQew30pyJeG1Ki2TdMSgTY/2
	NgJPiAVrDzW+jJ+FDAVPA2HPyHjLMvvGrWp3utOAmCvsQAHJcwfU4t2e/QcEb4Tj86wjH9vVVuO
	bYuIklb6wiNUiyEc3FkCj08Y+aVHKwsvhIqWgjEfzwCn2Xc3mhyrHS4XZPJM0kaJjWisaJEMYCE
	Jo/OD+/1z9sPJdJX5z9THkcu9J0qqcRyR9/3ywaT5Et8oqikTrHvflJSP9960lHrBGhhdfZCaFC
	qujIH1cPdCILiAL5CH9DoRTwwhRebkoVwcd13kYHRIaz1aRdr4sTPrUQ9RpaG6bNIMUUEIjSMGq
	W5tFELEQtIRIU0kNRi4bBJgEG6uG9EM1TdeF4P8AyQG6rpNnoqDyQ6nJ+sTGE0AyW4Nd4vRArEb
	63IHHPbIJ9MKuYcEw2nmlpSjg+MemvW9I=
X-Received: by 2002:a05:600c:46cf:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-48fe66267eemr368182925e9.28.1779296767731;
        Wed, 20 May 2026 10:06:07 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d5f21dsm5156135e9.13.2026.05.20.10.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:06:07 -0700 (PDT)
Message-ID: <3d0ef4a0-f943-444b-acc3-6d44e690fa16@linaro.org>
Date: Wed, 20 May 2026 20:06:03 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@axis.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <pnd34a6m7tc.a.out@axis.com> <pnd7bx2j2pi.a.out@axis.com>
 <pndjysynn55.a.out@axis.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <pndjysynn55.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/20/26 5:58 PM, Waqar Hameed wrote:
> On Fri, Oct 10, 2025 at 15:39 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:
> 
>> On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:
> 
> [...]
> 
>> Friendly ping incoming!
> 
> Friendly ping 2 incoming!
> 
> This will be the last ping for the original patch [1]. I'll interpret
> the silence as a NACK (though it would preferable to get an explicit

The patch is fine, I think it just slipped through the cracks:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> one...). All other patches in the previous patch series has been merged
> [2].
> 
> [1] https://lore.kernel.org/all/pnd34a6m7tc.a.out@axis.com/
> [2] https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
> 

