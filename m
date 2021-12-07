Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 09:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhLGJoF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:44:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36956
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229697AbhLGJoF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 04:44:05 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 619DC4003C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638870034;
        bh=JOMD5NNt/xfvXy1MKrXFMrSWfmb2GWyO1lXjWYdJbus=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=W8a9svcgr9EMQiDUYXEegbYxjsqMm29S+9zxKm4WLTcni1NhaJtJix70rjDpL12qn
         N12cM/l0h7Y3dwmNFIH+ITRh4ingEehm06kzK35CnfmK6sO/kSfOKXIaF6StDIG4Z5
         BJ13sQpc8sar60JwpjjWJNGg4ytFoYU2b/fYgbsg/54lyV5dVoKMiUF/ek3heGiiX2
         fzlLbS0I9xBTUfHxhR0Sqru0TucL4iG8JDlQFMf4k5qx8g2QWstBRYAA5y3c5mhY9J
         Hw+dPuRsVrCEjk9ejMaHFEL2pwe9p/kuGFjpQGvqLPR5NiiuhteyDLhJ6DYprK5gNB
         qS+P8FXrDl+0Q==
Received: by mail-lf1-f70.google.com with SMTP id bi30-20020a0565120e9e00b00415d0e471e0so5076602lfb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 01:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JOMD5NNt/xfvXy1MKrXFMrSWfmb2GWyO1lXjWYdJbus=;
        b=yN2claNOsa6kzvbBX+NoEspi2KDIRHqpCWa8ZHS1Lp9hINQXanWLB/C9FFoN9C1avV
         +9S2FAEO2i0ogJ6Mk5CGlMOEzrk0+EyzSuLh6LT7Te7nfSm8t2AvneSqDsbktySudXtQ
         jZ+TqwsiVW96LfZTYWqaJ7GRlsDgPoGM/lGdeKrAcChMgHOg9ez0/UmBKxntaOVKkg71
         T7kdqkwFYMg6eyujFNUvREoBCLjnNDApvguAnhdAdjUGK6adA+hwHbltIYIuVYSBMB9+
         7BqCbl8TvcLMvrDJ9dKr3DPTz4jKy8gz+hCwba1exSd/CgZqw0Ngkdp12de/vPT7NxBY
         Nv9A==
X-Gm-Message-State: AOAM533mZ48/ijAm2TLwwmEb6SDnXvfXsgllDAJCIihGMu3NE44XylKL
        Xz+p6d5HkN2u+MvR/IJZHqw2/T1qLccRNoiU49bexwtn+wMeF65O7JwYgwfTFj+ii3Imq0BxdII
        u+3HkGRr48aT+JVe1l3i+yxACGt4NSlLKbfXjPEUgBhumuMit
X-Received: by 2002:a05:6512:90c:: with SMTP id e12mr23777134lft.419.1638870032749;
        Tue, 07 Dec 2021 01:40:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTQ2k0wWW/H+W08cFK0E4G1YScO3MV5cie2qRunh/w3gGjwnDm4UaCRWd67b0Qs0mfxg2tFQ==
X-Received: by 2002:a05:6512:90c:: with SMTP id e12mr23777113lft.419.1638870032568;
        Tue, 07 Dec 2021 01:40:32 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f13sm1613936lfe.297.2021.12.07.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:40:32 -0800 (PST)
Message-ID: <5ba8fb6f-fc8b-cee4-6a10-38d64545af42@canonical.com>
Date:   Tue, 7 Dec 2021 10:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: exynos-dw-mshc: Add support for
 ARTPEC-8
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211206142929.26729-1-marten.lindahl@axis.com>
 <20211206142929.26729-2-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206142929.26729-2-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2021 15:29, Mårten Lindahl wrote:
> The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
> Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
> does not support HS400 and has extended data read timeout.
> 
> Add compatibility string "axis,artpec8-dw-mshc" for ARTPEC-8.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
> 
> v2:
>  - Change compatible string vendor prefix
> 
>  Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> index 0419a63f73a0..753e9d7d8956 100644
> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> @@ -22,6 +22,8 @@ Required Properties:
>  	  specific extensions.
>  	- "samsung,exynos7-dw-mshc-smu": for controllers with Samsung Exynos7
>  	  specific extensions having an SMU.
> +	- "axis,artpec8-dw-mshc": for controllers with ARTPEC-8 specific
> +	  extensions.
>  
>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
>    unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
