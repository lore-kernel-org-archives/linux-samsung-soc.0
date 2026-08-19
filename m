Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A11E36DA14
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169130; cv=pass; b=XmglDED8GG0wCTAHBP6XhemnSQ8zcauq0i/nv9m/3v2cs0SFBRvSXTo2WDMrF+polgAnDtj5hzmzIqZmBnXptf/jQ1eaKfzHdQeLa/4bq6W7QBjedEG7Di8naMlZQS2oMBjSUjfnkKI+AkI2lgS3fYl4JUs4mpVusDM3/KtvaX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169130; c=relaxed/simple;
	bh=iJxx7AGzKn5JzuzTejQHH0flYnkzlRr4Jq6x2gFnL1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/q+Nz+UflBs/u3rcEB9NxdGQRcu1wZ7qiRBsfWwaL0piX0y6jgFSx8CXnqyFqvS6ukfYXrCAePSK64x8eRiIjRd2Y6NcX9ARU9GdX+u2JskELmt91IBk4ZBZrlOWPqyeYA4xX30nKq0QNozJWAI5xLdkols2OnrzrgOERq/Gqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewZuerMb; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewZuerMb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7ff05e5d009so19895277b3.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787169128; cv=none;
        d=google.com; s=arc-20260327;
        b=VGWnN4REMfPZenDzu9Zy+ffXba53cbiXvpK6uHTMeh9PmgnbrkiEHyrJViLBoSJdSX
         m/5WWob++FwdPViQRj3IuitdRrpPw0Eb2VzrO7H7/1JU2TH/uqhf9AmU481soqI6gRgN
         4S3bndU5o9uHdjcOq6uWCn1RZjQgtGLmuqsiZmIPvVO34/h2Va0CDjk5CEz0HHehBoKZ
         hXQJXV+rqiVJIS3uRUHylC217sEFtqNoPe4M58JUbtTiG4vK0Yx1w1RaSoT61ZZEt91b
         fowoqoRxsLNkzTSFPQ+cLa4j/+/xMEakDrsd909rtagYIlgRilrjkWNE1lQOzuAe3XIV
         6+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/SaG0G0DjkldI2/6qV3SISEFspIBmL+SZ3mPT+4DmiM=;
        fh=aSnTPcUFoWZG45x3INDTMP8IqYETCALxs3qWil51MKo=;
        b=aLzrWqrJtXESWKI4Qv19sf1J/4D+LL3DpFf91DX+wAEYiA5WXwYi4URzWigSJF1D80
         7lLoD2q7eQDnL3K2ZtO9cQOf6zeiJSnb7n+dN1V3GnTNfY/1f502i5f0hvC4IyRl1ZjE
         o4jVI987dWseIFBHrWisb86EC9IJdrxt45A8xqw99uXbJMqZRtOhbuLLxdO83Y5FZCMc
         K+HshyUzMwoM8hQuHPePNDzB3Ixxr93orPDqYAjh7vEHR24cG8tLmvTtScQ5Ly+83BNj
         Agiplsb9/T45yMeDPXx4WrLDmMf+LsyqsPPkIQ1RQ0fmGE/1i8wEnWnq7Lka8XcRrXN3
         GIbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787169128; x=1787773928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SaG0G0DjkldI2/6qV3SISEFspIBmL+SZ3mPT+4DmiM=;
        b=ewZuerMbLDuKE2j64bxqlvP5kCwzWNTPT4zcPPxlw0vI0KAjgzBMWZTk3zVCIq4fDg
         pRNN2cRXz2ct7TZ8nvymcYoF4c+E0AoDS21W2jZ6ST77QRhNkhCDd33aFtz2YDh5uael
         0H00+34rVwjF4C/q8CL1vrP9zAMsY29ryPELI9snYUp7QKy1qRDRSTvTLH9D7NXM/GvJ
         JGulVTb6kK0ekzSLNrD4qqe2HwozuuGp2L2kRzL9yMMpiyjBGNS6eueMNcfmtcjJpenu
         pZpaaFWbYturXDfM7eDnm4ZbOXZCkMxdkTQG11xr9wbPsuJ3GtcSF/WGF3PxctilbtOl
         0MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787169128; x=1787773928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SaG0G0DjkldI2/6qV3SISEFspIBmL+SZ3mPT+4DmiM=;
        b=lz8/42hn84qgyEpwYhHcQDcD3X2eQul1Q2/LwJ0vpT7NjlUtv8JHZwr9jgflk02Pav
         k9wlw0Fi76LcnBo9p4f8U5GS5Ft6QX0y42LT6MEO1LlPyPfBFHRQ9ULZVbmtgmNkIMZ5
         +/d0qEk7WH6yy+PtgOhKauqckfRELYREjWXQf9wxbyAaw/EduBEPRv36to/QuI48YtMn
         1mBf+13DjLYOKgORo+B+ROkGo7Dbym1cyFVUe7zpJfZWWqyUH8qMTlZNQVbFn6QJ98EB
         iWeIOd//Hn9KOe3yNPGCbllfyZPxrFnBMKey/AOfBnbjtSB8G10tGqF73eUZSI2JBNO6
         zcQg==
X-Forwarded-Encrypted: i=1; AHgh+RrtmGrAWDFReBWE1Wmj1+aFThYR/10sF0eS138yEOeZobuUBKgSemXu7AqGNeWFONHVXnwSmp6NneAJ64qKQy3EiQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nB9QAo/qbNasdKH6xi81jXDZ+/1IJHdQhhR34tehMYS9WMqK3T
	r3t0I+gNUb+ERb39k9gg9iIQi5XIUmb9O0zC9kfmBvZRBro1yw1fZtjcEsVFp2vOTnMTiSizS0J
	HlqDUo/oaI0y2eOV8bCeGpmr3rvx+C+yp6O7cLHltQA==
X-Gm-Gg: AR+sD11330Ol1ePQ3H6bK5f68wTTPAE+hnzoYRdACYuLgL7SN1ZSBwv/LmcAlshXbIX
	8kO7szJ0glRJsKkAneX3h7mGa5gEa18Lb5eQ9SE+zo9L1JhlP9wWuXJpHkYLwITuBWmY6sHsOf9
	zf5B3rPQkOwn21OAia5+JYkpHZt7dVD5cNA0oHBjGpP5MAKRLnE61X4UceYkUhfwe4CR1cTTVOr
	xbRSKFfUH2URd/xexAe2u1F0M/qGLvD99ERzs1WX2uUg9QU3FsCLnvj0bx9ietx+jQOjvfv197Z
	jRRDPDuKDktQubuEcGwKqSCEU3OqjgzzBSW14WDaiq9UZRi9b6AxgyQKvkXajJxid4x3whroC+p
	hx6kiza0b8Ey3/g==
X-Received: by 2002:a05:690c:30a:b0:845:ddf4:a388 with SMTP id
 00721157ae682-845ddf4a483mr17548747b3.10.1787169127765; Wed, 19 Aug 2026
 12:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
In-Reply-To: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 19 Aug 2026 14:51:55 -0500
X-Gm-Features: AcwNN1U0hJEcAZdSQR3EFg30wQvgB44OFhk3hWO2h91s5wVbKbBI1pkFg1UCMsI
Message-ID: <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
Subject: Re:
To: "thomas_turner@talktalk.net" <thomas_turner@talktalk.net>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,
On Wed, Aug 19, 2026 at 8:07=E2=80=AFAM thomas_turner@talktalk.net
<thomas_turner@talktalk.net> wrote:
>
> From 20f8cda9f788a2d19689f350bff3754ff3c24e3d Mon Sep 17 00:00:00 2001
> From: Thomas Turner <tturner@lineageos.org>
> Date: Wed, 19 Aug 2026 13:48:24 +0100
> Subject: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node
>

The actual mail lacks the subject. Did you use "git send-email" or
"b4" to submit this patch?

> This can provide basic GPU functionality for the Exynos850 platform.
>

Can you please tell us a bit about how you tested this patch, and on
which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
sure how exactly GPU can be useful. If you have a use case or a
testing procedure we can run on the E850-96 board, please share.

Would be nice to have a more detailed commit message overall. In
addition to the above, it probably makes sense to also discuss current
limitations. E.g. thermal, PD, and DVFS, which are enabled in the
downstream kernel's GPU node [1].

Thanks!

[1] https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exynos=
-4.14-linaro/arch/arm64/boot/dts/exynos/exynos3830.dts?ref_type=3Dheads#L71=
9

> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08..8ed85c125030 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -296,6 +296,18 @@ cmu_g3d: clock-controller@11400000 {
>                         clock-names =3D "oscclk", "dout_g3d_switch";
>                 };
>
> +               gpu: gpu@11500000 {
> +                       compatible =3D "samsung,exynos850-mali", "arm,mal=
i-bifrost";
> +                       reg =3D <0x11500000 0x5000>;
> +                       interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "job", "mmu", "gpu";
> +                       clocks =3D <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
> +                       clock-names =3D "core";
> +                       status =3D "disabled";
> +               };
> +
>                 cmu_apm: clock-controller@11800000 {
>                         compatible =3D "samsung,exynos850-cmu-apm";
>                         reg =3D <0x11800000 0x8000>;
> --
> 2.47.3
>
