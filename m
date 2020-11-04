Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84701C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 13:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1752D22243
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 13:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IIwa8psc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbgKDNo1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 08:44:27 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50498 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbgKDNoZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 08:44:25 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201104134413euoutp017d0a6fb719a43f6b1b52a74c6b9517ae~EUe7h7NP32453024530euoutp01v
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 13:44:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201104134413euoutp017d0a6fb719a43f6b1b52a74c6b9517ae~EUe7h7NP32453024530euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604497453;
        bh=YGH+JbTQOfuDdbp4N5Uv+Yv/0y7PZudFMj/VFg78vkQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=IIwa8pscXPn7aWmc7ooJ1TywwhwPQBX0T9e/bx1d5BWgGK+w1KrED3ZcTNLuYxx56
         jQ+2NvhWVSSLGFJakRJTnny3dH8BCuxEDAnX5lBwFifmCo51DNWiTtrcF1TPjNsHxa
         +5EPyyY1p0eJO/6nbMyA4UxDDDwdzprHNuB2yc3Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201104134411eucas1p175f5c0186b0099d5ce393edab48b83b1~EUe58NHMb0782907829eucas1p1B;
        Wed,  4 Nov 2020 13:44:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 23.20.05997.B20B2AF5; Wed,  4
        Nov 2020 13:44:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201104134411eucas1p234ecdc496597231a697ce6d679dcec2d~EUe5hJPsJ1541315413eucas1p22;
        Wed,  4 Nov 2020 13:44:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201104134411eusmtrp2a12e9212288e8ba1ec448dd7c6298cd0~EUe5gd2nn1478514785eusmtrp2s;
        Wed,  4 Nov 2020 13:44:11 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-cd-5fa2b02b2f2c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2F.7E.06314.B20B2AF5; Wed,  4
        Nov 2020 13:44:11 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201104134410eusmtip18cc09701ef79ee90145fee1ce5f92bbb~EUe5AViNF1300113001eusmtip1_;
        Wed,  4 Nov 2020 13:44:10 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices
 on exynos4412 based ODROID boards
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
Date:   Wed, 4 Nov 2020 14:44:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87raGxbFG1z7Z2Ex/8g5Vov+x6+Z
        Lc6f38BusenxNVaLy7vmsFnMOL+PyeLlkR+MFq17j7A7cHjculPvsWlVJ5vH5iX1Hp83yQWw
        RHHZpKTmZJalFunbJXBl7PjJUTCdv2LNml/MDYyneboYOTkkBEwkGlZ8Zeti5OIQEljBKNHz
        Yi8jhPOFUWLhwY1Qmc+MEju/f2eGafnw5xkrRGI5o0TnhsdQLe8ZJQ6cWwJWJSyQJ7Fh+k8w
        m03AUKLrbRfYKBGBaYwSWyeeAWtnFmhnlDg15wY7SBWvgJ3E/BuPwGwWARWJr9MPsoHYogJJ
        En8//2GGqBGUODnzCQuIzSlgL7F2WR9YPbOAvETz1tnMELa4xK0n85lAFkgIbGKXWN00nRHi
        cBeJPzcgGiQEhCVeHd8CZctI/N8J09DMKPHw3Fp2CKeHUeJy0wyobmuJO+d+AZ3EAbRCU2L9
        Ln2IsKPE30Xt7CBhCQE+iRtvBSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEPIFRaRaS
        12YheWcWkndmIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzAJnf53/MsOxl1/
        kg4xCnAwKvHwHti2MF6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxilOViU
        xHmNF72MFRJITyxJzU5NLUgtgskycXBKNTBWbi648epfYvJJ9cwf2y/+myalmBgkaJvDUWNj
        7VwnWZe0kFtjo9RB44ORfwLYGhwY/Xoccv5arPJ5ubAqfhvj7kYuBZvWlHkSK7ivVZZdfzin
        wJFzbeom5vo3k28+unD+mX2oxvXbnBdPaspsLtnmWB/wX+jr9rOcEikbNls/4Fr8q2fS9EdK
        LMUZiYZazEXFiQByVf93PgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7raGxbFG6x/LmEx/8g5Vov+x6+Z
        Lc6f38BusenxNVaLy7vmsFnMOL+PyeLlkR+MFq17j7A7cHjculPvsWlVJ5vH5iX1Hp83yQWw
        ROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl7PjJ
        UTCdv2LNml/MDYyneboYOTkkBEwkPvx5xtrFyMUhJLCUUWL1hAOsEAkZiZPTGqBsYYk/17rY
        QGwhgbeMEruuWoLYwgJ5Ev/mHmMBsdkEDCW63oLUcHGICExhlDgz8TkjiMMs0M4oceftbDaI
        FRuYJDYtX8QI0sIrYCcx/8YjdhCbRUBF4uv0g2ArRAWSJF5emMoEUSMocXLmE7AVnAL2EmuX
        9YHVMwuYSczb/JAZwpaXaN46G8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PT
        c4sN9YoTc4tL89L1kvNzNzECY27bsZ+bdzBe2hh8iFGAg1GJh/fAtoXxQqyJZcWVuYcYJTiY
        lUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGA6yCuJNzQ1NLewNDQ3Njc2s1AS
        5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwMg740VLmNkGmZX8BVtS4i1FN9kb5D4TYA/JOWCz
        tzY/N3yX9E0j4ZIp03o25qla6qbc63DjO3GCRy/Vc7VppO//9q1P89P52Stj3t87+Jh50qyN
        wSetm45+lT6l9Ue37vdStnPC24sUngSvdE+MT3jGs4dpw9NvJ/bEfH5z9c+y7gPaPt09bkos
        xRmJhlrMRcWJAERMvpPPAgAA
X-CMS-MailID: 20201104134411eucas1p234ecdc496597231a697ce6d679dcec2d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
        <20201104102558.11070-1-m.reichl@fivetechno.de>
        <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
        <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
        <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.11.2020 14:13, Marek Szyprowski wrote:
> On 04.11.2020 14:06, Markus Reichl wrote:
>> Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
>>> On 04.11.2020 11:25, Markus Reichl wrote:
>>>> Recently introduced async probe on mmc devices can shuffle block IDs.
>>>> Pin them to fixed values to ease booting in evironments where UUIDs
>>>> ar not practical.
>>>> Use newly introduced aliases for mmcblk devices from [1].
>>>>
>>>> [1]
>>>> https://patchwork.kernel.org/patch/11747669/
>>>>
>>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>>> ---
>>>>    arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>> index a5c1ce1e396c..aa10d5bc7e1c 100644
>>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>> @@ -13,6 +13,11 @@
>>>>    #include "exynos-mfc-reserved-memory.dtsi"
>>>>      / {
>>>> +    aliases {
>>>> +        mmc0 = &sdhci_2;
>>>> +        mmc1 = &mshc_0;
>>> Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc_0)
>>> and 2 for the SD-card (sdhci_2).
>> How to deal then with sdhci_0 (from exynos4.dtsi) vc. mshc_0 (from
>> exynos4412.dts)?
> sdhci_0 and mshc_0 both operate on the same physical MMC0 bus, so this
> is not an issue. They cannot be used simultaneously. The latter is just
> faster, the first one has been left there mainly for the software
> compatibility.

I've thought a bit more on this and I would simply prefer to add generic 
MMC aliases to the top-level Exynos dtsi files (3250, 4210, 4412, 5250, 
5410, 5420) to keep Linux logical MMC bus numbers in sync with the HW 
bus numbers on all boards.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

