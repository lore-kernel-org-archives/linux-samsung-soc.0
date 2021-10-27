Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D00C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 08:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A692D61073
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 08:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239354AbhJ0Iki (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Oct 2021 04:40:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38436
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239187AbhJ0Ikh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 04:40:37 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1050C3F17A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635323891;
        bh=lSRmd+bAt3G+a8pB1uQ3D1t4YJVVUpvOwAJD3U8R8rQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vV8+IJX/iXU6XN8AzslCINldXcn+hLgIMkPUwuJOSRGocC1iap7nmWNdaMgaF61/9
         8FOFvBC1ygrtvw0ff/gwnp50p76qnZPDa1jWFjE0gohmTiqJB/wqipl46tOrGPpLQh
         bMA3ZnHnOIVc9VX9eCmdpU053nY1Fc/P330i5c2RqDqFA+8GdLY1IKKCvj2zpjzeuW
         XqbL1UMu+msCbSoZyMR7rZm2oQfp2lvU8bG7wWTV4t5XND8Csx9ffth6GlD97NWtjg
         rFlvAcVcf9RJScB4oXz2oevt1TNxmzm8bFCtPoa+rtPDPArrGqt0WAbXOMUwlHVXuL
         DvoyCwsLgM7Hw==
Received: by mail-lf1-f72.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so453844lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lSRmd+bAt3G+a8pB1uQ3D1t4YJVVUpvOwAJD3U8R8rQ=;
        b=XMcK6+epiA7KU6y1Hy/Z/3ehjqvbEK8eAxHXO8wCzc6sfKjidVkxMOFVVh9iV7coPL
         QtfSQpW6PLQK8TqoaV3j4Ozgg25KL6Dy4kHxZrYqs4RKsKkxz6I1wOmO6yUUPPHR63Zl
         Hb3roYTyqK14TNq6sixhmbtZ8YKv0vAbFGXUpCM2eBIA3E4LdFrRlr/mqs+ItK2lFVIC
         hJOfvLTOMZjuLZO1p6zbtA5oEg0ormxxPjsGl8FHzGb08ENIHZBNnEC8uq9h6I0Dha87
         oyk7o0GVBmWQRYxJ490hmNmj8dPO4gq0PjM2an/wUWpI38Q+aNOyMhNIfPAiTWArvvvJ
         Rmtg==
X-Gm-Message-State: AOAM533iBq+e42/KwnSOtSiGTeK9FIev59NN12PnK1g5EmS+Xdl0Bl+v
        8vRk4zQGQSIj6zpIptvuXje+EDagverJpacR+eT8E/WEma1hQwvZ73GPPSKh/nqjGiWF9MiPPkT
        8c4ox8WBHCoDMYpxgk/ACsB43q+R7dkZ8Wlv/U0PapEPZppHe
X-Received: by 2002:a2e:3504:: with SMTP id z4mr1120851ljz.437.1635323890455;
        Wed, 27 Oct 2021 01:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzulrV6FlW9g2gi/5knG/ThdYkMqFE5BqsPFzsMZn9K+3XQGV4JppxbW4/p2BeNyTZi2gMgxQ==
X-Received: by 2002:a2e:3504:: with SMTP id z4mr1120838ljz.437.1635323890316;
        Wed, 27 Oct 2021 01:38:10 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a28sm71719ljd.65.2021.10.27.01.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 01:38:09 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
 <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
 <20211021061804.39118-2-youngmin.nam@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <117dfec8-e417-642b-7647-9d17592826ad@canonical.com>
Date:   Wed, 27 Oct 2021 10:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021061804.39118-2-youngmin.nam@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 08:18, Youngmin Nam wrote:
> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> The 12 comparators can produces interrupts independently,
> so they can be used as local timer of each CPU.
> 

...

> +
> +static void exynos_mct_comp_start(struct mct_clock_event_device *mevt,
> +				  bool periodic, unsigned long cycles)
> +{
> +	unsigned int index = mevt->comp_index;
> +	unsigned int comp_enable;
> +	unsigned int loop_cnt = 0;
> +
> +	comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +	if (comp_enable == MCT_COMP_ENABLE)
> +		exynos_mct_comp_stop(mevt);
> +
> +	if (periodic)
> +		writel_relaxed(MCT_COMP_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> +
> +	writel_relaxed(cycles, reg_base + EXYNOS_MCT_COMP_PERIOD(index));

This is unsigned long, so 64-bit on your platform. Use writeq_relaxed or
handle it somehow.


Best regards,
Krzysztof
