Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331C2D8DC4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645202; cv=none; b=Ic/TAEsgtHhpwgiV3zB4AK49V7/87cCQOdyqWERVzMSeiBySpkLOpe84N/OQyPVilz4PKtPa+CNgO5G+dNqMfQBEXmnu9gDX1gR63ftpkbX85Ezc+hjBJF2IzoRCLXU8WtLu1ClENxjf9kwf3I4eua1mS0uywRjYMqr6OLl720I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645202; c=relaxed/simple;
	bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKImRA6Peo0yMlgXxR+IxmIQ8soqnLVPNNYDJT3sJ9719BuSB2+LSWd65L/EQuJ6tW45Y1Tl1vOz8oTUe0szrbsEX+y/ZKZ4hVuRkX4s+h2VEMJnMPuv3KbkrKwpz75cRhFenZGuYPzMhp+0dU60nLYCvFASZiRQ/qmT3W55zVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfhMTxv1; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfhMTxv1"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-44da774cc9dso1745097b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645199; x=1762249999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=;
        b=FfhMTxv1RByTSeNNYzyNjwkSpL8g38WpSTI2Mb+Pt+7Xh0BcGfUzyzp/RJQ2D9YHQ5
         UgjgOuJLBTIPsQv59GRp0/R3NvjYqp47RVE4vpb1kvl2TqKMkr+vQhu7PjZUQeXgK4zu
         pJrDUMcJ+W/cD5YOxNdk8blVOwpmYeptuNuQ9hMA2mBtXTi7QsliLxJTIxqUyzMor8iT
         9QzYIkjrfnrZ66ukQxC8PYdgMOBjX+9o+ZQD3ILWMOo/NsD2tuVMGT8vub1YC9R3eZtL
         6PD/RV0kMpqLstJ+CG7b7UzqEND8h4B6z0rU7LwOaPymTWSE3FZFBbAE9RQu2mXPQsRB
         /I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645199; x=1762249999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=;
        b=otdYJDSO3lE2YjDaZ0n4ewswRI8NVTLomvT+nE1Bc0nPnd3aJ/Swp5LP1Y+oOVWnLz
         Jqwqesrl3ZzaVQd/6ZYyxJNk1AIBD+pz0uHkqgt6GMK1/PgHO7RXtIbrMDixt1gmDX6k
         1Y54xArO5JAcyFRphSlJ8ud1U23hLOjBiwIV/pnzJDm++vvT2eNOjWJ7mWFgFPbipyG8
         FeC0hFz81j2xrVcGAilKfRsn6Ln62CfHsJ30LFbMCxJsFaITqYasabWF+AZYEUYlOLn7
         5+4JXhgWd2IShtsa0CUjeJm+I117hw6Hbo3ehAakepZ1ypR6UU7GWjayN4s2zNWNLwlJ
         fzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgm9xa0fyjiO8hR91wSCrAobyWERga9v9qxHxjSYdr+A9S9HCgQrTYg2WGP/xzRQSfsw35Bw617psrdgJZ/4Gfpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtPlvqtea1+1j6xw/zTEvPAdDGAkAa7X2x9G1fq01phNc9qkZ
	br06S/VljUp7iH0QTqEORcWBBnCGhviCH3uSZrFnjhDly5SHgiD0U/ZaaERQIqhJJ6ug7Q/YkW4
	iXTRtln1O8xc7V5p8SdLUwjXkdzs7OrY=
X-Gm-Gg: ASbGncvg2zAW8vu01Ai5cDkYiHnZt2QgtZTzkHx5bqBVSBtfO2yaichh1PANi3QkFfZ
	W4T/RRTS8RRMxbNhW4OY9aLjvsxPxLMyAgsvL8Z+4+PRyF+UE9QRsTyOnScQSFramxN5Iav56Xq
	pZPzoGwSgKd5lmjnpo+CR4E2tTi9RJ2Oc26olRhZYY3gw9PKm894XDtDZ18F+J5JpDiXOcLVr43
	Rshol3nrRaG+1tyzxnYLyEJ4OEjdeEN7TL40wDf6c0AtVnh13sYPt4BRQehpA==
X-Google-Smtp-Source: AGHT+IEbWmUMugzBeIPUgI1/BsJBgV+0SWoENDsfOHTRTsl6JEQadKCa6qWvaTqxnr9sGbNnfs44CBd9zTl5zKommQA=
X-Received: by 2002:a05:6808:320f:b0:441:8f74:f0b with SMTP id
 5614622812f47-44f6ba984f6mr1130597b6e.53.1761645199645; Tue, 28 Oct 2025
 02:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028031527.43003-1-linmq006@gmail.com> <0103d31e-f7f8-45df-9add-76adcca3ec40@kernel.org>
In-Reply-To: <0103d31e-f7f8-45df-9add-76adcca3ec40@kernel.org>
From: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Date: Tue, 28 Oct 2025 17:53:02 +0800
X-Gm-Features: AWmQ_bkMyjcKORFWNp8J-vJD4NSkB71CvF6mfPoA-5wZktbAILoRLRbfvGQOD3w
Message-ID: <CAH-r-ZF9r6hoDOBak5pj7Q5+2wmFto=onHF4_Atv1qcyVjbeXA@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: fix reference count leak in exynos_get_pmu_regmap_by_phandle
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Krzysztof

Thanks for your review.

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B410=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=8C 16:42=E5=86=99=E9=81=93=EF=BC=9A
>
> On 28/10/2025 04:15, Miaoqian Lin wrote:
> > The driver_find_device_by_of_node() function calls driver_find_device
> > and returns a device with its reference count incremented.
> > Add the missing put_device() call to
> > release this reference after the device is used.
> >
> > Found via static analysis.
>
> What static analysis? You must name the tool.
>

I use weggli (AST pattern search) followed by manual review.

> Anyway, same comments as before.
>
> https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fsoc%2Fsamsung%2Fexynos-p=
mu.c

Got it, thanks.


>
> Best regards,
> Krzysztof
