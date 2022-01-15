Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BCFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Jan 2022 16:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbiAOQhi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Jan 2022 11:37:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51190
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbiAOQhi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Jan 2022 11:37:38 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4A49C4001E
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jan 2022 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642264657;
        bh=yj6+HZalP4HtPojT66FrfosvNQEgUfV8RHCwny3+cII=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=OsamEYnYtpb4NvM/fkxzVCqjitiv3wRVwNeVYXx9Z/b/bzQN9zdrTEEOdFzqNp64/
         OKJLm5t/qqW5oJv2yWJk7yf7tPIrByJCSfnMJU+hzwXSl9L0CAc3RFsv9jp3wCrFQH
         0AK9RQorG8ntmA3EIz+5kd2p4tfrHoXB98i4Pp1BJ77FheTfr6MHMsqYHJaOBNSEm5
         1I5pjRRccbOD51hZGfRQ/vUg9MVBAlO043aNbZUJvEd9/Bn4y35NHUMbqIfkBlzndM
         9IwaBeU0zmn5aq0g7S6/tQOwwLv64hgom68rOHPPoh/w4KXe6rHVk2M8GVScqyCRrJ
         MyW3u+7uLcgcQ==
Received: by mail-wm1-f71.google.com with SMTP id o185-20020a1ca5c2000000b003478a458f01so8384849wme.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jan 2022 08:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yj6+HZalP4HtPojT66FrfosvNQEgUfV8RHCwny3+cII=;
        b=JkKtIwLl4GTyg2x4/NAlyRhRICrCTiFm/0QhmH28d5W11qO3TSizhev2JMu8rG4ccA
         S+/q/j7JQi6+BTr338IQ+ezdfXcw8H0ruzxbMBP+GlDb7wS3TBNLITUpJi7ItO7kVdC6
         sF1LAl+Gn61Fn8ZvS2qrWWmoQwG2lc/bzrHE3byz+ZBiujPMNYFCO8a/KlPgR0/CpUqY
         I9lM4SvYGkxe+uDkPU/VbRDjgxkOO/sX3KYUpWjAaKuQ+ljsDoFBJK9wAfua/9PBrdDl
         azDlsmV9oOBH+L9j85/5DZHoZtHWLba4HFnC31Bar9U7ijw3iP4c2m8ZmRgPd4Vx8BDX
         lCJQ==
X-Gm-Message-State: AOAM532XWtrPAbnji3etMqfKM0PISq8987udIW81OIg6h9bLwlk0K+CN
        zTEbGipPCjKnNZFZ05Mdmu/zw2Jc7dItlteLrUXorCPabMhTuHAuxLB713tODUhVPFE8lxqTeHH
        W8e0TGiMFpbZmYXvshPdixfml2zkrOPh0Jsw76zLwFf3d6TS+
X-Received: by 2002:a7b:c042:: with SMTP id u2mr13025386wmc.18.1642264655572;
        Sat, 15 Jan 2022 08:37:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLmmpo9e/3+GJkqC2GFexeIlRoX2GDOBUBnCE1ML1vmhGd4NkAg4u0iGjoNJewDmHP5vBQFQ==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr13025379wmc.18.1642264655380;
        Sat, 15 Jan 2022 08:37:35 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b13sm8767590wrh.32.2022.01.15.08.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 08:37:34 -0800 (PST)
Message-ID: <763b84a1-4cf0-505e-f678-3474058059e2@canonical.com>
Date:   Sat, 15 Jan 2022 17:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 0/3] Add initial support for exynos5420-chagallwifi
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, semen.protsenko@linaro.org,
        virag.david003@gmail.com, martin.juecker@gmail.com,
        cw00.choi@samsung.com, m.szyprowski@samsung.com,
        alim.akhtar@samsung.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20220115162703.699347-1-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220115162703.699347-1-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/01/2022 17:27, Henrik Grimler wrote:
> Samsung's tablet Galaxy Tab S 10.5" (wifi) has codename chagallwifi
> and is one of several tablets released in 2013 - 2014 based on Exynos
> 5420.  This initial devicetree adds support for accessing device over
> USB or UART, and allows using a rootfs in either the internal eMMC or
> an external sdcard.  4 out of 8 CPUs are brought up when device boots,
> which is the same as on the somewhat similar device
> exynos5420-arndale-octa.
> 
> Patch 2 is necessary after a secure-firmware node is added, otherwise
> device hangs during the CPU1BOOT secure monitor call. Without the
> secure-firmware node we are not able to bring up any secondary CPUs.
> 
> Changes since v1
> ================
> 
> Fix mmc_0 and usbdrd in patch 3: 
> * Remove extra, non supported, options from mmc_0 node 
> * Do not set usbdrd supplies. Usb networking does not work with them 
>   specified, but it works fine with dummy regulators

Re-try with supplies after fixing the regulators (my comment to v1).
These should work, unless your regulators are wrongly configured or you
used wrong supplies.

I just sent a review for v1, so please go through it.

Best regards,
Krzysztof
