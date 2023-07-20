Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AA3EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 09:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjGTJhv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjGTJh1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 05:37:27 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69B34480
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:32:39 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-986d8332f50so105260166b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689845533; x=1692437533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f958s3nbgdA1pG2lRmegO+5yorqgc7fcVF1TVclRI9Q=;
        b=Ey/12QEbmzUl/2DVcC0OB5SpzRCy30QU8rbLwh9+LjC+DY0M/c3/qNYZ/wwvxgWxrv
         X2GLMuMkSwulYRupWc/coQrMDIyStvYfpVYRWjfC7allpSir35oCUWhKXdCrcMA0f9HR
         PKAVBDgaom/iifg8eTBTgkBC8M3uu4/O+JC5fpHFPDoyC+GMpn5BDeplmbDO5Q2MVjnj
         aB3nmnKhE8CD9SMWHhMofijmZSKP7Zchx6quF8Va2XZcg+Fhxu6I8VSWr7RJ8meI9L1M
         R3qFeYzA7eVyJvc6F5EYbNCPnhrCGxwiVdlpwyKcszjwBgzn7VtAhJB9eE/FKdzDRUdV
         rcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845533; x=1692437533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f958s3nbgdA1pG2lRmegO+5yorqgc7fcVF1TVclRI9Q=;
        b=RzX5kFOMmpFpEjEvH6R9EAx1DNxTJH7RB1X+ZL2XNufWcnMyrirHCuU5KHDag4sSJX
         LlyP+ZBl94eRUTIuCJJN3K615Gmncz+HOHMRpYfPDPDWpmYexnMYnipESlfxpXM07/N7
         xG8KHEqchq5P1heXhLx4kOLtUACjIDqSruPcQwsIqEa9GYSZXScp0iYlKoGWStUcz0Ne
         kih5p31IVVCWVEPusm/qRW2VjPu2G61ixJYDIxYdZx6R+HvoGsFFrA+IAQ0zbHKwn2oF
         FcMsD3gxlNGkgKoc+iSemJ/SzzPfKe3AcQq2PF21AxxMDawjX3DrkxMuczElfGy9F7GG
         zjnA==
X-Gm-Message-State: ABy/qLbQLiyLHBTzPVyuHAEn1gbXg9ygnnm+y+9RtYO4XbiZDPdNQM64
        +xq166pFStd7aOr1W6jlh4Nz3w==
X-Google-Smtp-Source: APBJJlFvCIbTWcgngamb8Fv+fhJlfdBadvLniriEcqyYa8TvvEG6ibZT5iGZvHIsAGbY/Wq3y/DzOQ==
X-Received: by 2002:a17:906:3f0c:b0:997:e9a3:9c54 with SMTP id c12-20020a1709063f0c00b00997e9a39c54mr1856756ejj.0.1689845532785;
        Thu, 20 Jul 2023 02:32:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt15-20020a170906b78f00b00991bba473e1sm430204ejb.3.2023.07.20.02.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:32:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: samsung: Un-support cpuidle and clock drivers
Date:   Thu, 20 Jul 2023 11:32:08 +0200
Message-Id: <168984552539.79008.3332964661448587103.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714050223.8327-1-krzysztof.kozlowski@linaro.org>
References: <20230714050223.8327-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 14 Jul 2023 07:02:23 +0200, Krzysztof Kozlowski wrote:
> Since few years no one is really paid to support drivers for Samsung
> Exynos SoC CPU idle and clock controllers.  Correct the status to keep
> them as maintained.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: samsung: Un-support cpuidle and clock drivers
      https://git.kernel.org/krzk/linux/c/edf049c708681b4defacc740e3b254a5daa90e5e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
