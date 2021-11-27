Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Nov 2021 13:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355032AbhK0NWP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Nov 2021 08:22:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33584
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350944AbhK0NUJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 08:20:09 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0A6B33FFD9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 13:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638019010;
        bh=10khrOkDRFrb05P6nLD9gkd+H3zR9nJydcfwDdRxNVo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VpWwMbV+EWLIQNQJviMwLdexb4AuRW2aYeh9pnKYj+BqWwZNGONiC7l6Hq+vCpffq
         TS+aRcgi4ZOCknobwcqyfiBXPUbOv/T0Gn/vvUQQEHGtcevxV+bzLc9eLJ9lKRloFQ
         IZOBXmWtidG3ItgVMLU4W8ahHketv7ZZj3rn9u4Z59pvnUxjdFSpatPoqOGupcur1X
         91PXMVNT8+2q49jVmnfQ8NvdubR1q9OFQH2VQ1NwFHeNU2BJlZDLoCakUlq4KjFyiP
         mUTe1L0KIGt6Tt2Sf2zhd3S5ejM2c6JULi5xTMHV7ZpYK9ao7HZ9S5V9bWguOcC2jo
         27sg6vdEzKpeg==
Received: by mail-wm1-f69.google.com with SMTP id a64-20020a1c7f43000000b003335e5dc26bso6695299wmd.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 05:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=10khrOkDRFrb05P6nLD9gkd+H3zR9nJydcfwDdRxNVo=;
        b=JqMB1mKxnwccb2w1bpoNSP00zFIssAuuYcIrTu9Mg6vr+WMVngNi7+tupk7jzEm9Wi
         NhZYtfLgBvNua2+21dionTlXeS2zyJOT79yspoM6Dnt8U2lzJFxzHyAXigRHL7ol0Vrx
         ookrSGJ12dWLa1Cv7lxnfQ743tY/4I6ahdRtw58G+odsD1i+N7ntn9vchMRHbcW3JEsf
         VO7lEM/OoWVXOAZoSQ/0V27l+ZPsx8/0S/w+k12Lu5k0AALqjrgxPjsWJ7svYvg2kPq2
         rLu9XfwCfGlTwfTQ5ahBibYzCsK1puUnNEpyD+t79hkF2OJe1zRL++0sQoSgjhhv7Kki
         NX7g==
X-Gm-Message-State: AOAM530S08sBtBECXCxFlmBddGEjxH5MCMghvmLGtzY6OrUjFuDhviAZ
        crjKtxoPMhy1fACAz3qznk8K1eaEKzOe5CBxsQGeW5Dq+8nznaDXsGBIJSd/xUwecxeqQX3oCI+
        DyVPSGQVDdupNy4B3HHyb8j4fOR46nccGjKjA89N0CqMpnqB7
X-Received: by 2002:a7b:c194:: with SMTP id y20mr22743934wmi.2.1638019009659;
        Sat, 27 Nov 2021 05:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGUd2gGv1OUXpilzjJLYuIzPpTgbhBIbefbQ+L9Gl9/2mmcpBMwOifMOdYLSnbeH1GCdk5fQ==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr22743923wmi.2.1638019009534;
        Sat, 27 Nov 2021 05:16:49 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g13sm9031989wmk.37.2021.11.27.05.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 05:16:48 -0800 (PST)
Message-ID: <d8d6527d-1bdd-1a3f-f3ba-c97890d4ddd0@canonical.com>
Date:   Sat, 27 Nov 2021 14:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add samsung,exynos850-sysreg
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211126230620.478-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211126230620.478-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/11/2021 00:06, Sam Protsenko wrote:
> Document Samsung Exynos850 compatible for system registers.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
