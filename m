Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA7AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 07:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD15661040
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 07:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhJZHM5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 03:12:57 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47510
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232774AbhJZHM5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 03:12:57 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC3FE3FFF6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635232231;
        bh=bAjnGbbToGkMJN6qgH/QciqH0NHDxLWtaKjqkfWGonE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=KjKA0cP2miRqPqU7vAveeZD6JF4f0i0N0CSOJjj10DfV4z1HdVbsjAnSxrxjAy5FZ
         ZvdGNoIiMtzbTsn+28rXwXHlc0Mwu0e2xT12K8XnXFkXa9W2+QEh8sEm6e2ZS7kuRZ
         hezQe3FyKu+Z3RHjxPIfwPXfWbDowx0n9Vr1tYp7rfFNiU64h8zMKVfX8uxxvmUsCt
         HziT7kYXUF65NSOyQeiBSzz7Zp5JS5hRoaOj4JT4hy9UTcJsNa3yWygTVGhZNSviXU
         4Fw67674mTW0IFrFhdXm4OsgFBs4P94J82qY/7QytrXh1119ogstLUQv4bbbS0lZJl
         AisF7huYbgtOg==
Received: by mail-lf1-f72.google.com with SMTP id k15-20020a0565123d8f00b003ffb31e2ea9so1412137lfv.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 00:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bAjnGbbToGkMJN6qgH/QciqH0NHDxLWtaKjqkfWGonE=;
        b=sJhSenq6vSaqssNNridcQdrREoF22S67GLRsSief+R8L9bAMQc2tjJs/7P5YfZ/k6a
         aJOVhB1DBYTtum72oENPTXe87amIze+NlGJao0FEht5OWn5NMvUOVeYz7dk0+0gRcoxA
         m+DcrMAHiXe8JePj8nW7728zj6O46cYDronoaOLI3bD3aRi6dELt8i6IYM9JDUDI2T4G
         os7OuCjYJmmt8YHrgfL7P+4uFy9hNdYQOV+eUcHZ4OHyvv1MarDIhdJsvQbpxPyE9uQB
         0IdHNHUNQD0LXH19W0dbcaEwjnmIxucaqGzpy3vihsUTxLI5y2A6fx2atbBZ4Vkuy6zZ
         w0VQ==
X-Gm-Message-State: AOAM532/lWSbaG3W1G1ErwnK4ABB/MBHJ8ugSxTA2ZrU8WIzMHFdsMFl
        AddepiEyZPz3LE+nlLaby1rt2iGy/SU5qPIEOl3DB3Ngj31D87i3mNHlnd25RVTP331/WlFzUFR
        XDXYz1wTFB3s6Ejo6qg3/GIB1Qg06f8DgHK9/vQlAW/Hj4jMg
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr23570296ljp.498.1635232231045;
        Tue, 26 Oct 2021 00:10:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNVTNy3VIoyfsIQL5Y7AWvNrJ9Noboo205abbTkvscX0/E8rvfX/DldfhT2wIn7EKnMbu30A==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr23570285ljp.498.1635232230874;
        Tue, 26 Oct 2021 00:10:30 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x14sm368235lfq.232.2021.10.26.00.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:10:29 -0700 (PDT)
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
 <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
 <20211021082650.GA30741@perf>
 <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
 <20211022042116.GA30645@perf>
 <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
 <20211026014732.GA45525@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
Date:   Tue, 26 Oct 2021 09:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026014732.GA45525@perf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/10/2021 03:47, Youngmin Nam wrote:
>> If everyone added a new driver to avoid integrating with existing code,
>> we would have huge kernel with thousands of duplicated solutions. The
>> kernel also would be unmaintained.
>>
>> Such arguments were brought before several times - "I don't want to
>> integrating with existing code", "My use case is different", "I would
>> need to test the other cases", "It's complicated for me".
>>
>> Instead of pushing a new vendor driver you should integrate it with
>> existing code.
>>
> Let me ask you one question.
> If we maintain as one driver, how can people who don't have the new MCT test the new driver?

I assume you talk about a case when someone else later changes something
in the driver. Such person doesn't necessarily have to test it. The same
as in all other cases (Exynos MCT is not special here): just ask for
testing on platform one doesn't have.

Even if you submit this as separate driver, there is the exact same
problem. People will change the MCTv2 driver without access to hardware.

None of these differ for Exynos MCT from other drivers, e.g. mentioned
Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
drivers or the ChipID drivers (changed by Chanho).



Best regards,
Krzysztof
