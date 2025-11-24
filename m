Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEB165F16
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005059; cv=none; b=NYIvngtfGHJ8z+4CEeHG73CpD3b4/YEVF5dpVCES/bbWysmYtupxniQCaOqGtazNMc7rX2RPjGOop23E/smsHXapQahnH6L9Nj7aMpS8zTUQXFTQmEdki5Zn4bcljqqlRM4xhemS7VY/YBdwK8mNYaK/vL0IwwvFRJRY/zFRSZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005059; c=relaxed/simple;
	bh=RYQLGxxiC287sxK1jBPaeJUKtK0g7/ftRatFNFZN57s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap/dFIgvo329tgu9FnRMMgetgBE+/Gxojp1Oxm0yXOm9j+O+IsXt2BF+RHgW08hbJ9H+pT/NdPr3H1YevY84kfLyUWreD0Y3ygUwDogukUSZSaFquxvXefCcC0QwzaZnW/lz2F8+KidAYWGzaM7A7m0qpSTd5uVKbH3vv6Nt6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1kYCZWU; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1kYCZWU"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-882475d8851so53548726d6.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764005056; x=1764609856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=P1kYCZWUGmqNX3MXHrgiQbTEja7zK12xtqAQM2Rx46gjOX8qY3f2BIkgb4zjVRY/eo
         AT1cxFvjCA7JEfZ60T8k9748faU6qwhISAUuwzDqUltwE6bHbgJYGqLyz/8Q0x2B2CDK
         QzfW011Lkal8vwV1myI/sHZSHkpb7mp1vfz+2l3cRdCKovtbI+FoSD0E5Jt3Mc8nPWd2
         r2Z6rX1QMw/MdC3KNHU8wOWiwAHT1W71/TjJn1N4qquk96s/m/OMDQbZr4f1mLCoXlqt
         OLuQCx7iespNMinBlpCrLb688JBQiyvfpLzmtxl8Lf69oVggPbS1IXfirqPsMVbuwSpc
         KY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764005056; x=1764609856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=R2NOiPuaWYLrDd9CWNYfQ5QMB8JcAS5kRwmAW4xCz/19brmDMSxFBXEf7/V40X4WRB
         dt+re1xRq1AVDMNMM/V6fcy2Q2IEpyhCu+Od8jP5nt88W6hq5NBsj26fvXsdwBhHtETP
         tvuBP4tV4qAekm4EBs7qOxWnomemR5R6A+GwOB+tbs+vGrX22UbBAYYvzyewk+wMlsD2
         z/FvEp0wI23fJMU6CoQkDrT7JRQ+8Qk5HbTjIryJoeh1WSsLy6P/RhrzWk/OOck4xi7A
         qHA7/WS6LW2VZDe3W/Yb7r3d1xPSoMT3xb4wg9BQVb5NjHExm1LFG9iBE1x6Y4SVeYJp
         oOOA==
X-Forwarded-Encrypted: i=1; AJvYcCV5P3oIYgTpmUrew+33xHv/YazY+Lxrc/58CPAgScQKys1NAQuAwKt8ZgcBjvVcfgowoW6Jc3lBFIy6D046AsahoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PS8Fic0OaVrQAe2oiO/MoDeku0i9k1lMFhqf13NE+rHwjrMd
	56OX1Hhu1JZWjMXrG8Emtzi5sG9/K26o05/vL0veIZ2L23Vat/mdkS7xIkKEhUoXJKX3bFs9YHi
	eBCCmB5Iun/Dwxiuarj+AH4PU7Gv56MAabcuW3fhJgw==
X-Gm-Gg: ASbGncueSNlq6Xs+w4PlNC0/HrOupGfZmCRtku3RtsJn8L4q5HawshxAd7R8x/yz+K7
	eBNRJ+sQ3ayjTkwoHooWenHHZWjhl1YPKMd5Hd1Z5PDrv8+6d6M/8QRczTdP684rAtQ/GEyi4g1
	6JLGCN+G1q0vIYCnZdIFQhy6XvRqo/AZe8Lvjb5MuA2/utyUU23vZ6MvdHS9DTEKcuDi7BxO+v6
	0EIAAfQDpcsvmwU7D1mHe2d30BEF9j2118EI+idwcrtN9cB1SUidsPFhRDTp5hW8cTyzCk=
X-Google-Smtp-Source: AGHT+IFnvdWmjJCRzYLrbPvZGNPiEJ5Q839vHfC1gV/jBx6hNY1xoYFkx0yUuNsyMUDPM1RLCsF8HVzcVzBbZ0/NXV8=
X-Received: by 2002:a05:6214:3286:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8847c52771emr181588346d6.49.1764005056039; Mon, 24 Nov 2025
 09:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802@epcas2p1.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-6-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-6-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:24:04 +0000
X-Gm-Features: AWmQ_bkGzF2wniRoBjZTDbuGXNp0h_ztTCTVOwPYyYiq_8xUg5WYRfFqZfMc01Y
Message-ID: <CADrjBPo79HCUVsX_pv6EZ2_C5qB=pFMS=KMkMz8xkageuFvmAA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 5/5] pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
> GS101-specific. They implement the generic save/restore sequence used by
> Exynos9-style controllers that have EINT filter configuration
> (eint_fltcon) to preserve.
>
> Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables
>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)
