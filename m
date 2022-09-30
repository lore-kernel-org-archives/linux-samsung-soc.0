Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Sep 2022 15:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiI3PPr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbiI3PPj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 11:15:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CB8A02CE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 08:15:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d42so7411421lfv.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=9qe1ituoiVQ6tMTna4qx1CP35n7ZrXQ+Z8Kf3z6Up/k=;
        b=K2ppjZpTcwMXMqHVkbUZy5/PmQebskeMbiEDI8XMJvkxqFQFIjp3zCyX+XO+iW5elo
         UjqqE0Tk0PtRzPeodJgG5AZ7yRtcE0fgKae9x8UwrvG44G5ogXJef+8cltxvSu7VJ3ys
         /bRnODG+csOYM0DA93DZM6WeifBH9xjcL9/+wRzw8Oj67EI4xXySgkOX7kS8ITbDrP4N
         tS+zOo3/Lwyudf1obe7R+sQLVSTH/ALWQv7L4O4jHbwo8VoQJXHJz9S/PaJZX+NIIHEY
         1xktlKMiSjsKRh5KR/GLSy596efrUb9Eik4ELgyYbgq5lX1kOKC+BtGhfUrU5XAh9s+B
         Hh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9qe1ituoiVQ6tMTna4qx1CP35n7ZrXQ+Z8Kf3z6Up/k=;
        b=jNBVaR8Py28jpiEZVX1eFyaRl87tEy3bcyiTwOC6Bz1D8QiR1llvE8Zrk7Fg5MWq+n
         1r0G0neasivc768PYmihUdKnwoS+be92AcgUwFsOXlGq0yCd2GjQ416ARmt2lqX4s01Z
         MXN9WXIWuEIllXH38NlKYFajUrnuJKFXTytzrWwX32OIRBIq8Vpt5xai00rO7xx/TqME
         0TKXZxS8TINyMNBq1hcCW9D1XvfRGSKSLP9bfu2cHe5y6XHA2UNksZT5SslB2DvfpbM9
         Pjuwsntfv4s2nePMj0vGeqqvNNJ9EFKW/i46YZJy7d2AXOY/XdvuwV+xToeTGxb2y34h
         YLFA==
X-Gm-Message-State: ACrzQf0EQfZhl0q3tr+hZ7m1uQW8u+6mBO4CZZhZZmeV1WKBmkX/wywO
        6MLkx5ecrsOcjN5D2a3QjY6nWA==
X-Google-Smtp-Source: AMsMyM6OH/KU/K3lOw7qM6WdTyenUEIfcDT2JYgFrfRCgd4m0c9smxHRRRMOWigUKN/XtE2bYLMu0A==
X-Received: by 2002:ac2:508b:0:b0:4a0:5d6b:ff14 with SMTP id f11-20020ac2508b000000b004a05d6bff14mr3370963lfm.409.1664550932897;
        Fri, 30 Sep 2022 08:15:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q3-20020a0565123a8300b0049480c8e7bcsm320145lfu.176.2022.09.30.08.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:15:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] ARM: dts: s5pv210: correct double "pins" in pinmux node
Date:   Fri, 30 Sep 2022 17:15:30 +0200
Message-Id: <166455092698.6630.15512850580722431230.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926125824.477920-1-krzysztof.kozlowski@linaro.org>
References: <20220926125824.477920-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 26 Sep 2022 14:58:24 +0200, Krzysztof Kozlowski wrote:
> Drop second "pins" suffix from pin configuration/mux nodes.
> 
> 

Applied, thanks!

[1/1] ARM: dts: s5pv210: correct double "pins" in pinmux node
      https://git.kernel.org/krzk/linux/c/17fffac44943a619ec76463655b1ed7fccd8bea7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
