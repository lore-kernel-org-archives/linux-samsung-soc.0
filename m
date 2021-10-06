Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820D1C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 708266113E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238934AbhJFN0I (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:08 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51754
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238875AbhJFNZ4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:25:56 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CEE13FFF5
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526643;
        bh=3lioRcCn3/5I7Byd/FEr0VTjZpCEaYjPURKLlNwW7t4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=r1eWgXa3APdCPGG4W7Ve9jB2tA56dtl8ZHU0Pjbh0iY3pieHPH9eONpQSVIewXLp8
         7GjuqFx/jtQQivhGxTOkIOkQDTfpBncsN/6ipERkhKX1TuCDv2Lz4y0hFSKcte0e3B
         GuMeHG0SpnBv+l0XhbFo97IBDV8mXPBZmWU4j0fa/x4zP1j5DgEmWGPEvLnzfYOcAN
         k0wJQgu3a3blLugImxGjpzms/2QuwtZAA+Db4gHc+OBt6aEW9BB6XNSQWI63yJt02I
         CAJA42OO+PPFZauDPaFPRjfy5Oix9km5vzuCXVYjubg60lKeuGsJWLvyQPHpNTAHxi
         6EUK4NNpGv3vQ==
Received: by mail-lf1-f69.google.com with SMTP id t14-20020ac24c0e000000b003fd392f9a5eso1970381lfq.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3lioRcCn3/5I7Byd/FEr0VTjZpCEaYjPURKLlNwW7t4=;
        b=gobA8C2KGO3CMOm+NYUWis8DCEZWD296Imaal+dql7Dl3KbOpi+JZH9QqlWrI2K90V
         To/P0epWl+xeLI65bXRDV9r3Klk3ecln328evXHZ1/0kptwLamglbLWMSLqDiorV3Yim
         NIhLJa3CiOU9LwnBusF6ZOTVygMuNuWHnf3/TU72zzTj7AjbDxt3UdZok10j66F30UOq
         z0MOrXl6K88+qtoq2aqTF8fB6gEo8RWdFGFn98yShjURqiF/HgiSGoE4Kr6nQ6AK+Z0D
         Zb0cKO5HfCqzOU6D8mxY5jfN5nEtttfi0J8GFkraxZxpohF5R/zOEt7kW/gYE7fI05f6
         h5Rw==
X-Gm-Message-State: AOAM533UOVtFZY8fMZjVJsAKbXe79ibR4Vf/jZ9mRMn4JE5zDqyB9MgZ
        NS4J0WQkNHWnsF6EDbUrgihbiOIpHxZw/Hw1uSMa85YWefQ9jQy7aCCGLlgOGaX+gQ/qeAE4o/V
        UNqEVPy/WxDwugJC2fNFznXMeMu+iR+D2NVzwxm5HDtIxShHY
X-Received: by 2002:a05:651c:1792:: with SMTP id bn18mr30305326ljb.521.1633526642688;
        Wed, 06 Oct 2021 06:24:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnenvoq3tDN9Esj44Bs9yNQL95YRsv/Hr54UrHpzJFpiudu/3kvNFtA7qttRx9JwIFy+Tk9A==
X-Received: by 2002:a05:651c:1792:: with SMTP id bn18mr30305298ljb.521.1633526642355;
        Wed, 06 Oct 2021 06:24:02 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     stable@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/10] regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
Date:   Wed,  6 Oct 2021 15:23:16 +0200
Message-Id: <20211006132324.76008-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver was always parsing "s5m8767,pmic-buck-default-dvs-idx", not
"s5m8767,pmic-buck234-default-dvs-idx".

Cc: <stable@vger.kernel.org>
Fixes: 26aec009f6b6 ("regulator: add device tree support for s5m8767")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index d9cff1614f7a..6cd83d920155 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -39,7 +39,7 @@ Optional properties of the main device node (the parent!):
 
 Additional properties required if either of the optional properties are used:
 
- - s5m8767,pmic-buck234-default-dvs-idx: Default voltage setting selected from
+ - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
    the possible 8 options selectable by the dvs gpios. The value of this
    property should be between 0 and 7. If not specified or if out of range, the
    default value of this property is set to 0.
-- 
2.30.2

