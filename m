Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66908C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbiLLOVL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiLLOVI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:21:08 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E044F038
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:21:03 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221212142100euoutp0157e7145881b2db7328e13b3068b8a8f4~wEaSuF5S-2916529165euoutp01I
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 14:21:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221212142100euoutp0157e7145881b2db7328e13b3068b8a8f4~wEaSuF5S-2916529165euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1670854860;
        bh=YFTbZrY7e578Tc9I7NDP3r3OFfGO+pwBESsT7rAaI2M=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=IzrVR81XPWAhQXin1NgusCzskQnUYX70303jvND6Cs3mrygQk/HtBHHwsjFXX8ocf
         neEtO0cAXC3eyRqoBNs9phH182tgLiVBhFuY3j/Kzfnb+9lizOMk7DJ7X7lwrY+WR1
         LsPNYtwtGgFPhJEyvVUYZwYM2gJuHor93sEXqsDk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221212142100eucas1p2e8106dc9788ba909c69f17f8d6f6218b~wEaSKRvAz0401204012eucas1p2X;
        Mon, 12 Dec 2022 14:21:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DE.13.10112.BC837936; Mon, 12
        Dec 2022 14:21:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221212142059eucas1p2f04e85a8804295c1edc5b00d32703598~wEaRtWOJg1048010480eucas1p2B;
        Mon, 12 Dec 2022 14:20:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221212142059eusmtrp2eeebbd622604b61b28cc0a0daf100b12~wEaRrV88B2794127941eusmtrp2U;
        Mon, 12 Dec 2022 14:20:59 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-ff-639738cbd4de
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.B3.08916.BC837936; Mon, 12
        Dec 2022 14:20:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20221212142058eusmtip120777b06729ef803cf43b4328a4bd7c0~wEaQbIXI21195011950eusmtip1o;
        Mon, 12 Dec 2022 14:20:58 +0000 (GMT)
Message-ID: <72083bbd-216d-4e7e-13b3-509e984fc118@samsung.com>
Date:   Mon, 12 Dec 2022 15:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode
 flags
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZB9yGyAdddNaW6g8j2PYJo=p8Z3MGqwzt8A=qyrM5H-fw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRzmu/fdux81ex0o30OCnGHqEtIT/RIeYWW+dx2XdVfXedfRHO8h
        B2y2jSyurqmX0ZRuIBfu5TSPQQxQQCJwnBgwahhshSAWQhPnEWxDDwbxY2O08WLx3/N5Ps/z
        Ps/ney8fE9cSUfwshYZWKWQ5EkKIN/+yYN/Zi0rlLzWcxdDwvR4MOYxeHLnvmQg0MPuYQLUD
        JhwVVtq5qNihx9FMo55A43/14ch2ysNDXxdV8FCV/iaBGp2DXKRbrMbQhd9ucpDnzEmAeh7U
        Y+jXk1/i6HaJhUDTzCiGLIGxoOT8BIH6uqcxNOezYamQujrl4FIVrT9hVJm2D6cuMd04VdLd
        xaXs50YIysyM8KiyAgOXMt6Y4FBdd4xcanjwBkE5zlo51A8VX1DXHl3nUN801QDK2xhzmDwi
        3J9B52R9TKsSUj4UHjOXLBDHx3Z+0mouJLRgIU4HBHxI7oHtiz5CB4R8MWkCsGC5hMsOMwCW
        eZyrgxdA43Qb74mlxVXJYxdVAM7V3FlVTQVV/iIQUonIFLhsnsRDGCfjYGX7EM7y6+Etw8MV
        vIHMgO1mGyeEw8m3YH33MBbCGBkJhx5+t8JHkFL4j8G9UhAj3TxoGvZzQwuC3AV1kzoihAXk
        25CZncdZcyw8/WMZFjJA8qoQzgYeEWzv12GDyY+xOBy6rE2r90QHm4bSQoavALzsc6wOegC1
        fw8BVpUMh+2LwS/xgxHbYX1rAksfgPaLHm6IhuQ6+MfkerbEOljcXIqxtAgWnBGz6q2Qsdb9
        F9vx+21MDyTMmndh1tzPrDmH+T/3MsBrQCSdp87NpNW7FfSJeLUsV52nyIyXK3MbQfB/7glY
        Z66DKtdUfCfg8EEngHxMEiGK2/atXCzKkH2aT6uU6aq8HFrdCTbxcUmkyFRSIBeTmTINnU3T
        x2nVky2HL4jSct7VcZUpuhR5YF8RiMp+NS/WXdOiMRzMqjv98tH2aI98YIvPuOTckJAULmjz
        JxaeI8YGfNJnpM39+pyYcf+B7Hc6n9P15hcfajpU2uDbaPPa8i/21iq3vJK0VJnktFSnesbc
        ++9vy82/tLhsJx68aDjiumva2rb3aKFzfqzlcP/P+6xSNJ4cE/g8JSztox1ZnmuDytET/fdv
        RXd83zGS/FqrhbEkRhSlOm3Rkj0tF1K3P9vVtDT6VGKspmLuvVheQHDFL5Om7U3Qentf6PeU
        hrWnB5gw8+ONm7oOVmMTn7mM6dlvZDy9+fndlrT08vdPzWuu1MHq8qbicuEHCsmfb26+K8HV
        x2S7dmAqtexfmu52wD4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsVy+t/xu7qnLaYnGxx8rGhx5/ZpZov7iz+z
        WLy+vYLN4srX92wWq6+sYLHoXXqO1WLS/QksFl82TWCzeHHvIovF2aY37BadE5ewWyyfsI/N
        YtPja6wWXb9WMlvMOL+PyeJNWyOjxelH65ktTjW2slhcmnKYzeLTrIfMFof/PQMqmfySzeLi
        iU/MFt9/n2V2kPBY+/E+q8eSXfuZPWY3XGTxmDfrBIvHlBNHWD3O9dxl89g56y67x+yOmawe
        i/e8ZPI4cnUxq8eda3vYPO53H2fy2Lyk3mPjux1MHn1bVjF6fN4kFyAQpWdTlF9akqqQkV9c
        YqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexc8pPtoJnuhW7dvayNTD+
        VO1i5OSQEDCR2P5qKXsXIxeHkMBSRonL9/tYIBIyEienNbBC2MISf651sUEUvWeUOLf1ERNI
        glfATuL/zrdgDSwCqhJLD9xigYgLSpyc+QTMFhVIkWjv+QdWLyzgK/Gi5Ss7iM0sIC5x68l8
        sLiIgLbEt5mvwRYwC7xll7j57DfUtuNMEudW7gebxCZgKNH1FuQMTg5OgUCJWV9/sEBMMpPo
        2trFCGHLSzRvnc08gVFoFpJDZiFZOAtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefn
        bmIEpqNtx35u3sE479VHvUOMTByMhxglOJiVRHhVNaYlC/GmJFZWpRblxxeV5qQWH2I0BYbG
        RGYp0eR8YELMK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpg2h/g
        uf74koKymW0r7eYfuhE5x/n3ydz6nFnnjtzszlwSnHJB5rN/4fvoo54BhteeLC56+TIq5f7R
        uLr5jhcXnTP487g/l+9zls6eY0ssg76YPOv+1pb5/JHT3YcLVjj9nO5rZf9O1WaCj/L++imT
        v4rmXN/y9VTUiv/s8TZfSwoC7OZnBHcuLfQ6xypx3TpmR9CmqccVlr9z+Xqg8H6sV8KFfO5+
        Cdbu0N+3731aepvR60bWs6u/840jz23tNrhgmLvmmt2ySz0zA59XlDSfc3y2bVKCKrvD5DW7
        Sp6a7/tiGLD7qFUM949pag83e9Tl7HOoS88++S37/+MP00x3zTvzQIR7/xIdjS9Cv951Lnmk
        xFKckWioxVxUnAgAaH81ItADAAA=
X-CMS-MailID: 20221212142059eucas1p2f04e85a8804295c1edc5b00d32703598
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
        <CGME20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475@eucas1p2.samsung.com>
        <20221209152343.180139-5-jagan@amarulasolutions.com>
        <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
        <CAMty3ZB9yGyAdddNaW6g8j2PYJo=p8Z3MGqwzt8A=qyrM5H-fw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12.12.2022 10:03, Jagan Teki wrote:
>   On Mon, Dec 12, 2022 at 2:28 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hi Jagan,
>>
>> On 09.12.2022 16:23, Jagan Teki wrote:
>>> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
>>> 0 = Enable and 1 = Disable.
>>>
>>> The logic for checking these mode flags was correct before
>>> the MIPI_DSI*_NO_* mode flag conversion.
>>>
>>> Fix the MIPI_DSI*_NO_* mode flags handling.
>>>
>>> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
>>> features")
>>> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>>> Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>> Changes for v9:
>>> - none
>>>
>>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index e5b1540c4ae4..50a2a9ca88a9 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>>>                        reg |= DSIM_AUTO_MODE;
>>>                if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>>>                        reg |= DSIM_HSE_MODE;
>>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
>>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>>>                        reg |= DSIM_HFP_MODE;
>>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
>>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>>>                        reg |= DSIM_HBP_MODE;
>>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
>>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>>>                        reg |= DSIM_HSA_MODE;
>>>        }
>>>
>>> -     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>>> +     if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>>>                reg |= DSIM_EOT_DISABLE;
>>>
>>>        switch (dsi->format) {
>>
>> Huh, this changes the logic in the driver! I've spent another half of
>> the night trying to figure out why v8 and v9 doesn't work on all my
>> Exynos boards with DSI panels again...
>>
>> Please drop this patch from this series. If you want to get the Exynos
>> DSI -> Samsung DSIM conversion merged, please focus on the core patches
>> and don't add more random 'fixes' to each new version.
>>
>> This change has to be discussed separately. The values written by the
>> Exynos DSI driver to the registers ARE CORRECT and DSI panels work fine
>> with such configuration. So either everything is correct, or these flags
>> are reversed both in the Exynos DSI driver AND at least tested DSI
>> panels (s6e8aa0, s6e3ha2, s6e63j0x03). I would need to check this in
>> panel datasheets if I manage to get them.
> This issue was reproduced as part of the series in v7 in i.MX8m
> platform and reported by Sébastien Szymanski [1] and TRM matches the
> fix as well.
>
> [1] https://lore.kernel.org/all/4c9475d0-f76f-0c59-1208-6e5395496c9e@armadeus.com/

Then please append the following changes to this patch to keep current 
code working:

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c 
b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 1355b2c27932..2a33602372d9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -692,7 +692,9 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)

         dsi->lanes = 4;
         dsi->format = MIPI_DSI_FMT_RGB888;
-       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+       dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS
+               | MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
+               | MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;

         ctx->supplies[0].supply = "vdd3";
         ctx->supplies[1].supply = "vci";
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c 
b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 3223a9d06a50..bb47dbfdd7ee 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -446,7 +446,8 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)

         dsi->lanes = 1;
         dsi->format = MIPI_DSI_FMT_RGB888;
-       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
+       dsi->mode_flags = MIPI_DSI_MODE_VIDEO_NO_HFP
+               | MIPI_DSI_MODE_VIDEO_NO_HBP | MIPI_DSI_MODE_VIDEO_NO_HSA;

         ctx->supplies[0].supply = "vdd3";
         ctx->supplies[1].supply = "vci";
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c 
b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 362eb10f10ce..c51d07ec1529 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -990,8 +990,6 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
         dsi->lanes = 4;
         dsi->format = MIPI_DSI_FMT_RGB888;
         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
-               | MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
-               | MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
                 | MIPI_DSI_MODE_VSYNC_FLUSH | 
MIPI_DSI_MODE_VIDEO_AUTO_VERT;

         ret = s6e8aa0_parse_dt(ctx);


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

