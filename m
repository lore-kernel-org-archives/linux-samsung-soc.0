Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDDCC54EB4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Jan 2023 12:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjAVMPu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 Jan 2023 07:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjAVMPt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Jan 2023 07:15:49 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15C71ABD1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jan 2023 04:15:48 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso8766745wmc.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jan 2023 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYzBOFIiirkmqMZWjpo+uYx1+JPy1KYoRNQwi1+AmGY=;
        b=Uj/oOib5AsGrBWAYgFvNZIv9WdtsxocVc6DdiOF1wLCOXWYJlLB0T9w03A/a3nLWnF
         flwjaPuhcf62F6iKuU+vitZgZxqYXau/HeGwWoUmHkPb53pX0xEc/kEa3e5wWWFHA6Sb
         zeqFLjpeKh6HCXlhkhGm08VugSwhTfEs96DEvg6YfDAPJ2fWgG1KiGQbt7vc1fx1BmCs
         j5dBCsO/5N3HdNB97xFgYgAcdANtkAD9B/WgEfklkzxU05LUE6X/HxBSVvC1Tzk1v21U
         zKn1Y7qJuTPG8CzF74bcbbZixSU/8E1vL6M7QrwmlDz5+JmSzzfz1j+Vf9h8z2jnrqXD
         WKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYzBOFIiirkmqMZWjpo+uYx1+JPy1KYoRNQwi1+AmGY=;
        b=TZMiQiE8tfmpHaXNYUP/wYfqA88ITcPLWHy6VRqSUPwqn+aGAbhUlR5HESdnoiDfXZ
         NIzWOih9hcmJ9gefLYUAnGKxMT1pf21jgrLGGamxxF4WlCZ+qiaBMhEZZMoUW27Vz4R0
         A4gPD+voEz7eSqrefd75pZGssvsbi5QyV0Yv8mgWy/en26ai7BWXWePcdA5EC7WNedIq
         Z3DdVeY9Nf+YKC2kQquV80rRryN3ygfqtVpsT9NcDpRD+Q7l4LKi5RdgS463CGkcfRcB
         1jS3UV8jWJL5xtH2dCyrl5MS0QzqRPXd+8zpvIhj2KYVCRe3XSPWnJ5jqiqWeTVi3dbG
         b0pg==
X-Gm-Message-State: AFqh2kqACH8HQQ46DnWh0UZHuPjZn2hmgn5BwxdvXIFd6b0U79Gq6CaE
        6n5zeNXWaASzGuj2OWylmFaGVQ==
X-Google-Smtp-Source: AMrXdXvOtIoR3Sl2P5Nhj6vIVBah9gB0DFW+MWosXdF170n1/ZbFPnEZyspK38WX4XzAouVs5N0z7A==
X-Received: by 2002:a05:600c:2116:b0:3d6:10e:68a8 with SMTP id u22-20020a05600c211600b003d6010e68a8mr17054413wml.0.1674389747348;
        Sun, 22 Jan 2023 04:15:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o28-20020a05600c511c00b003dab40f9eafsm8543663wms.35.2023.01.22.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 04:15:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: Cleanup for v6.3
Date:   Sun, 22 Jan 2023 13:15:41 +0100
Message-Id: <20230122121541.29312-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230122121541.29312-1-krzysztof.kozlowski@linaro.org>
References: <20230122121541.29312-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.3

for you to fetch changes up to 3a48b303d44a19d335910f825f9a8473c5ff35e0:

  ARM: dts: at91: align LED node names with dtschema (2023-01-13 11:38:33 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.3

1. Drop 0x from unit address (socpfga).
2. Align HDMI CEC and LED nodes with bindings (stih410, keystone, dove,
   at91).

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      ARM: dts: socfpga: drop 0x from unit address
      ARM: dts: stih410: align HDMI CEC node names with dtschema
      ARM: dts: keystone: align LED node names with dtschema
      ARM: dts: dove: align LED node names with dtschema
      ARM: dts: at91: align LED node names with dtschema

 arch/arm/boot/dts/at91-gatwick.dts            | 12 ++++++------
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts   |  6 +++---
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts |  6 +++---
 arch/arm/boot/dts/at91-sama5d2_icp.dts        |  6 +++---
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |  6 +++---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   |  6 +++---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   |  4 ++--
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts   |  6 +++---
 arch/arm/boot/dts/at91-sama5d4_xplained.dts   |  4 ++--
 arch/arm/boot/dts/at91-sama5d4ek.dts          |  6 +++---
 arch/arm/boot/dts/at91-tse850-3.dts           | 16 ++++++++--------
 arch/arm/boot/dts/dove-cm-a510.dtsi           |  2 +-
 arch/arm/boot/dts/dove-cubox.dts              |  2 +-
 arch/arm/boot/dts/dove-d2plug.dts             |  6 +++---
 arch/arm/boot/dts/dove-d3plug.dts             |  6 +++---
 arch/arm/boot/dts/keystone-k2hk-evm.dts       |  8 ++++----
 arch/arm/boot/dts/sama5d31ek.dts              |  2 +-
 arch/arm/boot/dts/sama5d34ek.dts              |  2 +-
 arch/arm/boot/dts/sama5d3xcm.dtsi             |  2 +-
 arch/arm/boot/dts/sama5d3xcm_cmp.dtsi         |  2 +-
 arch/arm/boot/dts/socfpga.dtsi                |  2 +-
 arch/arm/boot/dts/stih410.dtsi                |  2 +-
 22 files changed, 57 insertions(+), 57 deletions(-)
