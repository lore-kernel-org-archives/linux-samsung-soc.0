Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB4AC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Nov 2022 08:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbiKWIjA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Nov 2022 03:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbiKWIi5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 03:38:57 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BECFBA88
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 00:38:55 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q7so165452ljp.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWg6Ff6BH10NGuivQAe12p9c1TDwH/74TLSEqxl141E=;
        b=G+Y0WU2FKvs6wUCeKCoe+WBbu6w5r3al4pGIeCTDsKyiEahu1kT86Q19qMqtnZ/4Zt
         5ltUpKPWIvoMv8Ah9n0hMy/D0dZHormnBUfn5TDyKAW9DkYcZsb/QJJFKt/ZDGhWht2X
         t2VwbS28jdu3pYPPxOYdt452TZgh2lpzIiQryuCCxpk0oqjC5zldfSvt6JZL8ZDwjDji
         flxXKx9YaculyiHOiiVz2c3unz2qnhYkxntwncry9bOY0IBiJMP7xF21MCrNfuD/Ljvn
         UFPR941foBk7PEEfkpAPPLi1udI0M3vnQXhIzWUbUDpWnvRFvgmn3G8++TApL9yqusaK
         K9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWg6Ff6BH10NGuivQAe12p9c1TDwH/74TLSEqxl141E=;
        b=UVp2pirPbxhRxUUX7LEXuUPArmA4KBIUtiOiHwbD3NushlgF8YBJZikwXaD3f75/u/
         GLgm/sKPsGth9fgJ1rOB2qAa7zXMyoc/Is1Z52PZgiRGeFf/0sDEg5ft15y/FY0i/v2x
         BjHybFjeVTEtLyQiQ63zKsL35PNHp7amjF3JTUR/7GyYPmFaUrXgqTGLVeDULlSNbxd0
         7ZHLDQzKgRPStdf0TzhssEX47wf+koRCK9NlfE+mcG+bpKG3ZL8pEozj2fH2D2c5+Ury
         KtIWBzemazdcBLnRVjZ3564K+h2l80FVDUEUaBLzYLAhdKZU0yDEYwDgZP+QOZuNSahd
         lSkQ==
X-Gm-Message-State: ANoB5pkbCfkUutp2xTiY5bHIn0hnqJ6vrdqolzCwKcNDpDGWSRQno6uc
        Vq77pFSlL6NQzXqxhkgNRl+/Ww==
X-Google-Smtp-Source: AA0mqf5u75+G9Siks12lr8P8mRmKZeK2sOP85dyIcPznnELW5X7sGWzwPjD1FaHES5bhYZ/oab6Jsg==
X-Received: by 2002:a05:651c:1105:b0:277:3dd:e32e with SMTP id e5-20020a05651c110500b0027703dde32emr8018766ljo.467.1669192733608;
        Wed, 23 Nov 2022 00:38:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2415a000000b0048a8c907fe9sm2814452lfi.167.2022.11.23.00.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:38:52 -0800 (PST)
Message-ID: <a141f08c-18e4-13b6-105f-b8e54bef61ba@linaro.org>
Date:   Wed, 23 Nov 2022 09:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/2] arm64: dts: fsd: Add MCAN device node
Content-Language: en-US
To:     Vivek Yadav <vivek.2311@samsung.com>, rcsekar@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, wg@grandegger.com,
        mkl@pengutronix.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, robh+dt@kernel.org
Cc:     linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        aswani.reddy@samsung.com, sriranjani.p@samsung.com
References: <20221122105455.39294-1-vivek.2311@samsung.com>
 <CGME20221122105027epcas5p2237c5bc9ab02cf12f6e0f603c5bb90c4@epcas5p2.samsung.com>
 <20221122105455.39294-3-vivek.2311@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122105455.39294-3-vivek.2311@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/11/2022 11:54, Vivek Yadav wrote:
> Add MCAN device node and enable the same for FSD platform.
> This also adds the required pin configuration for the same.
> 
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>

Thank you for the patch.

Looks OK. It is too late in the cycle for me to pick it up. I will take
it after the merge window via Samsung SoC.

Note for networking maintainers: please do not pick up DTS via netdev tree.

Best regards,
Krzysztof

