Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F70126C1E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758622206; cv=none; b=Xk6ptUnvWCmQ3D8kNSDd+u6wUhSbLyconW33uneQxJ7Iget6A5jPHX8ac0V8MLhjcdxxWQLMzEsTFKXCHDte1AEnJyXlaNt0UU6NjEyaF1gxSMcJ5PgFgKCSzDpTZPQcMjdaw9z0HK0eXyT0UPfa9Efk6N3ae/zJo6K/2JChvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758622206; c=relaxed/simple;
	bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMj+nPCLQCbHrlF6WQe7Z4ktxOvEV400knMx4zsYQLLsbDh4z416IWPzAe4R6MsnI9WcEk+ZWrw8upocKvO8nswc+Z1gLtLoGl+3XkNGBNqLCnFpxqYJkdvMKbTU6m9wxco/WWvku+2bFS+d/bkV4cJQyjGSCAi8iouDUd4N4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zrXRR4CA; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zrXRR4CA"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7827025e548so1077716a34.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2025 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758622204; x=1759227004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=;
        b=zrXRR4CAD4XIHlkeQ4mgdF6tArIq3L8ERCLB0DlUzRVeHUQ1v+8mcqqf5BgIEEQ53k
         NRI/3iK9oOhf89Ady+ROIYHEfoiTYqYdWJp1n0Jl/YHwL3Cuc70ztkV1Dh+NDRvdBAqf
         7I8VFFy07pH7w/EuLdkgBaDet8rq61Vl9kj7yFR8xTYE5emuRkITsMMaJB7LVAtjcq/M
         vhgiAhypVEQ9YOs8mD6Akv2tyVcZ412OGd8CsCtMHAmRtLAEOf3gUkvkyDDNcY8uY4D1
         2i7UCvXfNXylNT5DIvoEtP3ze3mFa+wqNNupgSJFpwb7dolqqP9M1TkZHhtDglRF2tFe
         AaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622204; x=1759227004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=;
        b=UOKxlYQH5yhLBIaX9qXdjFHJIqyCamrsMOU3H0DaR6Ha7SQ1Cv6MoL4ofTgnk4BR+C
         tb+n6MPLDU4Uhj9zw+569GabdKLAiROywP5rT8npPsT5LuhxP6D43GD9shLVlzOLi3Al
         6n92VsSl2MfWeEvTqMHrTZOCJ8Pt0tBL/e/Q/HmkqCg+eAjIBc6y4wdxiTxc0NnlCN3a
         m0w7UCCsVV/+nePflPFzPnS8v0gNg9pFfiV8U+Gg6kBh7lyhb2T07yeKreHYvoLiki8M
         NYq5JJ3eIVi3P5aNOHAyGdhQJd/9pqVGBhrp28dq9lJteKvHY4U/XLiPFbAajqQKWItr
         khKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTeX6yNHZkkyIsVZkVceeGEe8CfnWlNK/2uEHlnGyuTpiQtwwy1RCD0/cO5cPOzelzh0KArtRbNuKt0LyYpPW2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lT6X0f2hH7OdkJ+Movy9AtjIqtZZtciB/Aj4O3C8ch0qQCXl
	KxdqPXH/dOrmJKuJyE0yQ5Bghv6lr5msxSnHKRDTnheVtdj6kTH20rwd/1heaqT8hcPT19pWI7x
	XXilNfphs4Viu/+12VKd3vuKsfdJ9lpo/d4S3Xg+sgsKJOQx+TVoikg1wqQ==
X-Gm-Gg: ASbGncvNJ7N7qKTdjctYaIZUH2LpJIhP10SgcU4/pN7erN3cKrhK27meeLk5kOZqwMl
	GhpZlHo6u2CAgIt2ogjGItwrlVmtYHliKYaDqsqAdkkuTi8fuaPy9JnSnX1IwPvyaZiJeSKoZeM
	2KP5KVyj6e5mSjrQs0oC5OBCaiag07XIi09cm3uHdKBxEhPOQzO3dAzxiDxiPhllnLaNvo/mUxs
	LiNC4A=
X-Google-Smtp-Source: AGHT+IHlyhTrDpT9bOGms9MVcAbGBmh07wgn5vpz8u/HkSK1y5dEJI124GNG+UXQ+XT2/QrTB931J5v0hRlkByi3RVI=
X-Received: by 2002:a05:6808:10cd:b0:438:27c0:f1dc with SMTP id
 5614622812f47-43f2d45a7bfmr683558b6e.44.1758622204146; Tue, 23 Sep 2025
 03:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
In-Reply-To: <20250827102645.1964659-1-m.szyprowski@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 23 Sep 2025 11:09:53 +0100
X-Gm-Features: AS18NWD1p0hcePHVemPfV1t10goYXuv2LnsuxG6hiqD1cQfraZwIk9uBaFkxjm4
Message-ID: <CADrjBPrJTKSLd4JCR1MF6UeT1-O0EP3dSg3Ba3eibsh-u64eAg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 11:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> For some unknown reasons forcing percpu interrupts for local timers
> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> flag only when driver is compiled for newer ARM64 architecture.
>
> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
