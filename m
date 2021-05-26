Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55849C47082
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 05:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38549613F4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 05:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhEZFzj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 01:55:39 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:56456 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbhEZFzi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 01:55:38 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210526055404epoutp047898d18b4dcf33f53f833165164c0a12~CiBYOZUB92318023180epoutp04p
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:54:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210526055404epoutp047898d18b4dcf33f53f833165164c0a12~CiBYOZUB92318023180epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1622008444;
        bh=fv1JWZVtdz+8RIndfB1/eFHIAMxTy+LbQABTozTqxT0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=QC/0x8gYzaljmQ1KVrxMqoTarR6SrbIWOKXXh/dHb1Ziut4xuPvatnVllLVhUy5gJ
         rCvjz5JZAayCiQjKaCGLrVzfKrvjvLjz5ue+JCTlMhSi07AsMVXQ1qAJ9Au20xvmYT
         CTOhj3VTwT2AplOLQXyeQT22tR2tQlX8BdCveyAA=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210526055403epcas5p389b06b7974b4a85c4e2339b212a76bb7~CiBYCI5Ye1364613646epcas5p3y;
        Wed, 26 May 2021 05:54:03 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1A.4C.09697.B72EDA06; Wed, 26 May 2021 14:54:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210526051301epcas5p1ce9b9655d7e2d777906599088509f056~Chdi0M2jq1696716967epcas5p11;
        Wed, 26 May 2021 05:13:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210526051301epsmtrp27e6a2e50cdb1113b9cc754468717f598~Chdizbt0M0328003280epsmtrp2X;
        Wed, 26 May 2021 05:13:01 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-c6-60ade27b7c80
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.F6.08163.DD8DDA06; Wed, 26 May 2021 14:13:01 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210526051300epsmtip1f5dd657ab96a37d8444921ee422a5236~Chdh5JT8J2623326233epsmtip1c;
        Wed, 26 May 2021 05:13:00 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@gmail.com>
In-Reply-To: <20210525184716.119663-1-krzysztof.kozlowski@canonical.com>
Subject: RE: [PATCH v2] soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION
 defines
Date:   Wed, 26 May 2021 10:42:58 +0530
Message-ID: <33f701d751ed$cca98640$65fc92c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGLKzlHEtYW08yvc3oVFZUGsEBF/gJki6A5q3pf9cA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZdlhTQ7f60doEg1krTSyW3qq22Pj2B5PF
        psfXWC0u75rDZjHj/D4mB1aPWQ29bB47Z91l99i8pN7j8ya5AJYoLpuU1JzMstQifbsEroxt
        s9+zFpznrfi2vJWxgfEkdxcjJ4eEgInEyqmvGbsYuTiEBHYzSuw+3cQE4XxilPj29BiU85lR
        4v2ePexdjBxgLV8mRYN0CwnsYpSYcF0VouYlo8SZ53MZQRJsAroSOxa3sYEkRAQ2MEpcXncJ
        LMEsoC2x58JUNpBBnAIeEo3TlUDCwgLBEufeTWcFsVkEVCX67j8HK+EVsJS4NU0ZJMwrIChx
        cuYTFogp8hLb385hhvhAQeLn02VgrSICVhIXJq5ggqgRlzj6sweqppND4skxfgjbRaJ/RjNU
        XFji1fEt7BC2lMTnd3vZIF7MlujZZQwRrpFYOu8YC4RtL3HgyhwWkBJmAU2J9bv0IcKyElNP
        rYPayifR+/sJE0ScV2LHPBhbVaL53VWoMdISE7u7WScwKs1C8tgsJI/NQvLALIRtCxhZVjFK
        phYU56anFpsWGOWllusVJ+YWl+al6yXn525iBKcXLa8djA8ffNA7xMjEwXiIUYKDWUmE92Dz
        2gQh3pTEyqrUovz4otKc1OJDjNIcLErivCseTk4QEkhPLEnNTk0tSC2CyTJxcEo1MIUv4zfS
        WXCUeae3nhlbsgpH+BEXFvXd3pz13wxWWu4N59AKuXNG3Uf9yPXHRUd/L7Vbr+q7+C1rt0m/
        ZdvrT1dXKf5auG3f6bXfS2tmRCxpCS5RXHPSSXjltcqQpluXcl/Xmc7z/aujZ1ra9TR/fdL9
        yqP2VoHKs8LMDjnunPgo99nVLA3Ve9ft2hRDuPuXfHzlvc645HWL+bJmfsPiVrvorVf3H8yY
        abj2Zw9jxdmZh7bXyVV5aBX9/+y2K2/yv28xSlrlTzrndNzcdC/WYtK9zrqO7ZZxFfsKV+SU
        s93rTFFvNj6hxLhd4tEBlR2eTanlUbUK8Z6Gr6tf/f9/6ugybSmLgyflNnXX616/osRSnJFo
        qMVcVJwIAHPg19WeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSnO7dG2sTDF7dkrNYeqvaYuPbH0wW
        mx5fY7W4vGsOm8WM8/uYHFg9ZjX0snnsnHWX3WPzknqPz5vkAliiuGxSUnMyy1KL9O0SuDK2
        zX7PWnCet+Lb8lbGBsaT3F2MHBwSAiYSXyZFdzFycQgJ7GCUODpjGlMXIydQXFri+sYJ7BC2
        sMTKf8/ZIYqeM0p8XT6fFSTBJqArsWNxGxtIQkRgE6NEx40JzCAJZgFtiT0XprJBdMxklJg8
        4zEjyDpOAQ+JxulKIKawQKDElYfaIOUsAqoSffefs4GEeQUsJW5NUwYJ8woISpyc+YQFJMws
        oCfRtpERYri8xPa3c5ghTlOQ+Pl0Gdg1IgJWEhcmrmCCqBGXOPqzh3kCo/AsJJNmIUyahWTS
        LCQdCxhZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeJltYOxj2rPugdYmTiYDzE
        KMHBrCTCe7B5bYIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwc
        nFINTLuqD35KsRd5dF1FOLz3tnhNjIb5loC6c9avd8v03Xk/g++Y51zOW1lH7WZ8k168XPuE
        3I5fP99uvWm/60qwyZeYHfIirOzRhqpif986rre9fvzF/2kLz+tt//5/7v+/n9c9q5PTku/M
        MDVvVn5TwLLz1MGuK2dOzV6r5blxxrP1i757KNbvX+88Y9Kq5S33pj57cYA1XSbm0NK9rAV/
        uP4Xro0//LFi54TKbZHlqrKS/kdCrs1OfnLH5vBXRqnm/lm5TZrcLkzBGpO6r5vc/+D0Ku74
        HRep9IaLh8VrpCxMK9fkX2I3tFnyQVD/8M3W5sCVdvzupamzr+1K0rWdUBB4RnrFTv8bohFV
        xhffZJorsRRnJBpqMRcVJwIAPouuVgEDAAA=
X-CMS-MailID: 20210526051301epcas5p1ce9b9655d7e2d777906599088509f056
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210525184731epcas5p492729224fc5477481138e03df3da6cfe
References: <CGME20210525184731epcas5p492729224fc5477481138e03df3da6cfe@epcas5p4.samsung.com>
        <20210525184716.119663-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Sent: 26 May 2021 00:17
> To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Alim Akhtar
> <alim.akhtar@gmail.com>
> Subject: [PATCH v2] soc: samsung: pmu: drop
> EXYNOS_CENTRAL_SEQ_OPTION defines
> 
> The defines for Exynos5 CENTRAL_SEQ_OPTION (e.g.
> EXYNOS5_USE_STANDBYWFI_ARM_CORE1) are not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> 
> Changes since v1:
> 1. Drop defines instead of fixing typo.
> ---
>  include/linux/soc/samsung/exynos-regs-pmu.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h
> b/include/linux/soc/samsung/exynos-regs-pmu.h
> index fc9250fb3133..aa840ed043e1 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -611,12 +611,6 @@
>  #define EXYNOS5420_FSYS2_OPTION
> 	0x4168
>  #define EXYNOS5420_PSGEN_OPTION
> 	0x4188
> 
> -/* For EXYNOS_CENTRAL_SEQ_OPTION */
> -#define EXYNOS5_USE_STANDBYWFI_ARM_CORE0
> 	BIT(16)
> -#define EXYNOS5_USE_STANDBYWFI_ARM_CORE1
> 	BUT(17)
> -#define EXYNOS5_USE_STANDBYWFE_ARM_CORE0
> 	BIT(24)
> -#define EXYNOS5_USE_STANDBYWFE_ARM_CORE1
> 	BIT(25)
> -
>  #define EXYNOS5420_ARM_USE_STANDBY_WFI0
> 	BIT(4)
>  #define EXYNOS5420_ARM_USE_STANDBY_WFI1
> 	BIT(5)
>  #define EXYNOS5420_ARM_USE_STANDBY_WFI2
> 	BIT(6)
> --
> 2.27.0


