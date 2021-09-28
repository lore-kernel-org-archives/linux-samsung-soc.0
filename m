Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E995CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 23:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9EAC610A0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 23:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243498AbhI1X6z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 19:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243488AbhI1X6t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 19:58:49 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363E7C06176A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:02 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id v14-20020a05620a0f0e00b0043355ed67d1so3120355qkl.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0xU4rMhQf+Tsh4aGgPmL2VLP+qQMedKrbqJYsYtJvB8=;
        b=FTmdfSXZII7cRm19ecx75o8eAllYwqePg0NuCytvZQYsu0X/kUlzn7IL8ZeM/3z4ja
         ZLxBRz3wowKQUTP2PFV5gX3ESiyJcR4aH9wi1Bgcnw8DRlxUhWx/YFPBDqKHfEH+vxNZ
         cSU3SmdXvpusOlXyjNep2n+mzycENEL8nX5N4xL+wDPAkVYMzyVGKzEuXiFRmw4jjmh8
         ++Cz3M/FDUY0WukzbPkIqUDEzhDjIi1+Eo/eK2TZ2gQgOn8zz0pRZoIgB2McJjePq0uw
         uic1+Yv4HruxWjTzDDf3GC4w+FJmQOaZecctiPMnp6RQ+M4dYt0OVyK8EvWZCsA7IvzU
         4+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0xU4rMhQf+Tsh4aGgPmL2VLP+qQMedKrbqJYsYtJvB8=;
        b=mztaOvl0ptrFepyEwiyOWPFpRcg+LBZGoxPL5ghVPCt5SPBA/ZoFRan7ui/wu/PDZo
         s9P328ztbq3TmMk9T+lYiDqUv2gM88du6hX3Wk3NwdSH+LzadpNREc0ObGeD9OBBGysE
         BfGptWM2rckz/2nyoxMGBtcFMNPdSDt2LmSz24FXbR/hAfemhHC4UJBKkJiokThNgM/L
         2dYiWaKgNZhTf7FoibioY/dp7rJBXrXgdnDtPcCBC2RLimDdPC9Ljf3f8A7a3jRS5mdH
         z4Kp+gs8xYkNMSQ3OJ93QCo42yAaYc8oL12sykWd3osnWFxiN4SO1tKnD54FepZTy4PB
         HM2Q==
X-Gm-Message-State: AOAM533txKrzhVycRsDzhfeZEbPUTgbnVcMFAKeMXrTvSslXMriPjIw3
        EOFx8jzTdmiF7w2NvyTeTGqOhsRUnJgA31U2+6s=
X-Google-Smtp-Source: ABdhPJxXnGbQVYIKPCX7yNjY7ijrlFpSIGUian9jiU0yLqRqfT6gSGW3vVD1t8tBVnpZPavgKlT5Hlw9NDYqIMPa9/k=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6214:98d:: with SMTP id
 dt13mr8482075qvb.13.1632873421401; Tue, 28 Sep 2021 16:57:01 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:22 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-6-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 05/12] clk: export __clk_lookup
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This symbol is needed to modularize the samsung clk drivers. It's used
to get the clock using the clock name.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..f2aa4b49adfc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -612,6 +612,7 @@ struct clk *__clk_lookup(const char *name)
 
 	return !core ? NULL : core->hw->clk;
 }
+EXPORT_SYMBOL_GPL(__clk_lookup);
 
 static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
-- 
2.33.0.685.g46640cef36-goog

