Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFABC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 15:32:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239551AbiBTPca (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 10:32:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239449AbiBTPc2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 10:32:28 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4620C27FD2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:32:07 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1690B3F1CA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645371126;
        bh=mDIoi44y0rBobh+yuFyA2ajORGtPygGl0YvZuNczdWM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MdAsMIqARjHxA4v8ZeEWfp/JGG2JLWkqLxxZU63Nm0uvsTkk6M24NL0AQ38zvOkpI
         fE5cyKB5iwa4lALSXhGlUY2TSWbIaaMb5cKaQSYRL3Cz/VDJ7fzMu8tc1qG2zXvLS3
         vnE1+BUUs2649+uDV3imIQu2pibiQ6hCIi45IKlGFCIbaOOXPtNDFwF7Jq4h+mxOGu
         zJzMK34SS3WHN+NYn36afTuKNVVtxVOaZyFrD2Sshve3VY7ggArd2PDTcQDcBeMYPz
         tJeeDBWfWCgMjbzQYucGVUeZZzM89E2y0ckFASkuJD0USWuMOYUNXZbN9nZRA8uPTC
         I7tx/lgV75wBA==
Received: by mail-wm1-f71.google.com with SMTP id p2-20020a05600c430200b0037bb72b5865so1605349wme.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mDIoi44y0rBobh+yuFyA2ajORGtPygGl0YvZuNczdWM=;
        b=cCAQq7cxHh5SfPdzenYlmBObwcstIoB2/sPS95sq42SSQXJ9SMgP99i05NVAOatw+y
         5tvs/oHb1DmFhZBNJMOVoFGnJm8HcrZbcMdfDOVd++Ss0/jqg6hSEsjyF9u2WQANyCwS
         j2ibU82J0RB7RdJSDhImrBGe9W7Wz9sjkRagaU3396J2Vg2+vnrkwKwDbxxyefK9VbQU
         15YRz60BpwrPzAiKgQZ+EC+7vMSvzWO0uXbho8D2H2E43LC3bUNjd+m3mAmkvVj0ZBcL
         1n0bMpYC4C1zRJQMk7Peqg9x9ayQp7mp6yxz2KLpIjd8rtnsde8/VO6AmT+04TBhGKof
         bkhw==
X-Gm-Message-State: AOAM5322ozwQjDxcKdDlJgkyOueQ0b1ZdES0+nHhR/FvKWCJSbxPxTJR
        onbA+mIcLRcf2+dOQEC/60kc1wFgDRL+uN/EtGdHPpaWUeExDrOoR7giMQQdpbyJ7ft6c6og4MA
        t210HGP8A4B/p7D0r80WX0GAc0n0wBfh7bcLD85sjRJIdMgE0
X-Received: by 2002:a7b:c409:0:b0:34d:4775:4961 with SMTP id k9-20020a7bc409000000b0034d47754961mr17872474wmi.44.1645371121977;
        Sun, 20 Feb 2022 07:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyHE82bcimjw/k6+QxNFCMaeVmFPs21xBPhkFnJunp+DsUGhpb3pn7Y6EUxhrHE863aNuBCQ==
X-Received: by 2002:a7b:c409:0:b0:34d:4775:4961 with SMTP id k9-20020a7bc409000000b0034d47754961mr17872466wmi.44.1645371121847;
        Sun, 20 Feb 2022 07:32:01 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0037bdfa1665asm5903235wmj.18.2022.02.20.07.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 07:32:01 -0800 (PST)
Message-ID: <e616815c-d5c5-5290-6a6c-f4598aac9aa1@canonical.com>
Date:   Sun, 20 Feb 2022 16:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] clocksource/drivers/exynos_mct: bump up mct max
 irq number
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <20220220133824.33837-1-alim.akhtar@samsung.com>
 <CGME20220220132640epcas5p1a523e6db151e0cb76c0edb6d32959fe5@epcas5p1.samsung.com>
 <20220220133824.33837-2-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220133824.33837-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/02/2022 14:38, Alim Akhtar wrote:
> Bump-up maximum number of MCT IRQ to match the binding
> documentation.

Would be nice to also see here comment whether there is a real case
(DTS) using more than 12, but anyway:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Best regards,
Krzysztof
