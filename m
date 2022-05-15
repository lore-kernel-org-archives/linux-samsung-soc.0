Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92811C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 May 2022 09:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbiEOJpo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 May 2022 05:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbiEOJpn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 May 2022 05:45:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650092CDCD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 May 2022 02:45:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s27so14977198ljd.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 May 2022 02:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=VOmZ36K2/Se2iEMUmzCNT5DsiEAqRQzghBT3JGwISGE=;
        b=WEor0tLzXnp7bu0UIT8R/nBXO+eqMyT5HFceBaoQ11xqeJ5/Jf2Wv66WcB5585b7W6
         z2bK14uU1IrnaYyoOSdKdlQanJ1cI1iyUyFEZ34Kxq7ZyLOTQemSeoflGAg7WYQsU+25
         DfIbZJrrAl+RK1LiafBFTK50ADcF7pTgtOUmA5AJY2Hj9Qm5qN0F/OVfR5MOP/dWdeWT
         3F6pkzv5bEv94vZM7CWVOoJqF37XkYPJ7NeuSrbeGydcshtKiZ6IzwYdaO4SjZBo/Vt9
         KuMRqPjKE6zulmTA4wXVZFcppbtm5/exgMv33esggHRiuwnMq8hmXbMKGunDGv2LrFDj
         CUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VOmZ36K2/Se2iEMUmzCNT5DsiEAqRQzghBT3JGwISGE=;
        b=3iJxvYCYI+B0JG4OcumL6G+VLDZ7ECWdRBXaq0NorJQgRnVuvxxWVmiMbmOT+Edr78
         6jq2LObwH+u/dH+URPgwQCXz+VMXHbxChK2BAhLIMtMzZDM+xvIcSp8m+Qx+zIfR3X9d
         zsHDyzVHQGwoUytBHz8TSapQtrsph9fwGACKFTCDMX+kCvZEQfBNDUQgSSU55Bw2nJXg
         YQ7HS/DBrkBK29NTUxq4LJlgOf72RUpo5AXpHuL245zkbR+uWqV2jaGzZbbZwUi9if5P
         GmmvIwWSKK1hWXXTY5nT9qRHkO5sTrVDe9j7lJ+62mZktL3iXCSmSCgUpX7ovICCX7d8
         IsJg==
X-Gm-Message-State: AOAM530Td6KAe6/V3zg6hgHztWEvgqf7k3Tfp1iaCfUBjbAjVLkbhOeh
        EzGkVAB9JkdkoZ5nR2OuW5UMpQ==
X-Google-Smtp-Source: ABdhPJy81LqQn0Rmls65Gkci5x5pSZWL9g3WjSLGuX4ZKidOa6lfMqMC8zZ5Ugalf04cf+edi1UVZw==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr7984304ljh.254.1652607939794;
        Sun, 15 May 2022 02:45:39 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w7-20020ac25987000000b0047426f59b33sm960579lfn.252.2022.05.15.02.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 02:45:39 -0700 (PDT)
Message-ID: <5b388fd2-7d79-7e73-b1d0-a6c8bca4def4@linaro.org>
Date:   Sun, 15 May 2022 11:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv2 4/6] thermal: exynos: fixed the efuse min/max value for
 exynos5422
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220515064126.1424-1-linux.amoon@gmail.com>
 <20220515064126.1424-5-linux.amoon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220515064126.1424-5-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/05/2022 08:41, Anand Moon wrote:
> As per Exynos5422 user manaul e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly.
> 
> Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
