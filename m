Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE204C61DD8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E5F320723
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603758025;
	bh=Lp2xwrseE5WnFsU0jHEpe0ZRwzQFgONFTc+5WiDidNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=wesFAPlHLiH2HdiAsgy7fnVhL3rWkGS3rS8Fu0QMl24K5xxsskp6/8E8UUBSoRY2b
	 oaXmuuum7w93kt9M4dDyt8u3E3PVWbgmPn51nBRrj93+3bSsy9YEugIi3LsT9DKqPj
	 Y1SzS7ak0jCYESeJWlJ36wj63yf/rYp8NQIgpgVE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438795AbgJ0AGm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 20:06:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:54310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438241AbgJ0AFX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 20:05:23 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4080320754;
        Tue, 27 Oct 2020 00:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603757123;
        bh=Lp2xwrseE5WnFsU0jHEpe0ZRwzQFgONFTc+5WiDidNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=THQZOJxLkdbDm/xSvy5bPaRmcM8g539z5FFjK3mFru4oFCVXscOEzxO648bSplfz8
         SG0Sn6yHRwi6jOcBCIQNfQstILn2eAvgU3WcDwGjxFYqBVgksloG6/vPfVKZQNu34V
         0LBewymO2ZmsLuRSshPmKnqSOwBuvLqw/YeZMugM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 57/60] ARM: dts: s5pv210: remove dedicated 'audio-subsystem' node
Date:   Mon, 26 Oct 2020 20:04:12 -0400
Message-Id: <20201027000415.1026364-57-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000415.1026364-1-sashal@kernel.org>
References: <20201027000415.1026364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 6c17a2974abf68a58517f75741b15c4aba42b4b8 ]

The 'audio-subsystem' node is an artificial creation, not representing
real hardware.  The hardware is described by its nodes - AUDSS clock
controller and I2S0.

Remove the 'audio-subsystem' node along with its undocumented compatible
to fix dtbs_check warnings like:

  audio-subsystem: $nodename:0: 'audio-subsystem' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-9-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 65 +++++++++++++++-------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 37d251b1f74a7..020a864623ff4 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -217,43 +217,36 @@ i2c2: i2c@e1a00000 {
 			status = "disabled";
 		};
 
-		audio-subsystem {
-			compatible = "samsung,s5pv210-audss", "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			clk_audss: clock-controller@eee10000 {
-				compatible = "samsung,s5pv210-audss-clock";
-				reg = <0xeee10000 0x1000>;
-				clock-names = "hclk", "xxti",
-						"fout_epll",
-						"sclk_audio0";
-				clocks = <&clocks DOUT_HCLKP>, <&xxti>,
-						<&clocks FOUT_EPLL>,
-						<&clocks SCLK_AUDIO0>;
-				#clock-cells = <1>;
-			};
+		clk_audss: clock-controller@eee10000 {
+			compatible = "samsung,s5pv210-audss-clock";
+			reg = <0xeee10000 0x1000>;
+			clock-names = "hclk", "xxti",
+				      "fout_epll",
+				      "sclk_audio0";
+			clocks = <&clocks DOUT_HCLKP>, <&xxti>,
+				 <&clocks FOUT_EPLL>,
+				 <&clocks SCLK_AUDIO0>;
+			#clock-cells = <1>;
+		};
 
-			i2s0: i2s@eee30000 {
-				compatible = "samsung,s5pv210-i2s";
-				reg = <0xeee30000 0x1000>;
-				interrupt-parent = <&vic2>;
-				interrupts = <16>;
-				dma-names = "rx", "tx", "tx-sec";
-				dmas = <&pdma1 9>, <&pdma1 10>, <&pdma1 11>;
-				clock-names = "iis",
-						"i2s_opclk0",
-						"i2s_opclk1";
-				clocks = <&clk_audss CLK_I2S>,
-						<&clk_audss CLK_I2S>,
-						<&clk_audss CLK_DOUT_AUD_BUS>;
-				samsung,idma-addr = <0xc0010000>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&i2s0_bus>;
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
+		i2s0: i2s@eee30000 {
+			compatible = "samsung,s5pv210-i2s";
+			reg = <0xeee30000 0x1000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <16>;
+			dma-names = "rx", "tx", "tx-sec";
+			dmas = <&pdma1 9>, <&pdma1 10>, <&pdma1 11>;
+			clock-names = "iis",
+				      "i2s_opclk0",
+				      "i2s_opclk1";
+			clocks = <&clk_audss CLK_I2S>,
+				 <&clk_audss CLK_I2S>,
+				 <&clk_audss CLK_DOUT_AUD_BUS>;
+			samsung,idma-addr = <0xc0010000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
 		};
 
 		i2s1: i2s@e2100000 {
-- 
2.25.1

