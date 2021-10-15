Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8660CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 00:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69ABE610FF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 00:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbhJOA2J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 20:28:09 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:61761 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhJOA2H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 20:28:07 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211015002600epoutp018115aae13a453bd2bf375b0001626271~uDJeuPd6F2087320873epoutp01W
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 00:26:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211015002600epoutp018115aae13a453bd2bf375b0001626271~uDJeuPd6F2087320873epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634257560;
        bh=bqfCMtWJvZywk0i9bat5BnVoK4YMmWZTLkPMOJFjltM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=P6oMlIJ/Iwp+qve4JhWHiN8e6nvp3aI8KJh1aCKfQDjHgFpZzN6egqRWXFQv23+3M
         bItFr5A1h3TNma4recKZdjJHVsRwDHyeZ7qy1WFI8xODAMmjPItr/fYkpjrZyq684s
         KsNKECcqBLY+8RMtXgfNHlqDp8OoeYqSBfIyPq54=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20211015002559epcas1p4bd19f94f6efeea3d0f27c1398bc8b2e9~uDJdr9wbY0267702677epcas1p4L;
        Fri, 15 Oct 2021 00:25:59 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.235]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HVn9m1xFbz4x9QX; Fri, 15 Oct
        2021 00:25:48 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        17.49.62447.E7AC8616; Fri, 15 Oct 2021 09:25:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211015002532epcas1p12ce2153faa06905958dfd543d7aa4208~uDJEtH6t20681606816epcas1p16;
        Fri, 15 Oct 2021 00:25:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015002532epsmtrp1b389ea88df1c6ab76d0c09fe4188196a~uDJErRVYf1482514825epsmtrp17;
        Fri, 15 Oct 2021 00:25:32 +0000 (GMT)
X-AuditID: b6c32a36-39fff7000001f3ef-14-6168ca7e2bb0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A8.11.08750.C7AC8616; Fri, 15 Oct 2021 09:25:32 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211015002531epsmtip23fda87993dbda834e9221852dd073276~uDJENt2Zc0756707567epsmtip2b;
        Fri, 15 Oct 2021 00:25:31 +0000 (GMT)
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <6f366ea6-ff4f-8257-08bd-3835dbe4f883@samsung.com>
Date:   Fri, 15 Oct 2021 09:47:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20211007194113.10507-4-semen.protsenko@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVAUZRzH59m7213Iy+WQeGAYg21qRuq4OzxoKUAEtGuwBiPNmog22Llj
        uDd3D4xslHiRl0EMyaQLhVLejpkIQlKiI4FgQEZIXjLlCjkbUQPRk5GJC7pjsfjv8/v9vt95
        nu/zggskk6g/nq43Maye1pKop7C9Z4tUemhQQ8sbGklqvuFrQFX3XhZRQ0tSqmV2EaFa7RMi
        6n7p7yJqtKMKpSqHrQj1y+AOarG/TEAV/NiLUScWr6FUz1+FImp5okVI3SpzKQZtDowaGypC
        KEuHE8RIVPeuFmAqc85RVHXBbMNUrZZiVDU50Ymqvjt7WFXWZgEqR+vmRPydjEgNQ6cxbCCj
        TzWkpevVUWRCUkpcSli4XCFVRFAvkoF6WsdEkfG7EqU707WuJGRgFq3NdLUSaY4jZdGRrCHT
        xARqDJwpimSMaVpjmDGEo3Vcpl4domdMLynk8tAwl/D9DM3y59WYsTDkwyu36kEOKHuuBHjg
        kFDCpp47aAnwxCXEeQBbVvowvngA4BXLybXCAaAtt1z02GL/+7KAH3QAOGnLB3xxD8DOykqk
        BOC4N/EutLcfdBs2EQ4EnjZvd2sExDQCj/XeBe4BSgTDrpmrqJs3EkFwfNG+2hcT0bCy6SLi
        ZiHxLJyfacLc7EPshQPt+WsaLzjwxU2hmz2IGPhPc9EqCwhfeO1mNcLz0/D72arVnUIizwN+
        +8kPQj5CPCw+W4vy7A3v9LdhPPvD28eOrPFB2DjQi/LmIgDbukbW8m+FXbUVqykFxBbY3CHj
        20HwwtIpwC/8JJxbKBW5JZAQw6IjEl7yDBydsiE8+8EzhcXop4A0r4tjXhfBvC6C+f/FaoDQ
        Ap5ijJxOzXAKY+h/151q0LWC1WceHH4eHJ+dD+kGCA66AcQF5Cbx3E9qWiJOo7M/YlhDCpup
        ZbhuEOY64HKBv0+qwfVP9KYUhTJCrgwP3aqkFOEK0lfcdzeClhBq2sRkMIyRYR/7ENzDPwd5
        XlYp7CvOPfB672eXsjdwMq/yoOVp86PkCh2bZZa1ayw39j/0vR8zKsWKnPtr5q7TsoKFP+aj
        n1jS1uXn6pLGYqNbxrtPTDzQriTvwfbuuHh9qiCw1i9B7wzwGrLGDj66VBrX4NNlUsRmn3pT
        yf6aOhEkz0z38xi2BkydyfIc37jnPYf10O74cQw+3Nb6xti5lYDjTutv4rx9Hww7d58Ou50T
        7v0C6hwqrqvQli3sav5m5rAm4QDOyJOrYqtSR87trMireSUgpoLZfrL/5T+tPw+qv9wXF0rO
        2u0f3wBvL3dHbqipryvptEVPA5Vz+lUmp37za7oM61dvzXVtSyoYaWRJIaehFcEClqP/BTjb
        O+FvBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWy7bCSvG7NqYxEg7fNfBYfVixitJh/5Byr
        xZnfuhYb3/5gstj0+Bqrxceee6wWl3fNYbOYcX4fk8XFU64WP473MVu07j3CbjH1xy02i8Nv
        2lkt/l3byGLxvA+o4tTdz+wWV850MFms2vWH0UHI4/2NVnaPWQ29bB47Z91l99i0qpPN4861
        PWwem5fUe/RtWcXo8XmTXABHFJdNSmpOZllqkb5dAlfGv2nz2Qva9SouPV/O2MDYp9bFyMkh
        IWAi8fjXOeYuRi4OIYEdjBLrTr1kg0hISky7eBQowQFkC0scPlwMUfOWUaL9yHcWkLiwQIzE
        423VIHERgc9MErPeHmAFcZgFHjFJXN35nwWi4ySjxJf7J9hBprIJaEnsf3EDbAO/gKLE1R+P
        GUFsXgE7iRmrDzKB2CwCqhIfXqwGqxcVCJPYueQxE0SNoMTJmU9YQGxOAQeJv+s7wGxmAXWJ
        P/MuMUPY4hK3nsxngrDlJba/ncM8gVF4FpL2WUhaZiFpmYWkZQEjyypGydSC4tz03GLDAqO8
        1HK94sTc4tK8dL3k/NxNjOC41tLawbhn1Qe9Q4xMHIyHGCU4mJVEeN8dSE8U4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oqgcn8fF37rOM/tJbLBH53MX6Q
        dSyy2U++eVvZ70fv9H7MifA5KrTznNAG+Zcst6QmOWv9+mb29JxqkeQN/1d+q9Ql9X/XLo22
        S6qq3sz5f90DQ+cmiYQNvAYlMf+rZ60RUcrpbJ38bPnk+X+3VTMLrPZdZDBX6ID0D0fBcKtY
        +XJev5bjm4QrkxJ/acm++fTy+ON9BqtF6xuLZp1Zfb6m3spa2+3mxtuft79asMTw3V/Lwuu/
        /u5e+4WJec/xV7U3lTJc9m1TfGcaOvW0wUuZZSZer1tXXJ0w8efeyo6DqSfb7s9lybBzWlq2
        K6xhw7uLN5gYBDN2T/3Jc9TN1/vatA8uW3oaHk+fVKm1Y/+WhQI+SizFGYmGWsxFxYkAbm+O
        z1oDAAA=
X-CMS-MailID: 20211015002532epcas1p12ce2153faa06905958dfd543d7aa4208
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007194124epcas1p15414e11373b8a9a1065adc831ed236ed
References: <20211007194113.10507-1-semen.protsenko@linaro.org>
        <CGME20211007194124epcas1p15414e11373b8a9a1065adc831ed236ed@epcas1p1.samsung.com>
        <20211007194113.10507-4-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/8/21 4:41 AM, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
>   - Added all clock ids
>   - Added CLK_ prefix for all clock constants
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added Ack tag by Rob Herring
> 
>  include/dt-bindings/clock/exynos850.h | 141 ++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 
> diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> new file mode 100644
> index 000000000000..a44c5f91d3c7
> --- /dev/null
> +++ b/include/dt-bindings/clock/exynos850.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Device Tree binding constants for Exynos850 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +
> +/* CMU_TOP */
> +#define CLK_FOUT_SHARED0_PLL		1
> +#define CLK_FOUT_SHARED1_PLL		2
> +#define CLK_FOUT_MMC_PLL		3
> +#define CLK_MOUT_SHARED0_PLL		4
> +#define CLK_MOUT_SHARED1_PLL		5
> +#define CLK_MOUT_MMC_PLL		6
> +#define CLK_MOUT_CORE_BUS		7
> +#define CLK_MOUT_CORE_CCI		8
> +#define CLK_MOUT_CORE_MMC_EMBD		9
> +#define CLK_MOUT_CORE_SSS		10
> +#define CLK_MOUT_DPU			11
> +#define CLK_MOUT_HSI_BUS		12
> +#define CLK_MOUT_HSI_MMC_CARD		13
> +#define CLK_MOUT_HSI_USB20DRD		14
> +#define CLK_MOUT_PERI_BUS		15
> +#define CLK_MOUT_PERI_UART		16
> +#define CLK_MOUT_PERI_IP		17
> +#define CLK_DOUT_SHARED0_DIV3		18
> +#define CLK_DOUT_SHARED0_DIV2		19
> +#define CLK_DOUT_SHARED1_DIV3		20
> +#define CLK_DOUT_SHARED1_DIV2		21
> +#define CLK_DOUT_SHARED0_DIV4		22
> +#define CLK_DOUT_SHARED1_DIV4		23
> +#define CLK_DOUT_CORE_BUS		24
> +#define CLK_DOUT_CORE_CCI		25
> +#define CLK_DOUT_CORE_MMC_EMBD		26
> +#define CLK_DOUT_CORE_SSS		27
> +#define CLK_DOUT_DPU			28
> +#define CLK_DOUT_HSI_BUS		29
> +#define CLK_DOUT_HSI_MMC_CARD		30
> +#define CLK_DOUT_HSI_USB20DRD		31
> +#define CLK_DOUT_PERI_BUS		32
> +#define CLK_DOUT_PERI_UART		33
> +#define CLK_DOUT_PERI_IP		34
> +#define CLK_GOUT_CORE_BUS		35
> +#define CLK_GOUT_CORE_CCI		36
> +#define CLK_GOUT_CORE_MMC_EMBD		37
> +#define CLK_GOUT_CORE_SSS		38
> +#define CLK_GOUT_DPU			39
> +#define CLK_GOUT_HSI_BUS		40
> +#define CLK_GOUT_HSI_MMC_CARD		41
> +#define CLK_GOUT_HSI_USB20DRD		42
> +#define CLK_GOUT_PERI_BUS		43
> +#define CLK_GOUT_PERI_UART		44
> +#define CLK_GOUT_PERI_IP		45
> +#define TOP_NR_CLK			46
> +
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_BUS_USER		1
> +#define CLK_MOUT_HSI_MMC_CARD_USER	2
> +#define CLK_MOUT_HSI_USB20DRD_USER	3
> +#define CLK_MOUT_HSI_RTC		4
> +#define CLK_GOUT_USB_RTC_CLK		5
> +#define CLK_GOUT_USB_REF_CLK		6
> +#define CLK_GOUT_USB_PHY_REF_CLK	7
> +#define CLK_GOUT_USB_PHY_ACLK		8
> +#define CLK_GOUT_USB_BUS_EARLY_CLK	9
> +#define CLK_GOUT_GPIO_HSI_PCLK		10
> +#define CLK_GOUT_MMC_CARD_ACLK		11
> +#define CLK_GOUT_MMC_CARD_SDCLKIN	12
> +#define CLK_GOUT_SYSREG_HSI_PCLK	13
> +#define HSI_NR_CLK			14
> +
> +/* CMU_PERI */
> +#define CLK_MOUT_PERI_BUS_USER		1
> +#define CLK_MOUT_PERI_UART_USER		2
> +#define CLK_MOUT_PERI_HSI2C_USER	3
> +#define CLK_MOUT_PERI_SPI_USER		4
> +#define CLK_DOUT_PERI_HSI2C0		5
> +#define CLK_DOUT_PERI_HSI2C1		6
> +#define CLK_DOUT_PERI_HSI2C2		7
> +#define CLK_DOUT_PERI_SPI0		8
> +#define CLK_GOUT_PERI_HSI2C0		9
> +#define CLK_GOUT_PERI_HSI2C1		10
> +#define CLK_GOUT_PERI_HSI2C2		11
> +#define CLK_GOUT_GPIO_PERI_PCLK		12
> +#define CLK_GOUT_HSI2C0_IPCLK		13
> +#define CLK_GOUT_HSI2C0_PCLK		14
> +#define CLK_GOUT_HSI2C1_IPCLK		15
> +#define CLK_GOUT_HSI2C1_PCLK		16
> +#define CLK_GOUT_HSI2C2_IPCLK		17
> +#define CLK_GOUT_HSI2C2_PCLK		18
> +#define CLK_GOUT_I2C0_PCLK		19
> +#define CLK_GOUT_I2C1_PCLK		20
> +#define CLK_GOUT_I2C2_PCLK		21
> +#define CLK_GOUT_I2C3_PCLK		22
> +#define CLK_GOUT_I2C4_PCLK		23
> +#define CLK_GOUT_I2C5_PCLK		24
> +#define CLK_GOUT_I2C6_PCLK		25
> +#define CLK_GOUT_MCT_PCLK		26
> +#define CLK_GOUT_PWM_MOTOR_PCLK		27
> +#define CLK_GOUT_SPI0_IPCLK		28
> +#define CLK_GOUT_SPI0_PCLK		29
> +#define CLK_GOUT_SYSREG_PERI_PCLK	30
> +#define CLK_GOUT_UART_IPCLK		31
> +#define CLK_GOUT_UART_PCLK		32
> +#define CLK_GOUT_WDT0_PCLK		33
> +#define CLK_GOUT_WDT1_PCLK		34
> +#define PERI_NR_CLK			35
> +
> +/* CMU_CORE */
> +#define CLK_MOUT_CORE_BUS_USER		1
> +#define CLK_MOUT_CORE_CCI_USER		2
> +#define CLK_MOUT_CORE_MMC_EMBD_USER	3
> +#define CLK_MOUT_CORE_SSS_USER		4
> +#define CLK_MOUT_CORE_GIC		5
> +#define CLK_DOUT_CORE_BUSP		6
> +#define CLK_GOUT_CCI_ACLK		7
> +#define CLK_GOUT_GIC_CLK		8
> +#define CLK_GOUT_MMC_EMBD_ACLK		9
> +#define CLK_GOUT_MMC_EMBD_SDCLKIN	10
> +#define CLK_GOUT_SSS_ACLK		11
> +#define CLK_GOUT_SSS_PCLK		12
> +#define CORE_NR_CLK			13
> +
> +/* CMU_DPU */
> +#define CLK_MOUT_DPU_USER		1
> +#define CLK_DOUT_DPU_BUSP		2
> +#define CLK_GOUT_DPU_CMU_DPU_PCLK	3
> +#define CLK_GOUT_DPU_DECON0_ACLK	4
> +#define CLK_GOUT_DPU_DMA_ACLK		5
> +#define CLK_GOUT_DPU_DPP_ACLK		6
> +#define CLK_GOUT_DPU_PPMU_ACLK		7
> +#define CLK_GOUT_DPU_PPMU_PCLK		8
> +#define CLK_GOUT_DPU_SMMU_CLK		9
> +#define CLK_GOUT_DPU_SYSREG_PCLK	10
> +#define DPU_NR_CLK			11
> +
> +#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks for your work.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
