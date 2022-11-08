Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B00C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 21:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiKHVnH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 16:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiKHVnF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 16:43:05 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3751361B81
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:43:03 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221108214301euoutp013a0cba2519fcbd09e5b73e98aa518487~lugg-p5cQ0461604616euoutp014
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 21:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221108214301euoutp013a0cba2519fcbd09e5b73e98aa518487~lugg-p5cQ0461604616euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1667943781;
        bh=7PFzQzZuRqIsMoS+PTjvImnvaLoj2mDytyqrGhPf8lo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LRfaPxsWS4OwL+DWgtPRv8swHDpkpenxkyIsRJOgWSv90fAvup+k21wu9m2HjWHxf
         okEaSfKbFoS7yoc3JFuG0fAitvTGdcRCOLshJDFVzlGS6zJcTDl2pQ712Ma/eszrEc
         bnD17++SwsZDcesOTp53I4Gzv20r41a9bwn//8b0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221108214301eucas1p231aacff643c48f958b6f09cd6b5bef9f~luggrYdk20220602206eucas1p2-;
        Tue,  8 Nov 2022 21:43:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A2.9E.09549.56DCA636; Tue,  8
        Nov 2022 21:43:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b~luggHLoQa0092600926eucas1p2H;
        Tue,  8 Nov 2022 21:43:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20221108214300eusmtrp14b6bb0c9311249357e10c6f5ce44af1f~luggGptW71361613616eusmtrp1F;
        Tue,  8 Nov 2022 21:43:00 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-c3-636acd65c24c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 92.BE.08916.46DCA636; Tue,  8
        Nov 2022 21:43:00 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221108214300eusmtip2413149577861fc2be1faf2af2dce8614~lugfn0CJZ0187301873eusmtip2V;
        Tue,  8 Nov 2022 21:43:00 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] usb: dwc3: exynos: Fix remove() function
Date:   Tue,  8 Nov 2022 22:42:49 +0100
Message-Id: <20221108214249.32528-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7djP87qpZ7OSDbad4LB4MG8bm0Xz4vVs
        Fntfb2W3mHF+H5PFomWtzBZrj9xlt1i14AC7A7vHnWt72Dz2z13D7tG3ZRWjx5b9nxk9Pm+S
        C2CN4rJJSc3JLEst0rdL4Mpo+rmHqaCDq2JCT3UD4yGOLkZODgkBE4kFR+eydjFycQgJrGCU
        aG9/yQLhfGGU2Px5AROE85lR4smCxcwwLe/m7oNqWc4ocWj1eya4lss3jzKCVLEJGEp0ve1i
        A7FFBBwkliy9wwZSxCzwllHi8Iad7CAJYQFLif1H3jGB2CwCqhLHZm4As3kFbCUOHJjFArFO
        XmL1hgNQq/+yS/TuNYKwXSSOHeiFqhGWeHV8CzuELSNxenIP2BMSAu2MEgt+32eCcCYwSjQ8
        v8UIUWUtcefcL6CTOIBO0pRYv0sfIuwocXfnGrCwhACfxI23giBhZiBz0rbpzBBhXomONiGI
        ajWJWcfXwa09eOES1JkeEseWXwWLCwnESqx8uIZtAqPcLIRdCxgZVzGKp5YW56anFhvnpZbr
        FSfmFpfmpesl5+duYgQmg9P/jn/dwbji1Ue9Q4xMHIyHGCU4mJVEeNesy0oW4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkzss2QytZSCA9sSQ1OzW1ILUIJsvEwSnVwCS6xXDVslpbdofNUUH3ekOX
        +1zpPCuUMqn8mcTSbi+VY1z3F8+tLlbtX7Da/Vq9+2nh22vrOFUnLxQ4oHT9zod3gfE3sli/
        JRnmKp1OYQr9I2elqfju5+UXV3SkJ7b7bcqyNPurabhZq9Yv5YdG67VMSX7mh3b/WfdY69te
        ivsvZj1fWjH0gODlTf5nzTaXC50TYeTr3j9LSHd78d6gTbM09514Kq8wWWnlDN9JOi22bipy
        99dO+NLQxL455xdb8tazAst+/Zr2OOHp97bv76a5vt11x7d+9hnXmrjzwcdPaPOITOed17F8
        7Z7pO66Kv5oYs3gyh6kYV6Eln+3pHyu1/r+cG5/2KLHl+5YK3V9KLMUZiYZazEXFiQAVGK6Q
        dQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsVy+t/xe7opZ7OSDd6tV7B4MG8bm0Xz4vVs
        Fntfb2W3mHF+H5PFomWtzBZrj9xlt1i14AC7A7vHnWt72Dz2z13D7tG3ZRWjx5b9nxk9Pm+S
        C2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mto
        +rmHqaCDq2JCT3UD4yGOLkZODgkBE4l3c/exdjFycQgJLGWUmL94AwtEQkbi5LQGVghbWOLP
        tS42iKJPjBLn/y9mB0mwCRhKdL0FSXByiAg4SXSuPQ1WxCzwnlFi+YkXjCAJYQFLif1H3jGB
        2CwCqhLHZm4As3kFbCUOHJgFtU1eYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtQrTswtLs1L10vO
        z93ECAzCbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR416zLShbiTUmsrEotyo8vKs1JLT7EaAq0
        byKzlGhyPjAO8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamPg6
        +OSqpHhjOhXDp/92MNx1w7dn54Y3G8SVTvt+vl756czjRbs2v1sp5hLuUiBh8P4Oy620p+91
        lsucb3o/Nbzn0qJnGzh39rp6/zY4ltraLXSi8PxflfImv/dCEmusGi8kS7+yzHuWGdVzIL6B
        mTFtEwOj3tbeFe4LWW+FsHke8dcNKNzZI73tziFRa/0L92cnntkYp9Fj9Erw3424F+Efz2u0
        582pqrnSdaZd5tBFxX+FnmxsN5yDc6/uVZzb21i5rdiDo6HX6q8gf+uStwL1C7PZF0z2MG3/
        fNZQWcJ/Yucy3/KSrjV7/yTlXbR+dk1sjtWH8pM73LX1OErWHeFfOnOjTNKit+/Ortv2TIml
        OCPRUIu5qDgRAOKd0ELLAgAA
X-CMS-MailID: 20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b
References: <CGME20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The core DWC3 device node was not properly removed by the custom
dwc3_exynos_remove_child() function. Replace it with generic
of_platform_depopulate() which does that job right.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 0ecf20eeceee..4be6a873bd07 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -37,15 +37,6 @@ struct dwc3_exynos {
 	struct regulator	*vdd10;
 };
 
-static int dwc3_exynos_remove_child(struct device *dev, void *unused)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
-
 static int dwc3_exynos_probe(struct platform_device *pdev)
 {
 	struct dwc3_exynos	*exynos;
@@ -142,7 +133,7 @@ static int dwc3_exynos_remove(struct platform_device *pdev)
 	struct dwc3_exynos	*exynos = platform_get_drvdata(pdev);
 	int i;
 
-	device_for_each_child(&pdev->dev, NULL, dwc3_exynos_remove_child);
+	of_platform_depopulate(&pdev->dev);
 
 	for (i = exynos->num_clks - 1; i >= 0; i--)
 		clk_disable_unprepare(exynos->clks[i]);
-- 
2.17.1

