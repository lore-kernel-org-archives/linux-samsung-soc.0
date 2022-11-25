Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138FEC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiKYOXB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiKYOW4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:22:56 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A09421252
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:22:53 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id w23so4108696ply.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qOAkxVSfJy2zWWxLaFIIKbmYp4D8DI0K2XpzJHgmkZ8=;
        b=eJoLiVAmwT4odL41aHGE3930KuP7LK20G9MYe+DkZPIWUFRTqO/WQalz0QjfufKXiU
         sCVoDRrMCJvHZzLUKhK50e8wCwfd/ahbNLXX3p6d4IycQwbXPq1qtZ7lHYSwHivf0YXE
         muAKUBlxbMFB5EniGT3Xw7PW9oudvp5FDqEFjkq+NHdgdYW9NRUHJaUpYY2uMZp7G0nK
         lEB01rvTR8EZ7gpE9tXv6bz71iEJDY2owqWuAWhPU7Tdm/jeasP26RFhoccZ3Er4XbGR
         zk2qDn+k+cJ4P/sFpgoBcurkT3UpNGU/gLK9EUE1rnngSu6pjzxy72Y8jvXkLwAsZPvu
         ib6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOAkxVSfJy2zWWxLaFIIKbmYp4D8DI0K2XpzJHgmkZ8=;
        b=ALdNrWh5RQ2BdetPBgp3NWmdP4p9lwXxPVUUG/PSQ+HnI6kVmRD00mk3Ihg/BEleUG
         AQrs/dFWJ4SBkjKMQjbR0knm5XZqv/CC5OebD8kP1rj7XJuMpOBw5vo0ye9D+dHVzNPZ
         Cz7EDpqdjDiXMiLJ3kQBI1WXUJPRY9imYGYSbWqrGUXJhTZ5CzYJx3+R4gTy0SltQACS
         4Q2IM9WRYgAGl4dH1CvKVaG2jd3ynjN1in/RqCiLgQdIN0y2/oY5fQf/xqNlxXhm1byP
         b03uU/ih1NaHei/kWv0jgC4v+ceJ0ahZnyPtTX/RacNkS8IJ0KAFtN0EuOUPtoe8dRX0
         eZ1A==
X-Gm-Message-State: ANoB5pluxMeqaQOPX/f9RCBeKqyNHWbzt38/1Zn2IY2MVTkAC+CCLwWI
        Az5QizgMeoAR2mnY5pHke2IVcb/9GeUQuYhtGD5/mA==
X-Google-Smtp-Source: AA0mqf5nMhmCfoFMzaWKFLi/TIrJ0PU/O/K/ihdE0Qu11bnoTnqH4/Wij6km66/QflyT8alRAKCaQMcenmHZXgIRR28=
X-Received: by 2002:a17:903:258b:b0:189:1b50:f9e with SMTP id
 jb11-20020a170903258b00b001891b500f9emr19711920plb.74.1669386172833; Fri, 25
 Nov 2022 06:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 08:22:40 -0600
Message-ID: <CAPLW+4=1A42ppHYB5aFrokVx+9g=HYoF5H0Ot9cY74i6aZbujw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: exynos: add dedicated SYSREG compatibles
 to Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos5433 has several different SYSREGs, so use dedicated compatibles
> for them.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Sriranjani P <sriranjani.p@samsung.com>
> Cc: Chanho Park <chanho61.park@samsung.com>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index bd6a354b9cb5..6976e45aa769 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1118,22 +1118,26 @@ hdmiphy: hdmiphy@13af0000 {
>                 };
>
>                 syscon_disp: syscon@13b80000 {
> -                       compatible = "samsung,exynos5433-sysreg", "syscon";
> +                       compatible = "samsung,exynos5433-disp-sysreg",
> +                                    "samsung,exynos5433-sysreg", "syscon";
>                         reg = <0x13b80000 0x1010>;
>                 };
>
>                 syscon_cam0: syscon@120f0000 {
> -                       compatible = "samsung,exynos5433-sysreg", "syscon";
> +                       compatible = "samsung,exynos5433-cam0-sysreg",
> +                                    "samsung,exynos5433-sysreg", "syscon";
>                         reg = <0x120f0000 0x1020>;
>                 };
>
>                 syscon_cam1: syscon@145f0000 {
> -                       compatible = "samsung,exynos5433-sysreg", "syscon";
> +                       compatible = "samsung,exynos5433-cam1-sysreg",
> +                                    "samsung,exynos5433-sysreg", "syscon";
>                         reg = <0x145f0000 0x1038>;
>                 };
>
>                 syscon_fsys: syscon@156f0000 {
> -                       compatible = "samsung,exynos5433-sysreg", "syscon";
> +                       compatible = "samsung,exynos5433-fsys-sysreg",
> +                                    "samsung,exynos5433-sysreg", "syscon";
>                         reg = <0x156f0000 0x1044>;
>                 };
>
> --
> 2.34.1
>
