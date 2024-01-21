Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17127383B8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jan 2024 22:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705875096; cv=none; b=Sej2BHvHS0pcNFmrSdbwaLhZ1vBEMyuCXe2ZcqaMjdOLmWoSOe3uNr7kQ9thUYDq8URVY9uiELcoksBnA7MmHtx8zEQMVPPYgdaeTPl4440fOcemU1XKJcLllc+HbxCsE5IAJozX6xNVb1SrQaatj1rm6U1c2fW2UbKoghg8j+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705875096; c=relaxed/simple;
	bh=1WshGn/r4yUtPgsq+2zvC3o8H0Z/O1lFjI+KiAN/Kfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMPXmZRv5yZJJdo9TUsCc7GiXOhaR+W9XLCT9ZhZUziZPdbZtv/hcHRo5aeDMWDWdd80kORln9q17zBzfhBZlgxN5lpOltjT9BSgHq558GKsSqYPiTfetAH4SXJK5RPsHy9MJiKjS0BTEOfXk9MZjjwMg8Zoe3ZfCNCIZzChLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaAirQCb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaAirQCb"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78333ad3a17so241555085a.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jan 2024 14:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705875093; x=1706479893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQx94V7P8SCvFtwg/55jgCd7aKBUyQ8m6oqo197QKQ4=;
        b=QaAirQCbaNAOHijY8N64CdARsU6yKFxELpm9Xcc1GIijti+ewZvRwZDMCN1bRZ+pMN
         vt0OU2+iJIuILMnJawB0vEK8gVo63aDYKgnqG2KYeQzHJU81NDfId9n3MIyJzQFo+HTn
         xW9uPc09gey962JJgd4LqjSZ4YwseATzfgcm2ZmXNWOL9EE6nvq0D3+p1kL2AEq/+1Uq
         a347oO+Fdb7JfsJYYU4u3BJMda4PSg6SRdCLC3rrHmcL3eTOKshkTZfk9zTJeqqr6qQn
         yoFcJtu9JUGuc8IqJt5ccyXKl54T/b91LfA1vETMT8uNRotIAgDU/PSTYuSu6HO1NSZA
         g6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705875093; x=1706479893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQx94V7P8SCvFtwg/55jgCd7aKBUyQ8m6oqo197QKQ4=;
        b=J70n109i8TEMwWwQe72G6olEOExY1U8ITr7dmWPRkNf8hIxsfTPOGEaC1kATSogqzj
         ANYV1zjCyTamJeIs7JPzXXViCwN7P8Jxyuv55QIzEgznUQEuf9YI88F5Zb8CoEzu5O4j
         GvDDUSg+hrDFHZOxrJBXxwJMJPgxvxGepfA26o9KLw+syErpbTy8ErWfeWTyCh2Mbq+R
         TXW5tl43UHWugVsveuwJQXBPSmRXvi9QYHRJmV//8hFCjoy00Zilg0cWDOUHMirMx/hu
         ipIn8Yuzzu1l4scYdx9MSHW1m4exUhL48InGOF1Y5FOWSuc9KfWAVZC7pWEqwxzdrz+E
         Zx1w==
X-Gm-Message-State: AOJu0YyZl7TftSPtW+cWH2TQSXrndm+CuCmV8e0a97cA2sQpQE/1DdiK
	cSyPr0ivhbS79wEpXXnnut5R/4l9f63lpmtLzbM+Z01FamyBuu7PSBwRrk91s2k9HK7n+OFNgC0
	6RD4KjVY6QYurDOYGh0VNBKI/62hUZKKGlt4oKQ==
X-Google-Smtp-Source: AGHT+IHvU8siwfpJaJqqNkTXM5eZ5047daz1HIwgSXnFzKXjH4wTei7iJY8jtoVu/z7rC9KXSwYCQydXweKK5eEVLjE=
X-Received: by 2002:a05:620a:5692:b0:783:7924:296d with SMTP id
 wg18-20020a05620a569200b007837924296dmr3956859qkn.90.1705875092989; Sun, 21
 Jan 2024 14:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240120170001.3356-1-semen.protsenko@linaro.org> <k5ih3vurmzrirgfzy62r5nezm2sxp3zf2qa2bhzowybthkvduv@wjywn55v5hmj>
In-Reply-To: <k5ih3vurmzrirgfzy62r5nezm2sxp3zf2qa2bhzowybthkvduv@wjywn55v5hmj>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 21 Jan 2024 16:11:21 -0600
Message-ID: <CAPLW+4nJKt4xNxXbqQ=c5rXCEau56Xd9ocNKqcuHLo7+-CH8-g@mail.gmail.com>
Subject: Re: [PATCH] spi: s3c64xx: Extract FIFO depth calculation to a
 dedicated macro
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 2:24=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Sam,
>
> >       void __iomem *regs =3D sdd->regs;
> >       unsigned long val =3D 1;
> >       u32 status;
> > -
> > -     /* max fifo depth available */
> > -     u32 max_fifo =3D (FIFO_LVL_MASK(sdd) >> 1) + 1;
> > +     u32 max_fifo =3D FIFO_DEPTH(sdd);
>
> Why have you removed the comment? Perhaps you could place it on
> the side in order to remove that awful space.
>

The fact that `max_fifo' contains max FIFO depth is already coded in
the variable name itself. And with that new FIFO_DEPTH() macro, it
would be basically stating the same thing the third time on the same
string. Thought the removal of that comment only made the code easier
to read. If you think I should bring the comment back, please let me
know and I'll send v2.

> Not a biding comment, though:
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Andi
