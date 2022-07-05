Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849BDCCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 10:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiGEKmD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 06:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbiGEKlv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 06:41:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0D21581A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 03:41:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so19828698lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLp7MvUwLe6vUm/f/vpvAQrqzJspzeNNepnxgQONWpo=;
        b=XdccQCht5uccBXMriAeOgAaHbE9xSTdZmT4gl3/FPjo/+4VZICdWEr59W/m7xAyn0R
         Du01UHpu4IM24EmGtYRmdvdwGT2uEQJ2zlnw1Rv2yXYdxq/xUd5br1nXS50vKfXfyslD
         tea4bWDDKe2ZD6UGMvHOwZRWaaAkb1FNgydYOCptGMq1gRzdOVVG8qaxb0RLdcG91xRG
         qVPrtsSx7t1cy+JcWdxwwHrkWYfeSR+Ax5e4ngYmCWdJuIt01jIDs0fMk7ggKGbg4CMj
         cGg/HImHyO7ww9RHwE7GZZ8p0hna9AjBDVfV1Qc21xIoW85qdR+9w7EjvurM5aUAdrSC
         hn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLp7MvUwLe6vUm/f/vpvAQrqzJspzeNNepnxgQONWpo=;
        b=enR+2LLzMiChTAe5afe+/QNx9cML+9LjG37VEwA7LCj0p/+c44QlZu3AWjuA35AYsn
         56RHzO15+/eZUrKBT26KntTndsKd9XqiKpwJuQVW6HgbSTF4EK6p1vw23oL7XjEtW3tV
         Af8lZJGK9giK3ZVG4T9Ggr/0iEKLwJJOLH/Y6hgYFJqxBZ2xI6vsU5m30CLH0Gpz9RJl
         A5od0W2nREGipqJtstBHsHvVYcUHFnamEvYmiDtnUMz0xayCqLwWLGyo72PDpIno7Fy8
         YxBMzL3Gc8I5APctOBkKDO5eHqRGXrEixV+QfVb3XxKTFpHUpf1HYez/wfJ/b92TGdgG
         5CjA==
X-Gm-Message-State: AJIora8PBl0Tr1DOQPx8uwi9sP21Ne861dwWZFZiyfh2UW8qqTMMmaI0
        BHynRay3Hhf+B+/Tv6PqMjd2Cg==
X-Google-Smtp-Source: AGRyM1szsmyLtaG454LmVZbFO5Ze/e9fNgqE/lGV76M/s5IwvO5OzNIBtXmxEWPT31nRBKLkIeUwlQ==
X-Received: by 2002:a05:6512:ba3:b0:47f:74e1:e3c4 with SMTP id b35-20020a0565120ba300b0047f74e1e3c4mr22240845lfv.585.1657017705433;
        Tue, 05 Jul 2022 03:41:45 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b0047f615b5cbfsm5619814lfr.211.2022.07.05.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 03:41:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        chanho61.park@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        semen.protsenko@linaro.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/5] dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
Date:   Tue,  5 Jul 2022 12:41:37 +0200
Message-Id: <165701769259.78614.2407288710115888013.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701015226.32781-2-chanho61.park@samsung.com>
References: <20220701015226.32781-1-chanho61.park@samsung.com> <CGME20220701015451epcas2p4d9fcc589d5d1afdbc80903274247891b@epcas2p4.samsung.com> <20220701015226.32781-2-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 1 Jul 2022 10:52:22 +0900, Chanho Park wrote:
> Add samsung,exynosautov9-uart dedicated compatible for representing
> usi of Exynos Auto v9 SoC.
> 
> 

Applied, thanks!

[1/5] dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
      https://git.kernel.org/krzk/linux/c/4e112c7b5df2c37545836397b4297117fc7887ad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
