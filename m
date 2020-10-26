Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C17C64E69
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:31:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14A75218AC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603758661;
	bh=4KVjfQDPy0GeRE2oqdeGM9vZ0LxghZIwXZj4yZWU8Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=y6re3Bj057fff1EBXr6mOzAo8zu8Xge3G8PzgHO34fj76LLHh6QNtOWXHFt964iF6
	 4hi7Zm69RSEEpyTg7YcnLoty57FH73EE+GRX/6LSlHoxeRC3td5L5Klz7OEoTYgFtb
	 +OOYI5bAF9GW/iT5oh1fMX5jmNrKQfTVNwADPiKk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409579AbgJZXv4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:51:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409569AbgJZXv4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:51:56 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 898F221D7B;
        Mon, 26 Oct 2020 23:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756315;
        bh=4KVjfQDPy0GeRE2oqdeGM9vZ0LxghZIwXZj4yZWU8Lo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AJe21st8DPmLrUGEaMiK2orNfb+rW4oHdL5YBQCDdcwbSXy+Vi8Sc6HNMQu8bdj6F
         fO98rFwERI8inEwf8uR/T1D88hAt9rWKDLSD8yO3hUi1HHDh9cZMI3tjPKZ/UAklua
         B3MYdrXpBh5TRm34xiNXTdg5OR2louZnD6D1fVCY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 138/147] ARM: dts: s5pv210: add RTC 32 KHz clock in Aries family
Date:   Mon, 26 Oct 2020 19:48:56 -0400
Message-Id: <20201026234905.1022767-138-sashal@kernel.org>
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

[ Upstream commit 086c4498b0cc87fdb09188f3da7056e898814948 ]

The S3C RTC requires 32768 Hz clock as input which is provided by PMIC.
However there is no such clock provider but rather a regulator driver
which registers the clock as a regulator.  This is an old driver which
will not be updated so add a workaround - a fixed-clock to fill missing
clock phandle reference in S3C RTC.

This fixes dtbs_check warnings:

  rtc@e2800000: clocks: [[2, 145]] is too short
  rtc@e2800000: clock-names: ['rtc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-12-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210-aries.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index a3f83f668ce14..8a98b35b9b0de 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -47,6 +47,13 @@ mfc_right: region@51000000 {
 		};
 	};
 
+	pmic_ap_clk: clock-0 {
+		/* Workaround for missing clock on PMIC */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	bt_codec: bt_sco {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <0>;
@@ -825,6 +832,11 @@ &pwm {
 	samsung,pwm-outputs = <1>;
 };
 
+&rtc {
+	clocks = <&clocks CLK_RTC>, <&pmic_ap_clk>;
+	clock-names = "rtc", "rtc_src";
+};
+
 &sdhci1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.25.1

