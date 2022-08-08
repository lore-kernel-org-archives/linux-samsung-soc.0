Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540FBC00140
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Aug 2022 17:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237483AbiHHRTT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Aug 2022 13:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbiHHRTN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 13:19:13 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D125715FC7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Aug 2022 10:19:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so13671945lfr.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2022 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KbpI7aX4OJn+9ta7EZh2prJEXa1vTXGHPmj5GWJjFZo=;
        b=zlnytlGmuMZ+psy1MdlUiNxuXSiE8ZCQ3Gv5Frvlh8cCNKqt2vz3RyTbRK256z5CKX
         ZiuNuhAA8KA12Bt3I+BbNroQ91a8BPiMqx26a8cX96K41jkiGVK44WiqKCvPLcROB+9h
         RMY9cVTGaADY3Uew5DmA0cBp4ZUot3wxoLoTqCOQpZLlYII++6Brua3pyU1+ydwOM6IJ
         BUIgerP4Y+W2XoSWVc4fw9+o932Bj9skOfT3gBECuXD55/9/WtQgc5G5Avryql3RS6ZX
         KJKJOgYLQ3PSDLNrWyUjEk0LQY6DhY4+0EDzjqUJLHD/X7Z4ysu2yu2jnnBvISNlVRJd
         fEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KbpI7aX4OJn+9ta7EZh2prJEXa1vTXGHPmj5GWJjFZo=;
        b=1LMTQwNo8ajOHk0yCdhSRKSPBR/66volMMunvSSY55kfur8+WwnXeurO2TpdoPQk13
         lSNu2DvTyitPwm8Wi1L/yfXr6J6BbhJm6ibYuKj8NIKo+EJo735TKYIgE57DOvylzVk8
         IavUW6ix4Lt/Vd4egN1hkGbuhkskmdZIN8SzJ3ra0C8qpFiDfVjadZX/kER+AZRQtcJP
         cgDW0StyetfwLpQSwznmCuA37nd81peU8xbxAxK7Cm9jEDdXaPvbQ+vG6t7UOn9bTtCT
         hZxjG6BLXdSLR1dNkDo4K8KS1SbnGPOfMYfMMJcFxD6z3zTDJUoAKuMmiPUgKNL/plIy
         P52g==
X-Gm-Message-State: ACgBeo220ZPP7dGANnH8RXJ6PXu2caPpNmU1+stCYCPm9YrOlZeD2Nr7
        8+bYVEtLhfQSQoC95hi69B5QdVtJRNIdhg9aBlgz7g==
X-Google-Smtp-Source: AA6agR60RUwt3/4FZq6vv68Rd14ohShJ+6I1vuQ8pNpdWDWPZ27+sATnt0BnfGxwaXqeGnKcTp+CfCCKh4dFy7ZrKgQ=
X-Received: by 2002:a05:6512:2306:b0:48b:26f3:91b1 with SMTP id
 o6-20020a056512230600b0048b26f391b1mr6621555lfu.11.1659979150181; Mon, 08 Aug
 2022 10:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220726200739.30017-1-semen.protsenko@linaro.org>
In-Reply-To: <20220726200739.30017-1-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 8 Aug 2022 20:18:58 +0300
Message-ID: <CAPLW+4kG9V03edHFXWJumuK+tmWiiwF5B7d2O6+Mb_XmfBY5Jw@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/exynos: Add fault handling on SysMMU v7
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 26 Jul 2022 at 23:07, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> Exynos IOMMU driver implements fault handling for SysMMU v1..v5. But the
> abstraction currently used is not suited for SysMMU v7, as it has quite
> different fault related register set.
>
> This patch series reworks the mentioned fault handling abstraction and
> adds fault handling support for SysMMU v7.
>
> Sam Protsenko (2):
>   iommu/exynos: Abstract getting the fault info
>   iommu/exynos: Implement fault handling on SysMMU v7
>
>  drivers/iommu/exynos-iommu.c | 208 ++++++++++++++++++++++++-----------
>  1 file changed, 143 insertions(+), 65 deletions(-)
>
> --
> 2.30.2
>

Hi Marek,

Can you please review and test this series? I only have my E850 (which
has VM-capable SysMMU register layout). So it would be nice to check
if it works fine with non-VM SysMMU v7 and older versions.

Thanks!
