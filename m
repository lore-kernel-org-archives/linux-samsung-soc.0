Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F93C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Dec 2022 21:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiLOVjz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Dec 2022 16:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiLOVjx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 16:39:53 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5F42F01A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 13:39:52 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so478644pjm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 13:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=19xNB36z4ZF2bSOjVbfFWgPYWyBtIik4jiGmk9PMfXw=;
        b=RRk9pzsFQBiKFV3biL+KXLKYF02p/45lQPdYqs7nlVzrsFs454g+4bdGm8uM9DixI7
         Oz2JzWFwPF4eM7wyOV4AosMUj3bXhJ5jcz/zbc9GvzILjVRrOLryHGNYBJQP7QHna45H
         7zs2jcLM5zXZNC/jgW7SdkZJNgITl7MSVVXR//um8E5alg1f/1nRNSMvfQc3zAnQuK9j
         RUQ2KxZkVh5u4grEWMDiIdvvdE37xnQqg+XgTl0TwbZkQwMctl33SGI1By6OuxZ7SAOg
         VqREzBEBnqUUAz5moJ5dON8vch0ttXfxZtJWm4dCrapHeq5mL6qWO1FmXCHmi6db2o5D
         f7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19xNB36z4ZF2bSOjVbfFWgPYWyBtIik4jiGmk9PMfXw=;
        b=2+Ru/cv/Zk0b9mucocppyHqj7N+8zlLnGmeLuBN9b8yiy7JvDbEmWypa54qkgG2inW
         CCXpx1ceEG7EThpmKR9EaJ2ikumdbscw2pavp4p/rKxKVPaE2DbHBq2wR2vKhd5qB20i
         wU5qsxxxI8cBRHQsn8qYS7H+rW3AUWS2rQ/51CJxqSqyGCaB8DuLQtC/KuOGbkgLYWvA
         UFSSbgAkOxdYB1AKXO8dVxdCrNw9qKi7+7bce4RVrWLi/u8stNB8Q5omFc3BIBb2iR/T
         9ya/ejusg9JoglKn1gZxI4op4G4FudUCFjHjlUXkHzmvuAFBkRgf3LNGJbjmvaFoNGgQ
         KtGA==
X-Gm-Message-State: AFqh2kpdImURjQXW5+1d68dVvI22Ux4mnBj7lUnAk81sarv8lS07YXFe
        swzOSmo7nP22t9AdEeZP6RbsrIatYQECLlFet/JIdA==
X-Google-Smtp-Source: AMrXdXtCpBntfTL1jGJNjn/ZrqmxPTpShg/Qixzul1m0G+k8RWaFw2Rz+RgOFA2O/fFU4iaHCHe8EO3I+LBYQxMdsDg=
X-Received: by 2002:a17:90a:5d93:b0:21f:eb8:f6f0 with SMTP id
 t19-20020a17090a5d9300b0021f0eb8f6f0mr703026pji.4.1671140391669; Thu, 15 Dec
 2022 13:39:51 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221214044427epcas5p39131549dc4529ea41d9916d81d3d5fce@epcas5p3.samsung.com>
 <20221214044342.49766-1-sriranjani.p@samsung.com> <20221214044342.49766-3-sriranjani.p@samsung.com>
In-Reply-To: <20221214044342.49766-3-sriranjani.p@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 15 Dec 2022 15:39:40 -0600
Message-ID: <CAPLW+4kez4s2QHH9PdfVq563_=Rg-LZw6o-QbdrhUX0kDfiMyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: add dedicated SYSREG
 compatibles to Exynos850
To:     Sriranjani P <sriranjani.p@samsung.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, alim.akhtar@samsung.com,
        pankaj.dubey@samsung.com, ravi.patel@samsung.com,
        sathya@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 13 Dec 2022 at 22:47, Sriranjani P <sriranjani.p@samsung.com> wrote:
>
> Exynos850 has two different SYSREGs, so use dedicated compatibles for them.
>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index c61441f3a89a..a38fe5129937 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -549,13 +549,15 @@
>                 };
>
>                 sysreg_peri: syscon@10020000 {
> -                       compatible = "samsung,exynos850-sysreg", "syscon";
> +                       compatible = "samsung,exynos850-peri-sysreg",
> +                                    "samsung,exynos850-sysreg", "syscon";
>                         reg = <0x10020000 0x10000>;
>                         clocks = <&cmu_peri CLK_GOUT_SYSREG_PERI_PCLK>;
>                 };
>
>                 sysreg_cmgp: syscon@11c20000 {
> -                       compatible = "samsung,exynos850-sysreg", "syscon";
> +                       compatible = "samsung,exynos850-cmgp-sysreg",
> +                                    "samsung,exynos850-sysreg", "syscon";
>                         reg = <0x11c20000 0x10000>;
>                         clocks = <&cmu_cmgp CLK_GOUT_SYSREG_CMGP_PCLK>;
>                 };
> --
> 2.17.1
>
