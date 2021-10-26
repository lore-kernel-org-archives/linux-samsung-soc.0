Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11BAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4DBD60EDF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbhJZPcN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:32:13 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41876
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235506AbhJZPcN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 11:32:13 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FE8A3F332
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635262188;
        bh=WSJF9KCqXo5B633RP/TS84McxX2RgkL3V5mZBciirmg=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SpFEJpiCSMyUIFGSrjANcYREQx3NFW09vYCzAsM89Vcql+U/oItlal9xkoJ+BCUcP
         6eK8IppgrvYjQC/u/rU54jp6NUdxFqSwHS7UqSR2UA3pP3T7sv4POaKPdUaMcnDt6T
         8J2ePsZb8+TsFgcrZ925i7ZhZjrCEaLKACCojaJ21AVc34T6chtWZ46gboME0N5ONM
         SmoZ7eUlSW8witUuAj3sMe8rvovxRKuN9A91rB8zLx/dRzY/z0teb3JkbNLtVrtAvi
         hje9ubp12df/bTwvfe7t7v0u81yK5Dk8uM9jmFHnzoWY+rSekSzlOtud8MLVzmqcNC
         hoVOej4tIG7dA==
Received: by mail-lf1-f72.google.com with SMTP id d5-20020a0565123d0500b003ffbadeb642so757633lfv.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WSJF9KCqXo5B633RP/TS84McxX2RgkL3V5mZBciirmg=;
        b=7tOOxAhmUZdmiY75VJZLNjCHQorfa4Gpwx7kpyC9RBO7hWmJOfqVYq2rdA75M1g7Rf
         Cmyz0w7L7fWVmRcHhLaDyAFmJnUtG+kS1AU9uWMR0go4rPk/M9W8F2cVnrdL6XxQoaeK
         ebE6F5ykbx2gW0gebuBptLhehWAl/yWiYbTEVlSToxDXbMQYaHhel9w5LKeUTnl1PgzP
         eMkKx5dmzIJLY4A+RVVXPdbP8UCW/a82ukyUfjD0Wr+vumTs6+ZRApTy4G3Jya6O1ZeK
         AVPyRqde1crVCegoTXDl++1krJN5wu4XcoIltXQmAc3HBOcneHHfq8PlmKzYjJ0vPeYt
         LuTQ==
X-Gm-Message-State: AOAM531Kaks0SCs+PiSakq+pE6FR9b0GNBQ94pym21tMTwhcg0vXajsv
        KNBEAU6Vn2JmD8zlNdZV+sJN0X0BDGfdlQgHeWVDZUUVk4oJBTijcLJAC0mkjyiGTthymbPKcKK
        RQJUwxtt7VXWHD2dqiv/+TRFeBiqTLaGCY7HiU9MzVH1V3k41
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr26414045ljb.467.1635262187755;
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk7sNJbWjdv3xhjfE+UFgqNsGbUUen1K1mx8YhCM7+SWcWNWstn2HGR1lnvG7kYqDxBpr9RA==
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr26414022ljb.467.1635262187572;
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bp40sm441461lfb.78.2021.10.26.08.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20211015190515.3760577-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1] clk: samsung: update CPU clk registration
Message-ID: <cbdbf565-6403-39d3-a4cd-817e515d89a0@canonical.com>
Date:   Tue, 26 Oct 2021 17:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015190515.3760577-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/10/2021 21:05, Will McVicker wrote:
> Convert the remaining exynos clock drivers to use
> samsung_clk_register_cpu() or if possible use
> samsung_cmu_register_one(). With this we can now make
> exynos_register_cpu_clock() a static function so that future CPU clock
> registration changes will use the samsung common clock driver.
> 
> The main benefit of this change is that it standardizes the CPU clock
> registration for the samsung clock drivers.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clk/samsung/clk-cpu.c        |  2 +-
>  drivers/clk/samsung/clk-cpu.h        |  7 ----
>  drivers/clk/samsung/clk-exynos3250.c | 54 ++++++++++++++--------------
>  drivers/clk/samsung/clk-exynos4.c    | 25 +++++++------
>  drivers/clk/samsung/clk-exynos5250.c | 13 +++----
>  drivers/clk/samsung/clk-exynos5420.c | 27 +++++++++-----
>  6 files changed, 67 insertions(+), 61 deletions(-)
> 

Looks good. Tested also on Exynos5422 board:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
