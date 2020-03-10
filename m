Return-Path: <SRS0=2oIG=43=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB64C10F27
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 10:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E69CD24680
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 10:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Bz86n5wa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgCJKfd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Mar 2020 06:35:33 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34721 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgCJKfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Mar 2020 06:35:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200310103531euoutp01397bb68c10fde96831e6c6efd8785df5~66u8n7L8M3104031040euoutp01L
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200310103531euoutp01397bb68c10fde96831e6c6efd8785df5~66u8n7L8M3104031040euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583836531;
        bh=7YWM7Z4IXWxMp+NS/R0C5Hfzu6++9AJ9hO517CES0ig=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Bz86n5waIqhqDkWSS2cvjvhfIYmEzfpq1WaMyUaDkxhXHw+Py9Ojft/cVwe1NG/kS
         c1AJqiDo62Ip06Ndxpzpa9OoceE5pKPRVbwwdRJkpm8gHL3sVc1sW7J/A9qMtnOKsi
         g6FshjokGn3nE9E39Om3YiWVH3oXI4887UoKfnjg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200310103531eucas1p2d8fc222fab47eb72c2bf473dbd75c443~66u8R29Ng0555805558eucas1p2n;
        Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.6F.61286.37D676E5; Tue, 10
        Mar 2020 10:35:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200310103531eucas1p2c2d6a133dc899b21cdec6d8e9c2e9362~66u77ABoE0593005930eucas1p2y;
        Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200310103531eusmtrp2b2d97778ab0e7975eb0c646877bc5c96~66u76PT5a0345603456eusmtrp2Z;
        Tue, 10 Mar 2020 10:35:31 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-bb-5e676d735889
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.D3.08375.37D676E5; Tue, 10
        Mar 2020 10:35:31 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200310103530eusmtip1a707ded0cec75734fe1c5c744396d996~66u7CwumB1904819048eusmtip1N;
        Tue, 10 Mar 2020 10:35:30 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix_dp: Split bind() into probe() and
 real bind()
To:     Andy Yan <andy.yan@rock-chips.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <14da8aee-71bd-bdd1-4ac9-94cb7eed7efa@samsung.com>
Date:   Tue, 10 Mar 2020 11:35:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a287abf-12ed-7e34-c765-144a8c10230d@rock-chips.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7djP87rFuelxBjd2S1vcWneO1aL//E1G
        i40z1rNaXPn6ns1i7qRai6vfXzJbrPgyk93i5JurLBadE5ewW3x68J/ZYsb5fUwWh/qiLWZM
        fsnmwOvx/kYru8fOWXfZPWZ3zGT1ODHhEpPH/e7jTB6bl9R7/J21n8Wjb8sqRo8DvZNZPD5v
        kgvgiuKySUnNySxLLdK3S+DKuNjznb3gPUvF/y2VDYwfmLsYOTkkBEwkvmxexNbFyMUhJLCC
        UeJm9z5mCOcLo0TjgcWMEM5nRokZhxeywbTc2LQbqmU5o8T8Lx+hqt4ySuw69Yy1i5GDQ1gg
        UuLbXzeQuIjAdkaJh7vns4M4zAI3mCRW/P/IAjKKTcBQouttF9hYXgE7iV0dT8CaWQRUJWY0
        gpWICsRKzF55mAWiRFDi5MwnYDangJNE6/b1YE8wC8hLNG+dDWWLS9x6Mp8JZJeEwF92iZb1
        x6HOdpFYvLKDEcIWlnh1fAs7hC0j8X8nTEMz0KXn1rJDOD2MEpebZkB1WEvcOfeLDeQ6ZgFN
        ifW79EFMCQFHia+93hAmn8SNt4IQN/BJTNo2nRkizCvR0SYEMUNNYtbxdXBbD164xDyBUWkW
        ks9mIflmFpJvZiGsXcDIsopRPLUUmKxSiw3zUsv1ihNzi0vz0vWS83M3MQJT3el/xz/tYPx6
        KekQowAHoxIPb4ZuWpwQa2JZcWXuIUYJDmYlEd54+fQ4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
        4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhhD/v51nW76NMYlTbNV83vWQZt0scZD5T5mBSor
        Tb5V9uZO2fHAaFfmZ5fbB3bzyT3a8urTT3vPUj1uhTT3F6l91XsmHqzqVnjFtvOD3vo2hrt7
        f9yd+nqT5btN91yV7/aZ+LzaHem2ieEvY9Hew2r5v8Qzz1967fy1fHPl8+n9d2ZfW+KpEPNP
        iaU4I9FQi7moOBEA5TgS83EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xu7rFuelxBlcWM1vcWneO1aL//E1G
        i40z1rNaXPn6ns1i7qRai6vfXzJbrPgyk93i5JurLBadE5ewW3x68J/ZYsb5fUwWh/qiLWZM
        fsnmwOvx/kYru8fOWXfZPWZ3zGT1ODHhEpPH/e7jTB6bl9R7/J21n8Wjb8sqRo8DvZNZPD5v
        kgvgitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
        uNjznb3gPUvF/y2VDYwfmLsYOTkkBEwkbmzazdbFyMUhJLCUUeLogXfsEAkZiZPTGlghbGGJ
        P9e6oIpeM0rMfAJSxMEhLBAp8e2vG0hcRGA7o8ShRSfZQRxmgVtMEge2fGSF6NjGJDHz0AOw
        UWwChhJdb0FGcXLwCthJ7Op4wgoyiUVAVWJGIwtIWFQgVuLGzA4miBJBiZMzn4DFOQWcJFq3
        rwc7m1nATGLe5odQtrxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUokloKjNLc
        YkO94sTc4tK8dL3k/NxNjMDo3nbs5+YdjJc2Bh9iFOBgVOLhzdBNixNiTSwrrsw9xCjBwawk
        whsvnx4nxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnAxJNXEm9oamhuYWlobmxubGahJM7b
        IXAwRkggPbEkNTs1tSC1CKaPiYNTqoHRR+OhjlTbRh7uu4tP8PgoX19qvoE/dIr93SV9Kh+r
        Tj1PCuF5sf/e5ydnZQ51RNb0rl76ZbWVu+IWgXqN5HShhC436flbF56wipA0z5gVN6F69Zrn
        v+dkfHhUfdSp9HV9iF/igZkTJ4p/T3jIdYU3eltmY61L5+KMxNap90J3VT7iubZynpOaEktx
        RqKhFnNRcSIA8N4ZcgQDAAA=
X-CMS-MailID: 20200310103531eucas1p2c2d6a133dc899b21cdec6d8e9c2e9362
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8
References: <CGME20200302142626eucas1p25b7aec18264b1483fab9cceb86989aa8@eucas1p2.samsung.com>
        <20200302142615.14947-1-m.szyprowski@samsung.com>
        <30f64c8f-2a12-46c2-e5eb-505bbb2088ed@samsung.com>
        <331b5d65-f619-ff84-d4e7-55d2257a90c5@rock-chips.com>
        <0a287abf-12ed-7e34-c765-144a8c10230d@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Andy,

On 10.03.2020 02:10, Andy Yan wrote:
> [...]

> ret = analogix_dp_dt_parse_pdata(dp);
>         if (ret)
>                 return ERR_PTR(ret);
>
>
>     I think this is the problem I tested. Now the pdata were parse in 
> probe, but the plata_data->dev_type was populated in 
> rockchip_dp_bind/exynos_dp_bind after probe.So we can't parse the 
> right configuration here.

Indeed, plat_data wasn't properly initialized. Thanks for finding it 
out! I will send v2 in a few minutes.

 > [...]

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

