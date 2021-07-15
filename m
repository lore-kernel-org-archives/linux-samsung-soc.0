Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74974C636C9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Jul 2021 18:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58441613F0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Jul 2021 18:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239042AbhGOSvU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Jul 2021 14:51:20 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34992
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239268AbhGOSum (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 14:50:42 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 75204408B4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jul 2021 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626374866;
        bh=BDtq/bE7D6tv68aPIsRH6XGY2g0R3D1k7jrQYW796Vc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GBFPyJ8q22AhW7avRDSOKvzo4Ax6cDrIvi7gIFLhijzfDrhDh6wxBHEl1FTjutP6e
         29WFgxEsCvxuDQLZf39M3Eo3mBa3fcURwVG+z6ExpAfBqFWyYPeXQOUgpYgUTPTgaI
         g+H8AJL019KOI987A7OOKJa7m2ZtuMhQ5woDHMELCKgt7aPJ11H8bwB5c/kmlOLlsi
         cGh5cF6M4Boag54NeuNOfm5q0/w42V624nSpj1NbOJJ7NVOm0YyNtwT2h0MN3uC7rC
         d3qA6GT/pzOT+WsTs2hsLYR31I2ISOEUmbe5yLi+oIyNPNcemEi3eySUgsuUfs7oqx
         HI8QJe0L2iMsw==
Received: by mail-ed1-f69.google.com with SMTP id p23-20020aa7cc970000b02903948bc39fd5so3609144edt.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jul 2021 11:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BDtq/bE7D6tv68aPIsRH6XGY2g0R3D1k7jrQYW796Vc=;
        b=Rbq1FCNiX/AdPflKHVzEZS0dq3sdQ7E3rPS5un5CIQN9UkALxbv/IlaccJMHj9sGat
         naWMY/bQUkg3nrl/CRZvN5Tr5GHDOaa1wjerLG2TR4Yh7QOvuH7hD0xpxy9i4bNTHhOL
         AmR7H/cbw0+W972wqmoxfPDbKXMeHJCaKn247yPRKqWDp/3gVI4LBVkuhUP3XzhQWwFR
         JetrK2Uls7ivW0lutqOWSUcgBAaInDwqdrSH/x1O1rl/1TSkHCi0yPBdDS5488ywv1si
         yHoqQ6rCOp6dBsfPQRd4RMBkoknV4fHXLjOjJ3gXvAHlJXgO7cSlzkQsH/Cf3NTqM2As
         VxKA==
X-Gm-Message-State: AOAM531qk6gPT7eLcUh9rA+sRF8rih0qAwe0/ALNbrIRMb3lXEe9gsxZ
        uTvFAnP3uaaMZ8NSg5++i1XOhmHMUFuhp1PYKC5vjage7eVqfmE0Glp/ktNOtlalKrmM+nvSzqL
        RxlEKTrwiGkUCF3Q411MC7737C4XcIw1h2AXxuCeCF86ekGQI
X-Received: by 2002:a17:906:b796:: with SMTP id dt22mr7124051ejb.448.1626374866023;
        Thu, 15 Jul 2021 11:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6J9EsYOyF8uIEK6SstxMZ6C01PfUQPWo5oEFXjzSzIcfkZKr2Xrv4CwXrwXHXu2ltkmRjLw==
X-Received: by 2002:a17:906:b796:: with SMTP id dt22mr7124035ejb.448.1626374865850;
        Thu, 15 Jul 2021 11:47:45 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id v13sm2110746ejh.62.2021.07.15.11.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 11:47:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos7: Add cpu cache information
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org
References: <CGME20210622130203epcas5p48a3111fc6586b1bfe0bd3cb90f783ce0@epcas5p4.samsung.com>
 <20210622130551.67446-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8d18cafc-6d88-bef5-075d-b5436f0c5862@canonical.com>
Date:   Thu, 15 Jul 2021 20:47:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622130551.67446-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/06/2021 15:05, Alim Akhtar wrote:
> This patch adds cpu caches information to its dt
> nodes so that the same is available to userspace
> via sysfs.
> This SoC has 48/32 KB I/D cache for each cores
> and 2MB of L2 cache.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> Changes since v1:
> * no change in this patch
> * changes as per Krzysztof's review comments in patch 2/2
> 
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 35 +++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Thanks applied with fixes:
1. Title prefix as exynos,
2. Proper wrapping length of commit message (please use wrapping as in
coding style),
3. "This patch" -> imperative mode as in coding style.


Best regards,
Krzysztof
