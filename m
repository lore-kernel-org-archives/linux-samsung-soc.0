Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922B4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Dec 2021 11:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244690AbhLVLdv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Dec 2021 06:33:51 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36512
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229964AbhLVLdu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Dec 2021 06:33:50 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AD987402FB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Dec 2021 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640172829;
        bh=Bud3WNiBkA27UvVJCmsfryp1dUMovY1kL8ZJQpJGAV4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gnLarOnO17DbSsUktEjFGog+KLWpYvcRIFDjFNUabVhobc9wK1RPgft8N2UtA3uVg
         m17+i3W7gC/vnP8tXdmJUVkCT7ojHBDBtf4NvB1qICEbRmoicKwdMggPjDVp55hamm
         WffC+XWEZLDpMq+XmtNY0i6khyDnSsMwuHEN+1IjHGdEo4WOinXW2NK3f+4QXULwzo
         j0wUOHSOHuWRZznMuqTQYxOZGKp3lmW2IKLWZnYTHOLHNNr9bYH3CfzoCFzsiyqV3a
         gT50e07r5/U0x/Epv/r7a77zVimgHyAHTViS95hRkJBfL5aHQM8Wo2X+ltMw7En0Mj
         lQlHLC2NgfkyQ==
Received: by mail-lj1-f198.google.com with SMTP id q64-20020a2e2a43000000b00218c94eab9bso264579ljq.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Dec 2021 03:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bud3WNiBkA27UvVJCmsfryp1dUMovY1kL8ZJQpJGAV4=;
        b=SNsJ6kCxRS9iV461gZKc7RZjVZ/dP3jCWHuUCmNvMVV7rnnPFCNS0jxhB3vnc1Fhpr
         SGGxHxr/OMCPPQXrpjq5ncRIFcUCB/F7W1ixKzkhidd8tdP3nS2xTHWk+UqIBZuTI9Go
         oWofUhspED7f9HZwTtisq45Wf5Vooanq6IQFpMNstTPoxpZz1qlXZw9g5ni6q/HxGY6K
         8ZKLwkXvMqq0onSrU/GbJSXo9iO1MdiNnVF9Uf1PaUCJB2E4bolaZdkdklDJVwPkfdZU
         kNKDNDZ4MZPMZQmOjk1W7amUdcR5DsoYaWQITJJKc0FJ3EXYUdLMLaJ0qGWnc7i+OK/Y
         DKbw==
X-Gm-Message-State: AOAM532s5xYnutipmFn+F9MbWc9fiaPpmpObmh7WZQSbNVlKPa8IEc1b
        N7R/E1dO6y6ovhfBKne+S5Zf392uOL/g4r4xPDuCf+ZETLk/dWnLmarOVFlVQKoeMyDO6OfOTLe
        kTkCaViKpCBdydBVvvDo3epvNQ2btbL0ZbPSRWelzB3D/N6hk
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr1829549ljj.506.1640172829024;
        Wed, 22 Dec 2021 03:33:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrXcAMSKIhda/WRnP+EJBAhMAiZn/qnEX7ocN0kQ6d+ev4XmSMji7hciMkpNl3WXN6IXsTYA==
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr1829529ljj.506.1640172828863;
        Wed, 22 Dec 2021 03:33:48 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o3sm188031lfo.255.2021.12.22.03.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 03:33:48 -0800 (PST)
Message-ID: <414faffd-cbe3-a784-1f6f-4e2eb325be58@canonical.com>
Date:   Wed, 22 Dec 2021 12:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 1/2] arm64: dts: exynos: Add initial Exynos850 SoC
 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20211221142417.19312-1-semen.protsenko@linaro.org>
 <20211221142417.19312-2-semen.protsenko@linaro.org>
 <CAPLW+4=B2DU7SedxfKyFBDH=6ZqiJVVNCNbMH3wmVuedFk_YnQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4=B2DU7SedxfKyFBDH=6ZqiJVVNCNbMH3wmVuedFk_YnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/12/2021 15:30, Sam Protsenko wrote:
> On Tue, 21 Dec 2021 at 16:24, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>

(...)

>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> new file mode 100644
>> index 000000000000..2abbb972b610
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -0,0 +1,759 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Samsung Exynos850 SoC device tree source
>> + *
>> + * Copyright (C) 2018 Samsung Electronics Co., Ltd.
>> + * Copyright (C) 2021 Linaro Ltd.
>> + *
>> + * Samsung Exynos850 SoC device nodes are listed in this file.
>> + * Exynos850 based board files can include this file and provide
>> + * values for board specific bindings.
>> + */
>> +
>> +#include <dt-bindings/clock/exynos850.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>> +
>> +/* TODO: Remove this once corresponding clock bindings are added */
> 
> Krzysztof,
> 
> What would be the best time for me to send the removal of this
> workaround? Is it right after v5.17 release?

The best time is after the merge window, so when v5.17-rc1 is released.


Best regards,
Krzysztof
