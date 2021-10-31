Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC9BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E08B610A0
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhJaUia (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 16:38:30 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48618
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhJaUia (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 16:38:30 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 479B73F166
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635712557;
        bh=VcWZQJi06AXVZEhAIYstyglUxmyXYWI1mUrqnbXvlNk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=GG0BABG9j9B+CFjy68IyOIO39LGJiPr+b+jiYtUQzd8Ss/6Ig7kPUv07yaTmAFAxo
         2L9VbZbLV7omCdSTKV5Yk6Sh9uI3CozwG+UoTe7sTI6TFHB88JgIVM+s+xxQ+XExp3
         JRhWNo2rV5SRdcSPJytVrW1akeiMiVqTqvnGqGwO4a1SYym+A+Hb/z26ZvbGtcRqux
         12bACSi7b7Xo2qAFUfFcDj6nVdklv4mvOHIUYAeSrgPgxIBIHwJtlOy6dRLJ0caea2
         o6UG4I8Nrkm8IRyT68SLs3W7vURt9qPl78OukvXzn22umbl/dPZqiCf/vppm7BWVK3
         OoD39dJhs8hBQ==
Received: by mail-lj1-f199.google.com with SMTP id u12-20020a2e9b0c000000b00211a02bc7a6so5113000lji.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 13:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VcWZQJi06AXVZEhAIYstyglUxmyXYWI1mUrqnbXvlNk=;
        b=fCOUQZBaRSXSItZzp2WX1yf5M9AHDaAKh0YxDNW4lLKi5Psm9NKkU35h+3fncdryj4
         dKMOIs4vLN5T72Z0oFKnGd2Gxb+8lXcIBpuKhSrZ7nvhScjdVyzjjVhnFzaKZr6Dvdaq
         KLz6eQPnGmvoX8kumMkztuUhZamzXrC06Dr3oIInDHkiP7lLa5zRKoMofSKveRVAfnoc
         40RDBK63p+Vsp5cc5Bz5LBBbHhFEq6nT9Jj3Usud6WToOFqKZyOC7yyt/zU+fg7ShIXQ
         xLmc94fKc1TRB+uCyFBPSZmFywRvEOBZm2BSCXqt2mG8GWkoey0HKy/kA9TMNgnioh/z
         /75Q==
X-Gm-Message-State: AOAM533MMCyKREF7MueOBBBE6+AA9/OjYaTF65WkdLL/EqQj0P2v7EMC
        m5PxMBs6unhfoUYWm6NvgM4VK7vFyK4X8SmPV8vkCKqexsX0QaDJ/0EBLHcwjfnDSsA9vr9xtIV
        CqE2hWGNGVl1SSNUhRr4OOscgORDSpfRIms5xErg7o2kwHOv6
X-Received: by 2002:ac2:46e3:: with SMTP id q3mr6297792lfo.569.1635712556662;
        Sun, 31 Oct 2021 13:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqEaF0sAUt21q+kbgW+xAkSm6b4n3MXabMrAL0n4lOBNB++hoZYWsf1bbzv+SvGs13Xh82Wg==
X-Received: by 2002:ac2:46e3:: with SMTP id q3mr6297784lfo.569.1635712556528;
        Sun, 31 Oct 2021 13:35:56 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x5sm1229388lfr.307.2021.10.31.13.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 13:35:56 -0700 (PDT)
Message-ID: <b90fa435-05bf-297b-cf6f-5c9fe3667401@canonical.com>
Date:   Sun, 31 Oct 2021 21:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 2/2] soc: samsung: exynos-chipid: be more informative when
 soc is unknown
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, chanho61.park@samsung.com,
        semen.protsenko@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031165645.1182368-1-henrik@grimler.se>
 <20211031165645.1182368-2-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031165645.1182368-2-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 17:56, Henrik Grimler wrote:
> Print the obtained product id that is incompatible.
> 

Why? Please mention it in the commit msg.


Best regards,
Krzysztof
