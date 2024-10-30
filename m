Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24171E0B96
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284332; cv=none; b=pz2UpbhUHzRb4wYB4DmUmlGPzD37IF1YT8dyMMYePCLF1SBXjsPyiBJ3/xpYcYVj0RmAFnSkgZQrkN35fRYaaYmLaemRLTGPK/YBmLyhRu2h/ZZovvBJ4DF2p66opoHefuDkhwbAQLahZOisma4hmDCw/DWePbEcu0KwlhPn8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284332; c=relaxed/simple;
	bh=CU1cu24+i45K2ONyDBFElC17mZkV4BvGmiF2jOuAeeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVd8Bj+5OsSnSAG0LfUjDu7pa7sIxBXtzrIwxpmBXSVFkF6Y7kk1Irmg8OycsuuqFOdM/+FTrfI599hugHt7lVt69JpfG4AVWen90ogkM0kUBMPTxpE4A0Hy/N4C2joF2zn30IAmpuZSUZjUFruqPGNXY78LHLkn1v8KNUqv9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mgzygzOJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mgzygzOJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so63941881fa.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 03:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730284329; x=1730889129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6e62zABhJgu0xsmWlRUsEgJ/DIZADPy+MDY7G9xqvTM=;
        b=mgzygzOJcIWje4b2Bs50E75/j68lD9kPzL+Pqb3r17f5wXtsuBzZIC1ROZEeFONqRU
         39c30p1hqmGWer+wsufR0oQkX81CaEyUL5sEDXHp/WrhX33+T2XXm6EUfCzKq21WwJQb
         P27/JjoQEBZ6r+5pdbf2bH2jj/15J2nP+4WsLXwO5hOpvvEaEmi1vD5zeRFQEVr3sqdb
         CdF4PwQLuyAvBaLYH0Aqp4FBiO6SqWrtt6w6wg+k1lsP7p3uDjDR3JrT8fALD304kMOG
         W9MFs80PC2bdPPH0i/NBZGzqrhVJK0fQ6oWGK5ykWFYopkTYwV0+aeuYoBZq7zisM233
         NFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284329; x=1730889129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e62zABhJgu0xsmWlRUsEgJ/DIZADPy+MDY7G9xqvTM=;
        b=mEvePhpRPEGNwdy93gUEBqdiDvh/uN103BaZOo2VJ27Jwkuw3VNMYt4j9dz/Py1rGd
         fQH10OFdAI/wcrcJuxuI+SHjvcD+K126GJLyLD3RehfJYEs9qLDLlKUNUyd8gTN2z+nU
         CAEeGbS+VMgEmGgFh6m/Q7CqPEGOQ3tnbsU5nXihTu3p0zt9/F2TIv2fHDotFyeul0XS
         FYxGzvQQhjah4CPK9dBAyxFh9Oc/HH2Rt2AXtPtHuMAW99yPWFizQL4E1Tmnr9b/nEGj
         6G/IjCP6MQ76503dPEsCk9UG8G6RH4DA4B1gjq4NChH8iUDG32xhvZpez+51Y8upwiWG
         HQhA==
X-Forwarded-Encrypted: i=1; AJvYcCVyah8GNpLr2gzimGem/O5qGDPwgzDUwbqCGHNdEStt9ptxJ+zkVrSpkMy4v5xpfdBRN0wrm05+4Dq4JIom/txMxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5cySv4WYSLTXTzcqFsb8BnjPc55QigFjBc9/ht84ZxYaUciq
	U339zZTEKeDih14FxaF5mKLPVEr12tPNeOjXlQuZ+gdFdClInDMVG2IieXJXvvY=
X-Google-Smtp-Source: AGHT+IHN0Q+Mdq7fYa0Zn8cYYpDEzpyE0X1QlkitrR+30fjLy2hEruXPOPZRkaCk7IohqcOaFpkJEA==
X-Received: by 2002:a2e:bea5:0:b0:2fa:dcb6:fa7a with SMTP id 38308e7fff4ca-2fd0590bdc8mr13523571fa.11.1730284327314;
        Wed, 30 Oct 2024 03:32:07 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca747sm17059915e9.45.2024.10.30.03.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:32:06 -0700 (PDT)
Message-ID: <c553db69-6bb8-44f8-b571-21c631fcaee8@linaro.org>
Date: Wed, 30 Oct 2024 10:32:05 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] scsi: ufs: exynos: add gs101_ufs_drv_init() hook
 and enable WriteBooster
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-8-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-8-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Factor out the common code into a new exynos_ufs_shareability() function
> and provide a dedicated gs101_drv_init() hook.
> 
> This allows us to enable WriteBooster capability (UFSHCD_CAP_WB_EN) in a
> way that doesn't effect other SoCs supported in this driver.
> 
> WriteBooster improves write speeds by enabling a pseudo SLC cache. Using
> the `fio seqwrite` test we can achieve speeds of 945MB/s with this feature
> enabled (until the cache is exhausted) before dropping back to ~260MB/s
> (which are the speeds we see without the WriteBooster feature enabled).
> 
> Assuming the UFSHCD_CAP_WB_EN capability is set by the host then
> WriteBooster can also be enabled and disabled via sysfs so it is possible
> for the system to only enable it when extra write performance is required.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

While reviewing this patch I noticed few cleanups can be made. I sent
them here:
https://lore.kernel.org/linux-scsi/20241030102715.3312308-1-tudor.ambarus@linaro.org/

Feel free to include them in your set if you're going to respin. Or not,
if you don't want to tie your head with cleanup patches. I can respin
them on top of yours later on.
