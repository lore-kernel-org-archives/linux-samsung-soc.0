From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH 0/2] usb: ohci: s3c2410: add device tree support
Date: Fri, 25 Nov 2016 12:47:27 -0200
Message-ID: <1480085249-25014-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35825 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754599AbcKYOsK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 09:48:10 -0500
Received: by mail-qk0-f193.google.com with SMTP id n204so5215709qke.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2016 06:48:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, stern@rowland.harvard.edu, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>

This series adds support for configuring Samsung's s3c2410 and
compatible USB OHCI controller via devicetree.

Tested on FriendlyARM mini2440, based on s3c2440 SoC.

Sergio Prado (2):
  dt-bindings: usb: add DT binding for s3c2410 USB OHCI controller
  usb: ohci: s3c2410: allow probing from device tree

 .../devicetree/bindings/usb/s3c2410-usb.txt        | 22 ++++++++++++++++++++++
 drivers/usb/host/ohci-s3c2410.c                    |  8 ++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

-- 
1.9.1
