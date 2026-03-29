Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E414F70
	for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Mar 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801098; cv=pass; b=FMouCNOpZwQYdy2tLeWocEc8SyyE0WzrvJctfSHKePc4i6Sfhd90eQyxvre+3FifW5mJvumoTXPP1aJgrXnXZW/nPNHdDmBrgNTYponNaTIVZ6DuHJAzivasKUfwOnORgxplo2yGIFQ6fRTQm2aL/6baVf7ZDmpmWFqMcO6y6BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801098; c=relaxed/simple;
	bh=Q0e5aMLXLi724TnMUUc6wx+dZgqkYFlmPsiJaRjV/6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+g1gUx947oFf/XG7iSSstwgApLT7d9n0yBPorKZ8A1SwVV4s8f7ADPl1o69wSs5YQZScNPIJovAIimslig8DaA3lpNi8GTpuNV9Fkfxa1IVxmN3EQLvKaKb8qxbJ7fMSJwBKNYq6VtjGbjrdvbpeLo1TLAVhmrc7vfQ0P9lHTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9V6OFpo; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9V6OFpo"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-662efd1bdd4so2119729eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Mar 2026 09:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801096; cv=none;
        d=google.com; s=arc-20240605;
        b=fGBxwrN+vpicvr++iy6iiCberH7Wai/XZyM9PUDrd1pNTuKBZPUKf4+HIh1g6HYAlV
         mOoF+0Yh0OUezug6M/ldD03jTABnwcSaU7+f7athUXnRSSaykvPIzTAfN+tXuBjcqF7D
         z15V64QvgDqjdcj42VAKhE1LLIb7Qm5CJ/7/z1kzebvc4SUBqdp1SozUeaC6DglxYBh4
         KnMgePygxp1uawEL7faW0g0SY6EHytdNmmiPTsRL6nsTaEvuViQr8q4cKdi13DWKHCu8
         W8mwbrVTcstUXpOmabVdsJlNQZtTJobK0Al1x4awKKd8o5PEiu+KHjxAVXF10nb2Wjlt
         Igpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        fh=hq64CU0F6HSlmO6GGb5boYPu/4RlABd42WBPXm51oUM=;
        b=TMzgpbHrtxTuOqhor3hIcifwvhrXVRajXessf/thHLej1XaOsg6c9MKLkkNvQ3cVbU
         VIr4R2na4e0jW3on0qa6tPIk1tluXULEM6tXt1RtmesGAFnpVTqQHHiqwA8BM0z38hbK
         36LI3gMPr4p+GKZjALMA8+rQwmlpPI1t9C7yDCZoHPWOV2REoSjpjvifAUYK51+TH91h
         e6yE8VbZkN2Z0HfeWXDLDq/XwsuKZLtApEU0KJCFvYq1yNqfnhKItuRxFh4hKND4QUho
         DW7t81Jb5/mULWhzjQK6K1qAxktE/fUeyxfIOFktW8EUEGM6I24FmlwBmMy6Qh0NAHMs
         dWZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801096; x=1775405896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=W9V6OFpojV6eK03dA9D/Y1Joo0yzm6hY1w8kTQkcYtZImpwpl53ErZQeaRYzDL6uH2
         DQDX88t1Vcp9mcEk3p5RjrbpWBNEFrQvKeXhNubRJJznr3tYbf2HzBrh5YMx2ikMmEe4
         +CXRqjNtMsWksBSjBas1GCgwlwBHCfxd7VGV9fnKB9YUP+CZJ3VeQZ3HX1PM5HbiaYUM
         lPhCZGNz2NQOX3T8mpt+NVnf8dM1h9BbSwGGSyLjiexQ6zcFVA60tWQ1W9ggmBNawFzZ
         tfOQ7Vo2DYPZIpzSRcqtRPclPAFkfdHC5pt7UlXZoS/qs2uYjeKxHiRJrQqYUy1RgmpW
         xRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801096; x=1775405896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=kFsSJAg3y3WJJ9CDllGFydkd76GXbBcAlYn+peB137Rp6yC/r+A7TN1vcBbOfXiAFh
         euPYSWFN4j9f+GYS9Bu1KEDdQUXER3tX4g7L/3AqAGar/C+kR9tAZon00cAkeSK6dfWH
         xM7XCdv+HMnbLNWmR6ILgPeqPT4yb6Fr7hdoOkkoGuFVv36vo3V1t2UyIpUNz1Ye06M0
         xjKU+fV8nBBwwDvYPwJSqkYExQ7YpCveJ86I3Vztvk4iYCq9ozKJei+svW9lq1AheVqs
         2ntIdyxZ6nHjXRs3iJjMUB7jNwRQx5vUutMZPBmrRGvykRr7EVPDMPZC0cVqPDzvkHJj
         UsYg==
X-Forwarded-Encrypted: i=1; AJvYcCVo8vBSEqnEq8nl1yjag/T9GnO90XDeiV0ql8YK6jBKryUHodazOU637EN+sPALoA2l6fB8bzC7nuiA8trFiCsgOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDz/Ea4uBGEQ2EhBWQB5W4bJmupxRHQz5JdO4SRWuvucPDPAQ
	4h+PiXL93q17MGse2j/zz2ei6BccjGZmbx05QDICCNBKkdpU01utR8SZelVkydlCKZOmVmofNR1
	FHee64pOzU2cc1oBvyFc3UYtc6dYA+I5A4Zpt
X-Gm-Gg: ATEYQzzEv5Cc31JAfLgHQ1J56OOKbbT3v32IOlUPEj7jHHrZpoAJbVc8EUxmwENJk9m
	UyWAazcNKvx/V7i30LYIIsSERfrzTQV9Db5LqO8e3TPtinv7akVIQ6G1mBqdLYgYDmPgw8fBoBp
	ro6vwY44sl7zGio87HOrRQvEMfgaSawkVFaXzKSErrouBCTld39iaB9hZxLgXprhPU+1fkyS8DH
	5nD9EEScgvuPDEASK8XlFOlpI/XUci6HzKVTQLu3QGNP27E4Z+O5qeu57CjtW+zEw2muwTv2TFO
	lZsrXbr4
X-Received: by 2002:a05:6820:992:b0:67b:a85e:6ca5 with SMTP id
 006d021491bc7-67e195bd41fmr4231270eaf.18.1774801095746; Sun, 29 Mar 2026
 09:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:04 -0500
X-Gm-Features: AQROBzCYhRSHffyuIz40Wf6kh2CMkJkh3NmTLvlG_EffDBSm87x8_smNNQuGVlo
Message-ID: <CABb+yY0KOk4ASTwomuiJC_XBGvpoAXEV3GhHYpWAbgQiOXZTLQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: exynos: drop superfluous mbox setting per channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 10:13=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Changes since v1:
> * rebased to 7.0-rc5
> * add tags (Thanks, Tudor!) and dropped RFT
>
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pd=
ev)
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
>         struct clk *pclk;
> -       int i;
>
>         exynos_mbox =3D devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNE=
L);
>         if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *=
pdev)
>         mbox->ops =3D &exynos_mbox_chan_ops;
>         mbox->of_xlate =3D exynos_mbox_of_xlate;
>
> -       for (i =3D 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -               chans[i].mbox =3D mbox;
> -
>         exynos_mbox->mbox =3D mbox;
>
>         platform_set_drvdata(pdev, exynos_mbox);
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi
