Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD71C3F2CF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83993246AA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 09:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lywzm1WJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgB1J2S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 04:28:18 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41892 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgB1J2R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 04:28:17 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200228092816euoutp02cf211eae87a25cea434b7b6b44b397ef~3huF4MkMJ1076610766euoutp02P
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 09:28:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200228092816euoutp02cf211eae87a25cea434b7b6b44b397ef~3huF4MkMJ1076610766euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582882097;
        bh=4Il3OC3xzJqEiwuH88cOFDRumXb5AGJ1jKsN47OjV6E=;
        h=From:To:Cc:Subject:Date:References:From;
        b=lywzm1WJVfBeo7OK/K0++6joc9rkQ21agbBdmHBg/vFUU5UsjDgGZfPJC+j9AuUm8
         0SIY6kR3DLF9a1hPS9xA9AW2Tyh2Le6zlab3yL9QrR7KGsvVmKf4EOzij5rOAvELOu
         M2Zv7uk4daY25bQ0FzJsx7TLgUTu/zrIigKb2mXY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200228092816eucas1p1b2b5377252b731e4a845d3c9272a5e7b~3huFpJtIt2816428164eucas1p1T;
        Fri, 28 Feb 2020 09:28:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 56.90.61286.03DD85E5; Fri, 28
        Feb 2020 09:28:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433~3huFW1Lx73124331243eucas1p2r;
        Fri, 28 Feb 2020 09:28:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200228092816eusmtrp14e62b60f66944aee9ed8410319700180~3huFWQ3ls2387523875eusmtrp1g;
        Fri, 28 Feb 2020 09:28:16 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-06-5e58dd307e97
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.3E.08375.03DD85E5; Fri, 28
        Feb 2020 09:28:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200228092815eusmtip290157b77b61c8bb702ba38bde0e7f187~3huE9MJDc2158721587eusmtip2C;
        Fri, 28 Feb 2020 09:28:15 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] udc: s3c-hsudc: Silence warning about supplies during
 deferred probe
Date:   Fri, 28 Feb 2020 10:28:08 +0100
Message-Id: <20200228092808.4580-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7djP87oGdyPiDL6/U7c41vaE3eL8+Q3s
        FjPO72OyWLSsldli7ZG77A6sHptWdbJ59G1ZxejxeZNcAHMUl01Kak5mWWqRvl0CV0bLQt6C
        52wVW7s0GxhvsXYxcnJICJhILNixjamLkYtDSGAFo8T21a1sEM4XRomGi5vZQaqEBD4zSuw+
        LwXTcevjUxaIouWMEtOPH0HoeHP0ElgHm4ChRNfbLjYQW0TAQWLJ0jtgNrNApcT6havBdgsL
        hEtMW/wEaDcHB4uAqsTfswUgYV4BG4nmHdMZIZbJS6zecIAZZL6EwBY2ic1nZjBDJFwkvjUe
        YYGwhSVeHd/CDmHLSJye3MMC0dDMKPHw3Fp2CKeHUeJy0wyosdYSd879YgPZzCygKbF+lz5E
        2FHi7ZvprCBhCQE+iRtvBSFu5pOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrgEdZqHxKvzuxkh
        ARcrMfPWB7YJjHKzEHYtYGRcxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJERjfp/8d/7SD
        8eulpEOMAhyMSjy8C3aExwmxJpYVV+YeYpTgYFYS4d34NTROiDclsbIqtSg/vqg0J7X4EKM0
        B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsbcr5Pakx/e2eD2uWO+r/abjjnd1xrbQ59t
        XLSd2/yOpUXgxNWMmT+7AjicFb7fN03dV5776cuizh/6LMc77Zj1lzUt/t/70+lfQdEklb/f
        n96XOpVTV7+lKHRXxsMMc54Nol9Xft+89aid8KuZyyJmP8hYrvtMb4XovMlvuFkuHZreO/fY
        Vt5zSizFGYmGWsxFxYkA7lXkfesCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsVy+t/xe7oGdyPiDLpnCFsca3vCbnH+/AZ2
        ixnn9zFZLFrWymyx9shddgdWj02rOtk8+rasYvT4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
        z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL6NlIW/Bc7aKrV2aDYy3WLsYOTkkBEwk
        bn18ytLFyMUhJLCUUWLPi+/MEAkZiZPTGqCKhCX+XOtigyj6xCix9vtfsASbgKFE11uQBCeH
        iICTROfa02A2s0C1xPmuk4wgtrBAqMS/g9uA4hwcLAKqEn/PFoCEeQVsJJp3TGeEmC8vsXrD
        AeYJjDwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBIbVtmM/N+9gvLQx+BCjAAejEg/v
        gh3hcUKsiWXFlbmHGCU4mJVEeDd+DY0T4k1JrKxKLcqPLyrNSS0+xGgKtHsis5Rocj4w5PNK
        4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTA6Si+wf6i8cjqvtOKu
        d7wMAXvnn7txpFhoSdur9J2HpiSJ/nrz61He50oR781B188c64zumpr5aU5j0FuH5X8fG+Vs
        +l31LeWeUwKTlqqFtIcZy+e0i/m3z3UnJdyMbr7dcf8EC6PaSk2/Z47Kt2N3PQt7EBYu0rng
        sqZiSPKrsIa0q7tP11sosRRnJBpqMRcVJwIA+iAuC0ECAAA=
X-CMS-MailID: 20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433
References: <CGME20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Don't confuse user with meaningless warning about the failure in getting
supplies in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/gadget/udc/s3c-hsudc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index 21252fbc0319..aaca1b0a2f59 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -1285,7 +1285,8 @@ static int s3c_hsudc_probe(struct platform_device *pdev)
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hsudc->supplies),
 				 hsudc->supplies);
 	if (ret != 0) {
-		dev_err(dev, "failed to request supplies: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to request supplies: %d\n", ret);
 		goto err_supplies;
 	}
 
-- 
2.17.1

