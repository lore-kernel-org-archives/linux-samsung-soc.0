Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBD2DC765
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755970; cv=none; b=gBlr4gkX3269cJijxPWUNmoY5MLyanFhPN/rPUewuCO6xYiXfTgteRoBCmQGnaemDa4rdL94dAnxAi5PLH98Yn4PF0tRrvjUlfBVtjEK4zLqBBjtAfX/8Il0Y93L4UQIgViqFj+loXgpfWKbxckl4HayQx7zQIdOHFhEF4Qt4lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755970; c=relaxed/simple;
	bh=SHkFjsUEK8BRAqvmfnv5vItChhZEKbXF3e++QGo0kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGF5w+lzlaeILIFfZG5oLG2hk2cI0l83Qwia0pwCJYldPnmootBEr5R+EqwR94qzgUxT33/ZG8yHTB/9QDVZJmk2+exLS89mUCAMmPqdqnG6JwBQ2XqPWxurhonAQH4VjY0MNOO0t1EEIqPWvQrzZv0Meey+lz+uYU9lDCycPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIANc05N; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIANc05N"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6e954afbdso19052925ad.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=PIANc05N512QUTF5TjEtlbM4w7en9fL8O6BhtCA83roQ0jfUKukb//ho+6RXKySd9G
         FUTw3G0FVSbMNUtMYku3cZHHlvlWyfjjJU1OVIXHzVBQnjMwT2JBWDeHUDO1DzVMkcrq
         AxN6vpFP78ujLulq5uM1dTmRzi+LtC7nNUXT18TUw3Ahk1SOaot5RiQPSLJ/2M8AjXDY
         c4jOM5KGpPU8aUg5vTo0VaGJqfiJ5RwIZVKupuv/lHnbq48TMS7H+gvkXalZhIqrdyU4
         pndd0TNeuW9n0qkAm6pPJvKjOv5aq07RoZ4kaYjA9B1Lf1FeGycUCndnf8+V8OGsGPYn
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=stMw028d6JAN8T+LpLiLYnl4lQPs6sh065Tf1fK3H/vvyV7S9K6LMwtAiydl7sWjdZ
         COhKo5LVnG7MN51gFa+wADkcaUOIQHuhoxChKdwHh+AbRBOOhgzgNeqBm7YKH0I9AcwY
         XqAbWfiZGQ33ru2QP2DCA3bLNQN20M68NxBT0gEMjJ1ttWUXcrahq2Mq50elLjn48b2B
         KDUDEAQDNw9pUrTzW2rYM+WnwgV0+wjAxut/OIBtqQRSdK+AmgRWUVRKdb23pqkY+5x2
         vZxBM45gLCvfnGuASsaugBjAWHkv5pSxpy0F4a9KBAyAcsC52YDM+QAOznvKS8sOAIob
         xb+g==
X-Forwarded-Encrypted: i=1; AKwUvBwz2L5aGpvylMg5XVMuICkM5uifEI3M5aRkzPgBBh5FhbT4YEHAgTG06H3xbguOBIaBb/vyHEsfAT+1+Taw8Pc5LQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nazcr3Ug0KUmGIumd+A0xyvVxEaGQFNKmIh0pfzFB9hGC+DLcc
	LxwYn5sMd0ymHsOZN5rCkygfihnYBZMipkNPTyaiPTldaQRR9pG1as++mjw6ffr3rhs=
X-Gm-Gg: AYBFou2zhdhTTpzEoC39L1IXcoKfuc4mYvwIS5Q8x4cfUxh1bkXWUlm6JoHl8UntKyM
	XykCNWMzCrOCtcB5fXUj49VjLyOxRJp2Tc+8tUAG5ls6OKuzZ6D4BFNrnPClmCLyRQpSxFtQNHF
	rh9/od2CDvukdAe2iDQykjIqJcsjW7fUFxQ/yi/peg2OdB+3TKihKq2zmmzlirg2WlZbOFbijBp
	Th9NKPvfdqBULNguumdLhCJI3lXXDFfTx7Pv9XfLzsDx07wsjnAVk5B6QlM4e/EqDwRAXWHvOcN
	yMzct97mvY3xu4gqTh6pcJjbixZQEymg7qKG71wt3oUhxwNci1f5kQqMOZ7w7LjBMl2ONobzJUJ
	eaUO1F6z9J/efXeAHuyLM4ky7/toAevR1mN1TIxIwH+/0y6EBTt/36Neu53ujPC8+lTJ4p83WCX
	Xwrq1yTWf42uAyRaRi7sm0Fr9Wx/Lrjz5q8Mw9X9Z/LGkdrDDEFHRbCQCsHs5UKkQ=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh
