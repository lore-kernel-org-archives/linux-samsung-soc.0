Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF33C4727D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 04:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D76D2065D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 04:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sbBAVh4K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgJEEq3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 00:46:29 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50334 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgJEEq2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 00:46:28 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201005044625euoutp0211d7d4ed3821cd53082f26bf8869c649~6-yzShZ9J3041930419euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 04:46:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201005044625euoutp0211d7d4ed3821cd53082f26bf8869c649~6-yzShZ9J3041930419euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601873185;
        bh=Tu5e5wNR2PsQGnOyXDYlqqSao7h9DYF6j+U56TopWAs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=sbBAVh4KL7w+2pHOLItzLThPFOhacvaQvrmlynfcPlxsXmMXFxn05aKZtURpH3nIM
         OvY9153pYpgZNVFaKdQCQNQ+TcmDFcuii9zCohGE/vIhBabquEsoaCShYOKFqeaDqH
         xsFC17Y9OMwxIuZwsPfO5OSACHy8qfgoe4jHyWAE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201005044624eucas1p2dcd6538d5480084894735240682cc444~6-yyo7D1g0400004000eucas1p2r;
        Mon,  5 Oct 2020 04:46:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 31.3B.05997.025AA7F5; Mon,  5
        Oct 2020 05:46:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201005044624eucas1p2c20673290b584e38d0a0c628c49ed95c~6-yyDYwSU3147231472eucas1p2V;
        Mon,  5 Oct 2020 04:46:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201005044624eusmtrp2c36360e2382611f7dcd39199f9e66817~6-yyCrSj92239022390eusmtrp2C;
        Mon,  5 Oct 2020 04:46:24 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-f5-5f7aa5209c4d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BD.B8.06314.025AA7F5; Mon,  5
        Oct 2020 05:46:24 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201005044623eusmtip145ee034c0c9f24e2dab9319c79d476e2~6-yxXI_9A0558105581eusmtip1H;
        Mon,  5 Oct 2020 04:46:23 +0000 (GMT)
Subject: Re: [PATCH] phy: exynos-mipi-video: Add support for NXP i.MX8MM
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc:     Abel Vesa <abel.vesa@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4bac0539-f537-ab59-c29e-18ae30a67191@samsung.com>
Date:   Mon, 5 Oct 2020 06:46:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201003225020.164358-1-marex@denx.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUYRSG+XZmdkdp5XPVPGlabBdI8FrUQGJ2ZaAg60c/gtLRBhVdjV1N
        1x9ec8tNNCLLRsyK7CKYpZuu19AsTXHdjExDQynNJFvCCyiu5jRa/nu+c96X877w0YRqkPKg
        YxOSeG0CF6+WO5K1b+d7fbeWp4UHjIz7MI/63iDmd9YoxcwUNRBMWbuFYkY/nmQGFgwUM1I6
        KGOqv/ZTjHHhKcEU97bImJ+GLMTkNrcrmAmTe6iSvSt0kmy9MKxgqyvy5GzNwwz2xS+zjC20
        B7AFpgrECtdqETtd7R3mcNYx+AIfH3uJ1/qHRDjGlJbkyS+Wq1MLBAuViWY8jciBBrwHegx2
        uRE50ir8BMGLwjZSeswgqKzqlIkqFZ5GMHHv+JrD+n1xVfQYwVLzyKrdhsDyNXfFQdMumIWW
        rlTR4IqPwoeqMZmoIbBAQJP1ChIXchwIximjXGQlDoFrn+YUIpN4OxSN51Aiu+FI6LZmKySN
        M7y7840U2WElRZnp9d90BN4COS9LCInd4fO3sr/HAM8qYKi2kZJiH4G6zmZSYheY7DApJN4M
        y/VrhhwEo5ZKhfTIR/AhuxhJqv0wZFmQi9UIvAuqGvyl8UFYnh0kxDFgJxiYcpZCOMGN2tur
        YyVcNagk9U4QOp79O9tq7SOuI7Wwrpqwro6wro7w/+49RFYgdz5Zp4nmdUEJfIqfjtPokhOi
        /aISNdVo5cN1L3XMmFHDYmQbwjRSb1CmTurDVRR3SafXtCGgCbWr8lBP93mV8gKnT+O1ieHa
        5Hhe14Y8aVLtrtz94Mc5FY7mkvg4nr/Ia9e2MtrBIxOB/lzdcGVaboxzb9R9t7FjXoHE3vQz
        mzhbRCc6ZfN+tZFK79rQVdb3XGM6kBGit4e+9wqOaNlhy53Wjy0X5KecNoRVzsc9yLeZN+3r
        X84zD76a2KwOOrEUN+s713qcv8xb0xubhJheLzu3LSv+pn3iC665ZZ66Gxf8MPnwZLCgJnUx
        XKAPodVxfwANWa1qbAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xu7oKS6viDdZfY7FYdukoo8XHxoes
        Fl+m7mK2mH/kHKvFw6v+Fjd+tbFaPJh7k8li0+NrrBZdv1YyW8w4v4/J4k1bI6NF694j7BYv
        tog78HrMm3WCxWPnrLvsHptWdbJ5bF5S77Hx3Q4mj/6/Bh59W1Yxeszq3sbo8XmTXABnlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G3NmdbAVL
        lSr6Zp1jbWD8It3FyMkhIWAiceH5H5YuRi4OIYGljBIXzjxghUjISJyc1gBlC0v8udbFBlH0
        llFiz5I2pi5GDg5hAQ+JfacqQGpEBFwlLq9/ygRiMwvMYpY4utEPxBYSaGeU6DhuCmKzCRhK
        dL0FmcPJwStgJ9F9/Rs7iM0ioCIx9Vkz2C5RgSSJ7ktTmCBqBCVOznzCAmJzAh06f8thqPlm
        EvM2P2SGsOUlmrfOhrLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE
        3OLSvHS95PzcTYzAeN527OfmHYyXNgYfYhTgYFTi4a14VRkvxJpYVlyZe4hRgoNZSYTX6ezp
        OCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aavJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFC
        AumJJanZqakFqUUwfUwcnFINjJlPNm9ZvU9JbTJHhsd05mLGALuqWbcz1ov/mORgNkN6dkJZ
        2XSJm18E7oU3nndoTX6xZVpCfnC38Lc3LfaVbFm2xXP2Fv3QqPhqUxezahVHrKJ0nWu5Dpu0
        2H1LXY1yVlGbPNYQjWrTa9Gr1yVF9aZqfsrnOXov4gj3/8eXliZ7BOrfufpNiaU4I9FQi7mo
        OBEAbC+Nrv0CAAA=
X-CMS-MailID: 20201005044624eucas1p2c20673290b584e38d0a0c628c49ed95c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201003225029eucas1p1485d7e1d64350c688b03b598067d7959
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201003225029eucas1p1485d7e1d64350c688b03b598067d7959
References: <CGME20201003225029eucas1p1485d7e1d64350c688b03b598067d7959@eucas1p1.samsung.com>
        <20201003225020.164358-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.10.2020 00:50, Marek Vasut wrote:
> This patch adds support for MIPI DPHY found in NXP i.MX8MM.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   .../devicetree/bindings/phy/samsung-phy.txt   |  7 ++++---
>   drivers/phy/samsung/Kconfig                   |  6 +++---
>   drivers/phy/samsung/phy-exynos-mipi-video.c   | 21 +++++++++++++++++++
>   3 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> index 7510830a79bd..7b9dc361ab0c 100644
> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> @@ -1,14 +1,15 @@
> -Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY
> --------------------------------------------------
> +Samsung S5P/Exynos and NXP i.MX8MM SoC series MIPI CSIS/DSIM DPHY
> +-----------------------------------------------------------------
>   
>   Required properties:
>   - compatible : should be one of the listed compatibles:
>   	- "samsung,s5pv210-mipi-video-phy"
>   	- "samsung,exynos5420-mipi-video-phy"
>   	- "samsung,exynos5433-mipi-video-phy"
> +	- "fsl,imx8mm-mipi-video-phy"
>   - #phy-cells : from the generic phy bindings, must be 1;
>   
> -In case of s5pv210 and exynos5420 compatible PHYs:
> +In case of s5pv210, exynos5420, imx8mm compatible PHYs:
>   - syscon - phandle to the PMU system controller
>   
>   In case of exynos5433 compatible PHY:
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index e20d2fcc9fe7..342b75f6e4f6 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -12,14 +12,14 @@ config PHY_EXYNOS_DP_VIDEO
>   	  Support for Display Port PHY found on Samsung Exynos SoCs.
>   
>   config PHY_EXYNOS_MIPI_VIDEO
> -	tristate "S5P/Exynos SoC series MIPI CSI-2/DSI PHY driver"
> +	tristate "S5P/Exynos/i.MX8MM SoC series MIPI CSI-2/DSI PHY driver"
>   	depends on HAS_IOMEM
> -	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> +	depends on ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MXC || COMPILE_TEST
>   	select GENERIC_PHY
>   	default y if ARCH_S5PV210 || ARCH_EXYNOS
>   	help
>   	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
> -	  and Exynos SoCs.
> +	  and Exynos SoCs, and on NXP i.MX8MM SoCs.
>   
>   config PHY_EXYNOS_PCIE
>   	bool "Exynos PCIe PHY driver"
> diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
> index c1df1ef3ee3c..b735b8089cd7 100644
> --- a/drivers/phy/samsung/phy-exynos-mipi-video.c
> +++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
> @@ -214,6 +214,24 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
>   	},
>   };
>   
> +static const struct mipi_phy_device_desc imx8mm_mipi_phy = {
> +	.num_regmaps = 1,
> +	.regmap_names = {"syscon"},
> +	.num_phys = 1,
> +	.phys = {
> +		{
> +			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
> +			.enable_val = BIT(17),
> +			.enable_reg = 8,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(5),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
> +		},
> +	},
> +};
> +
>   struct exynos_mipi_video_phy {
>   	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
>   	int num_phys;
> @@ -349,6 +367,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos5433-mipi-video-phy",
>   		.data = &exynos5433_mipi_phy,
> +	}, {
> +		.compatible = "fsl,imx8mm-mipi-video-phy",
> +		.data = &imx8mm_mipi_phy,
>   	},
>   	{ /* sentinel */ },
>   };

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

