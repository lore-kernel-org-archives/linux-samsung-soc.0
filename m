Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D85EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Jan 2022 09:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238656AbiA0Jdi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Jan 2022 04:33:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45608
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238662AbiA0Jdh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 04:33:37 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 344913F1E8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jan 2022 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643276015;
        bh=ab1luuZzn+rKwB0G/H73SwnYANJP++VOjHTq7jQ19wY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=j7X4ELq6R73cQTTV+KhiFFg2KIZeMEhRVhWV5UEu5HtqS4+LmdhKNFy9nLzf/3vfP
         O2A2BVqIuhn8wDJFtcDZsqIqCwjaR7uqtYgogJAUxZw28wnSMV8a/rHc1yJgTCAI/c
         wx3C26T6ypR51MSUnwdpNE+qVUqa9Gat2m7tWr5EFhwHyjVZIPdCx921nKh3AkPslY
         mM0DaQ48EvEEUNIvF3eVtW3PLElJ0rD0SeFVbp7cM7KKIkpv0lRETh+EYxzBdyELh7
         3dsIEh3sHYnoXDwhLkd1+AJ6OG5iyx1Tb4+ShWYTJK+bC0VkPPOJoFBTU1tKV2vZw0
         7BiHQnS+0QB8A==
Received: by mail-wr1-f70.google.com with SMTP id q14-20020adfaa4e000000b001dd761d46c7so843838wrd.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jan 2022 01:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ab1luuZzn+rKwB0G/H73SwnYANJP++VOjHTq7jQ19wY=;
        b=RZO8F0y82nrh2r13abUNqYeCNH0llC9DZ2UHVqhRyCIHHSW70dKcH/C1vbx9wzo0xE
         mHOiwBSov+mQ26i0M9nrQ4Z5CrEFcA+xb82t8BjVc7kiITffZBWYlpIKPvc6BZ419N/Z
         /+1ki8B7ySYJGgTWmcMHe8Q2v5v0PFWVsGQmjPzcLYSpG+0oN3jwH7XsRv6cCGVAhc3S
         R9G7zw5NnML9l2nJYMByVF+cEXM7b4IqQTT3FlYafVLtVrfCDPZOgGvDlIf8LJU0/fhj
         RTZ7JKT2+IMLZnZRyoZXLr1l8iLigB+YWHzHerJtp8wvSRomAj4pByerrcD1Z9L0JE1M
         u0YA==
X-Gm-Message-State: AOAM532zrm02JWxvx7bpg2LJYm+u+yNhwus9LtmY88Is6nHDOGeoNrrp
        RUp4ULcmX5rC0AOcA5q47FAKAGlSBdBIp7vTIJECNIx9HZx5JbJQ9TN4HfQ8NIS8y4g0iKSDkTA
        zrickwwMk0wPmfx1lIJN6Z/sMfU9ZFq64KgnuYxnna4z5nPwm
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr2301428wrs.410.1643276014737;
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwackDtjcmH0YUiJyk7XzFedBt6pMCl5S0pLhlnvxCHhFBKHp3Es5kkgM0yYe1bv2SYad+4QQ==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr2301414wrs.410.1643276014525;
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
Received: from [192.168.0.63] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p7sm1533601wmq.20.2022.01.27.01.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
Message-ID: <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com>
Date:   Thu, 27 Jan 2022 10:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
Content-Language: en-US
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/12/2021 12:29, Krzysztof Kozlowski wrote:
> Hi,
> 
> Second pull with DTS for ARM64, on top of previous pull.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
> 
>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
> 
> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
> 
>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v5.17, part two
> 
> Add initial Exynos850 support and WinLink E850-96 board using it.
> 
> ----------------------------------------------------------------
> Sam Protsenko (2):
>       arm64: dts: exynos: Add initial Exynos850 SoC support
>       arm64: dts: exynos: Add initial E850-96 board support
> 

I'll send all this as v5.18 material, so this pull-req can be skipped.


Best regards,
Krzysztof
