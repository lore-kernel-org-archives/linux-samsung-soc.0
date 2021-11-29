Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DADC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Nov 2021 08:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242938AbhK2Iic (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Nov 2021 03:38:32 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58384
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243539AbhK2Igc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 03:36:32 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F54A3F1D7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638174791;
        bh=aCARnuWDBDtCC7T3FRwThc50ZrhDk+owTuPeR9h19HA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FI3z5ezaC3s8HhhE21gtwHDViP7ndcx5dTwf5PE36Y5/1ahvRkUZTT9C4H9CnDAAK
         E5cGQsmOzTGq2vuJFTl6Srk12X0ezJwOLbizVKomMMHp0VW+ApuW+nuh2wNZq58RVN
         hsJkg5LLo9eTcGi+jHv9S45tq6aNcbjfDp0n5aZQGONZmUMu1IPRfyg+p/0guuVp1e
         pfJdvsSvBPdFI/05B+W0A+7Y4G851eIGXU7+s96fhiR9Q8nRyzXQR2yG0AO/gN6v/W
         oMKbVLNw/3qhVGhzNIxy9njwx4ExVzTsQ5dGvtjvY3hAxg6QzA5XUu0CF4/2bzZMQU
         qAnnSoQdkLUUQ==
Received: by mail-lj1-f197.google.com with SMTP id a7-20020a05651c210700b00219132ab503so6537222ljq.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 00:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aCARnuWDBDtCC7T3FRwThc50ZrhDk+owTuPeR9h19HA=;
        b=eWpxS7EZeSDukc/Rbi3PLGhZ93++9hVkWRLt8j6mjJvGTuPIQgJ//Lkt70qSSa2TmO
         hfD/RgSa3fqsTPETAqrCfm6Uc4Sf4duUbx/iDXG+eTzvqypsn+Fcl4+wU+fj6g5LH8m7
         0+1RTeJMA0VU2UsVGD0Q0iegX/JiuGviBB/E/QRPHUSBLdB6PpNUmoMIYANQ2wAvYSz+
         hwQ1G/NV1Vy/tbWCPTVD8hdvnZpSURjEdTQJIec512o/m/UrXABwybs4v0zLm3F3dnjd
         nP1uP/xaxh/frdma+l+kudqOr+lDBPqfeIUbiFRaL71QkZ+V9IVx1QfayJHiWvQhOGZ6
         U0yA==
X-Gm-Message-State: AOAM533aDhPQoyWFMc8isldybiyHyruAsNfIbQAr43guaxNf1GmcfgHR
        8jpdLAhtPylcA7O1TWUEf4AS37jGhR8iDv9r/l0mbSCCo26YyKBbb1glpeh9lMt6ao4Lnysto8O
        DbxEVWNmL4B5PUhTbbsfM0RCpy0hhjzkR2S6F6W/voO4yPtTZ
X-Received: by 2002:a2e:b907:: with SMTP id b7mr47798057ljb.214.1638174789568;
        Mon, 29 Nov 2021 00:33:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+HqYaIWrUgOtsIwWv3NVax4MJeBvRWzGCQC326fhRonBcNHs6JMwj77zI5nkCDsHZVk4s+w==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr47798035ljb.214.1638174789408;
        Mon, 29 Nov 2021 00:33:09 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u2sm1268765lfi.108.2021.11.29.00.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 00:33:08 -0800 (PST)
Message-ID: <b757dcc7-7262-1f17-1889-6159015f2dc6@canonical.com>
Date:   Mon, 29 Nov 2021 09:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/8] dt-bindings: soc: samsung: Add Exynos USIv2 bindings
 doc
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211127223253.19098-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/11/2021 23:32, Sam Protsenko wrote:
> Document USIv2 IP-core bindings.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/soc/samsung/exynos-usi-v2.yaml   | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi-v2.yaml
> 

I propose to squash it with patch #1.

Rest looks good to me.


Best regards,
Krzysztof
