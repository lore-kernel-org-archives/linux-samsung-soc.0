Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE7DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 06:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9432B611C1
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 06:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhJNGoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 02:44:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54324
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229538AbhJNGoG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 02:44:06 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 729AC3FFF3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 06:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634193719;
        bh=CMmfj/ip+IGKBw8tWjgLAh8I3/FgLXWH7nylZ4BTcqA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=And/g7krMcJTdwNNvmU+sLfSGaoHP9OYRVBt86yIVPoo67IiYU07ei07tlOQgXrjY
         pwKDI49zNd01afiTMLkmlZDh6V9KK/V/pkqwsNxlzSk6dV0MCZDXTPC7zS10C3h/dL
         YAoKuNkcWuptnAWJpZO+BAsOwT8C0KkRqklF59gWrkgEsIK+GjJTAaEyBWwoThYAJV
         6wehBfWw7ATAo2bgD9+OM9jYT4pn5pjUfvouToGfb8hKVyQPKmWjmPs+NKpmihy/L8
         frSsPYQQUlY7opSTVdrkMUn7Boc1VbcUr5Ar8k85nPaKCQkF0nZM5Hc3gsH+i1HJUy
         96KdinLRMThwA==
Received: by mail-lf1-f69.google.com with SMTP id bt36-20020a056512262400b003fd7e6a96e8so3625696lfb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 23:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CMmfj/ip+IGKBw8tWjgLAh8I3/FgLXWH7nylZ4BTcqA=;
        b=a7TmxX8asWtIbaJaCacbhGprcpnfLMXCrguVwEqCk91bqwq5ouAEoNt1QT4PjUsgNx
         RGccHkCAIuS2SWau5RlRAsolDkizqG32W5lVqah6lZbNCqKxkVznjRLZKSfXFmgfiNN6
         KSyYGTKurWJTO/0nC94lQSOf7MDvhdnUHtWwdiDSN3vHZGrjl9Q3YI+VB+9yXLj0Qbg8
         M/mXXh2OpxqSdfz1Ab6XpV/f7/m2DevE5voPJmcyt6nSvyIdeCuz2Zf/0CvaYWURSDGI
         iCRHGPNTpEVIFrxl+vE1uafhBOGJ7PDI72M0gPkIACg6+FEDF/xWOuSBDzH8NYdpLAr4
         BZbw==
X-Gm-Message-State: AOAM533xs+C8GAREdSnJKNZ9/HjV68Ooe55TAbpHhlsVrgLMquPgSxiP
        YAmkSzXosZj77FIsaAEWk9a7QjOTqolOIemUfoAYKjjlEQtx976eMYUjfuG0EuthNy/cvXKD80D
        1AUWXRn8N4jmA2gktkWjJIInHldA5v/8kNP/NJu+atjrryGVz
X-Received: by 2002:ac2:52b0:: with SMTP id r16mr3405370lfm.500.1634193717259;
        Wed, 13 Oct 2021 23:41:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFQjJUQipqmMTro8hRz6eMfXduPpPL0Xek7QIUsQK2i5IMv8MJSarYOB4NbF6Q6rvUma+yZw==
X-Received: by 2002:ac2:52b0:: with SMTP id r16mr3405360lfm.500.1634193717105;
        Wed, 13 Oct 2021 23:41:57 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l24sm176616lji.25.2021.10.13.23.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 23:41:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg
 offsets
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211013202110.31701-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3460c787-0a72-3c37-1075-dfee9cc2c0b3@canonical.com>
Date:   Thu, 14 Oct 2021 08:41:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013202110.31701-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/10/2021 22:21, Sam Protsenko wrote:
> Old Exynos SoCs have both Product ID and Revision ID in one single
> register, while new SoCs tend to have two separate registers for those
> IDs. Implement handling of both cases by passing Revision ID register
> offsets in driver data.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
>  include/linux/soc/samsung/exynos-chipid.h |  6 +-
>  2 files changed, 58 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index 5c1d0f97f766..7837331fb753 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -16,6 +16,7 @@
>  #include <linux/errno.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -24,6 +25,17 @@

Include a changelog please. Your patch does not apply and there is no
information on tree which it was based on.


Best regards,
Krzysztof
