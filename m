Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AF1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Sep 2021 08:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F5056124A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Sep 2021 08:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhIVIMg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Sep 2021 04:12:36 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50444
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233532AbhIVIMb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 04:12:31 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4085B402D8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Sep 2021 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632298259;
        bh=P8Qe07F/xjMQdNLxVav+Rfl78SB2e9oBWelI8/7HSJc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=CsM4WOF81WV4yB0lm/EC63pq6fB0GK4NL8c4/F5T2//WbLnIeKe42j/bP2oUKxitz
         mp++AyRgVe+N2l+uOArLWutgo28uA/ASj36UsuqtSCR04x2f1T7isAgNOMJWQqTnWA
         hHd/GuvSPETJY1/RCKnDOWpkxc1QpD0rdvcaRPEb1GwulU+FTifRo1HEKbP7oUCsXb
         p3RUIxB6z7fpCPQTs/3Sf6PS75AbjV/t3Y3F6hWjCbUXfab2Ksjbe6izEZS50oAPUd
         /bbWz9RmziME4Vpy2yoOTK6wEg8J0hXIjYP+LeuyGlC910r6cm0paI/xa/bQqT6GTe
         71ZFoYf/zeKJQ==
Received: by mail-wr1-f69.google.com with SMTP id c2-20020adfa302000000b0015e4260febdso1346240wrb.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Sep 2021 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8Qe07F/xjMQdNLxVav+Rfl78SB2e9oBWelI8/7HSJc=;
        b=OdN16OXVxoH+kgQ4wIw56QfxLl2N3lXxDYY8fdrelRR8TEfVVU4pidW4g3mEgQZDnO
         j2uWQHuU2AwcbIUtW4VPTnHV4CfWPojBT64zkYggvhl8vsttvxhWZFfWijeUfGRVE3YQ
         6kIupCgu+KfCfIjShRGdaq6ARcTY9PpEU5eLKpS8HkGTdzcuAwdDt/aUTyr7TOG0xuAG
         Daaxo27rQk6ZfaSvp19Ju1+C5SG5Z1Z22c6/CHLj8fHp6uAmjTfvJhOxba9VgQV9AG4v
         RuunrFOlpRWGttsM8b3rytehKKF3IcdrAbGvtLdeX+K2/7g+8Ifrd+KzJuL1oXUctJmd
         y3HA==
X-Gm-Message-State: AOAM5315kvyxy9Jq+tjrdoQW0NR3ON2gi1W3Uh6tRt/4wf8rK3sdPTnW
        X+zRw6NXKFjEboP0CXpqBO0O1Pd4tPkLL9u3rnnDtokv6Ta34KjCnwDHaM1Ok9ra0JrPVxXdu0t
        Of39df/Ie6ZRXB6zQDe+DvAExBvs6e1GM1rhRaYBL6YRstvFr
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr9113903wms.186.1632298258646;
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb3Ljj7oUI5lHEYQz4nwFDjBGGdyp2FKjKpmWPv5gSTXpVI7LSRlWIyJA3WG9xT/pBfVR0VA==
X-Received: by 2002:a05:600c:3b89:: with SMTP id n9mr9113885wms.186.1632298258458;
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d24sm1174219wmb.35.2021.09.22.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 01:10:58 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 1/4] mfd: sec-irq: Do not enforce (incorrect)
 interrupt trigger type
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7ac677f1-2928-21de-a226-449e72b1bd10@canonical.com>
Date:   Wed, 22 Sep 2021 10:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2021 13:04, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
> 
> The Samsung PMIC drivers are used only on Devicetree boards.
> 
> Additionally, the PMIC datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> Marek Szyprowski reports that together with DTS change (proper level in
> DTS) it fixes RTC alarm failure that he observed from time to time on
> TM2e board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Rebased on https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> Changes since v1:
> 1. Mention in commit msg that this fixes TM2e RTC alarm.
> 2. Add Marek's tested-by.
> ---
>  drivers/mfd/sec-irq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Dear Lee,

This was already a resend. Any comments from your side?

Best regards,
Krzysztof
