Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167F8C4743C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Jun 2021 06:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2B0361186
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Jun 2021 06:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFWGLC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Jun 2021 02:11:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48007 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhFWGLB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 02:11:01 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lvw43-0003LQ-HI
        for linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2021 06:08:43 +0000
Received: by mail-wm1-f69.google.com with SMTP id w186-20020a1cdfc30000b02901ced88b501dso1153400wmg.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2021 23:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ft0xDxTbAS/DkqF80QwfrpX5K+lmscttPPKtFT3L718=;
        b=U1TM9+HLIpU98HzLUTVkzaqnHbwUgYDLsir02roD8uoOcaYBC+l7D1hEO6VzSz4JFW
         9k8luNMywa+rc+5nRZbZTH7hp2d+Mbz3nQOw9WXPkyiYM+NnxdTwhMPSycP6aV5v4kn/
         AJY90Ze6fDOhFnCySp0vv6L0qdnQ/OAZX5231se8K830KIFB+C8Nb8sFlbPkYRz5bXpx
         Hl8BImfLf5TmvReLZjkshypNVpuNQXVnjQs6dmp+l/g7a65Qx95sJa1vzSQLVclCrEAh
         1elAPzRj3VDF/wvuQvs+qMIwRif0/FJuAy+5HhypKWPBuiM8qeudMjA2STWGDgIVITwZ
         OSZg==
X-Gm-Message-State: AOAM532dv4G/c1v9iCiVpNr4OB5WsZVXd8/G/acUIAexax/Jk2HNR28+
        QMyhp1Rz7/ClP2g/n1vDhrKgoTlCvfqMqU1LXx82WjunPyqvKm5b3XHxcSFOhWgPB2wVyhLwBkA
        LIL6by8qrR9iNMbYV96b3G8aXeW8oVnV09Pi3npGFRcRf+iO0
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr9684536wrn.247.1624428523010;
        Tue, 22 Jun 2021 23:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQHsmrszVjqAWlc6DIo9w9CNb0wo7W5QI/0lUMBqx3D74+rrFhvB1fso2J+48Uubs2neXvDQ==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr9684525wrn.247.1624428522857;
        Tue, 22 Jun 2021 23:08:42 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id c8sm730522wri.91.2021.06.22.23.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 23:08:42 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos7: Add cpu cache information
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org
References: <CGME20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0@epcas5p4.samsung.com>
 <20210622130551.67446-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0832a33f-8426-6be4-377e-a0a6331e1025@canonical.com>
Date:   Wed, 23 Jun 2021 08:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622130551.67446-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/06/2021 15:05, Alim Akhtar wrote:
> This patch adds cpu caches information to its dt
> nodes so that the same is available to userspace
> via sysfs.
> This SoC has 48/32 KB I/D cache for each cores
> and 2MB of L2 cache.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> Changes since v1:
> * no change in this patch
> * changes as per Krzysztof's review comments in patch 2/2
> 
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 35 +++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Thanks, patches look good. It's too late in the cycle, so I will take
these after the merge window.


Best regards,
Krzysztof
