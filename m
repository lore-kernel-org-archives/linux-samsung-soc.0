Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963B7C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 05:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6193E613E8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 05:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhGPFEa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jul 2021 01:04:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29737 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhGPFEa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jul 2021 01:04:30 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210716050134euoutp01b8093b39b4081b75a6957a7f7431b4c2~SLNGoA5up0523605236euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2021 05:01:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210716050134euoutp01b8093b39b4081b75a6957a7f7431b4c2~SLNGoA5up0523605236euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1626411694;
        bh=tlnKnhtiuN5X69bO+zZbqtZ5WXVcvvkwRcRObs1MPDY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=iJ4j4jRPItwyKhnYGRLBU19LK0E3pyJsvJ4ld1V6eZnbp8+k+l3sQqst9hUXjOYrp
         tyu2ebV9il0VM+ecWFWHXk/Jo9+2GVAU/Ybm2fRW4lUqT5ed+lzcY9queAj6EhxgTS
         iYaKdmsQmRZUV4L79Pv6gG36kErtGZExgo2lZXmU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210716050133eucas1p1a8635c11b814b4b831610b2febd77f93~SLNGJ9k7I2287522875eucas1p1H;
        Fri, 16 Jul 2021 05:01:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 56.60.42068.DA211F06; Fri, 16
        Jul 2021 06:01:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23~SLNFIrIWE0138901389eucas1p2x;
        Fri, 16 Jul 2021 05:01:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210716050132eusmtrp1e7e85bfbdd812b3043d7b211ef2958c9~SLNFH_zkQ1937119371eusmtrp1k;
        Fri, 16 Jul 2021 05:01:32 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-a0-60f112ad36d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.14.20981.CA211F06; Fri, 16
        Jul 2021 06:01:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210716050132eusmtip1e14cbdb21a1f293aacdd2cb276f51aed~SLNEnnoAG0836508365eusmtip1U;
        Fri, 16 Jul 2021 05:01:32 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Date:   Fri, 16 Jul 2021 07:01:27 +0200
Message-Id: <20210716050127.4406-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7djPc7prhT4mGPxsMbDovWNisXHGelaL
        +TeTLBp/7WW3OH9+A7vF5V1z2CxmnN/HZLFoWSuzxdojd9kdOD02repk85h3MtCjb8sqRo8t
        +z8zenzeJBfAGsVlk5Kak1mWWqRvl8CVcXNeN1PBbpmK88v/MjcwzhfvYuTkkBAwkfjes465
        i5GLQ0hgBaNET8sURpCEkMAXRonLn60g7M+MEk0TGWEa1u9dygjRsJxRYsbCDlYIB6jhwok5
        LCBVbAKGEl1vu9hAbBGBBIkjm98zg9jMAjOZJLqmCoDYwgK2EuvXLGQHsVkEVCWWfz3JCmLz
        CthIrPm0nQVim7zE6g0HwM6TEOjlkPi0dT07RMJF4ubSg1BFwhKvjm+BistInJ7cwwLR0Mwo
        8fDcWnYIpwfon6YZUE9YS9w59wvoPA6gkzQl1u/Shwg7Srye18kKEpYQ4JO48VYQ4mg+iUnb
        pjNDhHklOtqEIKrVJGYdXwe39uCFS8wQtofEzqWzoaEYK/Hi40+2CYxysxB2LWBkXMUonlpa
        nJueWmyUl1quV5yYW1yal66XnJ+7iRGYGE7/O/5lB+PyVx/1DjEycTAeYpTgYFYS4V1q9DZB
        iDclsbIqtSg/vqg0J7X4EKM0B4uSOG/SljXxQgLpiSWp2ampBalFMFkmDk6pBqZex78ikxW2
        LRL8FXW32F8vmKMsjGvV57YvKwoSS7fs3HdGIX9e7zHfzsNdru8zJwUIyCSm8f5naH11fUm3
        3Roxiy8CodZeXhdXHdaeved4aGYj/2YPrc2Xlqxesbp7bsefC/OUZ39inK77NnLrJ7c2y+Sc
        By/uzNbe9/365QmGHIf0J7IXXnTRbN4no3vw6+OZmzLnr3lexhXrfjWmKmzLNEuFsu3yp+/U
        7l59WrN8EdeHEoFdGv4euw7kCKj/U/q3Q+R51eQTJW2Z7j+PLPivsPeWBO8moYqMToY/m74V
        XzU9ncvNtW6v0zrdfxba5xrC6l5tMygT8n7R68/W5vaR+QGD/fElPjrv/WwrS84osRRnJBpq
        MRcVJwIAohL+33sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xu7prhD4mGLzt17DovWNisXHGelaL
        +TeTLBp/7WW3OH9+A7vF5V1z2CxmnN/HZLFoWSuzxdojd9kdOD02repk85h3MtCjb8sqRo8t
        +z8zenzeJBfAGqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mW
        WqRvl6CXcXNeN1PBbpmK88v/MjcwzhfvYuTkkBAwkVi/dyljFyMXh5DAUkaJx32L2CASMhIn
        pzWwQtjCEn+udbFBFH1ilLh/4jMzSIJNwFCi620XWIOIQJLE9SenWUCKmAXmMkl8n/cLrFtY
        wFZi/ZqF7CA2i4CqxPKvJ8HivAI2Ems+bWeB2CAvsXrDAeYJjDwLGBlWMYqklhbnpucWG+kV
        J+YWl+al6yXn525iBAbltmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8S43eJgjxpiRWVqUW5ccX
        leakFh9iNAXaN5FZSjQ5HxgXeSXxhmYGpoYmZpYGppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB
        9DFxcEo1MM081CKdLaOoWvVpifqWjuOzONn1m98KSO65+OJmUFniQfHVz17P9tnSdu7dNs8f
        EY/ubdbkmfpddYL+/JSPiivk3drUzcV3eJ9V+O9yao3fS+bmF7IfHh6e61m55v7fjbv/R7Zn
        i+rdF7qdVcM9edexf+xyc7bwvoi2Xdjz/ed6v71XZnpcvufft2XaF5slDRutNlWtYEptmPQw
        7a5t7pWtHao8Mj327toHJbUd/qq4VZl8eP98w9bJZom9ykbnb7/YytbR0uEktp/TPPlduKNv
        4Ja8TJ67+jZeD5acPPqq4/jmS7lf5px9cm5JsEDd1SWPblQFfYiynntb44bn35nbuq6KfJ/w
        yDjTl/PDTh8GJZbijERDLeai4kQAy8uLwtMCAAA=
X-CMS-MailID: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
function.") changed the way the driver handles power down modes in a such
way that it uses clock gating when no other power down mode is available.

This however doesn't work well on the DWC2 implementation used on the
Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
the proper clock gating requires some additional glue code in the shared
USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
operation on the Samsung SoCs simply skip enabling clock gating mode
until one finds what is really needed to make it working reliably.

Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h      | 4 ++++
 drivers/usb/dwc2/core_intr.c | 3 ++-
 drivers/usb/dwc2/hcd.c       | 6 ++++--
 drivers/usb/dwc2/params.c    | 1 +
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index ab6b815e0089..483de2bbfaab 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -383,6 +383,9 @@ enum dwc2_ep0_state {
  *			0 - No (default)
  *			1 - Partial power down
  *			2 - Hibernation
+ * @no_clock_gating:	Specifies whether to avoid clock gating feature.
+ *			0 - No (use clock gating)
+ *			1 - Yes (avoid it)
  * @lpm:		Enable LPM support.
  *			0 - No
  *			1 - Yes
@@ -480,6 +483,7 @@ struct dwc2_core_params {
 #define DWC2_POWER_DOWN_PARAM_NONE		0
 #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
 #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
+	bool no_clock_gating;
 
 	bool lpm;
 	bool lpm_clock_gating;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index a5ab03808da6..a5c52b237e72 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -556,7 +556,8 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 				 * If neither hibernation nor partial power down are supported,
 				 * clock gating is used to save power.
 				 */
-				dwc2_gadget_enter_clock_gating(hsotg);
+				if (!hsotg->params.no_clock_gating)
+					dwc2_gadget_enter_clock_gating(hsotg);
 			}
 
 			/*
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 035d4911a3c3..2a7828971d05 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3338,7 +3338,8 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
 		 */
-		dwc2_host_enter_clock_gating(hsotg);
+		if (!hsotg->params.no_clock_gating)
+			dwc2_host_enter_clock_gating(hsotg);
 		break;
 	}
 
@@ -4402,7 +4403,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
 		 */
-		dwc2_host_enter_clock_gating(hsotg);
+		if (!hsotg->params.no_clock_gating)
+			dwc2_host_enter_clock_gating(hsotg);
 
 		/* After entering suspend, hardware is not accessible */
 		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 67c5eb140232..59e119345994 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 	struct dwc2_core_params *p = &hsotg->params;
 
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->no_clock_gating = true;
 	p->phy_utmi_width = 8;
 }
 
-- 
2.17.1

