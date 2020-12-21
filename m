Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C625C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 07:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC7022C7B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 07:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgLUHg4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Dec 2020 02:36:56 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47748 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgLUHg4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 02:36:56 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201221073604euoutp02c576a78703b3731a14a4b33f7c640781~Sqx5upSXc1909519095euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Dec 2020 07:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201221073604euoutp02c576a78703b3731a14a4b33f7c640781~Sqx5upSXc1909519095euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608536164;
        bh=z2/Q8BvO8qamiabVE8QS5VDyz3a05waBzY2w8BXLjmE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=U+D4D8Au7N113WFfXRsiohNmburvYAkeAxL0PCO3ir1AKRnQrFv7qxsAiwanfKxFX
         d8RS5RObAHUP+nZj04mmjTK3EKxTH6ZlvNnAJ10fphh5BRu7L6Ojb2916zWGU04rBW
         1aSuF2/5skfWC9KqjWSpYtXvcNntmay7OeQAZ1mc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201221073603eucas1p2a7fe137011a7de60d21afc5ddc95f905~Sqx5boaaZ0214502145eucas1p2f;
        Mon, 21 Dec 2020 07:36:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 54.95.44805.36050EF5; Mon, 21
        Dec 2020 07:36:03 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201221073603eucas1p17cc68c0a43db3cfb15cea2b02211bc08~Sqx4235m62579925799eucas1p1u;
        Mon, 21 Dec 2020 07:36:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201221073603eusmtrp2077692bccd15e93a0b532a386639716e~Sqx42IPtn1413814138eusmtrp2-;
        Mon, 21 Dec 2020 07:36:03 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-63-5fe05063a13e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.F6.21957.26050EF5; Mon, 21
        Dec 2020 07:36:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201221073602eusmtip1e12053b2c47b198201e4c178d52b1b6a~Sqx4NtcyD2921929219eusmtip1A;
        Mon, 21 Dec 2020 07:36:02 +0000 (GMT)
Subject: Re: [PATCH 9/9] mfd: sec-irq: Do not enforce (incorrect) interrupt
 trigger type
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <52a1b7c6-c7f1-f5eb-09f6-d84663912db8@samsung.com>
Date:   Mon, 21 Dec 2020 08:36:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201218142247.GA2847@kozik-lap>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjld+8ed4vFbSp+LCsaKWg4LSquKT3owf4oSiowpWzqTaVpumUP
        C9LKrGliZmVTUMK1pc3HfL9Cl2ZiuWo0rexhabmtCGtlWmZut4f/ne9853C+Ax+BC8vZIiI+
        8RCtSJTJxRw+q/7uhMk/evvryMCnXX5UdUElm+p3vGdTxZ19bMpkquJSr752Icrw1sKmzM1F
        HKrAdBujMto6uVTmiBVfx5cays5zpIOWVo60pvSkNKe2DEm/GBZuZ4fzQ2JoefxhWhGwZh8/
        7m1mOzdpgH+0Z9rOTUNDhArxCCBXwI302xwV4hNCUofgikWHMYMDgb1Tz3GqhOQXBJo3qX8d
        hk99GMNrERRUBTGGMQTNXdUugxsZDl/tJbgTu5O+0D81znaKcHIAA03PJHIuOOQyUH1UuQwC
        cg080QxznZhFeoPZlOFK8CCjoFL1/Y9mHvRcG2Y5MY+UgP7FqCsAJxfB6brCP9gTng0XY8yl
        HwhwWP0ZvBHGbY9YDHYDW3ctl8FeMN1U7KoM5GkEQ316LjNkIzCfKkCMKhgG+yZnriBmEnyh
        sjmAodfDnXs5mJMGci4MfJzH3DAX8uqv4gwtgHNnhYzaB9TdFf9iOx4+xnORWD2rmXpWG/Ws
        Nur/uSWIVYY86RRlQiytXJ5IH5EoZQnKlMRYSfTBBAOa+afeX92ORqS1jUmMCCOQEQGBi90F
        q0SvIoWCGNmxVFpxMFKRIqeVRjSfYIk9BVG1tyKFZKzsEH2AppNoxd8tRvBEaViTpqG87YnJ
        t5HXsdmrKmKrn9aR7pMunG41e14yBD3z5dvD8/dHB4kKj1/8uc2jxb2ydzzYcWJUkXfKh5/9
        YupzS0eZYPX0eaPEqMsK3bU2PGECf/ryut6m49lE84eas+6179VOlfrXCuJyAyRuk/Lq+4UT
        z/v1Nattjl+pjfXJSy+7ZVppi1eyvF0gqnsQOuJfVLFjQ5A9UPwwL816uCLgQol3BJjnxN/U
        Dr6jVXdDVp7Zc6fp2xZs/LJ3lOVEjC4pwltPW0RnF9SLPb7ZSFvY4lUTyaOa9NFdiqv55Rnr
        rD7m3WOmhQ+Kbizy2NnVG/IjJWxJ66brr6uTKo7vaSDELGWcbJkfrlDKfgOjFGL2vgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7rJAQ/iDdqOM1lsnLGe1eL6l+es
        FvOPnGO1OH9+A7vF/a9HGS02Pb7GanF51xw2ixnn9zFZtO49wm7R/vQlswOXx6ZVnWwed67t
        YfPYvKTeo2/LKkaPz5vkAlij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX0
        7WxSUnMyy1KL9O0S9DIetx9gL7jBVXHy/2v2BsaHHF2MnBwSAiYSm96fY+pi5OIQEljKKHF7
        xVdWiISMxMlpDVC2sMSfa11sEEXvGSUWb5/HCJIQFoiS+Pp6ATOILSKgKXH973ewBmaBW0wS
        x0+JQDT0MUl87XoL1sAmYCjR9RZkEicHr4CdxNWlT9hBbBYBVYnL51uBzuDgEBVIkjh7WhCi
        RFDi5MwnLCA2p4CexNq7L5gh5ptJzNv8EMqWl2jeOhvKFpe49WQ+0wRGoVlI2mchaZmFpGUW
        kpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAiNy27Gfm3cwznv1Ue8QIxMH4yFGCQ5m
        JRFeM6n78UK8KYmVValF+fFFpTmpxYcYTYHemcgsJZqcD0wJeSXxhmYGpoYmZpYGppZmxkri
        vFvnrokXEkhPLEnNTk0tSC2C6WPi4JRqYOpaVcO+e3GB6bbS7l8TIx8ytunZzT14tK8+9d+y
        Zc1cMW9e9jdt2Jv1drVASKmg7M+LbbWPlQ0W2geeXi14gO/xClktFrZ72tzVCS3p+z+48FsW
        3Dv453qVsedjoXuK15T0zqsduHypJrRqnrwKr2P52X9aaVUTuwpTpdIl1Tyr1hwXDwq0b1Bx
        k1nPWZV2Z+U2iQ9HvtwUtUybInMhpznHil1KJG9+cUVz3++j7EIbX2kufJ97aDn722dW3hN2
        H+Vk3PtCt154v9IjlZLU+1vuHE2at2219JNQ5+Or211Lku+n6+1YbXQ2LHbWpAD29fXO9isO
        Tps497eMf5tJUlU71yetr0rT4t88v+iwUomlOCPRUIu5qDgRALPrM/NRAwAA
X-CMS-MailID: 20201221073603eucas1p17cc68c0a43db3cfb15cea2b02211bc08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e@eucas1p1.samsung.com>
        <20201210212903.216728-9-krzk@kernel.org>
        <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
        <20201218142247.GA2847@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 18.12.2020 15:22, Krzysztof Kozlowski wrote:
> On Fri, Dec 18, 2020 at 02:25:39PM +0100, Marek Szyprowski wrote:
>> On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
>>> Interrupt line can be configured on different hardware in different way,
>>> even inverted.  Therefore driver should not enforce specific trigger
>>> type - edge falling - but instead rely on Devicetree to configure it.
>>>
>>> The Samsung PMIC drivers are used only on Devicetree boards.
>>>
>>> Additionally, the PMIC datasheets describe the interrupt line as active
>>> low with a requirement of acknowledge from the CPU therefore the edge
>>> falling is not correct.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> It looks that this together with DTS change fixes RTC alarm failure that
>> I've observed from time to time on TM2e board!
> Great! I'll add this to the commit msg.
>
> Thanks for testing.

BTW, while playing with this, maybe it would make sense to fix the 
reported interrupt type for the PMIC sub-interrupts:

# grep s2mps /proc/interrupts
120:          0      gpa0   7 Level     s2mps13
121:          0   s2mps13  10 Edge      rtc-alarm0

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

