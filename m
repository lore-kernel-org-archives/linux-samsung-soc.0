Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A154AC55178
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635A420780
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603758180;
	bh=olfPI7k9lj6uw5SfddY8q38Z540EwleMSau/CmqvOZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WGgMjaBgwYwmO3Y1V1XSKhiltzFYoA/ujZ0/h8pn5Aq55hAAMxID48YaK/KFs9ivy
	 ksZ47qMpCVy8wiyREId3XQdpE01WZrVo1uu2yxzMG7p1QIWKsk2FJwc4Fss5qh/2+E
	 0fLCcc3wQy2dFkyrl08n9CP3uUG4BCfq+4PWodyM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410288AbgJZXzg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:55:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410545AbgJZXym (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:54:42 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36D0C20B1F;
        Mon, 26 Oct 2020 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756482;
        bh=olfPI7k9lj6uw5SfddY8q38Z540EwleMSau/CmqvOZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hIsw5/NVmN0KkclhaRMuxwQJR5ywHaVvHeZRwsZx0FBBnUIROZt9c/ZmbTNnW4OVa
         /2zyQQvMsUUkpCmdc2atLLPN+Zp91dchfWfD7Npd1rFCzEfcqHP7HGqQTOYnbxEIBt
         Ma8ICksuNOVRHHUj+Bzbz8a8TwLd1vylkohmJN7w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 125/132] ARM: dts: s5pv210: move PMU node out of clock controller
Date:   Mon, 26 Oct 2020 19:51:57 -0400
Message-Id: <20201026235205.1023962-125-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit bb98fff84ad1ea321823759edaba573a16fa02bd ]

The Power Management Unit (PMU) is a separate device which has little
common with clock controller.  Moving it to one level up (from clock
controller child to SoC) allows to remove fake simple-bus compatible and
dtbs_check warnings like:

  clock-controller@e0100000: $nodename:0:
    'clock-controller@e0100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Jonathan Bakker <xc-racer2@live.ca>
Link: https://lore.kernel.org/r/20200907161141.31034-8-krzk@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 5c760a6d79557..46221a5c8ce59 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -92,19 +92,16 @@ chipid@e0000000 {
 		};
 
 		clocks: clock-controller@e0100000 {
-			compatible = "samsung,s5pv210-clock", "simple-bus";
+			compatible = "samsung,s5pv210-clock";
 			reg = <0xe0100000 0x10000>;
 			clock-names = "xxti", "xusbxti";
 			clocks = <&xxti>, <&xusbxti>;
 			#clock-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+		};
 
-			pmu_syscon: syscon@e0108000 {
-				compatible = "samsung-s5pv210-pmu", "syscon";
-				reg = <0xe0108000 0x8000>;
-			};
+		pmu_syscon: syscon@e0108000 {
+			compatible = "samsung-s5pv210-pmu", "syscon";
+			reg = <0xe0108000 0x8000>;
 		};
 
 		pinctrl0: pinctrl@e0200000 {
-- 
2.25.1

