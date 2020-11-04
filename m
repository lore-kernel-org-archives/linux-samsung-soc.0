Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9200EC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 393FE208C7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o8Io5Xl1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgKDMZy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 07:25:54 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53804 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgKDMZx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 07:25:53 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201104122541euoutp0216d9f21855ad49ae0c44b7b83c82b411~ETaXZrDG52803528035euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 12:25:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201104122541euoutp0216d9f21855ad49ae0c44b7b83c82b411~ETaXZrDG52803528035euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604492742;
        bh=8RjId3ML16XNZUrI3qqP7pmBLg8ZjuhG2qDhKBFtcUM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=o8Io5Xl1tf7CiPt8C3136cjMDCpW2aMOtbXj8gEyqayw54bfEsmSJBp6dAEIE+cYV
         dKpjLkwRzH1K6c/vT3BObP5066AyRXi+E0dIFf/UHB/jmb70epm1FBjsLqZuO2lyIQ
         nuqmQM5IKujUHwBDLIdYxmT+mSoZG1eGlw0YqzG4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201104122541eucas1p2c2a5a8ef19a96db647974677ea63fe7a~ETaW9a8cI1545315453eucas1p2n;
        Wed,  4 Nov 2020 12:25:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E3.02.06456.5CD92AF5; Wed,  4
        Nov 2020 12:25:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201104122541eucas1p10a2e6b8a553821f109e6fa328b687936~ETaWlFdS52595625956eucas1p1O;
        Wed,  4 Nov 2020 12:25:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201104122541eusmtrp2e55d329dd4cb8c3d6d3c0840ba178331~ETaWkbbmh3076030760eusmtrp24;
        Wed,  4 Nov 2020 12:25:41 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-c6-5fa29dc51566
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.96.06017.4CD92AF5; Wed,  4
        Nov 2020 12:25:41 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201104122540eusmtip20aef1e1651690db3daa4075cd427472e~ETaWHsESx1516715167eusmtip2h;
        Wed,  4 Nov 2020 12:25:40 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices
 on exynos4412 based ODROID boards
To:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
Date:   Wed, 4 Nov 2020 13:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104102558.11070-1-m.reichl@fivetechno.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3b3b7kaTt6n4aFYyQjBKG0oMmsM+iNUv//gnKL3mTSU3bfMj
        TVQ0nY1BZaQ2NNMC28Clq5YfGTZNMb9KIz8SpDRRl5nNQIdWblfLf+c5zznveQ68FCE2cwOo
        ZHU6o1HTKRKekLR1rw0eflNdF3ukpjtQVtM1yJXdnHYQsqGhRr7MOv2RKxtpreLJKodecWTz
        XatIVtzexY+ilBOT+Uqr+QZP+fRRvtJp3RdNnhPKE5iU5ExGE6aIEyaZXk6htGrB1fb3y6gA
        tfH1SEABjgBd2xqpR0JKjB8jGDUVEeywgqClYBa5VWLsRGDqTN129JdXc1lRPQKHZW7LvoSg
        bHyW51Z5YzU0Vqx5nvLB5Qie3+73WAisQ/C2asyTzsNS0C/qNx0UJcIK+FqsdNMkPgC61k+E
        G/vieNhwrnuwCO+G3nszpBsLsBzKRx9y3JjA++HFYhXBYj+YmKnhuLMA2/jQ3rHOY+8+BYtl
        zVutvWGh59kWDoQ/LduGIgSfBxv47GBAMFJYiVjVMZgcdHkuJXAIPGkNY+njsFGn47tpwF4w
        tribPcILymwVBEuLoLREzKqDwdhj+Rf7+t0wcQtJjDuqGXfUMe6oY/yf+wCRZuTHZGhViYxW
        qmayQrW0SpuhTgy9mKqyos0f1Pe752cz+jUcb0eYQpJdog5bbayYS2dqs1V2BBQh8RGdGOi7
        IBYl0Nk5jCY1VpORwmjtaA9FSvxE4XXz58U4kU5nLjNMGqPZ3nIoQUABujYwayovEa1u/Oi9
        5O0123MSZd3NcxXGzCSN8hpCcknLB9VyfxCz7IgsbvpeSuTd191pjlvqr12PdBk4CmfUoaLY
        XDMhNvi7FL5qf8PRLw7/tojoqbNnwqV7O+mEDntMjvxb1OmgvoEmU+WV66pCjldTvdwSFLyw
        YhtfmnNKSG0SLT1IaLT0X02hUU89AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xe7pH5y6KN/h2gMli/pFzrBb9j18z
        W5w/v4HdYtPja6wWl3fNYbOYcX4fk8XLIz8YLVr3HmF34PC4dafeY9OqTjaPzUvqPT5vkgtg
        idKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWLnn
        PmPBXM6KvRc/MjYw7mbvYuTkkBAwkTgzbS5rFyMXh5DAUkaJGy8PM0IkZCROTmtghbCFJf5c
        62IDsYUE3jJK3JlXBGILC+RJ/Jt7jAWkWURgCqPEmYnPGUEcZoF2oKK3s9kgxvYzSrQ/2soE
        0sImYCjR9RZkFAcHr4CdxNNWD5Awi4CKRPuu28wgtqhAksTLC1PBynkFBCVOznzCAmJzCthI
        TLu+GCzOLGAmMW/zQ2YIW15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpa
        nJueW2ykV5yYW1yal66XnJ+7iREYc9uO/dyyg7HrXfAhRgEORiUe3gPbFsYLsSaWFVfmHmKU
        4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgekgryTe0NTQ3MLS0NzY3NjM
        Qkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY+P0AxLObI+NPJ53B+2X+zfXSeJDys3vHKf2
        PWiYHBl6vupFQ6LVVvEXZ+WVD1v8W/zPz7Ve5tDvo9WCuxzfnqvffKvKsov/g8m7dDPGlXtW
        HVsVqmWpZXx2ceqP+e/uHigPLi/udn3cu5l1PrflbmmHiWKy2X1p7K3cJYd9WX0e7Xjtm8J2
        RImlOCPRUIu5qDgRAMAs8x/PAgAA
X-CMS-MailID: 20201104122541eucas1p10a2e6b8a553821f109e6fa328b687936
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
        <20201104102558.11070-1-m.reichl@fivetechno.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Markus,

On 04.11.2020 11:25, Markus Reichl wrote:
> Recently introduced async probe on mmc devices can shuffle block IDs.
> Pin them to fixed values to ease booting in evironments where UUIDs ar not practical.
> Use newly introduced aliases for mmcblk devices from [1].
>
> [1]
> https://patchwork.kernel.org/patch/11747669/
>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index a5c1ce1e396c..aa10d5bc7e1c 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -13,6 +13,11 @@
>   #include "exynos-mfc-reserved-memory.dtsi"
>   
>   / {
> +	aliases {
> +		mmc0 = &sdhci_2;
> +		mmc1 = &mshc_0;

Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc_0) 
and 2 for the SD-card (sdhci_2).

> +	};
> +
>   	chosen {
>   		stdout-path = &serial_1;
>   	};

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

