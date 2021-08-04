Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC89FC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE4E760FC4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237819AbhHDLot (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:44:49 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49705 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237757AbhHDLor (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:44:47 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210804114434euoutp02e4a4a6524b14200d8f10cb4a74beac9c~YF9ZEzSDC2436424364euoutp02d
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 11:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210804114434euoutp02e4a4a6524b14200d8f10cb4a74beac9c~YF9ZEzSDC2436424364euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628077474;
        bh=06q/IuPyxi5M60SRMqpAEAHW+0zNfEVbC7soamUbDB4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=loi700XtBrczLF7C8inb6iNVmrk5z9iHIzJfcC1bs+yoGhZYDn4GPzSjB3Nh8yit/
         TPKC6kZoH8GxNBulSC2Vv5x5LaQPgT89uV5Mp8Zu0Sf9yw9zVPIfLpVuItrmUtgK9Y
         QOHYTBbtTqsIYj4pmvs0NEXNlJsEdqf7nb6THD34=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210804114433eucas1p25439a34c18ffa70be4e38cba9dcbef6e~YF9YqB3nD0057700577eucas1p2g;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C1.14.56448.1AD7A016; Wed,  4
        Aug 2021 12:44:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210804114433eucas1p134417b605abeb57728d358fc2f42162b~YF9YKVdnj2735127351eucas1p1y;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210804114433eusmtrp25e4cfdbc5de7a8ac2168cc0ab304421c~YF9YJfqMA1038410384eusmtrp2I;
        Wed,  4 Aug 2021 11:44:33 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-80-610a7da1fbe7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 63.9D.31287.1AD7A016; Wed,  4
        Aug 2021 12:44:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210804114432eusmtip2afd594f7cd3a91a23eff9cbd68a0224f~YF9Xqp_Ma0903309033eusmtip2S;
        Wed,  4 Aug 2021 11:44:32 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Date:   Wed,  4 Aug 2021 13:44:20 +0200
Message-Id: <20210804114421.10282-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87oLa7kSDWZ+07fovWNisXHGelaL
        Y21P2C0af+1ltzh/fgO7xeVdc9gsZpzfx2SxaFkrs8XaI3fZHTg9Nq3qZPPo27KK0WPL/s+M
        Hp83yQWwRHHZpKTmZJalFunbJXBl/OjeyFawyKti8dxLzA2MF2y7GDk5JARMJGYcv8DSxcjF
        ISSwglHi5YFeVpCEkMAXRomPWyIgEp8ZJe7M2sQE03H78BRGiMRyRoljh1ug2oE69l5oB6ti
        EzCU6HrbxQZiiwgkSBzZ/J4ZpIhZoJdJYvr6jcwgCWEBd4mOxQ/B9rEIqEqs+XYIrIFXwFZi
        /fmZzBDr5CVWbzgA1iwh0MohcbutgxEi4SLR9bKfHcIWlnh1fAuULSPxf+d8JoiGZkaJh+fW
        skM4PYwSl5tmQHVbS9w59wtoHQfQTZoS63fpQ4QdJc7uAnmBA8jmk7jxVhAkzAxkTto2nRki
        zCvR0SYEUa0mMev4Ori1By9cgrrZQ2LxsoXQcIyVWH/vFOMERrlZCLsWMDKuYhRPLS3OTU8t
        Ns5LLdcrTswtLs1L10vOz93ECEwLp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nwht7gSBTiTUms
        rEotyo8vKs1JLT7EKM3BoiTOu2vrmnghgfTEktTs1NSC1CKYLBMHp1QD01ybv4lGR66avsg5
        Gmz1+yd/yaHjWdb/NyT89cvZYe2ztXzbDe5v7nzNi9fbd+62WaARp+bqpTS9WmPLss50z8eb
        i7deEo9JXLN8qtm0hcEGi340Tb2l83ir0vWrl6f3aN60ir9xrfRbsFIwo5ft3RN/f6747flL
        VWvC3yX1c/8nbtifHP76MuuSs4lCBRmLinQ+cAafOtAcPPPfxe8u33bc28M8v7znRrjmuboA
        ifyjX/7OqG1cz9HDZcY1yUp0p47NA8viaPnzvZcuse5urzftPFh7caXagqevZCbt5vvdvFZK
        PbwzU9YrzdK+WOeJFWe7nPX/PzzS7oHHTupUH1m78PxcJ/n5jyaxpEWy/FViKc5INNRiLipO
        BACY8cutegMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsVy+t/xe7oLa7kSDWav5LXovWNisXHGelaL
        Y21P2C0af+1ltzh/fgO7xeVdc9gsZpzfx2SxaFkrs8XaI3fZHTg9Nq3qZPPo27KK0WPL/s+M
        Hp83yQWwROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        Jehl/OjeyFawyKti8dxLzA2MF2y7GDk5JARMJG4fnsLYxcjFISSwlFFi0YnP7BAJGYmT0xpY
        IWxhiT/Xutggij4xSizZu4gFJMEmYCjR9RYkwckhIpAkcf3JaRaQImaBiUwSk2b+B0sIC7hL
        dCx+CDaJRUBVYs23Q2BxXgFbifXnZzJDbJCXWL3hAPMERp4FjAyrGEVSS4tz03OLDfWKE3OL
        S/PS9ZLzczcxAsNx27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHe0BsciUK8KYmVValF+fFFpTmp
        xYcYTYH2TWSWEk3OB0ZEXkm8oZmBqaGJmaWBqaWZsZI479a5a+KFBNITS1KzU1MLUotg+pg4
        OKUamHjb4u9m9nStOe8rdIVt4g3f8/ZiZzif3npi89z3eboT+9qKmYo8u569uKtk8EbuaoXN
        M8XvFW8N7qkIMTFN1/Rsvjv/nOwDVuZXsW0ZHnzsUslz2NbVad6M+bOc+6XuwmdXOB+78Hxz
        yDokm9bAZaN5IlVZMJB7Y8GLXJZ/6+1WcDqfLtTyP/IxYH/v9/4f58KW7bz6UkXlhFHH21Lb
        rnJG46evn87gstngNjezxyPe+IHP0c9SjyJ3bYuNniH9o7YwaWM/d8KGEtNFMQeO39x8/qp5
        tmX9rh3ruU9tOTXfmUH+hGqh5NmrXfNtZk6WYk4xPD7d8dOuj1Xpn/evk9ZY6XticopnotEb
        H8Xv8UosxRmJhlrMRcWJAPwEIjvQAgAA
X-CMS-MailID: 20210804114433eucas1p134417b605abeb57728d358fc2f42162b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210804114433eucas1p134417b605abeb57728d358fc2f42162b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210804114433eucas1p134417b605abeb57728d358fc2f42162b
References: <CGME20210804114433eucas1p134417b605abeb57728d358fc2f42162b@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DWC2_POWER_DOWN_PARAM_NONE really means that the driver still uses clock
gating to save power when hardware is not used. Rename the state name to
DWC2_POWER_DOWN_PARAM_CLOCK_GATING to match the driver behavior.

Suggested-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This is a follow-up of this discussion:
https://lore.kernel.org/linux-usb/26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com/

This should be applied on top of v5.14-rc3.
---
 drivers/usb/dwc2/core.h      |  4 ++--
 drivers/usb/dwc2/core_intr.c |  8 ++++----
 drivers/usb/dwc2/hcd.c       | 10 +++++-----
 drivers/usb/dwc2/params.c    | 22 +++++++++++-----------
 drivers/usb/dwc2/platform.c  |  2 +-
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index cb9059a8444b..38b6733d26ec 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -382,7 +382,7 @@ enum dwc2_ep0_state {
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
  *			needed.
- *			0 - No (default)
+ *			0 - Clock gating (default)
  *			1 - Partial power down
  *			2 - Hibernation
  * @no_clock_gating:	Specifies whether to avoid clock gating feature.
@@ -482,7 +482,7 @@ struct dwc2_core_params {
 	bool external_id_pin_ctl;
 
 	int power_down;
-#define DWC2_POWER_DOWN_PARAM_NONE		0
+#define DWC2_POWER_DOWN_PARAM_CLOCK_GATING	0
 #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
 #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
 	bool no_clock_gating;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index a5c52b237e72..660abff1d42b 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -327,7 +327,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
 
 			/* Exit gadget mode clock gating. */
 			if (hsotg->params.power_down ==
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)
 				dwc2_gadget_exit_clock_gating(hsotg, 0);
 		}
 
@@ -438,7 +438,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 
 			/* Exit gadget mode clock gating. */
 			if (hsotg->params.power_down ==
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)
 				dwc2_gadget_exit_clock_gating(hsotg, 0);
 		} else {
 			/* Change to L0 state */
@@ -455,7 +455,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			}
 
 			if (hsotg->params.power_down ==
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)
 				dwc2_host_exit_clock_gating(hsotg, 1);
 
 			/*
@@ -551,7 +551,7 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 					dev_err(hsotg->dev,
 						"enter hibernation failed\n");
 				break;
-			case DWC2_POWER_DOWN_PARAM_NONE:
+			case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 				/*
 				 * If neither hibernation nor partial power down are supported,
 				 * clock gating is used to save power.
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 2a7828971d05..067f2770c2ef 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3333,7 +3333,7 @@ int dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
 			dev_err(hsotg->dev, "enter hibernation failed.\n");
 		spin_lock_irqsave(&hsotg->lock, flags);
 		break;
-	case DWC2_POWER_DOWN_PARAM_NONE:
+	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 		/*
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
@@ -3701,7 +3701,7 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *hsotg, u16 typereq,
 			}
 
 			if (hsotg->params.power_down ==
-			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended)
+			    DWC2_POWER_DOWN_PARAM_CLOCK_GATING && hsotg->bus_suspended)
 				dwc2_host_exit_clock_gating(hsotg, 0);
 
 			pcgctl = dwc2_readl(hsotg, PCGCTL);
@@ -4398,7 +4398,7 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
 		/* After entering suspend, hardware is not accessible */
 		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 		break;
-	case DWC2_POWER_DOWN_PARAM_NONE:
+	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 		/*
 		 * If not hibernation nor partial power down are supported,
 		 * clock gating is used to save power.
@@ -4482,7 +4482,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
 		 */
 		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 		break;
-	case DWC2_POWER_DOWN_PARAM_NONE:
+	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 		/*
 		 * If not hibernation nor partial power down are supported,
 		 * port resume is done using the clock gating programming flow.
@@ -4680,7 +4680,7 @@ static int _dwc2_hcd_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 				"exit partial_power_down failed\n");
 	}
 
-	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_CLOCK_GATING &&
 	    hsotg->bus_suspended) {
 		if (dwc2_is_device_mode(hsotg))
 			dwc2_gadget_exit_clock_gating(hsotg, 0);
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 59e119345994..dac26410b575 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -68,14 +68,14 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 <<
 		GAHBCFG_HBSTLEN_SHIFT;
 	p->change_speed_quirk = true;
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 }
 
 static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 	p->no_clock_gating = true;
 	p->phy_utmi_width = 8;
 }
@@ -90,7 +90,7 @@ static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
 	p->host_perio_tx_fifo_size = 256;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 <<
 		GAHBCFG_HBSTLEN_SHIFT;
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 }
 
 static void dwc2_set_ltq_params(struct dwc2_hsotg *hsotg)
@@ -120,7 +120,7 @@ static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR8 <<
 		GAHBCFG_HBSTLEN_SHIFT;
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 }
 
 static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
@@ -179,7 +179,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->activate_stm_fs_transceiver = true;
 	p->activate_stm_id_vb_detection = true;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 	p->host_support_fs_ls_low_power = true;
 	p->host_ls_low_power_phy_clk = true;
 }
@@ -194,7 +194,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 	p->host_nperio_tx_fifo_size = 256;
 	p->host_perio_tx_fifo_size = 256;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
-	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->power_down = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 	p->lpm = false;
 	p->lpm_clock_gating = false;
 	p->besl = false;
@@ -339,7 +339,7 @@ static void dwc2_set_param_power_down(struct dwc2_hsotg *hsotg)
 	else if (hsotg->hw_params.power_optimized)
 		val = DWC2_POWER_DOWN_PARAM_PARTIAL;
 	else
-		val = DWC2_POWER_DOWN_PARAM_NONE;
+		val = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 
 	hsotg->params.power_down = val;
 }
@@ -585,27 +585,27 @@ static void dwc2_check_param_power_down(struct dwc2_hsotg *hsotg)
 	int param = hsotg->params.power_down;
 
 	switch (param) {
-	case DWC2_POWER_DOWN_PARAM_NONE:
+	case DWC2_POWER_DOWN_PARAM_CLOCK_GATING:
 		break;
 	case DWC2_POWER_DOWN_PARAM_PARTIAL:
 		if (hsotg->hw_params.power_optimized)
 			break;
 		dev_dbg(hsotg->dev,
 			"Partial power down isn't supported by HW\n");
-		param = DWC2_POWER_DOWN_PARAM_NONE;
+		param = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 		break;
 	case DWC2_POWER_DOWN_PARAM_HIBERNATION:
 		if (hsotg->hw_params.hibernation)
 			break;
 		dev_dbg(hsotg->dev,
 			"Hibernation isn't supported by HW\n");
-		param = DWC2_POWER_DOWN_PARAM_NONE;
+		param = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 		break;
 	default:
 		dev_err(hsotg->dev,
 			"%s: Invalid parameter power_down=%d\n",
 			__func__, param);
-		param = DWC2_POWER_DOWN_PARAM_NONE;
+		param = DWC2_POWER_DOWN_PARAM_CLOCK_GATING;
 		break;
 	}
 
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c8f18f3ba9e3..7bd8fb6c1378 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -342,7 +342,7 @@ static int dwc2_driver_remove(struct platform_device *dev)
 	}
 
 	/* Exit clock gating when driver is removed. */
-	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_CLOCK_GATING &&
 	    hsotg->bus_suspended) {
 		if (dwc2_is_device_mode(hsotg))
 			dwc2_gadget_exit_clock_gating(hsotg, 0);
-- 
2.17.1

