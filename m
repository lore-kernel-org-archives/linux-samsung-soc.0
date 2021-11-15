Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B12C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D5663220
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhKONjN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:39:13 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60438
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234702AbhKONel (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:34:41 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4EC463F19E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983105;
        bh=ojqXvdJwzGTTkyeWkIs8mxvrFI+WspsP1IO2MdAm86c=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hfC9fRwGFv9emmeFqqm3yxIEZ7IXO9j8oEJ20y7cgRBQFa8hu6+HkZ6eN9N1WDYfL
         afI5PuGPy8pzAXX0jKU7fC+hmIZcmiMu/on5Bk6iG8mWg/RYm38bmWb/mPS6a0kIvh
         0gt4XPpY83ukS9MOCZSU560SHXtyYkMhvnKN/93d/pILJkIMDODQTkWf5XIja0Fl1S
         eJZcIMjIkcIyipw/+So6IRb/1XLa4tkNTmmXmiHbsX5XX+KInsUYJA1KeWQd571VT/
         gzNLSskMlcKg1Etv6WUd6gYzyxv/u1P2eODpIC/43JVRvpEz9ScprAzohEW9UuJUeB
         xU5LxhqkptUHg==
Received: by mail-lj1-f197.google.com with SMTP id o15-20020a2e90cf000000b00218dfebebdeso5084261ljg.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ojqXvdJwzGTTkyeWkIs8mxvrFI+WspsP1IO2MdAm86c=;
        b=e/IR0o8UtHsie4tAzPApkGrUDQCGlR0ole8SE3EQ6VOJjgyiI8AgdQ4UkSPLmSRR2O
         A+TLFqQj/XrCtWA98+2ZAy+u1JElVrn3AOHIICDinkp5Thrp3nyUqtVJogrE8FEaA3DT
         034bNkiEmdmnO2wZRJh3M8D7rzmUcC8p0JP0cr/O6UyEu2+Oi06nxNAnWO16yh7O5tlH
         nu+snH86Kdq9zFK6EcNip0pKcthvpVgEkFZlRy8mxhxkAMGFi46fugoUhecwLzE0RZ5R
         +845x7497zDoBIBcUkTvSyG8FGB5DknqdLsG10GGiXmUFevH23Z1faltA8SRTDmtc8gY
         Ffew==
X-Gm-Message-State: AOAM532Qhh5koTbSry/X3vDpS/9dpkHSGNeB8OwFRwvVPU43ahkk90mm
        ZE/sDc6qHrx2wWv2zJyMxVp44OGUkdl0PFoOp2pBH7kRlYP2PmvzK4O9WFtf1lJR7BXlE7N/hMI
        5oNWBN2LWwSJDBDRbTG0/brUQKewXCRb4q/dvNpSgt21XS/KK
X-Received: by 2002:a05:6512:12d3:: with SMTP id p19mr25334049lfg.53.1636983104676;
        Mon, 15 Nov 2021 05:31:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqp5859FRwLs3vmdFsfbBUc9BqBiGXS88gVU5mPrJzcrErPFY4HeUhmswDPzB6Oz2RO38LAA==
X-Received: by 2002:a05:6512:12d3:: with SMTP id p19mr25334026lfg.53.1636983104533;
        Mon, 15 Nov 2021 05:31:44 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z12sm1421048lfs.101.2021.11.15.05.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:31:44 -0800 (PST)
Message-ID: <d1786910-6bf7-9aa5-296d-a467e41fe861@canonical.com>
Date:   Mon, 15 Nov 2021 14:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos/i9100: Fix BCM4330 Bluetooth
 reset polarity
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031234137.87070-1-paul@crapouillou.net>
 <163698188786.128367.17376497674811914207.b4-ty@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <163698188786.128367.17376497674811914207.b4-ty@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/11/2021 14:11, Krzysztof Kozlowski wrote:
> On Sun, 31 Oct 2021 23:41:36 +0000, Paul Cercueil wrote:
>> The reset GPIO was marked active-high, which is against what's specified
>> in the documentation. Mark the reset GPIO as active-low. With this
>> change, Bluetooth can now be used on the i9100.
>>
>>
> 
> Applied, thanks!
> 
> [1/2] ARM: dts: exynos/i9100: Fix BCM4330 Bluetooth reset polarity
>       commit: 9cb6de45a006a9799ec399bce60d64b6d4fcc4af
> [2/2] ARM: dts: exynos/i9100: Use interrupt for BCM4330 host wakeup
>       commit: 8e14b530f8c90346eab43c7b59b03ff9fec7d171
> 

Applied with fixed title. Please use prefix matching history (git log
--oneline).


Best regards,
Krzysztof
