Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6B6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 12:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242360AbiFTMVI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242517AbiFTMVI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 08:21:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D915A12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:21:06 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id fu3so20742986ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E3uLSUhwprnezWhgNjelyDpi9Pkas63/v00xHF+/vU8=;
        b=flreMh2NroyVGNd8enChslIN1cvKVgxJxxhnUBXjFc9GVkI3Na7171+B+8hmxsSCTc
         C+Ma1occ9HY+e4IsC8v/zHw3TpPYl4Bf0TLhYA59l6+j0yhZkKlL/xsC+6NFHesXH7pC
         Kckm2x6ElBlHssfWWt8q/9jHJclIQeii4Z7rGfBXUEFkOVCkxQtAkqxXVmtYmbB0N7MK
         ZxFjcocE1ZgZ2vu5v6lXz/B4wS8JCi/jpJCkIYU5QVzMs+VpPclxLTdVrWEtrvJF8Y92
         4WJCKynOvfZUu66df703sEw9PmtPZJJ0GKqrET1M62IN4wy9vnfsnE/Kxx8Y1k04cIRe
         Rx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E3uLSUhwprnezWhgNjelyDpi9Pkas63/v00xHF+/vU8=;
        b=Oow/bwUnPlDAayWahyjMXBFNZJ06MH8ReZjJxz6aGhWlYiCZd218NvsO6k3ZJoozVb
         D0/MIApZmJRj318E6ha4tq3ctaai7mQ2mMSTCKWBKxsgt8NRdKCwGHZTXUPMcbR5pjlh
         efKdVPzAmA8WjqbNg8chCOgzu4qq7lN5WRSYlbwDWJf1PsPydZiCewirBPovB6RekrYE
         2k8iChHXiOjq7VyppHxcmKE8FjVtyKVrr9r3ourGr7huBcCidewOu2L8g+j0qm8Gd6Pe
         wPH1+kgCvcmAQjc74icoV3Fuqn/orWFPpNn619OLo75N+wGHD/1MhGIgL8yxjhUnTPB4
         X4iA==
X-Gm-Message-State: AJIora++f7eMsUKRbCPorGGa06MMS6g24EbkzioF2C7W7ozyfwvUHMxX
        XU+cg4LiQMF+YKsadd8OEI8vvA==
X-Google-Smtp-Source: AGRyM1vsj2E2sC4eUk0ilvBOHumMn3Rq/1xT8iNhBngVpGkOy7XHu2JJYt87D1bB1ZyJpVmJz4ls8Q==
X-Received: by 2002:a17:907:629a:b0:6d7:b33e:43f4 with SMTP id nd26-20020a170907629a00b006d7b33e43f4mr21018798ejc.149.1655727665312;
        Mon, 20 Jun 2022 05:21:05 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y4-20020aa7ccc4000000b004316f94ec4esm10152674edt.66.2022.06.20.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:21:04 -0700 (PDT)
Message-ID: <170ebce3-4f29-c571-650b-abdcf05f3702@linaro.org>
Date:   Mon, 20 Jun 2022 14:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] soc: samsung: Add missing of_node_put in exynos-pmu.c
Content-Language: en-US
To:     Liang He <windhl@126.com>, alim.akhtar@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220615135659.3967956-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615135659.3967956-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/06/2022 15:56, Liang He wrote:
> In exynos_get_pmu_regmap(), of_find_matching_node() will return a
> node pointer with refcount incremented. We should use of_node_put()
> for that node pointer. We need a similar code logic in the function
> syscon_regmap_lookup_by_compatible().
> 
> Signed-off-by: Liang He <windhl@126.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
