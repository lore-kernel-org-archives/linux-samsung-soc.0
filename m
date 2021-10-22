Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A78C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D6BC610A4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbhJVWFJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 18:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhJVWFI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 18:05:08 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22E3C061764;
        Fri, 22 Oct 2021 15:02:50 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id q19so4830461pfl.4;
        Fri, 22 Oct 2021 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q2X/8VfwNdtvO4WHWKTeql6HD7EYi2Lj4H/w1gAQKOQ=;
        b=KQ2jivUs2wDE3OjEusgktIGwnWNUDzbHG++RpaXHRhPj+V89CZvEPZEFxaZm4VxsQg
         i0nT9+BmozmmdoMp7mmBQXS3bXB928eIS1ezKswG6k6JdBCURz6aIzqCCM94ps4eY7WW
         fduhdNKFS+f12Bcz7EoLuHVPlMDzvQwkJq1FEG4+HlTlmWZVZWx3aT7rtXPEqld/vBCt
         qQBstPnl/2NDzzZw29G4y2BLnizYo2RYYH2WnlWU6IhHs95S6mcrLdvlNQ4UANh5v65/
         G4JP/GFljffQj0/BpOD/rm3MksztIFaGJfPULxTsHO/X6EoELQBLzZc14QsJbcmNuvzA
         /+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q2X/8VfwNdtvO4WHWKTeql6HD7EYi2Lj4H/w1gAQKOQ=;
        b=gl0f5svjLVOobOAs67FYXxBSr0KBmDvC6pJ882IShw3FAkYYdp+Ksq1aGMSLnBvtxP
         YsgtIS3SfXofHOQSbwpVHIhwZ8Y5IzKW5ZL9YzeKgFaYUgDnxefp78cTmL+8aCL2hLBk
         HYDHy+/d+0ZyCWc0/6b3kMMnF69DDrZEkZDW72XCMJK0OgqhrYiJo9mG+Hh4WU1wwfaz
         GSVoMlKrTiCh+KEny68h6HLVLhQs8LQPYM1r0a++J9Rt6j0WfEWanwujEBdapvMZ+/OG
         TuHUO0wIx7JCmQOrsJ4LYk2da2QwBwLtMw47ok9PbR+9bFuWchyFUYqTCt9Ke3eoUsvC
         5BGg==
X-Gm-Message-State: AOAM531JTRt1miGjCR8fvBDd6fCvj9IuumdOJpo8nT3Ufy7K1Mk5qVYB
        5q9eEn4Funnuw9bRHA3QwMg9b6fXCH0=
X-Google-Smtp-Source: ABdhPJyi83RmmZlRicKRAYSWWka9IWiS1ZqEYUQHFMFH4oh2FUO2PsfM12waVM0aqMiSBQTG9v8/gA==
X-Received: by 2002:a63:1950:: with SMTP id 16mr1772387pgz.346.1634940169552;
        Fri, 22 Oct 2021 15:02:49 -0700 (PDT)
Received: from [172.30.1.57] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id v22sm10920247pff.93.2021.10.22.15.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 15:02:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850
 CMU_APM
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211021203152.29312-1-semen.protsenko@linaro.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <d54a7dd3-d88b-81ce-cd80-02abd3e37165@gmail.com>
Date:   Sat, 23 Oct 2021 07:02:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021203152.29312-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 10. 22. 오전 5:31, Sam Protsenko wrote:
> CMU_APM generates clocks for APM IP-core (Active Power Management). In
> particular it generates RTC clocks, which are needed to enable rtc-s3c
> driver on Exynos850 SoC.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> index 7f8c91a29b91..5618cfa62f80 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>     compatible:
>       enum:
>         - samsung,exynos850-cmu-top
> +      - samsung,exynos850-cmu-apm
>         - samsung,exynos850-cmu-core
>         - samsung,exynos850-cmu-dpu
>         - samsung,exynos850-cmu-hsi
> @@ -68,6 +69,24 @@ allOf:
>             items:
>               - const: oscclk
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-cmu-apm
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_APM bus clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_clkcmu_apm_bus
> +
>     - if:
>         properties:
>           compatible:
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
