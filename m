Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FC5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 08:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69770610D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 08:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhJVIxF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 04:53:05 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57676
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232314AbhJVIxF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 04:53:05 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3814D4000B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 08:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634892647;
        bh=rhThjc69gD8klHJ2HlQUvp1F029DaZ1HD6bgaTLsMRM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=kjRf84sUCnRUZmlj/f8iSgRZmHWoL8cUlihi5tfk9QIP8BxPxeL7QB1pxNqpnBJmc
         Teo7UQHZTJEwest3iYaq07jMqLprxn4Jbj66Z2//e+LcezA46FON5L2uPuQ4bbekh/
         Nn018iHLXBmnHnPsVyCiEAVrtN0ot3QpKGRvQHmLr6bhhH0CSRV5ZpeDYkNyUis6wX
         VyiDFYpzf6zQfFLx0wRNCCjaodolaJrc7AGwjx8iImw6iNiPUxdUw686bi7sGRP/8j
         xmL+3tioqm/6RwGO3Nv+qCjLg/GG5WJhBF5cAuzIDYu9tGPHazkXpBN/cZm3Ae4iRy
         7g0IpQM6oiSlQ==
Received: by mail-lf1-f69.google.com with SMTP id z1-20020a056512308100b003ff78e6402bso661998lfd.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 01:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rhThjc69gD8klHJ2HlQUvp1F029DaZ1HD6bgaTLsMRM=;
        b=opvFkuRPnVB4sZNKRsCZjCE2OZJ+dJQE4DkN/bFWOyaxuahBybECBT+F0cfjJtxXa1
         SmX8lFzrqoVhGCnyCJyuzamOYD1u+X5O1IdVihRDa8YjBLLcUO2foZp3XiXoefYodjB9
         2h3o6hi7bIXosJGhCHJknNbRAMTuU5sZ9FHN67SC++810DDbRXDGtCpjr5DJ+JMR9ga9
         HL1OPrBTSkDqdPqzBKCLVgrQ2gELAnahJGHtcq2ThexlOuDKlFTYPyCpuXG+Ih9ONysf
         GaFDPRQrP5Lpl5bZoJU0U0gvz+hctUvIAx5iCift/fvawZh2BS030drwl28XnW0hp/gi
         /NLw==
X-Gm-Message-State: AOAM5319b1NTggDaFQEUF0AAFRNpYZEFjfAOEK0TBmijRWqhVKB7O0NR
        liQcWuAb00I8Tmzxp/AZCOLjCmeZg5n31fGMMkh0thAzo5okm7VDqJr4doq24SmWwC3pUI5CDVQ
        b9cXf3hD9S/CseuHFZs2hqzUFcVa6445aulkfiNdSK5I5MXsK
X-Received: by 2002:a2e:a164:: with SMTP id u4mr11573067ljl.195.1634892646410;
        Fri, 22 Oct 2021 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7R2BPnrUquhReFpj1fTuRbmb5kq31vlb03XMGyoObg+X2rVNUTOXDvu/rTk7lDl+ktmirmg==
X-Received: by 2002:a2e:a164:: with SMTP id u4mr11573048ljl.195.1634892646143;
        Fri, 22 Oct 2021 01:50:46 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id q24sm673300lfr.138.2021.10.22.01.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:50:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850
 CMU_APM
To:     Sam Protsenko <semen.protsenko@linaro.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <59a5cf03-fbf4-7003-4309-e9e5b63112a9@canonical.com>
Date:   Fri, 22 Oct 2021 10:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021203152.29312-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 22:31, Sam Protsenko wrote:
> CMU_APM generates clocks for APM IP-core (Active Power Management). In
> particular it generates RTC clocks, which are needed to enable rtc-s3c
> driver on Exynos850 SoC.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
