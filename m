Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EED26158C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253049; cv=none; b=pjwoXnX3+heWQ7bOWzGL4bTDgPmyGihLHGbwzS1Lgx8CtjEDATIl0u1TvUV0YihzRyfZniErl8JaSGe0iNCwLY7Im3ihvGndq3KoK8CxPnz3mnqDltdM+Kr0OoW+cQfYO5IghsQhsN9yVWHANEsl/LNUvAYRRn2NSLaBnmAP+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253049; c=relaxed/simple;
	bh=m8ASc2OAY4fv8+TtsrJxQF9H5kewxn0+auSNH+ttR9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXG7niKCg1YnBMtmvNP6gRR9H5qrNbRlfQaTncsBxELSHNpuLBZZSQvr9uGTRPb20UbBcUvYwXfGHVDc9dw4LhMfmbDV78dTFxV5N+j5m6/jw+XejPXeukoTuwQoo3jOZw9fOwSR/Oa9JJd8cLS8I8Mtr8UQm2L21HOUgNGiPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T65CGYWe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T65CGYWe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33ba37b3ff7so1321598a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761253047; x=1761857847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5tTG1pwP7TykWxe8MPff4LTF6nEVfVWG3Z8SQ568z2A=;
        b=T65CGYWeI/JtDHZc5Q8LaWWi8b2TJQGiEA+U0YTSZXNfm1HjolauayNPqv1XxhofWx
         FtgHjvLZ1c6Q3AbdhY/MhuKzLBVzJ1tCU6C3Nhp/taq+D5yVNVA137Gf5lo1/u+jiN0K
         1Z7D+ECmcmZx0IW+NWS4qmBtZEwDfszVihuUgs5nWuscZN/La7wIsjDnNRn3oPKVUrfG
         FYtiY38GS5VYupd+ObMSyJf4MwfHBcrWJBu2fTwoGPE+QKqn/dh40Sza8v2WInfHzY71
         dwMxWVkRdQb/U3VhSnkDyNzVMx7HyAHipzdIGdvAFCUwoHyFX2i5oISfgfNAyUq7rKjf
         I6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253047; x=1761857847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tTG1pwP7TykWxe8MPff4LTF6nEVfVWG3Z8SQ568z2A=;
        b=pYVGXuKgXF6FUHUDtMnUsP0ERT16GnUsjIFlU5p7A+xWCgZ7kpIfpcjhh6epMyeabp
         J81FLFTrNb8djB5ljSBMG8EtpwWUGwZs01kh90fexgzlHwmOlnFaql6XNtEpNrbWehSG
         CyR8id5kxdQceb98z24lXspAJMU7TjHhp5atYXVtOsbqSYNcxyIjCzPrGgk09XWgeT3g
         ZMJ4NBy+r62Nx5shYt3613CW0u9KJyMGqNoGNtNzY/aC8+IRE1bwFvDbOjZ47KULmc8D
         JdGrq7r2iDhtR7wfqLLavVOeU6NQgbRY8wfmMgBLXEBjDnRu/LGWDNb2mCi3pWcv+pXN
         p5gA==
X-Forwarded-Encrypted: i=1; AJvYcCXCqlTEIpSAAyv8trn4oFExkP5eYYsB2AVq+2ScsuC928svmTiMOcfoWlA13tALjfJ+OfTkllP7VYD8WzRaotlVZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5PRbTtTc1Lczaytoqji6CckdTgwaFHSis1LQBY2XtwrHGOtN
	HRdx0uDdQaDZf2easT2PrHau4RkfwwBaBl9sSW04Q1Aq2U7wlayafuJ81NsXjG61Vg==
X-Gm-Gg: ASbGnct2JKoueL6+ewyHD4zlYvHrCG06xGSZW4GGfAXG/3u08sW9Tl0lBKeyB96rous
	JeWq9JAdSw/7cEdqsIeZhrMNqb/ipaEZ068rf+Y7tdlupS8HKEVhCWC5Zq/XsQfPIdBGpb4NGeE
	w7z8ZYBF/WBCA1VXgUPduKMni5aVwLJ96iBBhLVgmsAzwuVLNxIlX2LcEn8n26f3LTj0ido3/By
	PQhJaLJWvSHrXpSg9m+tFP6HbPsohJP2dOrCXrJpPe3ttnfm+WORI6iuNg+DJWVjVuawtXujyld
	F3rUZ32CbHcbWFf2W0nBUrcA10OMY0diYl5hgGvO6XezoOrUghLYUUibBHQFuaxX2CSUDYwp+Gf
	O0HlZrEMevFtB6yen1DRBZzu/lYiPTLh1FANaaGHYR4fr+5Y8ymNr8UKg5R9pCOYpxlQignnPIH
	yQgBMagchVbQIt8Gmdh5lZP7tsLFyPYBqaesPlvn+nX3q86HO9AE53Fz3U90M=
X-Google-Smtp-Source: AGHT+IG8WEMgflsND+5AmBeFxzQTcqL/T08P5hnlVq90L3tdTnALjw3mEYnO3w9FtfRAZWoL1HpF8A==
X-Received: by 2002:a17:90b:50c7:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33fd3a61ad3mr335524a91.2.1761253046760;
        Thu, 23 Oct 2025 13:57:26 -0700 (PDT)
Received: from google.com (80.88.82.34.bc.googleusercontent.com. [34.82.88.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2090eff6sm3795056a91.2.2025.10.23.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:57:26 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:57:22 +0000
From: William McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <aPqWsjUCmplMda_S@google.com>
References: <20251023205257.2029526-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>

Sorry, I missed the "v5" prefix for the patches in the first v5 series. Please
ignore this cover letter and refer to the updated series here:

  https://lore.kernel.org/all/20251023205257.2029526-1-willmcvicker@google.com/

Regards,
Will
