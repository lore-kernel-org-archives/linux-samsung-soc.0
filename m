Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61962C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Jul 2022 07:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiGZHVw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiGZHVw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 03:21:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799CBDE9D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 00:21:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b21so8551589ljk.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BaHRyLExwhQJT5LoXWhyAV94oIh55w9luBR+4krs4UE=;
        b=IvRWCs+QRUbjysWNzcrXSCOLNDiVNIOzFM3qbLPrFROW6ff5JQQ3Y6fh6fWX/9xBAN
         P9GZnniPLle+tgVY9QCRN6g+97izf7kayF7CVc39++5MqmfER6vl4nkFdCH0Xp1X9A/X
         Np8igVpHxQGt/AWTPTI6oAoWJS6cBSk/z3WaNOT6cdfzJzC+iiAldLJlTOOrB959O7Vl
         /7rYfBgOTVGhx+uQi0FBSw6jRRriJYZXl6urd5fKzw8VnKeyYW/PsooBAVMr2C0sjdNu
         XLoYoQaNTK2HTLcyPqxVm7K0vNynn5I+nBtQ5sbAADgMQc2b+DAdSbQpQSswJZXYkTyJ
         SLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BaHRyLExwhQJT5LoXWhyAV94oIh55w9luBR+4krs4UE=;
        b=PvoPOvYFhSE7mF+eqOtFXJrq+dDmSiUH5wnA8y//JxTT7CMq4lzBgw3Vu58/XpXZZm
         dH1QoZH2w1IyH2Y8lo98Ygq/71nONCRymQFiXxtaUYVhK5JXM+toPHDa2zVj2vLUJ6nb
         PfmeSm7sti/XP5/XaySUALJLuMo29kMszsCTfDXqmLf2A9nMLJKhcGkKQLRbhFxqaVkf
         cJbKcCxtj+1LbaQw8AFdhawNuojdi5FBCUNW9IXn+TOlw8wynDq/RCBaLXlvgaA0WzKO
         F7hPCoTLllVmvl1XNGuZZlujUX5C5kTqJ8MRB4XBOw245e5t7Owa4rt37jams0IO+END
         63ew==
X-Gm-Message-State: AJIora8O6VLPFSk0/9aVkjUzrF6LwZ4doSOTP8CFkxuou0816NVidllj
        vO2q3rWgO8oRUv4OH8768pcK3A==
X-Google-Smtp-Source: AGRyM1uI68NeSyMBV7L10D0hiN3uZqFmqFNUzzXgBA5m7TamyyJaIsHnblRN0NsbOPTnr3qjKjVmXQ==
X-Received: by 2002:a2e:9797:0:b0:25d:e70d:a63e with SMTP id y23-20020a2e9797000000b0025de70da63emr5689874lji.248.1658820107619;
        Tue, 26 Jul 2022 00:21:47 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u16-20020a2eb810000000b0025dff3737afsm1441063ljo.117.2022.07.26.00.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 00:21:47 -0700 (PDT)
Message-ID: <2329cb6b-7385-c670-1601-b7a3827070df@linaro.org>
Date:   Tue, 26 Jul 2022 09:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 30/32] thermal/drivers/samsung: Switch to new of
 thermal API
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linexp.org>,
        daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        abailon@baylibre.com, lukasz.luba@arm.com, broonie@kernel.org,
        damien.lemoal@opensource.wdc.com, heiko@sntech.de,
        hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
        talel@amazon.com, thierry.reding@gmail.com, digetx@gmail.com,
        jonathanh@nvidia.com, anarsoul@gmail.com, tiny.windzz@gmail.com,
        baolin.wang7@gmail.com, f.fainelli@gmail.com,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        glaroque@baylibre.com, miquel.raynal@bootlin.com,
        shawnguo@kernel.org, niklas.soderlund@ragnatech.se,
        matthias.bgg@gmail.com, j-keerthy@ti.com,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
 <20220725212637.2818207-31-daniel.lezcano@linexp.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220725212637.2818207-31-daniel.lezcano@linexp.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/07/2022 23:26, Daniel Lezcano wrote:
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach. The ops are no longer device
> tree specific and are the generic ones provided by the core code.
> 
> Convert the ops to the thermal_zone_device_ops format and use the new
> API to register the thermal zone with these generic ops.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 24 ++++++++++--------------


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
