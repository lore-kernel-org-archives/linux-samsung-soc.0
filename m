Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC567C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 02:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF55216C4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 02:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WH8Dfme+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgKKC5X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 21:57:23 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:20780 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKC5X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 21:57:23 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201111025720epoutp0377d4cec6142db54accf50796eba48084~GVLH_e5Oj3087430874epoutp03l
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2020 02:57:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201111025720epoutp0377d4cec6142db54accf50796eba48084~GVLH_e5Oj3087430874epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605063440;
        bh=XMY0feJEoj0Fz3GWM7JAGEyI7GINo95+2JX6RIRH5T4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=WH8Dfme+CYxLponQPi7jjXOVyTV9sb5k8gezlOmuYVHFhg32Pnz/Xa2VR9F6GjEiC
         T9cY1zcjzyy75i35s3Kmr7b/WVz4szUFezit1jYga2zj79Q3kSxt6c8rufuAUCLaD5
         bfD2J2Tn3KeepI/oh4SWxf3xjo+vzfHJZJYMLr/w=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201111025720epcas1p48391efd438032401347574fb341b6f98~GVLHjEmp10977009770epcas1p4L;
        Wed, 11 Nov 2020 02:57:20 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.155]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CW8XY6c7WzMqYlt; Wed, 11 Nov
        2020 02:57:17 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        DC.DE.10463.D035BAF5; Wed, 11 Nov 2020 11:57:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20201111025717epcas1p45b544458fccd3599eab6790a6e155edb~GVLE9Wg8g3109231092epcas1p4X;
        Wed, 11 Nov 2020 02:57:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201111025717epsmtrp1d2a5b63d0166cf79849b2aa9fd24511c~GVLE8aW3V2244922449epsmtrp1j;
        Wed, 11 Nov 2020 02:57:17 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-4e-5fab530d56b1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        40.60.08745.D035BAF5; Wed, 11 Nov 2020 11:57:17 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201111025717epsmtip1d1fff7d71ab4d959455982ec2bae6dd5~GVLEn3UsW1167511675epsmtip10;
        Wed, 11 Nov 2020 02:57:17 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <fd177674-b22e-6743-9886-5590ccade2f5@samsung.com>
Date:   Wed, 11 Nov 2020 12:04:40 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201110081336.GB13669@pengutronix.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmni5v8Op4g7etJha31p1jtdg4Yz2r
        xZWv79ksXty7yGKxaupOFovz5zewW3ROXMJuMeP8PiaLbSuA6g71RVvMmPySzWLe551MDjwe
        72+0snvsnHWX3WN2x0xWj02rOtk87ncfZ/Lo/2vg0bdlFaPH501yARxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLzc60MDQyMTIEKE7Iz9u86xF5wSqFi12Hn
        BsZmqS5GTg4JAROJH62vGbsYuTiEBHYwSnxYc48FwvnEKHFp/m8mCOczo8SBFXOZYFrWrlrH
        DJHYxSgxY85tZpCEkMB7RokXaytAbGEBN4knZ46DNYgI6EnsXzmLDaSBWWADk8TWvSA7ODnY
        BFQlJq64zwZi8wrYSWx8vw1sEAtQ/MiPK4wgtqhAhMTx7snsEDWCEidnPgHq5eDgBLriX1MQ
        SJhZQFzi1pP5TBC2vETz1tlgx0kIHOGQmP97MhvE1S4Sv178g7KFJV4d38IOYUtJvOxvY4do
        aGaUmDjjNBOE08EocffxdRaIKmOJ/UsnM4FsZhbQlFi/Sx8irCix8/dcRojNfBLvvvawgpRI
        CPBKdLQJQZQoSRy7eIMRwpaQuLBkItQNHhKHlr9im8CoOAvJa7OQ/DMLyT+zEBYvYGRZxSiW
        WlCcm55abFhgghzbmxjBCVnLYgfj3Lcf9A4xMnEwHmKU4GBWEuFlalsVL8SbklhZlVqUH19U
        mpNafIjRFBjYE5mlRJPzgTkhryTe0NTI2NjYwsTQzNTQUEmc9492R7yQQHpiSWp2ampBahFM
        HxMHp1QDk9MZqX8qgXdTSr6ycTlGTUidbx77sfXK850hp03/pX868+bei6cFG0IPL7hV8HoC
        G3Pp2ouiJjwzbVZ5dS658iM3IFD5SJ6Ryf/eaxx1CZJbirxcrq0unPG4+Rbrg8stU5IYoqtP
        xYpfVQ1Lexez+3PW/8Xeuyc7fk859q5iz50PU8UY7sbdEmSZ9muSa/mzDap3K6SXzXgy40zu
        UufM+3bPj5Q3C+VP+zrPzkv7i5/85LCqY+EBt+ofun+/bnjaNFK0oIG70q+x+irTMrML4kV8
        Tm19/ssW9t0UnSZXs7FehW1Brdk/ixXMqWX/F22sO3oj/q6inWWX9rLo55/LpzxauzvD6qxI
        4XcfZrO175VYijMSDbWYi4oTASTnQmtRBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnC5v8Op4g78veC1urTvHarFxxnpW
        iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7aYMfklm8W8zzuZHHg8
        3t9oZffYOesuu8fsjpmsHptWdbJ53O8+zuTR/9fAo2/LKkaPz5vkAjiiuGxSUnMyy1KL9O0S
        uDL27zrEXnBKoWLXYecGxmapLkZODgkBE4m1q9YxdzFycQgJ7GCUuNH0nKWLkQMoISGxZSsH
        hCkscfhwMUi5kMBbRomZK1NAbGEBN4knZ44zgdgiAnoS+1fOYgMZwyywgUli8ulLjBAzPzFK
        7Fp/iQWkik1AVWLiivtsIDavgJ3ExvfbmEFsFqD4kR9XGEFsUYEIiZb7f9ghagQlTs58AnYP
        J9Ch/5qCQMLMAuoSf+ZdYoawxSVuPZnPBGHLSzRvnc08gVFoFpLuWUhaZiFpmYWkZQEjyypG
        ydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjODo09Lawbhn1Qe9Q4xMHIyHGCU4mJVEeJna
        VsUL8aYkVlalFuXHF5XmpBYfYpTmYFES5/06a2GckEB6YklqdmpqQWoRTJaJg1OqgWl3i0x0
        6Zvfr+POeh+Y+tGujO2w4S+56E6vOV+zt8pZ1tZpq569+8uv7tvzPsbZosw+k+oOdh096HPn
        5hrOB8/0ms69fpX16TjPlHADPqn80/Jycpw/t9z9c0DLIcjA7fK0WVPWLGE3Wbf0O+eCmDen
        2n/Hct2Y9NWfPUt/4WYpZwGHEjWH9MkKGbws9leebNy1NWdH9v5Ly96dcOq1/PTJ3K453kW6
        1cj9hvu6FDmuS9qn65T7I/6sVs+zf1XOppE1f7fUm+LCngXv+GQUv3H8b3e5feoiP4NOdc/v
        APenFjc2Zzlmfg3ufiwRzrMsvfHNtPJ9PU/l9VzP5fCJPfg6Qbdn53Vj3lqR1hXd3kosxRmJ
        hlrMRcWJAN4R92AtAwAA
X-CMS-MailID: 20201111025717epcas1p45b544458fccd3599eab6790a6e155edb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
        <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
        <20201110081336.GB13669@pengutronix.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 11. 10. 오후 5:13에 Michael Tretter 이(가) 쓴 글:
> On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
>> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
>>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
>>> bridge and make it usable with other drivers. Although the driver is
>>> converted, it still supports the component framework API to stay compliant
>>> with the Exynos DRM driver.
>>>
>>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
>>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
>>> the Exynos Decon. The driver for the LCDIF does not use the component
>>> framework, but uses drm bridges.
>>>
>>> I don't have any Exynos SoC to actually test the series. I build a dummy to
>>> test the bridge with a component driver, to make sure that at least the
>>> initialization is working. Furthermore, tested the driver as a bridge with a
>>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
>>> should verify that the driver is still working on Exynos hardware.
>>>
>>> I also changed the order of the patches to first make the driver more platform
>>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
>>
>> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
>> would be one of an encoder type of devices not bridge such as DSI to LVDS
>> and LVDS to DSI bridge devices, and also image enhancer and image compressor
>> in case of Exynos.
> 
> I don't understand, why the MIPI-DSI bus device would be an encoder type and
> DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
> documentation for the DSIM states that the DSIM receives RGB video as input
> and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to

MIPI-DSI receives RGB video as input and encodes it to MIPI packet and then transfers the packet to MIPI panel.
And finally, MIPI panel decodes the packet and updates it - RGB data - on its SRAM.

MIPI-DSI driver programs how the RGB video should be made as MIPI packet. For more detail, you could refer to MIPI-DSI spec.
This would be why we handle MIPI-DSI driver as an encoder like other ARM SoC DRM drivers did.

> MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
> data as parallel RGB.
> 
> On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
> implements the encoder in the platform glue, but in the end the encoder can
> probably be moved to the DECON.

As you know, Display controller can transfer RGB video to various devices such as RGB panel, CPU panel, LVDS panel via LVDS bridge, MIPI panel via MIPI-DSI bus device, and so on like below,

Display Controller --> RGB panel or CPU panel.
Display Controller --> LVDS bridge --> LVDS panel.
Display Controller --> MIPI DSI bus device --> MIPI Panel.
...

Display controller drivers such as FIMD and DECON series in case of Exynos don't create an encoder driver-internally instead of it depends on Display pipeline configuration - what kind of Display panel is used.
In fact, if the Display pipeline uses RGB panel or CPU panel without Display bus device such as MIPI-DSI, then FIMD and DECON drivers create an encoder for it internally - just we separated the code to consider other type of panels.

On the I.MX8MM, could you share how to handle an encoder if some board has only MIPI-DSI panel, and in this case, where is an encoder for it created? I looked into I.MX8MM DRM driver but didn't find MIPI-DSI driver.
Seems that they support only parallel display, HDMI and LVDS panel.

Thanks,
Inki Dae

> 
>> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
>> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
>> for Exynos with i.MX8M Mini?
> 
> Yes, the reason is that the driver should be shared between Exynos and
> i.MX8MM. It is the same IP and I don't see a reason why we should introduce
> another driver for the same IP if the driver works for both SoCs.
> 
> Michael
> 
