Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55EBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCF8061167
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhJ2IeR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 04:34:17 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41168
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232478AbhJ2IeQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 04:34:16 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2ECA13F190
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635496307;
        bh=f9xGfy2IVXtAZrt0FZMC98EWuEmmved4QRdbre5fxcg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=QiCk8XpOVvEfRfn4Zn18AUJo9CsnumZzQY68YywMXP/hwhGUI0PCfiWVfCQrG8kee
         yoeFi5smlIB1LK4kJeNmsjg6jzFzdFKr0I8V7gOv7/+3Rs9k6YQkak7/26tqpCGCXB
         5VBrPi77S6IC+wVNBls3yMaw4LaQdMa+zpOdNEjYoN+671Pxf/DjDFdtbE9JCrPCHE
         qGDVqlxCZkFwIxHQooAR7PL7rVz39Xcp92Vnn8u8Ihg+lb7hIxxEzdGONuJOYm8KuZ
         8eSpRJIQyI/giJ3so7S/KQauMJIg0guiwYfYTPpvLtSS699a3xkXEOU50F7098WnqL
         jRR8J6sMMTe2g==
Received: by mail-lf1-f70.google.com with SMTP id g6-20020a0565123b8600b003ffa7685526so3866046lfv.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 01:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f9xGfy2IVXtAZrt0FZMC98EWuEmmved4QRdbre5fxcg=;
        b=21PKzIe/EeMqHtpGQGs0hAhjG7m1KeNcDBJUf+NqkWHu0Mq9+R7o/HQiSMb4kHEzgp
         v+D2lNTi9LpXjj8D7o+We+Y/MIXuLFiG/Emg3yS/OsmM5ZYJnF9zltlBb7QVM5wHKofh
         FS+Gx9OXuriiXT91AIfaEyYgMUkrhBc5G9ggVcATtBSkchvxrQfQDPSCZW0wKELvXefP
         0Onc/446XkyRbkvAYM1PYn/PJ1hoXHDRJ3KAC6DhSI2mU3h8B41nZDiyvdZxGkisgkiv
         wP5Z/j6uQSq5egfTytbVx7d16Ugx2G7QVRboWMZnmj28Pg3g6zPqZp1ZUpWV0o+tALgo
         62BQ==
X-Gm-Message-State: AOAM530OADloIgVwW0/lDON8TNnn5HuxfcjvIwhJUh+PtYQzodfoh0os
        RJy9RST/n72nYbwloHUev3i7g3PgGm8mzY9MtRGXhmODWtDvmPOv8csViX5FsdZZRoWBiMaRRZq
        FFMQAslS9EJs4K4YBLkk+S3caojSYPMsLap2ZtQvaLjL1Z0Tb
X-Received: by 2002:a05:6512:1153:: with SMTP id m19mr9014911lfg.418.1635496306733;
        Fri, 29 Oct 2021 01:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Hyrds2Q0O6D4rKzUGcomrQuWNDbWOqCF/kGuCYTGcoX6Ii/2ymVukRDR0lH5EXL4eD4+Rw==
X-Received: by 2002:a05:6512:1153:: with SMTP id m19mr9014892lfg.418.1635496306554;
        Fri, 29 Oct 2021 01:31:46 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d27sm551447ljo.15.2021.10.29.01.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:31:46 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: samsung: pmu: Document Exynos850
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211028144313.9444-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <53a13ca3-a83e-b9ad-192c-b711657e2979@canonical.com>
Date:   Fri, 29 Oct 2021 10:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028144313.9444-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/10/2021 16:43, Sam Protsenko wrote:
> Exynos850 SoC can reuse PMU driver functionality. Add corresponding
> compatible string to PMU bindings documentation.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Looks good, but will have to wait for merge window to finish.

Best regards,
Krzysztof
