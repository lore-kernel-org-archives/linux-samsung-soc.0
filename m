Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9C1EF093
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733237249; cv=none; b=oEbQJRuWAwx4cm8zzFSFxATvxclC9NjnW/AVU4gDZ5ffS5g8xPn5ULZYekvYov/vMaH4vAhJne4g+/gxpBEpu9yxmMMAk5wyFo2jATZ8fK5PiRWi+P6ZPj4ck1dDqC1AlL0mqcsYN/iWgdJm6PfGiAXYv2i+bY/oSwqZXsXn9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733237249; c=relaxed/simple;
	bh=88ogFTJY+WVyaXYeQRUUQYXOcq9qFAHKf+T0txnkxSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csaZuqqZGtDtpits7SB7kJCrhxY+rpS3Y3pjR/bKFUunn3BxyoKdicJ9gyManl8hQ43LJBfzsVYMCRDKCjsfNT50cqRPU1wbbxVgJsttvIFioOkKYeKOmCmepgoiSjhAK8KQGuqUCAcz5yLg0QGGsRqXIgYccXiKJCVQE1nt9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysTKvBey; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysTKvBey"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f1e560d973so2767139eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 06:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733237247; x=1733842047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgM8+c6QyalF7cc/76yT7fGDgmWP/O2VdbCIDqU+xlI=;
        b=ysTKvBeyHEc8p5/6Z6YLQ1+96Bm2m9VR7cR1H2ZGitg4eJgPD1qgk+7/hpQTKysuib
         p2QoQxucpSqcQ/J7T2Cywp9ApM7tTEHWz7X6gRVztjjv2XZM4WEHxXtpJsAbKy24aTVD
         drbpkY73hgW47K3Oms8bA6tYjPN8Wsdda8JLlA27crNsX/ArQu9K6WjNiha7pdQk64u7
         jnBxAkQYOj9oBq2Ipn/0gMIQ22KtlvxwosEShUEc7zIvEWg6tyxnR1pC6Vdm+7ca3wov
         bwOq8suUzUgmM4pMlp4A6icHyR8CKDkFgf+oqHq/p2sRNYw5Yd/COx1RKrZwXNBg9iBk
         nCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237247; x=1733842047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgM8+c6QyalF7cc/76yT7fGDgmWP/O2VdbCIDqU+xlI=;
        b=GMGEUwMlx00/iXZd2SXYmqk3aXMHCsTvpoDOxF65ljz/MCz1SEiyh67CMxr05a/qQc
         lR1UCcjJIKiQg60WFMJHjSHYQSyYbqBbvdCg1Oukau/DHBmsh3nkNk8Xq4fkybPvs5LG
         ky3hQS9ZorsTiTgXMIE+TyGjGqGiND5gpBtTEVpsYGc+5bvrTowC3AQF51HpD3+8Fo02
         XPQzDth1XUQfGnjECc583WqAlSFqoHRsuXrpWLQsvu0To1GxRE9837R/fh1wFfiP+5z3
         ug7p1aAWQOpCvfrvfIX98l1FaCrfK1B9oTMSBPAOqH6HF6z200uWw+71/XugHhpHwc0g
         OGBA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ao1oM3hUnoq2OKJaF8LPyZYbd+A1AYRJ2eCx6uNYDcYBgKDhbyO8GGjYKPbcmvWAmJCdPUBWZsyg6u2XJqVXzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywf4A5y/soATJwu1TXBstX9x4LdQQk05nKsVmmbo9t+z0X3yRw
	g1q1y6r6ZqLaCt4ONfpXkcPVs4XJTeC4fkxzAp2QP15+xv+4VPAvkJKLKhHVv10kcC5508WL/2w
	I7piid2A8etBtmdM9Y894JfL3DkLtz4kShZTWKg==
X-Gm-Gg: ASbGncs8+nyjsESt+nTzQEJ3iSj14SKyi1z6V7uVH33JT+4jrWNGG8/CcY7d11U7/eO
	L9V0MIo5TWxKPhMQiBJ2W5nwzeL6HNDjlrg==
X-Google-Smtp-Source: AGHT+IENhzKf3J+XAqUzX24pS41sfMggDYWVmlBRkpteJm5vDK7SpgO5QphskG20CDt+MT2o+rMDEXThjllUSYU+Bt0=
X-Received: by 2002:a05:6820:408d:b0:5eb:5eff:afbb with SMTP id
 006d021491bc7-5f2178caf33mr13278379eaf.1.1733237247113; Tue, 03 Dec 2024
 06:47:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 3 Dec 2024 14:47:16 +0000
Message-ID: <CADrjBPrYvz6yNdvZUmTGVAvOtP53kHBLVt6A7zCcRwK3rDg2FQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9 and Krzysztof,

On Tue, 3 Dec 2024 at 13:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside
> Peter.
>
> While at it, also add our IRC channel.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krzysztof could you take this via the Samsung Exynos tree?

Thanks,

Peter

>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf1d81bd04a7..2039cc57d8a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9754,9 +9754,12 @@ F:       drivers/firmware/google/
>
>  GOOGLE TENSOR SoC SUPPORT
>  M:     Peter Griffin <peter.griffin@linaro.org>
> +R:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +R:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  L:     linux-samsung-soc@vger.kernel.org
>  S:     Maintained
> +C:     irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>  F:     drivers/clk/samsung/clk-gs101.c
>
> ---
> base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
> change-id: 20241203-gs101-maintainers-9a24c8b220e3
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
