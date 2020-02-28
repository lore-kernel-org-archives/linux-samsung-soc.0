Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474F4C3F2D0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 09:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 079B5246A8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 09:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uILggC8P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgB1J0J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 04:26:09 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40971 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1J0J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 04:26:09 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200228092608euoutp021797df941cdb0620d6ea56c0d23e7d20~3hsNxqhTR0823708237euoutp02R
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 09:26:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200228092608euoutp021797df941cdb0620d6ea56c0d23e7d20~3hsNxqhTR0823708237euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582881968;
        bh=uxI+hoJzJcNS3iFRQfZhy42RKYmHFtURnsop68L4Y8A=;
        h=From:To:Cc:Subject:Date:References:From;
        b=uILggC8P9eUOIb/vJhvFT88GMTo0dMihg+oKG+3Rs8r3SogwjV5hEsvYIUUMf32aw
         8iekxPjwhPqoeTMKXVr9IKTdG31K67+Q0grw1vCp9eKk7DXJKA6SaPaB2B0cNF0M9U
         VHU/aiRn18Tm4eyV4ZVvhNFbEO7c6WYCMOotUdYk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200228092607eucas1p18b339e2514909990ee6fd5c58107c724~3hsNoIZ2W0626406264eucas1p1e;
        Fri, 28 Feb 2020 09:26:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 8C.C5.60698.FACD85E5; Fri, 28
        Feb 2020 09:26:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d~3hsNUotia0091600916eucas1p2r;
        Fri, 28 Feb 2020 09:26:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200228092607eusmtrp1c2277da0e29978a39779d543affa56b2~3hsNT-P6n2159621596eusmtrp15;
        Fri, 28 Feb 2020 09:26:07 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-46-5e58dcafeb4a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1D.AD.07950.FACD85E5; Fri, 28
        Feb 2020 09:26:07 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200228092607eusmtip2827864b68ad1c988ea68cf2914ebf49e~3hsM49Xcc2722827228eusmtip2i;
        Fri, 28 Feb 2020 09:26:07 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] usb: dwc2: Silence warning about supplies during deferred
 probe
Date:   Fri, 28 Feb 2020 10:25:57 +0100
Message-Id: <20200228092557.31429-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87rr70TEGZxuNLJoXryezaLx1152
        i/PnN7BbzDi/j8li0bJWZou1R+6yO7B5bFrVyeaxf+4ado++LasYPbbs/8zo8XmTXABrFJdN
        SmpOZllqkb5dAlfGqaneBY/ZKnZsf8PawHiGtYuRk0NCwETiyPujzF2MXBxCAisYJY40nGKC
        cL4wSsxrWMEC4XxmlNjZ2csO03LqejsjiC0ksJxR4solfbiOZeu3soEk2AQMJbredoHZIgIO
        EkuW3mEDKWIW2MIoca3rK9ByDg5hgSCJudvzQWpYBFQlFv65CLaAV8BWYu2rZ4wQy+QlVm84
        AHafhMAZNoldFzpZIBIuEtd33GOGsIUlXh3fAnWdjMTpyT0sEA3NjBIPz61lh3B6GCUuN82A
        GmstcefcLzaQK5gFNCXW79KHCDtKdO9+wwISlhDgk7jxVhAkzAxkTto2nRkizCvR0SYEUa0m
        Mev4Ori1By9cgjrHQ+LuobfskACKldhx6SrrBEa5WQi7FjAyrmIUTy0tzk1PLTbOSy3XK07M
        LS7NS9dLzs/dxAhMAKf/Hf+6g3Hfn6RDjAIcjEo8vAt2hMcJsSaWFVfmHmKU4GBWEuHd+DU0
        Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQZGqccFt3Wc
        0sOjtOoiGVpaZi6/8qj1SJjCtAcLZn1a0d4/Z8ZM3gcHZi2Y+/Har8anvz32WaQud2XJZD/L
        xWZ5Jjnb69tP68c222/e+HWMZZU8+/KgOS6M+o0tIk77H4ueWmp09p+GY+nUE6msig+1md08
        zp27cvo0k1nFiq6zyxd9/L2rbfaWLiWW4oxEQy3mouJEAAnauAr8AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xe7rr70TEGVz/I2nRvHg9m0Xjr73s
        FufPb2C3mHF+H5PFomWtzBZrj9xld2Dz2LSqk81j/9w17B59W1YxemzZ/5nR4/MmuQDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MU1O9Cx6z
        VezY/oa1gfEMaxcjJ4eEgInEqevtjF2MXBxCAksZJT4fbGOHSMhInJzWAFUkLPHnWhcbRNEn
        Ronlkx4xgSTYBAwlut6CJDg5RAScJDrXngYrYhbYxihxoRMiISwQILH20AxmEJtFQFVi4Z+L
        YBt4BWwl1r56xgixQV5i9YYDzBMYeRYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIDL1t
        x35u2cHY9S74EKMAB6MSD6/HtvA4IdbEsuLK3EOMEhzMSiK8G7+GxgnxpiRWVqUW5ccXleak
        Fh9iNAVaPpFZSjQ5HxgXeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4
        OKUaGFfvrnS/uOx05s1EZ+vaqO9Rh+QWmk2tZJ4+x3Si1e2DRq78f7fu++So7L/u6JzZ6W8W
        zXvVGsW4zJp7WZ5V7o1t3fs2eapf6D0ap7XlxNfZsr/OCHLtWGtRuFpNwGWN8Zn904/PWbu5
        4q3EnMfaPrtFn956GVT1e+rUxLL++bPO5u5eU5/z4tsJJZbijERDLeai4kQAYdjQSFMCAAA=
X-CMS-MailID: 20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d
References: <CGME20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Don't confuse user with meaningless warning about the failure in getting
supplies in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 3c6ce09a6db5..eb110d368623 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -285,7 +285,9 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 	ret = devm_regulator_bulk_get(hsotg->dev, ARRAY_SIZE(hsotg->supplies),
 				      hsotg->supplies);
 	if (ret) {
-		dev_err(hsotg->dev, "failed to request supplies: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(hsotg->dev, "failed to request supplies: %d\n",
+				ret);
 		return ret;
 	}
 	return 0;
-- 
2.17.1

