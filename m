Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA8AC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jul 2022 16:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbiGLQUp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jul 2022 12:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiGLQUp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 12:20:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3707BCA6E2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:20:44 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so14789053lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pPvdo6E/8z4yuwllWLa9VmBaE7sTUkZvuVnN88mQiew=;
        b=pjHJ6TMi7gYiJfM3BBjUdaGo3Pz31kFTgqMi699hX4dsUEuKdWS/SzqioBK9aMSMxz
         jv4bOKzp+vs3j3+I7kcyVuq3zZoWverBE5sE6grD7VEmf6urAWnTCriJJI0qpulJueF2
         CD7FkE+R6b390qI+JOU0yrli0gfymIxGZaK3ZMNvhlS9iWHKEDmDFrQCHxsg33RZ7TD1
         HIH8JwEm0etHsY2yiAgX9QeWaUI96KZNE7sS6iK3cW7m1Ubo5KL+KMzjEoCTulsdY2PA
         WVaZIR/1ljH56ZSpM7ga0WEbM+FHYJKi6ZxM//HZRk/CnivStkxw6KOFjZKwR4Nkt1zT
         oyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pPvdo6E/8z4yuwllWLa9VmBaE7sTUkZvuVnN88mQiew=;
        b=p31POo+vmVQ0BL9+pE0kArQBiwgo0F+jZM/aH9CovO6TmxMxLvvsk5vUpLbdsgKmmS
         YezZmViRwM6KwkevwCUD6aKiIgiygf/XssK1HirsnbxTWpHWnsodl75JNzBDlPRRkksu
         9Kb1t+Nq9SbJbjd5ddiuMDEMBYBcWrs/bw37uLCDkCjyvn9imULnNmaBIwhw4i1vBCge
         5oxYiS0ccow4jAUKblrTdysNFiM7j9tvlvymigWzg0wtI5JvX+33GJQxxtWU3tLKm3Wo
         n1/vv24ed2fAe5AAA+uVi1Gknb1evfR5tEJua7JQM1oegw0GmDMwS50k8TvmkbyyBLmQ
         qw7A==
X-Gm-Message-State: AJIora8+GoZ6BQor27gIi+yImUZlxgq8EaWpF9XCN93MVYWhgfoiTQro
        q0cVNmmptATw0M7s3mKEBkgYzid8oYFBHVyE
X-Google-Smtp-Source: AGRyM1v98KWxppvdS1K4LP70/57yD3snxlG0GqUiLRvcK8eTNrXTs4BZtDFfUmG8nkYMA6we7cMSvA==
X-Received: by 2002:a05:6512:1381:b0:489:cd0b:3a03 with SMTP id p1-20020a056512138100b00489cd0b3a03mr11481588lfa.583.1657642842608;
        Tue, 12 Jul 2022 09:20:42 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id q6-20020a056512210600b00477c0365b20sm2263111lfr.188.2022.07.12.09.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 09:20:42 -0700 (PDT)
Message-ID: <09c807b3-67c4-1439-793d-2b7d461f4656@linaro.org>
Date:   Tue, 12 Jul 2022 18:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/7] iommu/exynos: Handle failed IOMMU device
 registration properly
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
 <20220710230603.13526-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710230603.13526-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/07/2022 01:05, Sam Protsenko wrote:
> If iommu_device_register() fails in exynos_sysmmu_probe(), the previous
> calls have to be cleaned up. In this case, the iommu_device_sysfs_add()
> should be cleaned up, by calling its remove counterpart call.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Fixes: d2c302b6e8b1 ("iommu/exynos: Make use of iommu_device_register
interface")



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
