Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578D9C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 14:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DE7C61057
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 14:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240968AbhHTOsV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 10:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240961AbhHTOsV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 10:48:21 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAB0C061575;
        Fri, 20 Aug 2021 07:47:42 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id y3so9796834ilm.6;
        Fri, 20 Aug 2021 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=62VnvjyphalzFzBYkwspNm895JgksTkZY9txiEFQ5qc=;
        b=tQXQbz3LvY3VC1sa2AZE4VyazVGakX2o7W7yIncXEXleBcHS2rbyMTObp6TLA8NTXe
         l9u/Xqjjvc/mbcCGOPWwZZa2y57+lJNanYTpDEB8tt3I8bzJ7YGxuFOgNlxWc4atETOl
         Nx1XvUI/n6NXR430r1DjxSxcXwNpCyWKrt05lYrkUhFefPtT0IjonOtNshUHc9ABfSv8
         uhhgdAc9uk/5eju8tXvVkFdVmCLDbeVMVR+3CGlt9rsAVGDlEpEnIe4yzGvyK6aUYQPF
         jMfdjz49FZ2EoWjuKSrvuR2sxFXh6fJX/wtpKkyyi94nID585B6LuV3ykIprxkvbyC5K
         Oalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=62VnvjyphalzFzBYkwspNm895JgksTkZY9txiEFQ5qc=;
        b=i65MoN8DwLbjexuFTvjXLcxAjLlWr8baLdho/Tg6jiNlSBfBjBmfsU5657vfQSz5Ov
         cTr7ArTyOu4GRWryOgXYfNP6+V0dlgjV0D+iyK+updebnAl8RPKqG+G1t5jJoEd9O7xo
         bqAlq7L/RVTt2+/gZxmmypAmkqs1+uHU1pemuLt+GMhSCHR/uRtbHMgK1vFXsA7maB2f
         mvhYfrmbGWHDDmXTMMMhEoUC79s9D2wMOOVggClu0ghOOEtsZEiC5q1piPhRQeF0MidO
         5i6Se+jbT1DdiDQ15ctVZ4FA2p1vb2VUOTtgkvRw8nBfsA5MpudnYeBXZuOkPT6bnTL5
         BvbQ==
X-Gm-Message-State: AOAM530yd4yltlqr80Vm8MYBh81x9Q6stQpua7LwClTyQ18U52sWhVdL
        c0+A01M6vUogGS2gZxM3JMH6tpWXstmQk2xCjog=
X-Google-Smtp-Source: ABdhPJwl/oonu9809IeYqTovES9HGl8KCdL6OOPvub5jGBu36Sbbf+L8ZKgcZ0HT7KMQAVDyzAPjmAquW0VhgX2EOzc=
X-Received: by 2002:a05:6e02:138a:: with SMTP id d10mr13189484ilo.287.1629470862344;
 Fri, 20 Aug 2021 07:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com> <20210820082149.84613-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210820082149.84613-1-krzysztof.kozlowski@canonical.com>
From:   Alim Akhtar <alim.akhtar@gmail.com>
Date:   Fri, 20 Aug 2021 20:17:07 +0530
Message-ID: <CAGOxZ53CeRYafwjP45CsDRgBQtuvyVxJQR4CX4qChWyHzO4_fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add proper comaptible FSYS syscon
 in Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 20, 2021 at 1:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The syscon nodes should come with specific compatible.  Correct theh
s/theh/the?

> FSYS syscon to fix dtbs_check warnings:
>
>   syscon@156f0000: compatible: 'anyOf' conditional failed, one must be fixed:
>   ['syscon'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
With typo fixed above,
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index ebd5091d68b4..4422021cf4b2 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1132,7 +1132,7 @@ syscon_cam1: syscon@145f0000 {
>                 };
>
>                 syscon_fsys: syscon@156f0000 {
> -                       compatible = "syscon";
> +                       compatible = "samsung,exynos5433-sysreg", "syscon";
>                         reg = <0x156f0000 0x1044>;
>                 };
>
> --
> 2.30.2
>


-- 
Regards,
Alim
