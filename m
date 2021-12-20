Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B234C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 09:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhLTJbp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:31:45 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59328
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229575AbhLTJbp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 04:31:45 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 520C83FFDF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639992700;
        bh=q7I5LUCu0tEwQU8mlJ01Zkswbw7h7CV+lz20uT47oA0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UnAtfDVqH5nO07QRByZ/jipV5qcR4Mu/Q8EUoz0ehmuvMn0IVatgft7vL6J9xAAhh
         MCcTSL5Rxlyhh+sXwENcE+cOMq2fiH1kIOAoga9jB39FGnUIvnrgY1cJF/6MjGugDa
         QWXyXLp6TakDqD3xJvdXJ2y660ANSnvnDjMxSyx/qysLdUnC95B1kOB5Y0LQbQUvkN
         Q3fiepwPMWV7gNkCaLZV7wEsScmn88mIWFfmARYRDfciT5mpgYRiHRj6YPOSCeflC0
         TMsKLYuQH6VSBt8/wwi1hP/d9LPF66TSNqLzXNZASNqDZDhFGOJQbWx1pUyq54qfnE
         xTCUnOZggDvug==
Received: by mail-lf1-f70.google.com with SMTP id r21-20020ac25f95000000b004259e6ab262so2348969lfe.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 01:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q7I5LUCu0tEwQU8mlJ01Zkswbw7h7CV+lz20uT47oA0=;
        b=MAyO/jbKiO+0pWQMZjNO15ec3UWPahsarq38Pqirt1f4XZYPul4BQcCN+0Oj9lanjC
         Rm4st5EVX5qZU/gv2rdfR7EiiE2GbEgXyN07pAOQr8TrmXzrra+5nEW9EAFNKoPlHVZA
         pMf8zyDto+a/dIn+slvNwnA31+qN5Hj6JdU6lSswSXph81ia2OeZFCgMQNEgeVH58oAh
         ePXDSoW8+jKOoyy1nMbmXQf7gvAvx33JTdFnypGivNJ2toaklSIxND4isk0384Igu2MH
         mWGnkx0w3RuX9cYPr+xinDFvin51xI5GWIDpt9NwJ+yupHGg32Vj2WlU5jT7L/anKFjZ
         m7rw==
X-Gm-Message-State: AOAM531eThcemY5CdGreffL5PVgvW+zpMw+BF7q1zSWijMnz++fqIQvt
        tTIREbPt6WTVNGvCXV96FVSlYC3gHMmWOvMS2EzGYMINdQLu0ZhZIz4NJVC4YGIwh2lKv+tf2EJ
        mzKO8B2y4muqw89XI+Rv9ing4yr/aS9L4ZMp62F4oUCgX59HA
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr14038811ljp.249.1639992696180;
        Mon, 20 Dec 2021 01:31:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgVVgGiKkGKbx4ide5sjyVaqJ3UmUjO0Zkflx9HK1jDuh36xwydUtGqYdkrGBefX8MPBCelg==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr14038784ljp.249.1639992695825;
        Mon, 20 Dec 2021 01:31:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j19sm2466716lji.94.2021.12.20.01.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:31:34 -0800 (PST)
Message-ID: <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
Date:   Mon, 20 Dec 2021 10:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
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
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-2-semen.protsenko@linaro.org>
 <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/12/2021 23:29, Sylwester Nawrocki wrote:
> On 17.12.2021 17:15, Sam Protsenko wrote:
>> System Register is used to configure system behavior, like USI protocol,
>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>> make it possible to modify SYSREG registers.
>>
>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>> and might be needed for corresponding Exynos850 features soon.
>>
>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>> Acked-by: Rob Herring<robh@kernel.org>
>> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> 
> Apologies for late reply, this patch is applied now.
> 

Sam,

The clock is used in the DTSI, so since this was applied, there are only
two choices now:
1. wait for next cycle with DTSI and DTS,
2. Resubmit with replacing the newly added clocks in DTSI/DTS with
numbers and a TODO note.

Best regards,
Krzysztof
