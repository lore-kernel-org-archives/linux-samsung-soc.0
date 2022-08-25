Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F23C32774
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Aug 2022 06:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiHYGuj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Aug 2022 02:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236330AbiHYGu0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 02:50:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EAA27FE3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:50:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id w22so3539958ljg.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/aDZ/gNecubrSglCZKC6R+L0GMkm5WzoSscWaItrmmw=;
        b=Bv/Z9Kbd6gW9pMSOIhwj5HVjw92Ht7qYDkxXv232ofbc58J1e40xp2nzz07qHYllOM
         PI1pDeVzuWAZMGdP86qd9QKx43vNhVNIhUJVPaDNlzznVu0QagUuBSUPNOstTYPNXsDu
         qcAjPziSgLZBqaVNAaIUx2V3u/MwxiJupqte23G9cgo75Ji9Gzj7LUkoOsYbpuHAnKvX
         Bf9chbYAZ210qPC0kj6k2/nv64RPjwUXkmiLURf2QH9UKPdZZjU8Og/lQssPkhkyr6Ps
         uvQId6BZKbp6XCOuHZSgT5o1PrK8xzf5waU7J1OSWBDfpn8TZ/YRiFKpcE0diZ3lnVNL
         2zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/aDZ/gNecubrSglCZKC6R+L0GMkm5WzoSscWaItrmmw=;
        b=pkxIjQ5DUsnBdQWA1oRUb9uY2V+xJNUxQoscPxEek+LCa3ueyGlE/pZ1EwcIs0g33T
         UmyaaI/hhqs7h42WKpLpCMdHTwN29S0y63pc6Jn78DZNddHYQVhqWjKLHDSMKZffIpV9
         RzWxsvM9qk5OTxavvGQLXNTMReGmQhzDTc8y4hQo44/wLE0YVkY4R7Yt69UeipcP22Pa
         a3lMX6t+3ED1lY0ajdE9p7JFg/6bWwnmhtqhcJG7mVQNpHFSAy/eOsn9WM5zKBVZHX7r
         klGS2Fy06jq6P16BRqN/Varhz6z72owhMACPVOWVVYnothtXZo/gMtkSkuXIYenhIPWb
         aRVg==
X-Gm-Message-State: ACgBeo3TyrK4pwm4ijEG/+Z6+fF4qkP75D5edWowRmiUygmFc3B0yxZw
        7mFSbQ2w8Za/W1V0kZcVR7P+Yg==
X-Google-Smtp-Source: AA6agR5PR7ybmEgH13umjwUaqHYI9JYVvqCS4U2sV3lefMC531xA1KVP9foQDczRqV1gIJgKsAGwTg==
X-Received: by 2002:a2e:b746:0:b0:261:cc50:35cf with SMTP id k6-20020a2eb746000000b00261cc5035cfmr701857ljo.4.1661410221332;
        Wed, 24 Aug 2022 23:50:21 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id p24-20020a056512329800b0048b143c09c2sm321096lfe.259.2022.08.24.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 23:50:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     krzysztof.kozlowski+dt@linaro.org, chanho61.park@samsung.com,
        robh+dt@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        semen.protsenko@linaro.org, devicetree@vger.kernel.org,
        jaewon02.kim@samsung.com, alim.akhtar@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v3 2/5] dt-bindings: serial: samsung: add exynosautov9-uart compatible
Date:   Thu, 25 Aug 2022 09:50:19 +0300
Message-Id: <166141020446.21953.3639272669356222279.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701015226.32781-3-chanho61.park@samsung.com>
References: <20220701015226.32781-1-chanho61.park@samsung.com> <CGME20220701015451epcas2p15355e8f1777824f73b402899c4afd40a@epcas2p1.samsung.com> <20220701015226.32781-3-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 1 Jul 2022 10:52:23 +0900, Chanho Park wrote:
> Add samsung,exynosautov9-uart dedicated compatible for representing
> uart of Exynos Auto v9 SoC.
> 
> 

Applied, thanks!

[2/5] dt-bindings: serial: samsung: add exynosautov9-uart compatible
      https://git.kernel.org/krzk/linux/c/dfce69c8520592f1a20619050e6ded6275e9f25f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
