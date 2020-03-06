Return-Path: <SRS0=V4Vk=4X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B872AC10DCE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 10:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 872F1208CD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Mar 2020 10:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gvrL1jik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgCFKaS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Mar 2020 05:30:18 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42892 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFKaR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 05:30:17 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200306103014euoutp02f2b4fb9fa92cf6375dfedeb870398cb3~5sFLkkkSw1109411094euoutp02H
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2020 10:30:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200306103014euoutp02f2b4fb9fa92cf6375dfedeb870398cb3~5sFLkkkSw1109411094euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583490614;
        bh=cd1BgbEvdP8ztnBlctSkvEjdVhn0VOryPrA2r7OAkyA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=gvrL1jika0ETcPCBlxCdOqz8uwwVCQWCitf2uUNVw1BodlrDaKkUoOVlir0fhFG3Q
         QyAyFaAYK9dh1wujajVybVm1hz3DGc8vGYT+rlNdU+K3BHizzGuTirlgT4Mp4WR3EE
         H5+7/ZycSXhee1u2w3e1dOj4I/+34sdXCTG0HIQg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200306103013eucas1p1d8dcc46c9e2c7e34e741c2bae39ee0c8~5sFLGAvO61556515565eucas1p1t;
        Fri,  6 Mar 2020 10:30:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 7C.EF.60679.536226E5; Fri,  6
        Mar 2020 10:30:13 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200306103013eucas1p241d4648f5a31a885778572158af4918e~5sFKzjUCB0842708427eucas1p2R;
        Fri,  6 Mar 2020 10:30:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200306103013eusmtrp2ec4844fe0eac998d20553b151cce8b29~5sFKyy-4f1573215732eusmtrp2v;
        Fri,  6 Mar 2020 10:30:13 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-5c-5e622635030c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7B.B9.07950.536226E5; Fri,  6
        Mar 2020 10:30:13 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200306103012eusmtip106be6b6fa4a0cf4f937f1b9122eeda47~5sFJ5gntk1660116601eusmtip1i;
        Fri,  6 Mar 2020 10:30:12 +0000 (GMT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_drm/bridge=3a_analogix=5fdp=3a_Split_bi?=
 =?UTF-8?B?bmQoKSBpbnRvIHByb2JlKCkgYW5kIHJlYWwgYmluZCgp44CQ6K+35rOo5oSP77yM?=
 =?UTF-8?B?6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlhbj1yb2NrLWNo?=
 =?UTF-8?B?aXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
To:     Andy Yan <andy.yan@rock-chips.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jingoo Han <jingoohan1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <746dee17-dac0-6c49-ffaa-5048b352bee6@samsung.com>
Date:   Fri, 6 Mar 2020 11:30:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <331b5d65-f619-ff84-d4e7-55d2257a90c5@rock-chips.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7djP87qmaklxBufb5S1urTvHatF//iaj
        xcYZ61ktrnx9z2Yxd1KtxdXvL5ktVnyZyW5x8s1VFovOiUvYLT49+M9sMeP8PiaLQ33RFjMm
        v2Rz4PV4f6OV3WPnrLvsHrM7ZrJ6nJhwicnjfvdxJo/NS+o9/s7az+LRt2UVo8eB3sksHp83
        yQVwRXHZpKTmZJalFunbJXBlPHl9j7mgX7zi04w+1gbGOcJdjJwcEgImEvNvHmHqYuTiEBJY
        wSgxoaOHBcL5wijx5NBXKOczo0Tb4hMsMC0HZi9hhEgsZ5ToP3kWquoto8TK+StZQRxhgdVM
        Ertv3GIHcUQEtjNKPNw9H8xhFrjFJPHr+WkmkGFsAoYSXW+72EBsXgE7ib67U9lBbBYBFYlp
        J26BxUUFYiVmrzzMAlEjKHFy5hMgm4ODU8BJYvq9GJAws4C8RPPW2cwQtrjErSfzwV6SEGjk
        kPh99CwzxOEuEtP2Xod6Qlji1fEt7BC2jMT/nTANzUCXnlvLDuH0MEpcbprBCFFlLXHn3C82
        kM3MApoS63fpg5gSAo4SX3u9IUw+iRtvBSFu4JOYtG06M0SYV6KjTQhihprErOPr4LYevHCJ
        eQKj0iwkj81C8s0sJN/MQli7gJFlFaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmDCO/3v
        +JcdjLv+JB1iFOBgVOLhVficECfEmlhWXJl7iFGCg1lJhFfYND5OiDclsbIqtSg/vqg0J7X4
        EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsbuz/c/Rr3eJN/yNfhesqxqs+Wz9tBn
        2jKXoh302CLmBKqs900MEzL2mH6p2367pfZBTuGbUzeFLrvrmrtx5m1FJpPgB1mnPm76pKAx
        8/UHzQ811v03bNsmL8ow4FgpELunZKvx70N+u47G2dwNZ/cNrctvfJisznScYcq6iIQj60tF
        3uZndymxFGckGmoxFxUnAgAEQyrKdAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xu7qmaklxBjNOcFvcWneO1aL//E1G
        i40z1rNaXPn6ns1i7qRai6vfXzJbrPgyk93i5JurLBadE5ewW3x68J/ZYsb5fUwWh/qiLWZM
        fsnmwOvx/kYru8fOWXfZPWZ3zGT1ODHhEpPH/e7jTB6bl9R7/J21n8Wjb8sqRo8DvZNZPD5v
        kgvgitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL
        ePL6HnNBv3jFpxl9rA2Mc4S7GDk5JARMJA7MXsLYxcjFISSwlFFiTfsxVoiEjMTJaQ1QtrDE
        n2tdbCC2kMBrRom/51RAGoQFVjNJ7L5xix3EERHYzihxaNFJMIdZ4BaTxNoLHxghWv4xSvTc
        Lgax2QQMJbreQoziFbCT6Ls7lR3EZhFQkZh24hZYXFQgVuLGzA4miBpBiZMzn7B0MXJwcAo4
        SUy/FwMSZhYwk5i3+SEzhC0v0bx1NpQtLnHryXymCYxCs5B0z0LSMgtJyywkLQsYWVYxiqSW
        Fuem5xYb6RUn5haX5qXrJefnbmIExve2Yz+37GDsehd8iFGAg1GJh1fhc0KcEGtiWXFl7iFG
        CQ5mJRFeYdP4OCHelMTKqtSi/Pii0pzU4kOMpkC/TWSWEk3OB6aevJJ4Q1NDcwtLQ3Njc2Mz
        CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjHHT7lw5scdFrnKuXNscft4dwtcStA7x7Xhi
        ZLk02V/q2wUp2Zd6Ms9UGSXDtlWU+04wuVFhdO7H2wuvuZILyuR3BIWEmvomHzm6ec+2J1N9
        g289U7lR6rnpceuyLhWudL3jihy37l+en1TPpHy8vX1P8w7POpbl1h0HBDKvvWHc2mQmdUiH
        VYmlOCPRUIu5qDgRAAOqEwoFAwAA
X-CMS-MailID: 20200306103013eucas1p241d4648f5a31a885778572158af4918e
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Andy

On 05.03.2020 10:03, Andy Yan wrote:
>
> I tested it on a rk3399 board, but the eDP was broken after this patch 
> applied:
>
>
> [    0.891873] registered taskstats version 1
> [    0.892243] Loading compiled-in X.509 certificates
> [    0.929147] rockchip-dp ff970000.edp: no DP phy configured
> [    0.931676] random: fast init done
> [    0.932594] rockchip-drm display-subsystem: bound ff900000.vop (ops 
> vop_component_ops)
> [    0.934117] rockchip-drm display-subsystem: bound ff970000.edp (ops 
> rockchip_dp_component_ops)
> [    0.934878] [drm] Supports vblank timestamp caching Rev 2 
> (21.10.2013).
> [    0.935459] [drm] No driver support for vblank timestamp query.
> [    0.956708] mmc0: new HS400 MMC card at address 0001
> [    0.958261] mmcblk0: mmc0:0001 AWPD3R 14.6 GiB
> [    0.958952] mmcblk0boot0: mmc0:0001 AWPD3R partition 1 4.00 MiB
> [    0.959804] mmcblk0boot1: mmc0:0001 AWPD3R partition 2 4.00 MiB
> [    0.960540] mmcblk0rpmb: mmc0:0001 AWPD3R partition 3 4.00 MiB, 
> chardev (242:0)
> [    0.965428] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.966228] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.967025] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.967104]  mmcblk0: p1 p2 p3 p4 p5
> [    0.967823] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.968620] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.969417] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.970216] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.971012] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.971811] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.972608] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.973404] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.974201] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.974998] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.975799] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.976596] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.977393] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.978189] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.978986] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.979786] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
> [    0.980584] rockchip-dp ff970000.edp: AUX CH error happened: 0x7 (1)
>
Thanks for the tests. I will check the code again, although I've tried 
not to change the code flow at all... If anyone has a suggestion what to 
check, let me know.

 > [...]

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

