Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4CEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Jan 2022 10:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238118AbiAFKv1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Jan 2022 05:51:27 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54926
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238102AbiAFKv0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Jan 2022 05:51:26 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33D743F1EE
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Jan 2022 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641466278;
        bh=Z8uVFl91LVSZAsJ7llhtIxSOJQsIP7V3CT2J91myL5s=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pWyjd/7bDk8di1FhkNAT4XJoG00EUwkgxOVR+loalyaeKanGuHPiVrf89/Puqj9Mv
         3Fns0QBtYb+1/hzL1mnPzRX+TSlsbzI23vSJzzTWvzQ0U1knc6mDqF+IogQig2qxBm
         tEgyroe5RrkNysRSMHpxrKbAlq18DRXNBMvs/rgnITGrgYUIU8v0zK0DSq2tnvnNiJ
         bsFp2aB+rNMyH970/EyVA8JTSnsS8cz2K+kWiXqg2pdvflpfIDMGcW8kO1T7uLq4Sv
         jbliWf39vqngKJG7LS+VT/XzK0zKX1gQK0bXhRh8k+TOBy6RUrE7MGyPmbPNyLN0li
         FpSKyFZkNv5Mw==
Received: by mail-wr1-f72.google.com with SMTP id v14-20020adfa1ce000000b001a49d6587ceso1018996wrv.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2022 02:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z8uVFl91LVSZAsJ7llhtIxSOJQsIP7V3CT2J91myL5s=;
        b=dATtW9zQiRLIQqw7J4E2wNK3GK5G7LCrSCNCvqeA95HxvwZ1b3JZX99mc1YqsZDDGk
         0prteu+bd+mcDyCzxa0iJMhmvlEJTuEOd3mOxavLrmAjmgL8bGqi43Loz5Bjg5GTuARb
         MeQSw1iL/QFOo7Oq3F5wvm7sS1fBo640gdV6atFI9NXCVAvw1USWgkDVusYpUT58YjUg
         JvKnHWFF6XG86P1FA3cFUmEyVQJqZTzagfmwVEYLTzMHL/sBgDN/dlClCgEeYsZSnkJZ
         N9ixDE4wNZZIx/UGd35+/qpS/JCZetkQOHXzCVHIvnBcat9GAJBw/jBc2Zi4mKPng6u4
         fFQw==
X-Gm-Message-State: AOAM532cs3UexOr1MhtQtsk68pN1ZwwKf1Ea0I4JxV7id5nhroHXqUTJ
        myQXWj4HUMMx0tsLTk0JcsXDZxPGGjMqw6HNQJx86ABcKtwWVaFtOLJMwQ02G1C0Dc/JhYemWT/
        ObDP9VjizMftVcXIDTzgDxzjbsajp6S/gIDjHf0UEe9Xo4rsc
X-Received: by 2002:a05:6000:1088:: with SMTP id y8mr51799858wrw.53.1641466277939;
        Thu, 06 Jan 2022 02:51:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvwPlNNr4r+ARSGVb+q8oYwovGI0EfhupJ2baWh7BPrAI0n0mOlcmsVpv6UwYxMeHYDKJutQ==
X-Received: by 2002:a05:6000:1088:: with SMTP id y8mr51799848wrw.53.1641466277791;
        Thu, 06 Jan 2022 02:51:17 -0800 (PST)
Received: from [192.168.1.125] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l4sm1702147wrm.62.2022.01.06.02.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 02:51:17 -0800 (PST)
Message-ID: <6e9b1512-c9bd-f072-ed89-5c0f7cb02909@canonical.com>
Date:   Thu, 6 Jan 2022 11:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] MAINTAINERS: add reviewer entry for Samsung/Exynos
 platform
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org
Cc:     s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org
References: <CGME20220105165351epcas5p100b28a19d5a5e5614ea82adf5e0037b0@epcas5p1.samsung.com>
 <20220105164341.27479-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220105164341.27479-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/01/2022 17:43, Alim Akhtar wrote:
> Adds myself as reviewer for Samsung/Exynos platform to help
> in review of current and upcoming SoCs patches.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13f9a84a617e..ddc8e8552e8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2544,6 +2544,7 @@ N:	rockchip
>  
>  ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
>  M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +R:	Alim Akhtar <alim.akhtar@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
> @@ -15110,6 +15111,7 @@ PIN CONTROLLER - SAMSUNG
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +R:	Alim Akhtar <alim.akhtar@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
> @@ -16868,6 +16870,7 @@ SAMSUNG SOC CLOCK DRIVERS
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
> +R:	Alim Akhtar <alim.akhtar@samsung.com>
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
> 
> base-commit: 2585cf9dfaaddf00b069673f27bb3f8530e2039c
> 

It's fine with me for the SoC and Pinctrl, but for clock I will need acks.

Best regards,
Krzysztof
