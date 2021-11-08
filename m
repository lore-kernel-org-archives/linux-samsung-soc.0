Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4162C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 14:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EFFC610C8
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 14:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbhKHOVL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:21:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37048
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240348AbhKHOVK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:21:10 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BB75F4000F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Nov 2021 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636381103;
        bh=HiqLyGrHJ8vZ1EU008SBhCNuKX+ktJLcgyrfTZqVUQQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ZrDB2o3XsslR/K+l/kADIa1CimlgAromNIUUE4lJ4Xbh29tcXxxG4qDMR4hPA0SNq
         vjUk0SHNy+TwH9n0ywttP3B0nsJsLeqw7az66I2FxHtKe9I13p/AJ/ulSVkMvT7/7j
         +5cOeL84vBDabLiVoeNpbvwmjQp74AErHzetJ+Be3JFrSssxzaLSD2DZaVridbMM1Z
         Qgm3wNVGyw+SqyOYx5bPswLEQT6KkGndo9rFAaDZ5ynT8efMsh9bZ1xmK0VFf0LlLL
         e7CRsZRIhSGJnQdyo68odq/A0mfYvWAuY67lRK4k0bk6d7/MsyS2aPIJDXei93k47h
         t0w/fIvLGfP8A==
Received: by mail-lj1-f198.google.com with SMTP id e7-20020a2e8ec7000000b00218c5e0fa4aso1535672ljl.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2021 06:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HiqLyGrHJ8vZ1EU008SBhCNuKX+ktJLcgyrfTZqVUQQ=;
        b=KHqyKKb70Cqdsjipyhdh71DDQe8LaW18cKkH7vQxte82g0Zyv49YHY5a9MOyHnBsBW
         /6nOXFP61uZRvY6BbSzHWkR0as7lWDD98k/g8tvt3zHEAW1dDJEjPJEpNQvKkzsKf+wn
         EoSY+UX16+IrzxKp767aSNwEUkar/u99YImNrlBq3zAJzYLC9fojlM2mGVVwCN1p99ln
         szjF2JzrzAC7JidpMErZQKJLmvzH2xmZs0MLUULqHF3pNoR6cElJhAP0vrBuecMueiN4
         o9mIOGq0YBszTVisT1BmaNnVSTdZWTKfG0QQfbUjIWrlrSUP8+A0isOp7/t+trkggsb5
         vp9Q==
X-Gm-Message-State: AOAM5302QnntIWixE0oDe+z0kDX89C2nPFf/5+ZTPpRpJT0wUNUwOe7S
        at0uCM/UikxU2gX9by8aBPbEW8DY/4nc23qFkE8dfhXRZfKL2ttOfCpvd73AEZu0J4pYpHxft1+
        ZBt/AmR3ihqujZZIPaanOv+Fb8XPMv9bbzgHVZS1xQM0uM2F+
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr28429581lfl.565.1636381102901;
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoBnzQ2brUYZsVEzHJHGfIUeAE1W1YmKzWFRbwndi941x319xZJkbtd8QCDTyFmriLopVtVg==
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr28429568lfl.565.1636381102755;
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m20sm209636lfg.42.2021.11.08.06.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
Message-ID: <433f2d77-90d0-53d9-2e04-a8c5feb16349@canonical.com>
Date:   Mon, 8 Nov 2021 15:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Samsung I2C driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
 <20211108134901.20490-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108134901.20490-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/11/2021 14:49, Sam Protsenko wrote:
> i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Hm, that's a little bit unexpected. I thought you will be also using the
HSI2C driver (where Jaewon is adding USI support).

Best regards,
Krzysztof
