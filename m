Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DEE2D608
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146110; cv=none; b=W/aQ1Zcg4g1OftQ3KJZO2MjlMTFs5tHHnFxL20NzlNnfKsX4Iz/cfdS5QZI84NHAceSww+mzkEU3ZFEzMpAQrXo/8D1EhOSpXe+FxvTjlww9Mpa/sFH1wTGAJswKsdoRPcjAGQLtiocFhB2WYxzZnJfuHrsMyjKA0sAfVyP3Iwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146110; c=relaxed/simple;
	bh=Au4LVORN6H/onQsw+fO8tyJyMuEiQJy3CYj6SC/W5Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS5w4ji2h0bE0HeKB7BDqbI/ctm6eNeVjSTxEllVrAgmapoFjLIojAO7MHiF38/5m/5URc0djkqx7iLyv8X6QW2RfBBUMdyxr8tFOafqeBi9MEQ5Iz4W0KHNSWhb94csa0lTCzhKzmmAVwRPy36W/BHLTV0PCIAKDNBjAFCnrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cTcEakOv; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cTcEakOv"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68c431c6c91so20211086d6.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707146107; x=1707750907; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SagLyPv+tU2JHwW9rPzTIveX03STHYINvfEVvGHvYDk=;
        b=cTcEakOvQDZ7Mb5rKzpRotRkW6lTnJPLC/HW10XK9Nmy6AFWqh1Fb0JdgZEy2Of1g4
         7ZUdgCd5Rmth3kJKy7On97jxTISm0N97fqiXWXr7jLd7UoL3JOmXJB/3a5HXM54TK/BY
         jyuUjYmpC3HjNHnmzzIT6fDqD/NXICO+amY8kk4rSyF87+nP+e69eVqPyu4wa3rW/9v5
         cKLSptdaZmUkSM9ygOZjqu0zvAO0h9t+x8D184iOSVRO9OJ2QGirK1OgXW1OPB8XNi8A
         x2X23FXQAHRSfMUIrHmDbpyye9F/AEAQ9neAYswZA7E1Ws7OwL/R4pDz21aVt7Cube3P
         osCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146107; x=1707750907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SagLyPv+tU2JHwW9rPzTIveX03STHYINvfEVvGHvYDk=;
        b=pVgRmLwPoUTyLHhCeV/Bbt6JI+T0LeGULOY6S5SxZK3WyljaYCjDQeR9TWQ2EOb8lH
         j3XL5kGDFHgniNjHxB+FnUi4vkcY43/e9tCJ2xiJ8vQ+Kp3vcqkRKiVFmWQ05ybUYKkF
         plmSEXvriGuat1a9Gb2PyZKiKoP6V6EeFncQVxNYf4u5NBMk7OQiEKgrDQowXZvGKcZ/
         +o+bVys+YZwo8H/aAzbJg4mIE5MAWq3ByNYfBC9tAffY0F0CvgFwUhosZA0lR2Yfn+yH
         LVljv2SR8YAcRAXGOaXSc9HgRkcEOdVYlGLIESli9VWFpDs76AVgp1Cx1fypok9GwnWq
         t5rw==
X-Gm-Message-State: AOJu0YzLxHkYcD821MkH5wJK4GswD5rJOxWT50chuS7r94bSqpxBbmVv
	595We3FBaQoz9dioYfZkq7rRx2iUpIyOOjqE2P2lnUTouRy+c7KovBavra8B5LalfpuP62UDDxS
	2pXcQQSzQTjo2I07HA1v1VU+tkTVJhTfbDiEyqg==
X-Google-Smtp-Source: AGHT+IEJiCZJgCddiVpWsHVt/Z+aTDGcg5cltCSOe6qZPrQ2iyQVush+5469m4nHWe2ATfO1pbwocsEiLH2smm+MZUI=
X-Received: by 2002:a0c:dd04:0:b0:68c:67ad:93cb with SMTP id
 u4-20020a0cdd04000000b0068c67ad93cbmr6650169qvk.37.1707146107317; Mon, 05 Feb
 2024 07:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201172224.574238-1-alexey.klimov@linaro.org> <20240201172224.574238-4-alexey.klimov@linaro.org>
In-Reply-To: <20240201172224.574238-4-alexey.klimov@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 15:14:55 +0000
Message-ID: <CADrjBPpWXHhRhid77=utZuaQVzw8aaXUV_EKwwn0=rp7-Jt+NQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] soc: samsung: exynos-chipid: fix revision calculation
 for gs101
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, semen.protsenko@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, klimov.linux@gmail.com, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Thu, 1 Feb 2024 at 17:22, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The main revision for gs101 SoC is not reported in the CHIPID_REV
> register. The gs101 Product ID and revisions registers have a behaviour
> split between old Exynos SoCs and new SoCs. The sub-revision is
> reported in CHIPID_REV register in [19:16] bits but main revision
> is still present in Product ID [7:0].
>
> To construct soc_info->revision correctly for gs101 the main_rev
> should not be reset from a value read from CHIPID_REV.
>

I think it would also be worth adding in the commit message how the
main_rev and sub_rev relate to the a0, b0, b1 reported by the
bootloader.

> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c       | 20 ++++++++++++++++----
>  include/linux/soc/samsung/exynos-chipid.h |  1 +
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index 7fee6094db12..3b952ffd8cf7 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -87,14 +87,26 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
>         soc_info->product_id = val & EXYNOS_MASK;
>
>         if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
> -               ret = regmap_read(regmap, data->rev_reg, &val);
> +               unsigned int val2;
> +
> +               ret = regmap_read(regmap, data->rev_reg, &val2);
>                 if (ret < 0)
>                         return ret;
> +
> +               if (data->main_rev_shift == 0)
> +                       main_rev = (val >> data->main_rev_shift)
> +                                  & EXYNOS_REV_PART_MASK_GS101;

Looks like it can be simplified to
main_rev = val & EXYNOS_REV_PART_MASK_GS101;

Peter
