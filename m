Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B261199234
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 17:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004937; cv=none; b=NxWWLnHLfAZUw9ll3LANjlPeq2WtV2DO6ssftUsHdUQ1ukD0qce+p6MZKaU/HoImixi6BMfJ7hVuCJdG5nnrh3SQDviR8r2fqX1NBh++YQI/v7hWamroxTquNMPzghavk9ChE1wwfa8krTkQK8pMT1615HaQaNqIVAZsa3mt88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004937; c=relaxed/simple;
	bh=bZpxwxVUi3Yu9Xp5tgpTDN3djeM5sWGLN5I4BpYPP84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ch17dxxbHRRRqPLMKrO3Winm+bNSdjDguiI9uSeaeQiqkeKhLkp9JYMF4M1kM4OkwJY8r2QV0MD8QIRGvynIwrsu7m2GXB7VyBqT9b+B7ezxiadRL575c9jYonaR4bheZnjC45sBbGY+Fsf8RFozTs2CSI8FCvZ8X54qcPL1LkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZfMNV86; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZfMNV86"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8824a756771so53382936d6.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764004934; x=1764609734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=KZfMNV86lGrroT3A2k4PSTjO4MI3foYAYqP/ONRtUw3Ri7UjfcL7HYU3kUD8IkC3ae
         AFoCO+s0LvidM8P6kO1jrxmJXWXlRr3CoTYkF/Iip42AvfmNMT3cnnbHx8509cprmxkv
         mAJs6EGSO+DptVDd0vJKAw+o19fb2sv3DPjykKaM8FQa+ydK6qD3zhFZPjMMEnBfY8JI
         xMKuitfHntivzif/gQ7DHJj3FZghYf2ffT3wxuXULWEi2OjAydf9npO+0wuYjuQKGBcQ
         kILlT4ysXUphVm7khYl+99pKnmuozccqMcDLYJ2Ie/Aeix5wLSpQ/ggV0zHk0ZENypLV
         I1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004934; x=1764609734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=EafDRqpll0n73dkGgOvhsqB2bzx6XiM6uOZoY8J4myDMrQDOjJpBfKfyae0Jdhz4B0
         /Iv8Uy4gADuNAop5sGMNC3ThhWKQMv8q+6WWpAuUgdAqD+6mw1cDD5KAs/gSXNEzGadC
         hYL+3xMmBtHRWRDQOVLSBdMA8hupA7msm9CcEhPmZ0b27noYjYONk+TdU0E7ZUnjqKe4
         Us7kgMeI+wG+IvbToyZ5cFowNNDLFn9ZgO2xHHRmYGVkXV0ZKBnIGurOKFPU6MV7QVcO
         D2vK+PSxhSNhSPYaZ/ivb0mRy9yAKPweb4zVtAy06o+PmjCFUrVa7L8C/R9DyyW0gse3
         cqlg==
X-Forwarded-Encrypted: i=1; AJvYcCWYF62HNKvBdmaz3v5QJanMEGyLQF08t+rEJhnVgiXmx05e5jQO8Gz8dhWf40tzhNWqAqAroUoNIFB5S47Czz5upg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxRrJQpRzWwNfVyrWimefwwZnvRVC80yFqqRqEqvul3P5I6e4
	oAqMcKqlCjXEW36ss54BhjyFuOVACNgD7Azn+Cs+z4CNS7XV+6JgfnEmooJ3MUQz88i9xeVA5AC
	w3DXSfY+ug8t+6Yxz2702lMondpC/dqHvlwgaXcc0gQ==
X-Gm-Gg: ASbGncsXeCOgX8TRoykTnOnwe5kNY3pAa67apv+aQOBw3mKasNSt4FKEi1cfym4lFxj
	e1jyTNtYZmvdVtzm+gXzbAPdKLaFI+6VrjbhY4XX6XAVT5x0dt2HoxPGYA/JdqVMgcJx0koOY8X
	J+grypUYG4megjbKQpgNygpNLobege3WLxM8vlofsyd1qAEcKZP+bXXgslnb1zq2uHjrYWxB9SR
	cNBGnO4MLAQQeY8nRPsAYDQA7ZPb75W9WW3qLIx3JsnGd2eC3f8isHHc9sv1bRSlOwxh4g=
X-Google-Smtp-Source: AGHT+IGur7qIOhwydiDE1YdricdgFBJKpzAzcrVA0e8HEfbCvBR/llLvZ/uw2OutwktsYwyQUs0eBjA/3PkYC9zPCKk=
X-Received: by 2002:ad4:5e8e:0:b0:884:6f86:e09a with SMTP id
 6a1803df08f44-8847c440274mr206409366d6.6.1764004934295; Mon, 24 Nov 2025
 09:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251117073604epcas2p3f35b42617fb26aa087409eb84c19724c@epcas2p3.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-5-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-5-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:22:03 +0000
X-Gm-Features: AWmQ_bk4g88xYV4Wotp3KJG1hjaYXqURmaKu-TssPY9mMy-anug4aQBTum0eDz4
Message-ID: <CADrjBPoG_omRShNhwUJZ0yeRLAzQxmGHvO6OzsR2NOfLczoptg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 4/5] pinctrl: samsung: fold GS101 pin-bank macros
 into EXYNOS9_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

Thanks for taking the time to do this cleanup!

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers, but they are
> redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics, including
> the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and switches the GS101 pin-bank
> tables to the EXYNOS9_* helpers with exynos9_bank_type_{alive,off}.
> While here, update the struct comment to note FLTCON is Exynos9-specific
> (not 'GS101-specific').
>
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces
> copy-paste drift and keeps the FLTCON handling consistent.
> There is no functional change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)

regards,

Peter
