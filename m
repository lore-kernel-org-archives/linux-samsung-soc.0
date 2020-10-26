Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34296C56201
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 00:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED1B20809
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 23:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603756799;
	bh=ds9DF3uL2XMQtK6TidDdAo8vna0q+6iyJPyCByNMttw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nMwkPptiXD9AB9lj8ZWNJ5HoHexkNt4dKRimqNJRuGMng3lsnWmBUPinalLmsxbZn
	 0gdgQXcUXwRainnirZhUFST0U5AwDpTYF8O3u9uFBlkLnUkwUnwqmTLZHK2f5Z3y/8
	 JOoKWpDAX++xNVxEn3cKeyjcKalxSp9x2/OZNK9Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410902AbgJZX7m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:59:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436608AbgJZX4t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:56:49 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0F3F2151B;
        Mon, 26 Oct 2020 23:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756608;
        bh=ds9DF3uL2XMQtK6TidDdAo8vna0q+6iyJPyCByNMttw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LIYd+oJhJvaVVwxOdn2+ufBFY8Jwi/zGL1lW88zD+G6mCyYTT0YWVM53VxZNdLRIe
         qaCOgT9LyIERCajoTgzuJrlamx891J/H+yFGCY17szEnQ7XzafOh0IwWEW7w2Z82F4
         qKXwgBARPXTOKtdeFDllfScjQ4i5X1FhL8QDcmY8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 76/80] ARM: dts: s5pv210: move PMU node out of clock controller
Date:   Mon, 26 Oct 2020 19:55:12 -0400
Message-Id: <20201026235516.1025100-76-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235516.1025100-1-sashal@kernel.org>
References: <20201026235516.1025100-1-sashal@kernel.org>
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
index ec41e46edaced..f10139bd80a53 100644
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

