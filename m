Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDDEC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Dec 2022 21:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiLOVjV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Dec 2022 16:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiLOVjR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 16:39:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908BD1D0F9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 13:39:15 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so515885pjd.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 13:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nTU5fQoqjwEXrOChYxVMfOo8SjuSN+m4eM0Q5QXQ60Y=;
        b=J9JiEdPeUqhUsC4Nrmpy7egHFxBJu4LlHV0DiEb+/wfg8LQ3ylko6Jg1nKZjbCDYbQ
         YNb7W7yzzbtW5L4J/hR6rIY5EkeQruBD/OMNNBoITnQPXKF4z9Q8UsTUO95cuUB8V7qu
         GvTCa3tgcNXy8t1QK14adYD67Rj/iiPmLPgG+8O0bNbw4hfmTQz5adJS7TuJDF8yLPc6
         kh9l13u3kSMem9W+Y+JRGsfEByXxc+gkhfDwLSYiyYguAArry7sDVd6J+pokvThuSdhu
         puC7Castd05B9JXHqK2FMHzP8ynJVXdRkceTR30izCxi8qUo1roJQGtYmSZR5MCkj3JD
         SY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTU5fQoqjwEXrOChYxVMfOo8SjuSN+m4eM0Q5QXQ60Y=;
        b=1INoIiAEPINFVbJX24SlbL7lh54txavz8aMMf+R8dkNPBc7wuCgJW4zsrG3veaDl7f
         5vV8r7YI3pxwDmXwOm1e9eRWTYUyEqbfwF6sbIo24mnQHBZKDY+KvLfs/jmjlm4uWKW7
         Mgc4Ou0iRden+bMzpszfTl+0y9ocEGPjT7WR3EnrIiGxGpHlImpcbKoho8VVHKxLNh7+
         nkGSPTdROkQ5Qdq4QlWCBZk2q2cyprX/T4SsmHsl4vvluT6g/gKIZ1ixQQFXDqHmgYd7
         2Fy9zgGMYE/kKBbFUxymOGPSOeRSwEwDImXzHdoTkX1IuIgnyDLjrFWQgY+CSVSK7p1U
         FtZA==
X-Gm-Message-State: ANoB5pmz7QbhTo/ba7zqPEfUi5cSTBSFq8e9RCwJtA66fk37wZ0BEQTV
        Trr/8YNLK1Au3nue+3DwDc6+NSJbAZdipLb7HR/7Nw==
X-Google-Smtp-Source: AA0mqf4xS0mNui+iwtI2uABIiecA8axv+muy3th2pg7V3KYEh2UpXjp4O/+hm4slZjBqV110jo7/JiezXYxhAlIY1rM=
X-Received: by 2002:a17:903:2290:b0:189:93bf:b5d5 with SMTP id
 b16-20020a170903229000b0018993bfb5d5mr49516613plh.145.1671140355121; Thu, 15
 Dec 2022 13:39:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221214044423epcas5p2920e87930665345169745002ec6993c3@epcas5p2.samsung.com>
 <20221214044342.49766-1-sriranjani.p@samsung.com> <20221214044342.49766-2-sriranjani.p@samsung.com>
In-Reply-To: <20221214044342.49766-2-sriranjani.p@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 15 Dec 2022 15:39:03 -0600
Message-ID: <CAPLW+4=+31Zaq4=FYyMF26fpU7wAbi-+GMsY8Wctw-S9Vtr8vw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos850
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
> Exynos850 has two different SYSREGs, hence add dedicated compatibles for
> them and deprecate usage of generic Exynos850 compatible alone.
>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

>  .../soc/samsung/samsung,exynos-sysreg.yaml        | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 4954790eda6c..427df05224e5 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -17,7 +17,6 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> -              - samsung,exynos850-sysreg
>                - samsung,exynosautov9-sysreg
>                - tesla,fsd-cam-sysreg
>                - tesla,fsd-fsys0-sysreg
> @@ -33,9 +32,17 @@ properties:
>            - const: samsung,exynos5433-sysreg
>            - const: syscon
>        - items:
> -          - const: samsung,exynos5433-sysreg
> +          - enum:
> +              - samsung,exynos5433-sysreg
> +              - samsung,exynos850-sysreg
> +          - const: syscon
> +            deprecated: true
> +      - items:
> +          - enum:
> +              - samsung,exynos850-cmgp-sysreg
> +              - samsung,exynos850-peri-sysreg
> +          - const: samsung,exynos850-sysreg
>            - const: syscon
> -        deprecated: true
>
>    reg:
>      maxItems: 1
> @@ -53,6 +60,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - samsung,exynos850-cmgp-sysreg
> +              - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
>      then:
>        required:
> --
> 2.17.1
>
