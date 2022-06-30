Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56CAC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 08:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbiF3IAg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 04:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbiF3IAI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 04:00:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3B141627
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:59:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i18so32284136lfu.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sXQID4kqZRzoAMqKC8neoC1cmFkcvAWk83MWIRBHPSs=;
        b=X8NtlwiK94vDwSYZbEpSIVXUgecoaYPi0GCMqUVGDsPgRy6T/GQw16R+JOlqAQmir0
         ttMeyawPjBh41dgmYoKNEKcb6qRFRJ0zGPuPwURhGkQd8LqzMwS2gjpiPzO7/iFjoGiG
         wEZvmdUpSlcTID/1xtrdAPjEfmqjn4SYgLym59Ysf+MURSOM1UiNVVhpUNFLpGjlxESK
         zblfu1114rYiMqN7TtYukcJX4eWlnA/ZbAYQWqDoxSbjyJ6mc2ItaYJO0059nVAj4QNs
         vjW2wfJrJO1Z4AaFU3CRK0WWcIATRvgWe+cyABTZX0jfXf88d6SL9/a7JXSVC2h1Hn5z
         Ai+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sXQID4kqZRzoAMqKC8neoC1cmFkcvAWk83MWIRBHPSs=;
        b=ELAR8L5DY2BaGYTaoOnBIQf2WfX2P+JxwBnO9352LmnzN6XzTHYGBYwWWYP9bZsteC
         AZH1lkm54XgYAuu6s37tOuGKUb1GvifpCzSX3pJQ13WT1MtfBUbbh/fmqe0grtxpityh
         HRzVRNBGnETTy0zlJaBpCgnU1DOi7+dSJSOaT8kFMV+99xzMuL4a+W2TV24BP8ZzZlsx
         9KEFXJXgXOaUrMoQrESgvFAt8cTnVuIx/4Y6NGkbnyih6xwzQ+md9imVJon5/LRmeDoL
         gjCvqxWly65whzMKyy9W1r9E5/TNiv+9ZfNre4uy5AURm4YimPpBCdn/MDa+iH6qtvYV
         cnYQ==
X-Gm-Message-State: AJIora8//gUo8V+fbqFeg4TwUfhdlXNbxfhjgUAJZ8ra8kvYMOjeRyDB
        QlEyx7unZcZCIkIvFC7gWPrU1oZbHrZPyyRWeOlQcw==
X-Google-Smtp-Source: AGRyM1vRBRICLUr73DSA6nGgv5bZrmStKPTppICU7lfOXICq90+nxylSkMDtpI7OjsyHh8JhP55P6UyIUvkoFE6UVG8=
X-Received: by 2002:a05:6512:281c:b0:47f:bd92:4185 with SMTP id
 cf28-20020a056512281c00b0047fbd924185mr4792676lfb.11.1656575994730; Thu, 30
 Jun 2022 00:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
 <cover.1656554759.git.chanho61.park@samsung.com> <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
In-Reply-To: <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 30 Jun 2022 10:59:43 +0300
Message-ID: <CAPLW+4ksOuBmKxGziA9Wb=wwQ8b7dciDWwAt1r1UhJOZFCJRxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add
 exynosautov9-usi compatible
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Jun 2022 at 05:19, Chanho Park <chanho61.park@samsung.com> wrote:
>
> Add samsung,exynosautov9-uart dedicated compatible for representing
> usi of Exynos Auto v9 SoC.
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

with a note for incorrect comment (I guess Krzysztof agreed to remove
that while applying the patch).

Thanks!

>  .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index fde886a8cf43..6e806e950a36 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -22,8 +22,12 @@ properties:
>      pattern: "^usi@[0-9a-f]+$"
>
>    compatible:
> -    enum:
> -      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
> +    oneOf:
> +      - items:
> +          - const: samsung,exynosautov9-usi
> +          - const: samsung,exynos850-usi
> +      - enum:
> +          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
>
>    reg: true
>
> --
> 2.36.1
>
