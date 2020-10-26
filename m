Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02F4C63777
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 650D921D42
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603758660;
	bh=xqDwpo2dA//CpS9TXgscxwx4pAuGxQncwa0ySR7ftn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gA4syVaE/ZAouBUJWRVFhiEY5FktAMM5PZEFJJTDY8nS3l6Fekvh4k2LEx21Fxpc/
	 6hVr5T/XC5ZQsfwu8qZYpMglV6Uzqiz/NFpZHVwR2w7GmVUJfapFilvvSfE3YNKJQe
	 Y9ZsQ20ONW5f6qkjkWsUF5Bes0kqX03lKHNzQ6nE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409588AbgJZXv6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:51:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409581AbgJZXv5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:51:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2D7E21655;
        Mon, 26 Oct 2020 23:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756316;
        bh=xqDwpo2dA//CpS9TXgscxwx4pAuGxQncwa0ySR7ftn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m0QSQCwuLdVVkeqsPmRzfO58eGiBi1nca5tjfy5jN2ocV+XkneQa1rB78pCHKazpF
         qerfamiH6FjI2IsAsAY7h2229/vSO9B/YaNpmsii8G0Cwt8MJEH1uZhZ2+IWSMow3E
         kJvO7Bjz3SDldr3967E7D1evJkfcwi7GQv1hVpSQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 139/147] ARM: dts: s5pv210: align SPI GPIO node name with dtschema in Aries
Date:   Mon, 26 Oct 2020 19:48:57 -0400
Message-Id: <20201026234905.1022767-139-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 1ed7f6d0bab2f1794f1eb4ed032e90575552fd21 ]

The device tree schema expects SPI controller to be named "spi",
otherwise dtbs_check complain with a warning like:

  spi-gpio-0: $nodename:0: 'spi-gpio-0' does not match '^spi(@.*|-[0-9a-f])*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-25-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index 8a98b35b9b0de..3762098233c0c 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -545,7 +545,7 @@ poweroff: syscon-poweroff {
 		value = <0x5200>;
 	};
 
-	spi_lcd: spi-gpio-0 {
+	spi_lcd: spi-2 {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.25.1

