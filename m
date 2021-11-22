Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F50C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 09:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239217AbhKVJ6G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 04:58:06 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53861 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239209AbhKVJ6E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:58:04 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211122095457euoutp01d978a8ef01a7eb4cf4864d0e706f4867~51bFWp1ur2170221702euoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:54:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211122095457euoutp01d978a8ef01a7eb4cf4864d0e706f4867~51bFWp1ur2170221702euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637574897;
        bh=F3Skvzj/P56Y6MwM/7dKiA/OVXU6pP/WVS2qkxGn+F0=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=Fu8chUbQyfvYqx4fOHdD9FMcGnL3DmbJX5D4zenK+jFJPXdU2aZ/RQiLp1s1+n/J6
         zcsSBJN1P4uqltbWgj8+sJVpi5MkEkONbGugWu7SLS21z0mKspP15CRR/A0ER+rtGR
         X0zP6IEFOeoc7yMH4DTYPKcn6/1LgMpOExd28g/A=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122095456eucas1p1292295d1f937200c68fed349dabbfe64~51bE832Ze1462314623eucas1p18;
        Mon, 22 Nov 2021 09:54:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 83.68.10260.0F86B916; Mon, 22
        Nov 2021 09:54:56 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211122095456eucas1p1aa15b18d34d0b32557925341541b5c29~51bEhezWk0350703507eucas1p1E;
        Mon, 22 Nov 2021 09:54:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211122095456eusmtrp2c9968882fec6351c6f05d8f56fa04f24~51bEgaoFP0445604456eusmtrp2K;
        Mon, 22 Nov 2021 09:54:56 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-b7-619b68f07bd6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.6A.09404.0F86B916; Mon, 22
        Nov 2021 09:54:56 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211122095455eusmtip2a49a495da7729d8839fd70c47e782073~51bD2ZKqe0343803438eusmtip2J;
        Mon, 22 Nov 2021 09:54:55 +0000 (GMT)
Message-ID: <190aa098-6653-bdcd-3476-574b4bed8496@samsung.com>
Date:   Mon, 22 Nov 2021 10:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 4/6] clk: samsung: exynos850: Implement CMU_CMGP domain
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211121232741.6967-5-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djPc7ofMmYnGryapWpx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFFc
        NimpOZllqUX6dglcGW8vXWUtOMxc8X3Ja+YGxrdMXYycHBICJhJTNs8Esrk4hARWMEpcunaK
        BcL5wiix8EU/I4TzmVHi+5uz7DAtt74+hEosZ5ToPrEDyvnIKLF460VmkCpeATuJQ0+/sIDY
        LAKqEv/a9rJAxAUlTs58AmaLCiRJnG6dBFYvLOAt8evINLCjmAXEJW49mQ92lIjACiaJB9Nn
        sYI4zAJ9TBJnvvwHq2ITMJToPdoHtJqDg1PAXmLffUmIZnmJ7W/nMIPUSwgs55T4vnc5M0iN
        hICLxOU/uhAvCEu8Or4F6h0Zif87IZZJCDQzSvTsvs0O4UxglLh/fAEjRJW1xJ1zv9hABjEL
        aEqs36UPEXaUeLbhEtR8PokbbwUhbuCTmLRtOlSYV6KjTQiiWkXi96rp0ICXkuh+8p9lAqPS
        LKRgmYXk/VlIvpmFsHcBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwDR3+t/xrzsY
        V7z6qHeIkYmD8RCjBAezkggvx4bpiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5Rf40JAoJpCeW
        pGanphakFsFkmTg4pRqYFAJWlLRzbdomumFTreoO+53RT6Jkj5759/Qj03T3QoO2p20XeV0W
        +Py7US/scOGjKqvHtt6N+yvWBkyRufN108QX8ocDtjRMudB9TnjPcbfN88KUutkVkyIDs7Qf
        rmdvOnsu7K3/fNNVDUkOD18zB4T3MhQZZXzU2a9mOel+0cb43R8d7gR6zHxVI8pkYWbX3rsj
        WO770pXXf7zd+/7+S4Y0fqb+G76X9jWc73mW9SnAI00pPsH5t6Xd3mrxeLlXRvqdavILhbtC
        bqcdClrkqh3g2cs2LYHPcP023ZziuE8RUsLP1rxZtaDP6nq7RkpRlszTP8mRhz6KSoZN6Tks
        WiZcp/jmgMcK0cKp2QZKLMUZiYZazEXFiQCUQhmc4gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7ofMmYnGmyez21x/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFF6
        NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW8vXWUt
        OMxc8X3Ja+YGxrdMXYycHBICJhK3vj5k7GLk4hASWMoocefoHfYuRg6ghJTE/BYliBphiT/X
        utggat4zSnRPX88KkuAVsJM49PQLC4jNIqAq8a9tLwtEXFDi5MwnYLaoQJJE//ddzCC2sIC3
        xK8j08AWMwuIS9x6Mp8JZKiIwComiRcP+sCuYBaYwCQxp3Mv1EnHGSWaV58EW8cmYCjRexSk
        ioODU8BeYt99SRCTWUBdYv08IYih8hLb385hnsAoNAvJHbOQ7JuF0DELSccCRpZVjCKppcW5
        6bnFRnrFibnFpXnpesn5uZsYgTG97djPLTsYV776qHeIkYmD8RCjBAezkggvx4bpiUK8KYmV
        ValF+fFFpTmpxYcYTYFhMZFZSjQ5H5hU8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1Kz
        U1MLUotg+pg4OKUamDJtk06rCx1nNpHq/nAu8rOFvZVXeFxIf/Iqs8ePu699DJPWm58bxmgy
        8Z/Cvtu/rGsi6k3+mRz7mLHHceajPdf/TQ0I71r05VD7ukLNrLj2XbuY5S61JXw7rXaUqbzQ
        5wxLxNZMkykz7Vp2mk5hDzt8/v8ClaIfIX1St1PefJqlqH/9e9yTV1JxD1VPX3GMvGOectat
        UalcLWbqy6lCloubOH6yOEiZXc9e6RXq8vnWnm0vX1sci5Co6ZCzbfEQUHVS0pbPvm5t8GmD
        Tb5mVIRA3JWQ/Uz554RzH2pvtWF3C3v/Xnmt+9956VXisw0v9ida2f69XhazZOej30q39k1N
        W+XmdGW2x1kdSasSJZbijERDLeai4kQAGsESeHIDAAA=
X-CMS-MailID: 20211122095456eucas1p1aa15b18d34d0b32557925341541b5c29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232752eucas1p1c108fca5bdac6e74006cf32b912d27d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232752eucas1p1c108fca5bdac6e74006cf32b912d27d5
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232752eucas1p1c108fca5bdac6e74006cf32b912d27d5@eucas1p1.samsung.com>
        <20211121232741.6967-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> CMU_CMGP clock domain provides clocks for CMGP IP-core (Common GPIO).
> CMGP module encapsulates next blocks:
>   - 8 GPIO lines
>   - 1 GPADC
>   - 2 USI blocks, each can be configured to provide one of
>     UART/SPI/HSI2C serial interfaces
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied, thanks.
