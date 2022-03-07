Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F47C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiCGIv4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbiCGIvz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:51:55 -0500
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5B110D1;
        Mon,  7 Mar 2022 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646643061;
  x=1678179061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bVG6vwdlcHFBo+UrFcLHvLdJ2KogK7OxC3zq2iPwzuk=;
  b=DE01NczPkB923mIOMYfvrljSBf5CIeX3XFjyUL2GIJhR0KwOjMS7pzdT
   pIQP4vZ+eGVRPs3kJepYI0stYqxckTStcNFiuHk2t0xwvKbnFg4ncCehx
   HfJ2KF0kvI3NUEOHfd1U1vcBV0IMqzIoLmvO2r3nz9VhJwXWxhyOzPv9p
   +WrG7vxQHUiq/qbZJUghY+vAsF0pd1LIpnkKxiFDzuelUPcI+wHyc1fbn
   vtIDqMqwZNz4vHYfdVy09SIkBQsWnmK8YXnpJloppqNMXvvT80hMt/Jhy
   WUTj5ohx/C0GP9TN5ssXeSQTZw1YMVw+b3c2Q2F6jkd/CVYczUlRtmWqJ
   g==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <krzysztof.kozlowski@canonical.com>
CC:     <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <alim.akhtar@samsung.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 0/2] Add support for ARTPEC-8 UART
Date:   Mon, 7 Mar 2022 09:50:51 +0100
Message-ID: <20220307085053.1636475-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series adds support for the UART hardware on the ARTPEC-8 chip.  This
block is already supported by an existing driver so only a small patch to
describe the properties of the variant is required.

Vincent Whitchurch (2):
  dt-bindings: serial: samsung: Add ARTPEC-8 UART
  tty: serial: samsung: Add ARTPEC-8 support

 .../bindings/serial/samsung_uart.yaml         |  1 +
 drivers/tty/serial/Kconfig                    |  2 +-
 drivers/tty/serial/samsung_tty.c              | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.34.1

