Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD21D63FF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779603; cv=none; b=c7hvSgM3Y9nshtB3ZB3c9T4qVLe/QprY6xZuoIghyAdtZzz2BI+o16sAwNMnk3HbeXYkx8xGtVH5w130lR/3aAfGyIyk2oURmby1WQeWiqVKOG9RlSAe0o7OPG+y9ZK5DFo2cQWYoSAS0FNPjU3cHgUbLF6T+Y+alRV80BZMXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779603; c=relaxed/simple;
	bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj38nuP816OqAlDMQokhX6ZJeFRtzSn9nUhJ3IWsrk42nF79MNWbEms/c/Vx1jqfdO2iSDEatWS4y6GxqePQRoBGmXaYsMD0xDypS0jHsMqX67c9LEifZAkeMnD9buBBodg4SgRYd0go3doa3Mle8Of6npvPPbCAj8DGyizhakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qfmRQZ/5; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfmRQZ/5"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2bcceee7b41so1813601fac.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779601; x=1742384401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=;
        b=qfmRQZ/5UBV03WqOmIPr4g/BqdcgWAxUZii/4TPbDhxFK8APn+iuKm91a7EHZlZtzb
         UznGGWW7D8rcUo6Zd0Knpe+ACi79yILJ1nOQ2iUcXEJ64z7RtvLLpYL3nJ2KxW+W8i32
         cDgLSICNpGpAakpYnhW7PCW3j+WW3P63OcN17PUFFYfF3aGiSoKjRKxB/dsd3EbA/R/R
         S79tOjnt1OqI0pDzGl7gxwZV89TYHteNI5YLjpqtHl2y3hSfnWqQwgyZBgC4LXl5tslP
         p0pqv9VTSJybYL6Grn9c55SJWRsK6ePiKOiCUdTCQddbKtdtpyQhmf0+2+EMDckNAeVM
         ekrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779601; x=1742384401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=;
        b=wdxn1sDPgN0fa0yhf4Q7mdhyDI7VV+RTk9vAHtfEwSDaEMgWOP5FGrMYgETAyjWYfA
         pQgbKe5PlWKEK8pgYwS2vkNbL9PaotPEGhypcvZTZoudT91A3Bi0oxFymXq0GKMDvnuU
         rByy5Rilm0GYCYXyrcPDn0Ex0kaqN85fuGOUndf7JE54+FgNBZzQaemh44UW2zqKUuyw
         ArWRIpRcdDSQTRH1fFhGKYosaU0TXVYiIdppzQKYFpidV9gReEX8uDSQ42HGqZnUyLG/
         C4JCY4JZKqw0MI58n/FCYhucyGWgWDuQGdPZf+8j1vvRJbRq0QhGsFoK8AcEQCkYyFWa
         6sFA==
X-Forwarded-Encrypted: i=1; AJvYcCUXIG7Lzz1IGjjr6CorrR+Uy0KSc2xSuq0gVaawvy8HEfkRrC8n56mNNjsuczNtuZChayNykgop0lcte/bqGq+rWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/vLgNI4Tt09oGp8t2jaaFsDfxEklSooUgHnAupsnM9panf0W
	kZ5o0Toy71CfBDCz/gY+khcVglrMJWy/pOgi7V3E6HQzMeyD3U0CJpqOzopTY7qkTgUG4dHH2k1
	xiSuY3GY8Wd7cnU/PKovWaiX15CuFiV9PtvtM7A==
X-Gm-Gg: ASbGncuohOnmHgSCD7WABxj/rf+nGv77o1Qq75MLutqcE1/V2ClQwDLvz56nJMFYlZZ
	lpb0KNXE8M4VsX+LVgoQHjHkYWU3+L+XKXzfDMGR/Hk4O/u3p0+n98fIzQe9EQwGnhbzkw+c4Ws
	UMcR5qkmRur66yuLt4rQSvrh7WOGZH
X-Google-Smtp-Source: AGHT+IEOKr0G9dvkjWIRUB6KSVHU6mQO45AWdp58WuGfhWD50M7ulSEgn1psTWYM0zeljiehFpwBV8RLclSGmbEE8iM=
X-Received: by 2002:a05:6870:6f0e:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2c260fd90dfmr11572872fac.4.1741779600961; Wed, 12 Mar 2025
 04:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-3-2d775e486036@linaro.org>
 <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org> <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
In-Reply-To: <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:39:50 +0000
X-Gm-Features: AQ5f1JormaFnXJuP6e1NiOQZPsn_AaUXUkojjSZ_JcJhsq5FNURWiGRoLSlUVIY
Message-ID: <CADrjBPqSSbt=xM7u12BU2nsF2xvyXe_+bLSCxCPBTfCc07VpuQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Mar 2025 at 11:31, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krzysztof,
>
> Thanks for the review feedback.
>
> On Tue, 11 Mar 2025 at 19:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 07/03/2025 11:29, Peter Griffin wrote:
> > > gs101 differs to other SoCs in that fltcon1 register doesn't
> > > always exist. Additionally the offset of fltcon0 is not fixed
> > > and needs to use the newly added eint_fltcon_offset variable.
> > >
> > > Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
> > > Cc: stable@vger.kernel.org
> >
> > It looks this depends on previous commit, right?
>
> Yes that's right, it depends on the refactoring in the previous patch.
> To fix the bug (which is an Serror on suspend for gs101), we need the
> dedicated gs101 callback so it can have the knowledge that fltcon1
> doesn't always exist and it's varying offset.

and also dependent on the first patch that adds the eint_fltcon_offset :)

Peter
