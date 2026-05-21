Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FB397B0B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349117; cv=pass; b=HfLoimJ1wSH0PlxLlulKqdcDN883rWe/jOLMH6kZFJNdmaxu4o8o49ShTbPcpA9TAuo5qn6mjVkyYirBNYq2jd9G43eZh5Ze2lApsnwyj6h1AoBMfwS3zWRO839NJ8pHolF8dOv/XabtwW5M+gpaQ1Jvlp313Vo5YpCtIt4ZzYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349117; c=relaxed/simple;
	bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeAJ26KtRx1Wo8NUshWEV9/95YWesXTEiNw5EAyqxrLt19gEshTWIOFPvxRLWM0qSDUbaXNM1g8wyyF4gf6pqdCGQ9Zxvf88MC5UIxXACmwNWiQifq0Pil8R7ZWuRVi1owAVrJ4XPMQmwJ3P9JPB6szSNG7KQL6ncqitEvv/LBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tt3gzNgO; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tt3gzNgO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so4198633a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2026 00:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779349114; cv=none;
        d=google.com; s=arc-20240605;
        b=IzdWDx6lwKnbHTAAZtm3rKJTKXamfgw9U9UIHTN2okaMh09UPZDPk8pIMDQstPvdv7
         mzDFsd5kLQRckQjEIThXeG0WzQZSwmuaaHMRMP1NgsbY0l83BpTQhxw349jFKHNUlfS2
         I8zOLSf3e8vkEZCwwpTOFhx3xWGuhOfP+tIq1sYSw1urvDBoizNuB3PGasTOfrhC72YC
         0Jg8Ejy0VJgcdS12wb1NWpm4y0fW1k6tGSKcXmObzsVCHt8Xr5YZ/n+qIfJL4edk7ZLp
         0m6PQDZ8B8VKWTdPOsyx/zRK85piX5K7C/6Iqde+cpPd4LNXUvQcRZxCjZ6ujGKHM2MG
         r4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        fh=36XV+Db32js+CsJR06wJePVuA2QFhBqKWjfQZnOLfrY=;
        b=lFitLnGy3953JsICAn+UNgmru2YOsK6T1ZFEwBKRjd646b/VKsY5hyENVDJye0hd5K
         t5cCAOh/f4wK1xEzMu3qyMO4GPSnOsjf2HJe12qxKmhJ8F87N7mu+fAQZlZ8iTUlTtHz
         Ee0sm47W2CMR1NIcc1WlPmrsnLERY8v4jOIyf4cebDXy6OsgJE0jUvfYOXh2H6p/AW4s
         HMyCUHtuYozWRTmbqFEK1PE3rDVUJEZQ7m5ha0SjKfUzknrsSlA+lI0bJAZ0P9Ni3NLp
         4w+45CWUyY3OKL9dmj+80tNVi/v5A+1M5JMP8fosLZsFo1X5SgbZIk18P2E6FSYlbjks
         wZuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779349114; x=1779953914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=Tt3gzNgOzpz0jD1f1eM8A91r7kCnmW+W/Qa9gPngeXqXwdih4R26qe8jOTh2W1dFYv
         qksCU8eWaBfPYEzRrIHjgMiuZyCa4VNZUG3AIGj3QutRaKLu6ruuB8sLRsdhsJ7IgeDq
         872eev4Km1kxcrRvNFyS8xHAF92EX7T1Qq3nVvUDYumwTPjEvE09XTbTXlljiXmUlq3x
         YXZ3iqXe1wthTwWBYEM4YYT3ihPRKqjq9kfo1WXsxd66zcU2DQY5VXfMvJnPzoSGtBMX
         3nv7fi0CNI7xXY9VhfCo/1hZzwYTEC/hgi1sgyglXVTpRl+iANLDMSjyb39WJecqcY+R
         6uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349114; x=1779953914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=GGUStlUKhV21aMrKX9Jxq1lXzmyUDXONWbymiNcqrhi2NvDxN+lehn8oVwmAt2qYxZ
         +FHcAhKA4WgQTKPLJUsLcsL2iNnDQ6K+yTBUOja8iK3blAW3dO/JwqA73FtM12PF4Vau
         saXdJItqjyPewXDjXpHWRtTGc7wG59Bg+NE5pfK0DFi1ti5i+pf1u50IxEC5v5k/1q/2
         aLnoXGbdj4K6WiUidNzkJlo43wfiCrGlvMMm2YdaZ3cLozOI3RYq4LDLrigdxWhnMZwg
         EcmM5DCAdsoGSVTMiX6YcRFKi/d7qiC9WlRU3lNyQCkS0eHNZ9JVDz76LWuYxPzxm+hR
         3nwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5ew55L/ZJGGjBJ/5aokyy7s7+pQYEDZMaDRzznA0/sXTUJDEFLhfygpM3+fB2DGKAHGyPxyCWZDD5Lzd9+arTrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkaE+nY/kYngYTzXV1w1D71Gb781pTb1BgWRzj9yTIs9KwrTCU
	YQheVLkdQg+9E/POLdTWjgJLpj/+mB8z3PdVpowDfxWtnOCv/hLvCAwM0DD6jmL+QL0tqwGMA19
	ry+OzEglnRrOWX2dlSgLpcPQjf+UsF15lqhi9c4RImw==
X-Gm-Gg: Acq92OHeI8aWRoC6NdoAaT6I3vPIhMwXHdTk+GsD/S/nO55H5PXOT0S3gDueT12hyDO
	4QWtpLLrRCND8Guq3dve5h5KSDKNLTB5hpl4CR+X8vmzCfkQOAJ3OtT7ftZY8L6DDJMD9/jn119
	dlaMw+Pf36pGkpSV+AkqiWF/eXq8XCyeHLqbOOV7BMKcSN4+CZKS56lPyMfJiL73YcuGhXN7JoN
	e5wrvyVT4LJZ9SsmVeGwDyRu+e6vU8d+gjHRJOKQh3fnWwmmNaeKCfT/koI002ugsWw5ODjjtjl
	57YESUkYj5Twzmp+xlQBLPIg9O8nqQidpSNQAZ6ukA==
X-Received: by 2002:a05:6402:34c3:b0:686:d801:96c9 with SMTP id
 4fb4d7f45d1cf-688367cfeb0mr797381a12.14.1779349113964; Thu, 21 May 2026
 00:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
 <20260514053037.BB9A1C2BCB7@smtp.kernel.org> <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
In-Reply-To: <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 21 May 2026 08:38:22 +0100
X-Gm-Features: AVHnY4IWx-1LpMYkHNMVlV5-A-NXDPnKWwrYcqsb3AhsVZOrTUQ92kJoyqXmTRQ
Message-ID: <CADrjBPpBJ6cZYnGRkSVDA4BVKC_rh=KKvSWq2VjCTDMo5nMmPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, sashiko-reviews@lists.linux.dev, 
	conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 20 May 2026 at 17:06, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> (adding samsung list and other folks back in c/c)
>
> On Thu May 14, 2026 at 6:30 AM BST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> > - [High] Hardware register misprogramming due to incorrect CPU index from smp_processor_id().
> > - [High] Use-After-Free of device node intr_gen_node.
> > - [High] Missing teardown of global notifiers on probe failure causes Use-After-Free.
> > - [Medium] Missing of_node_put() on error path causes a device node reference leak.
> > --
>
> Sashiko reported quite good findings. I'd say that most of them were
> present in the code one way or another before my series.
> They look fixable.
> I'd rather need then two series: first one with fixes and then
> generalisation of cpuhp for Exynos but first one will be listed as a
> dependency (but dependency will indicate order of how series should
> be applied). Is that okay with you to proceed this way?

That sounds like a good approach to me; then you can use Fixes tag so
it gets into stable for gs101.

Peter
