Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBA1F8AF8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2025 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781922; cv=none; b=TZHwThFn8s1/O2D2iRrJp9YY5SeR3ltaurkPqA1SZb5Tvab3Dd6z9280Bk425xy+4xBewH6hmBG9kd+CuwKyeoXMXk1EagojLdW9iwNgXwlvit7TeH306ZR6raDiebyR+82am3dbGP24n9JulbnKUNAPFFZLDQlEf/49BHTArFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781922; c=relaxed/simple;
	bh=/t2+YWKsBNaTZjRg9QXhq2gQ9OK1h3FqoqYWVASNd38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O/CL7n9KDt1G0zpv+5l9eFcHHSXG0Vp8/s1ae10sGsXCwDwNfHj/SACJkvvJhLfB0Uj4Fds7BEm79OPnmR9I+B08UiPtDfL82ioZEZAWNOQ5n2oa3qKqxHu6NU+iBwtPuvsHS1b9ScpHZFxRjCMBXMJE67WE//TGcYwkX2PPttE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkwBeALu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkwBeALu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so572410a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2025 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781918; x=1746386718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ciHLBQ7v+KERtVpL0VN+WVIHbN2nip11tdXEkw5/k=;
        b=kkwBeALu/WUD6Y1YQQkrBWiqyFAyqAxKOJ+EfqM+ray7RkuAF7UHR0zD470F5zps/A
         ZOfXkMmsag+9haBh0Z0gRvIrzz2C4pccvG/LnJ6U2fmwwyq2q8JqS3Neam9XTEUg/ATU
         rGo2ZMO0l+KMAU6QP5glCm080hn3R1wHWPLeTCS4BevKmQYChpwvSbQZo2NltcL+lsqf
         ZkRW2edOoGtpZ5k1DB3KyWw4qu+97O+aDAMpd8GxmUmsdW2MlLaVdDs8jMoUB63CG+R2
         UVSrk80vEJ2zPm8Aw+9BqkfgUDoiSpIv5mWZeWSLhWgui0H3Uvv0rSlClOM3+ZtB4x9g
         mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781918; x=1746386718;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ciHLBQ7v+KERtVpL0VN+WVIHbN2nip11tdXEkw5/k=;
        b=aE5vEqNEjxMPYS1VHQ8JBdHTS+VHSSvQHOiOYm+LXqYoAEPNJtfkGfcG3unAl27Rsp
         UiNpZOf4QJalJ2/i9zjgMUp4KrQfRq1LzbGGbsG+zJDKT5LXGbrg9JyxW5Q4oHTIszNS
         b/7IKiVgAckO8KdFLjr4D8o2RMT0LXdUwejbnzDyzAKXXgKz3daZVA8HEMDHVrG+hcm5
         NCaM1rLDxQ71IMuf47xWeAm17poPPM7C4Y4fWPH1PATSO0rlq2rfhvz3nqSA3iawaa/Z
         alNtIe3KJ+0dWYsPgU35XS987t7nmAMWZg/Fgg2yQkBpnWZSeZ5p9EVhFvRjjplg6Pvi
         i1hQ==
X-Gm-Message-State: AOJu0Yw7oYuy0jcfz2XYTjTvEf4GlpuQl1UNVpuiFt77Xl8aVWjD0Xb1
	47UtYqoyK+FmRvD9sxbiofejUmSqqlMuZClZnfRvXDT8gdTvFpqTFXM12T3ipck=
X-Gm-Gg: ASbGncv9xnFcq4AecLCGjzZGooFEv8CCJg2yajeW0aJGGxplMNYAOVsfiaKfJ4iCUI3
	1Mp9T3D7XQwu6+1pvfACftqKUyityzscbY89KYmhHf51+mHNcEeSpZQEo6NbqOgY6FdBUqGY4DW
	iK5IIkxrHC+emoobme28Kgl8qkJQaVPFL/xWFKo7gBJ8reh9fpZBeGlE3A8Q3mG2uGQVoO6vnA1
	o9dJAGBPU6NvK6mDVqqm1E24t00siBbWAoD+sbbi6rrs1z1Tj7kjjFSfEkrZkMvvjtVsem+ucI6
	v2hBLUxxzbZi0ltHy9NWVKnyXb4o1jyQo7VLIcaoHlABEQuJXfZalY/eklc=
X-Google-Smtp-Source: AGHT+IFKU4psDf5PYHdZCtkO3pzmjbu/DFKLJPT1981+M/z6WVOmTWVD+2jCO8pEXGfM0N5n5sGArQ==
X-Received: by 2002:a05:6402:5110:b0:5de:ce71:badf with SMTP id 4fb4d7f45d1cf-5f723436a14mr3052840a12.6.1745781917715;
        Sun, 27 Apr 2025 12:25:17 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423044153.1288077-2-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354@epcas2p2.samsung.com>
 <20250423044153.1288077-2-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: exynosautov920:
 add cpucl0 clock definitions
Message-Id: <174578191521.47282.12191544954441136681.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 23 Apr 2025 13:41:51 +0900, Shin Son wrote:
> Add cpucl0 clock definitions.
> 
> CPUCL0 refers to CPU Cluster 0, which provide clock support
> for the CPUs on Exynosauto V920 SoC.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
      https://git.kernel.org/krzk/linux/c/e2642509e3d60dc90b74d27b47e36cea71a96186

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

