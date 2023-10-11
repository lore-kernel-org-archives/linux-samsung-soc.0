Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE082CDB47D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbjJKSu3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346479AbjJKStq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:46 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841E3C9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32d3755214dso167864f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050181; x=1697654981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=PaOvRb7Yvxi9w0f130SZo7wgZgVYlMfMs9rE9c9DryFw+3X2d+lptCDYcALdt2Ee5F
         D4s4vYsNGAoTPnhrPEa+YQxR6B8Lpl6uHXEw/To6+eVlU4gI+jXDRhSQPlnodLQ+2nhQ
         qwYxKPAMISEWs0jFpsQtaHDKdM4Ka1LSePSgrRgoqzce2/C/SFndM6CRDbPkPFvO8RVc
         um38ESEhpBQ/7bdIGjCLI85xP8SbsT9selN0/6jIg2QNX4RepA31SrypwN+hyj6MAZA1
         qQxFlRFH+dVALR+AVm2XgvqjqkzXVV44w1elrPZ09I4FvZg08OFd7hDtgFUxkPGbCRBS
         0GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050181; x=1697654981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdsParCuymjlmImw/5r7LgWUbKh/XK9/vZ2/JG1KUVA=;
        b=AQoQAVvm5J6j5PSoKUtNcs+ansv9fxL+toLOrY9OI37miDW9nNgopLmWU6ULg5Myat
         /irOn9hk85fzUmiebE80AjL8YGiNaSzFDKWOD8sG+ANqe7qxHO/95+nk0qw3SockEmcN
         yR3HHwfqL1Sp+pjgpy8frLjaevEFQpwlNV2mN7CxWFlJotMvEgPGZYp1IbaGpwpQf1VU
         nK1wQ9eqsFuOqHcZ9InvcKEZTNn3EAi4CiBgPCgU5o6qeSowRRwgVl27XB9NxylAg+f2
         Vmc3M5N987Nbf4FQ+kiXnTnRjDhvk8fn//HYg3cWHcGTYsxzXtnI4KF/TzsciPzh1ByK
         IqSQ==
X-Gm-Message-State: AOJu0YxMLnPhFjeXq8bKNG8oSH6sKP+tR9ig/LOT6AHJTx3Eu5S3W+HQ
        sasQdGqYqrAhWjl4qsvspd0Yzg==
X-Google-Smtp-Source: AGHT+IFBklXaphM/CWCVEBadRe6eZJrH2hObJzvWcKnrEkFzR9HfnZ6RvER0PV3n72K21bArq7jmlA==
X-Received: by 2002:a5d:4cc1:0:b0:324:885f:f7fd with SMTP id c1-20020a5d4cc1000000b00324885ff7fdmr19347507wrt.15.1697050181726;
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:41 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date:   Wed, 11 Oct 2023 19:48:23 +0100
Message-ID: <20231011184823.443959-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..149a0c364309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.655.g421f12c284-goog

