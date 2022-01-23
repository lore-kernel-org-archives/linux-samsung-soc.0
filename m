Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A053AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 17:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237659AbiAWRJf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 12:09:35 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59098
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236859AbiAWRJ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 12:09:28 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 47A523F17B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957767;
        bh=FaifMX+EZOHeqFOH0mC+iaZH1b4BUvHDBCCkl/PmcMY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=RFOQGHlpJBuWCoAKwhWBSL1PC3sDVD7k6NGUqDjuWQi3pKP13F2r0WdqCrGNr12jd
         n/3uTeFgv/xIzzx7eSpWsLh7jCyAOW19lDztoZnrD6RJblQ0C8azkjBJDnV7IV2y7R
         y0ZjRQ8+8m9B+kwBUMX8uT5bQmjQOfnG0aCMPDIPqgH/cmD19CvSf2Qyki5sz2OXcS
         ibh/RoUosmdtnZ+DTtr4ncA2uQuRzBi8WjkN8RY73Lfn2bTdELDkwj9MUXlAqTVA0C
         sFWiPk2hcIZ0/5r7Ejidi3SNGi7uhFSZtS2iqBacm4gZqWMD0ZEaBMKXNrUS0CHPZP
         izmiomvLNDTnA==
Received: by mail-ej1-f71.google.com with SMTP id gb4-20020a170907960400b0069d1ebc4538so1527209ejc.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 09:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FaifMX+EZOHeqFOH0mC+iaZH1b4BUvHDBCCkl/PmcMY=;
        b=qhprDHsAbn5BURu4sNSUj1QKoU8f+DhJYJpnDWHNf448NYR/+w0d56QAeL/MPm1DCg
         7+HMum/9nIlcUswd+iM+EzLVkiPoVZacb2uNiIi5ATZ6k7Ygs2ipsVE9Baw6L136x+l5
         DVKLE9hj1bgAS3ZLvEC/W7TahRaQNjFTaCHhomFHAiQmo+ZA0u4KXy3TbqfIeZMI7MHC
         NqfqjD3EimH1IvyE175DibyEK0ljOhwA6fDCVOD4GzOjP4vR2zSMENl1XMZFrjiTZeWO
         zP5UXTxmT2Q1HcVBdQIfMGV+UZxRcxIvxD8JMdTVSy27KSWsiPaJ1ArhGt5iZVUEU9z/
         H1gw==
X-Gm-Message-State: AOAM530gTHLgTowmIIxMTKgJeG0khyQkf0sxE57+rGF7fuOCxwL9FU21
        PtsW/JiyWKAct/rF/0s7/uAWQSFJoiFNosJYoPmABLK4KoVxIclCdwNbf+5AWEpSJcz5OB2Qr+1
        nSVXm+xgjDF0WtZjg7R7iESK70HIt9I6NJK1KwUM7LnsMe9hA
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr12161412edz.79.1642957766853;
        Sun, 23 Jan 2022 09:09:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysQjuJXR6vDAY3DSDqkbdhGZsDj4a5MgHVE/SEUY6pjq+/f9+HtYqzjvLNhWASo0Oc/p4w3A==
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr12161402edz.79.1642957766717;
        Sun, 23 Jan 2022 09:09:26 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id lt23sm4051370ejb.173.2022.01.23.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:09:26 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v2 00/28] pinctrl: dt-bindings: samsung: convert to dtschema
Date:   Sun, 23 Jan 2022 18:09:24 +0100
Message-ID: <164293835975.31601.16562955007803362485.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20220123170924.9BOOt33EbmItNGXYsmlChsO1kHzF5yL-lY3hW3f_7Sk@z>

On Tue, 11 Jan 2022 21:13:58 +0100, Krzysztof Kozlowski wrote:
> Changes since v1
> ================
> 1. Patch #1: add missing pin assignment (Alim).
> 2. Patch #2: correct double sizeof() (Alim).
> 3. Patch #7, #8: put label-override in proper patch (Alim).
> 4. Patch #24: Extend doc, change the 'if' clause for wake-up interrupts.
> 5. New patches: #25 - #28.
>    Exynos850 and ExynosAutov9 seems to be different in pin ctrl interrupt
>    handling, so they need their own compatibles.
>    Please kindly review and provide feedback on these as I do not have
>    details.
> 6. Add review tags.
> 
> [...]

Applied, thanks!

To Samsung SoC tree (Exynos850 is skipped because it was not merged into
v5.17-rc1):

[03/28] ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
        (no commit info)
[04/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
        (no commit info)
[05/28] ARM: dts: exynos: override pins by label in Peach Pit
        (no commit info)
[06/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
        (no commit info)
[07/28] ARM: dts: exynos: override pins by label in Peach Pi
        (no commit info)
[08/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
        (no commit info)
[09/28] ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
        (no commit info)
[10/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos3250
        (no commit info)
[11/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos4210
        (no commit info)
[12/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos4412
        (no commit info)
[13/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos5250
        (no commit info)
[14/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos5260
        (no commit info)
[15/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos5410
        (no commit info)
[16/28] ARM: dts: exynos: align pinctrl with dtschema in Exynos542x/5800
        (no commit info)
[17/28] arm64: dts: exynos: align pinctrl with dtschema in Exynos5433
        (no commit info)
[18/28] arm64: dts: exynos: align pinctrl with dtschema in Exynos7
        (no commit info)
[20/28] arm64: dts: exynos: align pinctrl with dtschema in ExynosAutov9
        (no commit info)
[21/28] ARM: dts: s3c24xx: align pinctrl with dtschema
        (no commit info)
[22/28] ARM: dts: s3c64xx: align pinctrl with dtschema
        (no commit info)
[23/28] ARM: dts: s5pv210: align pinctrl with dtschema
        (no commit info)
[28/28] arm64: dts: exynos: use dedicated wake-up pinctrl compatible in ExynosAutov9
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
