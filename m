Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C058C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Aug 2021 19:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7280610FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Aug 2021 19:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhHMTxW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Aug 2021 15:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbhHMTxS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 15:53:18 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE16C0612AF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w14so16830648pjh.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmecue9QUeQLjEjIx40ol9W8NZeTwwWyqVOpKPEfJgQ=;
        b=h4+g/p4zliff4K3/cjL/A4A5SmFQmvVCsuFj25M74PywK8belHVLPd84mufDGOc99Y
         fGqjxwCyRuccst5WNCdAUE7ch+nbURpFjSg5atf2Zf3WWduE4FhEogoZV2doYILpzEL7
         xHYipN658PX7IqYoLi7fOn+uDM2MVYnWBKC7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmecue9QUeQLjEjIx40ol9W8NZeTwwWyqVOpKPEfJgQ=;
        b=rp0MWBnT7R76QG+wJbwy2suJUCq5bL9VBPSs+iNryyKBCZkuv+Lhtvu3/085niWPit
         T99wG5/PgNuiaiLMfmHMUeiF1qK8PYa7uPs9a82Dhqod+xAJPlRFZ/iUvxV5wr9ONE2/
         2EtfBYKyQFxbSD80SxlnyEEgKWb87omM7btcLdYtg1l9/uGLwVoZ/Fb03I6cyG6DXzGz
         MtobVogm2XEMGKTY6LQnmvdLG7mzKUn7GsAe7x9r0lb5WidnQqQWWNXqIrZlo/fAbSly
         2bb2cxpgSp1B6SKhAu5u2/W7G2KZGzCtex2tQW3xmu6dGaFh2OmIP/zwkwL9LV2NA+Ii
         +w8Q==
X-Gm-Message-State: AOAM533IjACZauWXaRAC8Ex2ts665T2cDGqKB4pls7ullLIG84JsX6xh
        c+Fraq8tUTBXqtHwtim3D0xXZg==
X-Google-Smtp-Source: ABdhPJzOWOlsavcCtPw0JA3mrby5b3cV4By0+SKQ6t9340axfGaaw4art/RyEN/KJya669RhN3muMg==
X-Received: by 2002:a65:4581:: with SMTP id o1mr3695529pgq.349.1628884369112;
        Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:450d:9788:a70e:42d6])
        by smtp.gmail.com with UTF8SMTPSA id ca7sm2554886pjb.11.2021.08.13.12.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:52:48 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
Date:   Fri, 13 Aug 2021 12:52:26 -0700
Message-Id: <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
References: <20210813195228.2003500-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some USB controller drivers that depend on the xhci-plat driver
specify this dependency using 'select' in Kconfig. This is not
recommended for symbols that have other dependencies as it may
lead to invalid configurations. Use 'depends on' to specify the
dependency instead of 'select'.

For dwc3 specify the dependency on USB_XHCI_PLATFORM in
USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
dependencies of USB_DWC3_CORE to make sure that at least one
of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
selected.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v16:
- none

Changes in v15:
- adjusted dependencies of USB_DWC3_CORE to make sure it can only
  be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
  or USB_DWC3_DUAL_ROLE is selectable
- updated commit message

Changes in v14:
- none

Changes in v13:
- patch added to the series

 drivers/usb/cdns3/Kconfig | 2 +-
 drivers/usb/dwc3/Kconfig  | 5 +++--
 drivers/usb/host/Kconfig  | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index b98ca0a1352a..07e12f786d48 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,7 +1,7 @@
 config USB_CDNS_SUPPORT
 	tristate "Cadence USB Support"
 	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_ROLE_SWITCH
 	help
 	  Say Y here if your system has a Cadence USBSS or USBSSP
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 66b1454c4db2..870f2251350a 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -2,8 +2,7 @@
 
 config USB_DWC3
 	tristate "DesignWare USB3 DRD Core Support"
-	depends on (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA
 	select USB_ROLE_SWITCH if USB_DWC3_DUAL_ROLE
 	help
 	  Say Y or M here if your system has a Dual Role SuperSpeed
@@ -30,6 +29,7 @@ choice
 config USB_DWC3_HOST
 	bool "Host only mode"
 	depends on USB=y || USB=USB_DWC3
+	depends on USB_XHCI_PLATFORM
 	help
 	  Select this when you want to use DWC3 in host mode only,
 	  thereby the gadget feature will be regressed.
@@ -44,6 +44,7 @@ config USB_DWC3_GADGET
 config USB_DWC3_DUAL_ROLE
 	bool "Dual Role mode"
 	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
+	depends on USB_XHCI_PLATFORM
 	depends on (EXTCON=y || EXTCON=USB_DWC3)
 	help
 	  This is the default mode of working of DWC3 controller where
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index df9428f1dc5e..518c2312ef0c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -80,7 +80,7 @@ config USB_XHCI_MTK
 
 config USB_XHCI_MVEBU
 	tristate "xHCI support for Marvell Armada 375/38x/37xx"
-	select USB_XHCI_PLATFORM
+	depends on USB_XHCI_PLATFORM
 	depends on HAS_IOMEM
 	depends on ARCH_MVEBU || COMPILE_TEST
 	help
@@ -112,9 +112,9 @@ config USB_EHCI_BRCMSTB
 config USB_BRCMSTB
 	tristate "Broadcom STB USB support"
 	depends on (ARCH_BRCMSTB && PHY_BRCM_USB) || COMPILE_TEST
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_BRCMSTB if USB_EHCI_HCD
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	help
 	  Enables support for XHCI, EHCI and OHCI host controllers
 	  found in Broadcom STB SoC's.
-- 
2.33.0.rc1.237.g0d66db33f3-goog

