Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193316E86A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719014179; cv=none; b=NQGODq2X98gezEHcbb25BoigKf4MtCrISOqntK+LBarpXY0HuD8RHUE/WFCUzMToFEgDH6v1UJGW/CbutxF3Dwfbwbv7ZsQRk9YR0rhHSQf3fcWScllsyx7+eyRa3KoGi/9bBCKRCQf+UJuS2450ZQ3hhL22I5omyj8ZvdfHCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719014179; c=relaxed/simple;
	bh=nWi4TkapE2Ezxu7e4csCWHYxNmjlAhbuDlvNb1n3IPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dk7tmOIEmN8++wdv1IlN/TX/kAbsuRy9jPysmbfUVkBed64+Os1EtQgXhP60gSG0+ktLH2gzeO72OmQccsGxqH53epVhDbir3lT6snvqjm+6Kkj3Ja2dTaMnxfn9Fc2Le2A8p9u9jEm7g9+h3w86V7aSW3w/N8B0zih+gkKIblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z2ajfKhn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z2ajfKhn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f70fdc9645so222075ad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719014177; x=1719618977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIy2CR/RFjZQaJDXPjHveFD5gn1nucaR+J0UOyxBY1U=;
        b=Z2ajfKhnQ2h3ZfKHj+6jmtRIkRSYPFfeCvUhEaqP9GyS7gW+JD+3R+041XKloVqPpE
         XDxHga8l9hglsKe0/enbZRyNIlIZl1Vkyrv77dUZAZmTCyRJBtnQMpZs6QjExpYahQyJ
         4L3jMUfkFlYfSbljawAOHITnw/jQ2NAu4PVZHeh5fbVpvEDSkWdZNh2UHs0F4jHB6elQ
         qIKVOuwAKHs/U4m0UgvcaG4DT8XJtWK0ODrmUkYcXzYeUeg++SoS4cxd0MbEEIhvT0fQ
         BnxnX7tI5qLJdCY+GMS1TKwH3ZxZJCEYQHR1Rf2lFu2WQ1CfzVQjLDFttcLALLlV/n+D
         YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719014177; x=1719618977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIy2CR/RFjZQaJDXPjHveFD5gn1nucaR+J0UOyxBY1U=;
        b=EbhvRsUWORkTkstZhoJy2TYaodkVGCCwQ0NDjyWTOLoBtzpdT86ps/6JmToycjS0Pg
         YsT0eNGRuuM4sO60biD91K+aMYCcM3LjotckbjCM8Kow4Zgx0RoliKCXLe1Wp+k+uFlm
         XejMNqqgxWYwV3Z1rdQhYdkn3og/C4FidhaOY3GzDFuws+SJ0lwQZHbUZpL4CCC6wU0J
         jG3rnZS+FwrSUK+xh1+Y5TA0vEG/cHauamj4PmAE+WWpGmL7ytWWuymERsKeS6cPdu9a
         K3SRPiz1B53YGdnXhqK6CQ/YqF1p3OUOUFGuFmCilqeOKDaK44SGmo0HNZt/FYV/dqDP
         l/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhFWYWVKDiC+enVTjGYM0NlpCI9o4gmLbKrn554FagePn890+O7V/6TNqBlmAII4UMHM0eJc7k0oUJmxUSi4SAV0Gx3ETFo7yhUhl8mKgXng=
X-Gm-Message-State: AOJu0Yy/mW3oRj9A89j7ZSq72iMJYlGpT8J+SwVy+tAfe+qahZvkWJcC
	Raz0oXzL6kqO1njJDDgjrxlx8us6b/gv409OawIL8xnUDtn3Ur0cH7MN5Mf5hw==
X-Google-Smtp-Source: AGHT+IHwKZFfTcf6qeuALbcdQ3AWCrAEIufgmLdwwP3qVJwrhBc2d0hTnJg9cYYAp8QYf/0EybR/ZA==
X-Received: by 2002:a17:902:a58b:b0:1ea:963e:2e2d with SMTP id d9443c01a7336-1fa0a29ec8cmr788815ad.24.1719014177092;
        Fri, 21 Jun 2024 16:56:17 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dbb963sm2168967a91.41.2024.06.21.16.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 16:56:16 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:56:13 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: lee@kernel.org, arnd@arndb.de, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, semen.protsenko@linaro.org,
	kernel-team@android.com
Subject: Re: [PATCH v3 1/2] mfd: syscon: add of_syscon_register_regmap() API
Message-ID: <ZnYTHcjBo5E8Lxi0@google.com>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
 <20240621115544.1655458-2-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621115544.1655458-2-peter.griffin@linaro.org>

On 06/21/2024, Peter Griffin wrote:
> The of_syscon_register_regmap() API allows an externally created regmap
> to be registered with syscon. This regmap can then be returned to client
> drivers using the syscon_regmap_lookup_by_phandle() APIs.
> 
> The API is used by platforms where mmio access to the syscon registers is
> not possible, and a underlying soc driver like exynos-pmu provides a SoC
> specific regmap that can issue a SMC or hypervisor call to write the
> register.
> 
> This approach keeps the SoC complexities out of syscon, but allows common
> drivers such as  syscon-poweroff, syscon-reboot and friends that are used
> by many SoCs already to be re-used.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

[...]

Thanks Peter! I've tested the patch series on my Pixel 6 Pro and all is working
well. I verified all the modularized drivers load and probe successfully:

root@google-gs:~# lsmod
Module                  Size  Used by
at24                   24576  0
dwc3_exynos            12288  0
i2c_exynos5            28672  0
phy_exynos_ufs         20480  1
ufs_exynos             32768  0
phy_exynos5_usbdrd     36864  2
s3c2410_wdt            24576  0
arm_dsu_pmu            24576  0

Thanks,
Will
