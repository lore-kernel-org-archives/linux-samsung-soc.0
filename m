Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2A31E102
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996105; cv=none; b=X1xpUtiXV4Uk5eHc03yGHddfUTfs/0LrVWkNkrW+LGuTkz7mLVl4BxIGKWHdUuX/7iQmTPlDhAi3sTseSuSwimYYiwl4/NlNfz4eVfcfNNgtzr6kaolXvckQokNdEc5NMJH6GUeZ2GhGkuM7h2uKLX8WJXXfINmF0YAH79dIhE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996105; c=relaxed/simple;
	bh=QTjgMxMpkqLWpIeuMVGtCnInfpv7GD4qqA4XFz+DIsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTVkFMJvqUT3r3x+b/t9WAgG4sDitTgzsbErpBTVYeM6YXGwRFFlu10gyv9TC4+hpPaXtYx097C/SUO/+LGqknuUKIJjEAddV9LLENbdKJTjKBIHm5hva4ThSAqT7BoUoRkvUxy0mn+Zo+kJOOxvIO2netcrVaiKHcA1rkBsUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KJrT+Hd0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KJrT+Hd0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so7445785e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Sep 2025 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756996101; x=1757600901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcDEKKNnQTPrirM2TKss0tLgkg6+UenJjOFVj0kydUE=;
        b=KJrT+Hd0DpngAN2dUpXudbOaUJPr9KJ7KCZuGfLtyAC7stz78Pe21xEW+6VrjXkQqx
         UqfcvkItHcrGdBkmpZ3nwHBzc01kXtle9VIWJU6DkDexB1HHhU4DuQxEtv0q148jTE59
         rTH1KY34QJ4NjtNo6MMC9ii4mmGQoKx89HNacbsbFbTepyrgIaSqVMscztxzEEsbrDP3
         Eq5PfIW4e00pYdSHglC0WQAE+zHczOH9ymvBuVcXvHUmjePxQzo8f5SCF4jAMdK9lm8h
         vilY774VRmXcSqku+vaDrOnZcJiaERXneDyR8OAm+CeOMRHToCkY/y9TvZrR0TpFehjn
         DgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996101; x=1757600901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcDEKKNnQTPrirM2TKss0tLgkg6+UenJjOFVj0kydUE=;
        b=CQ5GTtj2x+ZlcF+SuNI1JI4C0+5KveJlpm0fRLNZaemjxHAIHab56mNDj5McmzX73Z
         93dHHLNN12RLjyDiRn8ChneEn0h6adamZ9WJ3aadww68C5yhkSa/hL64i6MaJocsxDiq
         wd9kZb4WJ6sst9fpTuQjcjEjgt44GQQDSsr8DnwLu+yypK1HS8Th40pFznPR9xfK230v
         2VFUFPY/l7JzS2hywrnshZCMfpUlOz8D45bwSeCfuBNAKWy8cHmCnrirIM9bY8j7Z3Au
         udbjxEAGEOiH64dAQLub0Ve0jq97wvxHVOtXJWHcnhOpXlABa1dBYGwRj7QcSOLa3c8a
         WzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB6xgSu8iwNFbsdOzYIXS3tfnLXPWSc0je0k0IeFsMRLr439G+1qQxC2cw2QwYmwk0x4BdJYdd8eKsH/Uz7XnQgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWIjxWYHKDC4U2mPkguUbOwdwy+c5gosTT/iiR+tpLazY0WOP
	hkP80Eip+5/6c1lr0vIfSBypvPuJtg8ln2Q9rMTcpr151dOmiTvmsdjtKeLitgXQkgU=
X-Gm-Gg: ASbGncttj5+czYR8XFHZbBBxHbjL79+muZd7D26XRXx0+ZGYuyY/dEYDqjIJfpUpVOK
	5j32ilxbtTzLDO1fJuuS8ZLOXnsnPKWv+OZHQ3PxO/qnC7pDZcHQnvfZX0gCBbw33ziLQPZFcrv
	7v5gbCoIbP9T73ZE8N3LGOmCrxC6RDzdWBCN+Dk+R6y+liBE9azjce+gTMCfY9imJNpXTXK/sCQ
	77B0ZGBPIdkKEsbDFOb08tA+V6PLNgW5g+xfqbMFockWkpjJyZCMqCVXFmU5BUOZUyEpxZqe35g
	GHZykDmtn6RkIIweSmj1IsvMewp/QR49hq6adJpFUxZ8WKCIhRpIzMJ+QEfvfFPa/oRzgePlpyj
	btzwgeqPzNRVEAhZXc7SPwcZcSOBpOGcl
X-Google-Smtp-Source: AGHT+IFMpG6ZWacwiwSPkZLZJzyjsT25qjvuify+8jgJtfkFvC5YMwDloMKDY1OfWLbskoCZF7jJRw==
X-Received: by 2002:a05:600c:8b23:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45b8553f3ffmr156662065e9.3.1756996101466;
        Thu, 04 Sep 2025 07:28:21 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm79031275e9.13.2025.09.04.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:28:20 -0700 (PDT)
Message-ID: <3cc48a65-5d08-4469-9ed7-f836a2210702@linaro.org>
Date: Thu, 4 Sep 2025 15:28:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, willmcvicker@google.com,
 kernel-team@android.com, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
 <175699523574.4060004.693479596122414416.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175699523574.4060004.693479596122414416.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/25 3:17 PM, Rob Herring (Arm) wrote:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
>    10 | #include <dt-bindings/clock/google,gs101-acpm.h>

That's alright, I described in the cover letter the dependency on the patch
that adds this bindings file. Thanks!
ta
