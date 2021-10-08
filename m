Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DEDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:40:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9117060E95
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243039AbhJHLmG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:42:06 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33542
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242408AbhJHLkA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 07:40:00 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 557E03FFFD
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693084;
        bh=aTSEz98+bylpmPPcNopQa23h1tajKRR6XK7sZAFZg1k=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=LwfWPQ978SogYXqg0QEhZaIt73YOlvGE6NpF/m7ST3bVX9cg8GBUCNAfJ6JuCLWIU
         RHmO0+4eMSK6cMncCOoA3JaTeJJ4upNR6Qsj1oRqku1SJzCjEnJ92C4SAJ1ULhth+M
         RQopOaDjJwM1OG8WssFdzp1oMcfCu9ljIWZiLFahqp8Wy025oKHyrqN/KLhGoo4igB
         yJEXlG/vH4XrSVkzFT+GVPR8MHue0DwUHEJF3r4qlIveOlRhM0IqTlMpgM+TLsyLG9
         6CP4qsv5t0Jow2DvB6u7PmjUEzePnzwcAFa+SSeaAWi++EP/ghHef54n2OMiHjJdN7
         zdINtHbK/qjig==
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so8872519edj.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 04:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTSEz98+bylpmPPcNopQa23h1tajKRR6XK7sZAFZg1k=;
        b=wG772uaZKNLvMs3ZxuGFZqG6TWM9FexaWxwS8aLlOZtL+rcVetB0dVx2xfm/iFuf0m
         pCqXi1FOYXTjztAuErXsnARNQCFuUo4465B7IZhRDrN93pEmPmUX4OOw1wz6660jwXwH
         PVDOumrpNVQOub70MRRTd4E5Mhl3QlrNv2Fl3HppZxzOK0n64gJARsH/+RalSOAQxAHo
         JgKPoZA6ndoP3lvInzBJL7bXwUM2fbyDSKd9m64tXhvN4UljRrklGyOY905e5WvzhZ0q
         GvX0bq+LUHTodN69bWqb6OnxurqkxvDQ84XA2LoQGn2ns8w32hVn+bQSP1MBrVTqMObi
         lVcA==
X-Gm-Message-State: AOAM533t2W7gF2JgReQvE9HplqsWQt29iOwUUBwuFr/VXFRgxJALiW3z
        AtZsunoFDSaPMvKbsQhwH5fQpYcj2at7PtEKk6qMGwCdMIc1lAtFZ0wyRMHmAIe12s7kXlPkbC4
        2lRUgkpikZjTHNp866T4PuYdYfnqM2c7Jk6/sRCj6Ib2A9M50
X-Received: by 2002:a05:6402:4405:: with SMTP id y5mr3069444eda.339.1633693084007;
        Fri, 08 Oct 2021 04:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8NR7U/YVnS2fiVyjL2cLT+NkCncwBCqM2zQeAmZ6DE79hAPBigKIL+nDpB77FDCkcqo6xhw==
X-Received: by 2002:a05:6402:4405:: with SMTP id y5mr3069407eda.339.1633693083838;
        Fri, 08 Oct 2021 04:38:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id la1sm819948ejc.48.2021.10.08.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:38:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v4 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M and S5M to dtschema
Date:   Fri,  8 Oct 2021 13:37:12 +0200
Message-Id: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

Changes since v2
================
1. Add Stephen's and Rob's tags.
2. Correct inb-supply description in patch 10/10.

Changes since v2
================
1. Add Rob's tags.
2. Remove "regulator-name" from properties (all regulator dtschema).
3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).

Changes since v1
================
1. Drop DTS patches - applied.
2. Fully remove bindings/regulator/samsung,s5m8767.txt .
3. Minor subject reformatting and few typos in text.


Intro
=====
This patchset converts all devicetree bindings of Samsung S2M and S5M
PMIC devices from txt to dtschema.

It includes also two fixes because later conversion depends on it
(contextually).


Merging/dependencies
====================
1. Regulator related binding changes depend on first two commits (the
   fixes), because of context.
2. The mfd bindings depend on clock and regulator bindings.

The fixes and bindings changes (patches 1-10) should go via the same
tree.  For example regulator or mfd tree.

Another alternative is that regulator patches (1-2, 4-6) go via Mark who
later gives MFD a stable branch/tag to pull. Then the clock and MFD
bindings would go on top via MFD tree. Or any other setup you would like
to have.


Overview of devices
===================
Essentially all Samsung S2M and S5M PMICs are very similar devices. They
provide the same functionality: regulators, RTC, 2 or 3 clocks and main
power management (e.g. power cut to SoC).

The differences are mostly in registers layout and number of regulators.

The drivers are built around one common part, mfd/sec-core.c, and share
some drivers between devices:
1. MFD sec-core for all devices,
1. one clock driver for most of devices,
2. one RTC driver for all devices,
3. three regulator drivers.

The regulator drivers were implementing slightly different features,
therefore one regulator binding for all devices does not make much
sense.  However the clock device binding can be shared.

The final dtschema bindings try to implement this - share only the clock
bindings.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
    is disabled
  regulator: dt-bindings: samsung,s5m8767: correct
    s5m8767,pmic-buck-default-dvs-idx property
  dt-bindings: clock: samsung,s2mps11: convert to dtschema
  regulator: dt-bindings: samsung,s2m: convert to dtschema
  regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
  regulator: dt-bindings: samsung,s5m8767: convert to dtschema
  dt-bindings: mfd: samsung,s2mps11: convert to dtschema
  dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
  dt-bindings: mfd: samsung,s5m8767: convert to dtschema
  dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies

 .../bindings/clock/samsung,s2mps11.txt        |  49 ---
 .../bindings/clock/samsung,s2mps11.yaml       |  45 +++
 .../bindings/mfd/samsung,s2mpa01.yaml         |  91 ++++++
 .../bindings/mfd/samsung,s2mps11.yaml         | 267 +++++++++++++++
 .../bindings/mfd/samsung,s5m8767.yaml         | 307 ++++++++++++++++++
 .../bindings/mfd/samsung,sec-core.txt         |  86 -----
 .../bindings/regulator/samsung,s2mpa01.txt    |  79 -----
 .../bindings/regulator/samsung,s2mpa01.yaml   |  62 ++++
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------
 .../bindings/regulator/samsung,s2mps11.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps13.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps14.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mps15.yaml   |  44 +++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  44 +++
 .../bindings/regulator/samsung,s5m8767.txt    | 145 ---------
 .../bindings/regulator/samsung,s5m8767.yaml   |  74 +++++
 MAINTAINERS                                   |   9 +-
 drivers/regulator/s5m8767.c                   |  21 +-
 18 files changed, 1080 insertions(+), 477 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

-- 
2.30.2

