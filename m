Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A6AC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 11:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCFLkI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 06:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjCFLja (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 06:39:30 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D3A298D8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 03:39:26 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o12so37150077edb.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678102766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBm+LmDf7JpRpW0pbr+OMw7xDIF/iYcLmWDF8FxyxO0=;
        b=GJVkRcRVFuVw5MD5Efoncf6o7vTfmRPLCakX4v+i5vjiN17Ft9D0yPaa2IpKOMyR1/
         juIrjwqNf98Vx0tGf4RjhFNmMtpogZO/uo5hfBm8dUqojl69f2fF2Xvw99qeEHrkb5Jj
         Ooxzpoj8PIyeYhknWvm01h+gzVJ6dUliw6L5VwYS2FY4SNOxRxKUemnMXq02NTXmXiw+
         p2kiEiF8oIdwgH9J5/Ppwvx6GOy7gUWp3XDUz9aLtWx4se9fGyM3VJww4h+IBXzlkDaY
         lfCJTCwoMUI50cHEE7yU4gW9j3YnSkv7c0qP9dLMqYmjfz+0vyxlqWEhgRt6UKiHJyxE
         PWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBm+LmDf7JpRpW0pbr+OMw7xDIF/iYcLmWDF8FxyxO0=;
        b=vswE/O7CuegiekTOcGT/YhFHLolSzoi7dS5bwyJZgQSeFGUlVCFxbEupVzu8TEFjI4
         eeSgjRtGXQNREOBNYxIiA3FdsBjJVlBxDxaH4zjTdO1lyEz8EUNCPpqoT4S/DO/pQEOn
         XpB5pNeWIGHpOvlNiMsWZlOObuZOxKV0BhlsLCp4FU/06kSXofyUSgghIThbSUyXNTqt
         O2XuBiwtVMPoC3iTpFkfzThkr4O57JY0cyzF6OPVZR6FgxcU56e2MC2IhS2zguXDZ+ua
         69E3sePCy7J4tdrnzPl6h74DuUZUzLmQ6iiFAeskOU3lYAMVwCBOpZhIEVi5dIkXLVPV
         t75Q==
X-Gm-Message-State: AO0yUKWM4pdPJFNI1ozpn837fn6Pf/lxhJ9VYss/zPa21rB7139ymHcN
        73UpBJhItz9wwpLvhITsSvb3ATiCfI3lZG1MIcA=
X-Google-Smtp-Source: AK7set+3LJI+hqfpj9jjbS9NQiNFrIaeLnk+h9q8tvMSttpZOJ/9DU0LtZClQcEUdXH3HAVW+7D4LA==
X-Received: by 2002:a17:906:c001:b0:8b2:d70c:34ae with SMTP id e1-20020a170906c00100b008b2d70c34aemr10877241ejz.71.1678102765790;
        Mon, 06 Mar 2023 03:39:25 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:39:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Henrik Grimler <henrik@grimler.se>, phone-devel@vger.kernel.org,
        replicant@osuosl.org, ~postmarketos/upstreaming@lists.sr.ht,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: Re: (subset) [PATCH 8/8] arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433
Date:   Mon,  6 Mar 2023 12:39:12 +0100
Message-Id: <167810274096.82312.3611753501270461912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-9-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org> <20230127194057.186458-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Jan 2023 20:40:57 +0100, Krzysztof Kozlowski wrote:
> The MIPI phy is actually part of the Power Management Unit system
> controller.  It does not have own address space, thus keeping the node
> under soc causes warnings:
> 
>   exynos5433-tm2e.dtb: soc@0: video-phy: {'compatible': ['samsung,exynos5433-mipi-video-phy'], ...
>     should not be valid under {'type': 'object'}
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433
      https://git.kernel.org/krzk/linux/c/2a9c708411834661e5b0ffb817a8f82f1a2f108e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
