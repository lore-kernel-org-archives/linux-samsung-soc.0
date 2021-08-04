Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F121C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6946961037
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237832AbhHDLot (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:44:49 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49725 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237816AbhHDLos (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:44:48 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210804114434euoutp02873b8ed2d08e8da5323b19cb3ae84c97~YF9ZiAtbb2396223962euoutp02A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 11:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210804114434euoutp02873b8ed2d08e8da5323b19cb3ae84c97~YF9ZiAtbb2396223962euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628077474;
        bh=XeiT3T0AIqu21kYHEOSCAdLqm7FdtiPyjAwJQ8y1KjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gi7jH+ncdUZ4Y2MFAii6TNI8vgAbAjcGQc2dT3hxLvWLwxo+F5RFH0Un6YIMmrQRl
         ef3N4phHKzi1o/5UQ4UWkv59h1YWM6/0oN3DRFe6SsiRJzRh1ynkgDdhY7dZDcDf6A
         Ltm4HZbvnCCR5BJmH5kIBJbk0XsSzeZ3Mw6WRmM0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210804114434eucas1p1a52106ffd4a0fb7c3eb4e764e59fbf88~YF9Y2jDtT2736727367eucas1p1i;
        Wed,  4 Aug 2021 11:44:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.EA.42068.1AD7A016; Wed,  4
        Aug 2021 12:44:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210804114433eucas1p255ac5db7e56a8d5e50b8937c07559587~YF9YkbfYC3240532405eucas1p2Y;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210804114433eusmtrp2a554001d7cc0de2146f76b6127c6bbb4~YF9YjtLxs1036210362eusmtrp2W;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-08-610a7da1001a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.0F.20981.1AD7A016; Wed,  4
        Aug 2021 12:44:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210804114433eusmtip2d50901d6b87509388507727e18b8372f~YF9YDG2ZS1145011450eusmtip2Z;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] usb: dwc2: add true DWC2_POWER_DOWN_PARAM_NONE state
Date:   Wed,  4 Aug 2021 13:44:21 +0200
Message-Id: <20210804114421.10282-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804114421.10282-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7djP87qLarkSDd43MVr03jGx2DhjPavF
        sbYn7BaNv/ayW5w/v4Hd4vKuOWwWM87vY7JYtKyV2WLtkbvsDpwem1Z1snn0bVnF6LFl/2dG
        j8+b5AJYorhsUlJzMstSi/TtErgyFl6cylbQIV/R/3otUwPjNskuRk4OCQETiZbzD9lBbCGB
        FYwSp7eIdjFyAdlfGCXurF/HCuF8ZpT4sKmbFabj/5sTLBCJ5YwSh8+uYYZr+XG1iw2kik3A
        UKLrLYQtIpAgcWTze7AiZoFeJonp6zcygySEBTwl3pz9wwJiswioSrTdPw0W5xWwlei+cYYN
        Yp28xOoNB8DinAJ2Em+bPoLdJCEwl0OiY+VUqJtcJOa8Oc4MYQtLvDq+hR3ClpH4v3M+E0RD
        M6PEw3Nr2SGcHkaJy00zGCGqrCXunPsFtI4D6D5NifW79CHCjhKvnhxnAglLCPBJ3HgrCBJm
        BjInbZvODBHmlehoE4KoVpOYdXwd3NqDFy5BneMh8f9DHxskhCYCA7XlLfsERvlZCMsWMDKu
        YhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEwYp/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nw
        ht7gSBTiTUmsrEotyo8vKs1JLT7EKM3BoiTOm7RlTbyQQHpiSWp2ampBahFMlomDU6qBaTG7
        l4lUssmq7Oqb1XoV3tFfV2xc1Lk83mnP2VvBP0tNn0gue/8qa95NzrX7wg2fiOwqSPote8F3
        ztuuOok7cWuPzpsqylQ0Peai4Lwvpy97JtjN6GoyUrl7z3Wni/y6m3ZnzPceyd1peOvHq/qF
        lR1SW043qdWcSbbQk5zbNuH7RAap1ackV8x2WaK2ZXvI/5p1qhu3ZW16FvMkMLTI3H+pqvv8
        pp7u/s4IZt7e3r9h5f9Zo1kPxm7rO3HP7q7j54zrrdJ7XZYmMyq/m7Qy/Jb+hgfb6n4qv/9Q
        vE2d7/qOBsHw7aEnmx1zVO8HmiruYOZ7YFu0/8AnU7eOu4LpWa7ZbTvsjp4+URe2ZtuKaiWW
        4oxEQy3mouJEAJtJoUmHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsVy+t/xe7oLa7kSDZbNVrPovWNisXHGelaL
        Y21P2C0af+1ltzh/fgO7xeVdc9gsZpzfx2SxaFkrs8XaI3fZHTg9Nq3qZPPo27KK0WPL/s+M
        Hp83yQWwROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        JehlLLw4la2gQ76i//VapgbGbZJdjJwcEgImEv/fnGDpYuTiEBJYyijxZ94fRoiEjMTJaQ2s
        ELawxJ9rXWwQRZ8YJU7euMgMkmATMJToeguS4OQQEUiSuP7kNNgkZoGJTBKTZv4HSwgLeEq8
        OfuHBcRmEVCVaLt/GqyZV8BWovvGGTaIDfISqzccAItzCthJvG36CLZZCKjmyMeXjBMY+RYw
        MqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIDN9tx35u2cG48tVHvUOMTByMhxglOJiVRHhD
        b3AkCvGmJFZWpRblxxeV5qQWH2I0BbpjIrOUaHI+MILySuINzQxMDU3MLA1MLc2MlcR5TY6s
        iRcSSE8sSc1OTS1ILYLpY+LglGpgsmo3E63zqWSb/EV/pYm8UcWkswnldamBd6bwqpyVrr7a
        4rghgfd+S3gmc1VOwqe3UQJMLhs8mU+zPy1dcO/alW87DjR8LtCafrnpifaFSJltLozzlA+d
        LWH/tbN1dTO/d2ftxtW/ci5vmRXwND9Kl0V2Bu/VsJuCGpPW/Lvypr/Gfsv0YM2CN+sq9wUk
        3PlnvJFzd8ZTHZs4hZLD6/icX7/fVmRnu6tnR7DS04stl+MO84m29p8+eHfR0hmffLkbj0et
        fMIj9bgmroAhP8D6xLfVDQrORnbrlgm0S+82El6oySDWeG6x+X1Rx1RWN/3AI8J+gdGrhLKq
        9Vv3R9zmsYtRv8Gx9ui15EOGAveVWIozEg21mIuKEwG0+idn6AIAAA==
X-CMS-MailID: 20210804114433eucas1p255ac5db7e56a8d5e50b8937c07559587
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210804114433eucas1p255ac5db7e56a8d5e50b8937c07559587
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210804114433eucas1p255ac5db7e56a8d5e50b8937c07559587
References: <20210804114421.10282-1-m.szyprowski@samsung.com>
        <CGME20210804114433eucas1p255ac5db7e56a8d5e50b8937c07559587@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Refactor no_clock_gating flag into separate DWC2_POWER_DOWN_PARAM_NONE
power down state.

Suggested-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This is a follow-up of this discussion:
https://lore.kernel.org/linux-usb/26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com/

This should be applied on top of v5.14-rc3.
---
 drivers/usb/dwc2/core.h      | 6 ++----
 drivers/usb/dwc2/core_intr.c | 6 ++++--
 drivers/usb/dwc2/hcd.c       | 8 ++++----
 drivers/usb/dwc2/params.c    | 4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 38b6733d26ec..d590eda952a2 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -382,12 +382,10 @@ enum dwc2_ep0_state {
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
  *			needed.
+ *			(-1) - None
  *			0 - Clock gating (default)
  *			1 - Partial power down
  *			2 - Hibernation
- * @no_clock_gating:	Specifies whether to avoid clock gating feature.
- *			0 - No (use clock gating)
- *			1 - Yes (avoid it)
  * @lpm:		Enable LPM support.
  *			0 - No
  *			1 - Yes
@@ -482,10 +480,10 @@ struct dwc2_core_params {
 	bool external_id_pin_ctl;
 
 	int power_down;
+#define DWC2_POWER_DOWN_PARAM_NONE		(-1)
 #define DWC2_POWER_DOWN_PARAM_CLOCK_GATING	0
 #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
 #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
-	bool no_clock_gating;
 
 	bool lpm;
 	bool lpm_clock_gating;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 660abff1d42b..cdd39199780e 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -556,8 +556,10 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 				 * If neither hibernation nor partial power down are supported,
 				 * clock gating is used to save power.
 				 */
-				if (!hsotg->params.no_clock_gating)
-					dwc2_gadget_enter_clock_gating(hsotg);
+				dwc2_gadget_enter_clock_gating(hsotg);
+				break;
+			case DWC2_POWER_DOWN_PARAM_NONE:
+				break;
 			}
 
 			/*
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 067f2770c2ef..d06bb927a073 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3338,8 +3338,9 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
 		 */
-		if (!hsotg->params.no_clock_gating)
-			dwc2_host_enter_clock_gating(hsotg);
+		dwc2_host_enter_clock_gating(hsotg);
+		break;
+	case DWC2_POWER_DOWN_PARAM_NONE:
 		break;
 	}
 
@@ -4403,8 +4404,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
 		 */
-		if (!hsotg->params.no_clock_gating)
-			dwc2_host_enter_clock_gating(hsotg);
+		dwc2_host_enter_clock_gating(hsotg);
 
 		/* After entering suspend, hardware is not accessible */
 		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index dac26410b575..2ad9f407ca40 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -75,8 +75,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
-	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
-	p->no_clock_gating = true;
+	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 	p->phy_utmi_width = 8;
 }
 
@@ -585,6 +584,7 @@ static void dwc2_check_param_power_down(struct dwc2_hsotg *hsotg)
 	int param = hsotg->params.power_down;
 
 	switch (param) {
+	case DWC2_POWER_DOWN_PARAM_NONE:
 	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 		break;
 	case DWC2_POWER_DOWN_PARAM_PARTIAL:
-- 
2.17.1

