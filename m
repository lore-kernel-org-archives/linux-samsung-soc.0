Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF6EC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 14:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjGSOd3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 10:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjGSOd2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 10:33:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58601718
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992dcae74e0so953513366b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=JxURig7FBAAC/3I9yT3aHiTqXeWWAq0k+MGxx7xZ1vdG66aZ7E/pUW+2Vufm3nF5nt
         PQRijfFThwLLN+R5vZT+cepzhH9bJqUTHAarRy2saW3hXq0sJ+TgQOkCl+S7betr+2r4
         I1Zsk8Y7AgA3q1gZu0RQooyDAQxZjPz6YNJQzKEERCq/hVknWzKJFTWLjFxbal365wUH
         higiPiWNIGJF2pPpBfQgRyGJaMGwb1cxsbX9puXisiBFXZQrdHTSdqFzuFAunWwO7ky5
         n2Ptixa7nFwWUw+pilJzQBH9JRPhhLbsxRKczXkhgBHDa0LDjyKeZ5DgA9xVDlY0EP/t
         jfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=c28dHiMgTdXKGbfbRCRbet+PZSxS6TorxDVT5uckTvzCTqWzC3HXJNur7/Hifw0deI
         /KPwNu/0/F9sGTX9N0HagcgclZLLwn2kWwHuTJZKadaMRGK0+F8CNsGMDFwV8m6pluuH
         eRLLF7MUJc1qM1lfnYx+8FQhX4XCVxqPKDDK6kHC4zNVpfPk/Uu/GVQeKdLbp75c99wU
         lG5l5tbugYUU8JxWfJvAdKlhFJG6vxLfpcUTLGk4gBZLSppqWihcUY0Hy3f5QTwO4vA6
         xb4yd7rX/8Kao+K04NFYEyNrU0Xks7nmGfLjKb/0VlsYUCV3nitQzQAHcm/jIyRYd4Zt
         nnOQ==
X-Gm-Message-State: ABy/qLaR7Sd+R6Th6odr8v6DWIOaTD8/vSX2JrNAwDy0M+Qmgn+rzE6m
        T0HH9IOgKOa/pl00895rDu/UFA==
X-Google-Smtp-Source: APBJJlF+JcEt0XZP2Tw59JukE7GuYig+Z35mtFzxo15uZB8/KXGNf8iKMl16iFRTuItUUfVn/5VsyA==
X-Received: by 2002:a17:906:77cf:b0:993:d47f:3c84 with SMTP id m15-20020a17090677cf00b00993d47f3c84mr2864253ejn.7.1689777197337;
        Wed, 19 Jul 2023 07:33:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] Documentation/process: maintainer-soc: add clean platforms profile
Date:   Wed, 19 Jul 2023 16:33:08 +0200
Message-Id: <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some SoC platforms require that commits must not bring any new
dtbs_check warnings.  Maintainers of such platforms usually have some
automation set, so any new warning will be spotted sooner or later.
Worst case: they run the tests themselves.  Document requirements for
such platforms, so contributors can expect their patches being dropped
or ignored, if they bring new warnings for existing boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
1. Add Rb tag.
2. Implement Conor's feedback: change doc title, follow->should follow,
   minor style changes.
---
 .../process/maintainer-handbooks.rst          |  1 +
 .../process/maintainer-soc-clean-dts.rst      | 23 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 9992bfd7eaa3..976391cec528 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -17,5 +17,6 @@ Contents:
 
    maintainer-netdev
    maintainer-soc
+   maintainer-soc-clean-dts
    maintainer-tip
    maintainer-kvm-x86
diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
new file mode 100644
index 000000000000..c460923f39be
--- /dev/null
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+SoC Platforms with DTS Compliance Requirements
+==============================================
+
+Overview
+--------
+
+SoC platforms or subarchitectures should follow all the rules from
+Documentation/process/maintainer-soc.rst.  However platforms referencing
+this document impose additional requirements listed below.
+
+Strict DTS DT Schema Compliance
+-------------------------------
+
+No changes to the SoC platform Devicetree sources (DTS files) should introduce
+new ``make dtbs_check W=1`` warnings.  The platform maintainers have automation
+in place which should point out any new warnings.
+
+If a commit introducing new warning gets accepted somehow, the resulting issues
+shall be fixed in reasonable time (e.g. within one release) or the commit
+reverted.
diff --git a/MAINTAINERS b/MAINTAINERS
index ba5e7344f30e..a70c32790427 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1573,7 +1573,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
-F:	Documentation/process/maintainer-soc.rst
+F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
 
-- 
2.34.1

