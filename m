Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AC1CCA47E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbiF0JQN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 05:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbiF0JQL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 05:16:11 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4952B5FA7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:16:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fi2so17737007ejb.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kJ1jAwa/+7BjPtt5g76BTIKEOFlfeh80CJPRRsz6gBY=;
        b=QVRkpvoeUqPXDpIa2rU1njf8g+wNu1owM3abURlIHRb1HaswOUzKXD0aZAYaYQQxNx
         jdzAWkC0xvcwT7Dc0NzDZeRrJx4y/5x2QvSBhDnej/DZFMRa05sst3bYwNHkFApDIt9H
         IxX3MLfjwgZxn6ej8j644dMoVHx24Q+U1NNz5Vzgsh1CLWoBoHZriZKbQVvMjH/GtYHv
         xOvU9Yu+CJ2KOOHmhXu3nbdrc1nG0AOa541v5g8aak1o1KbH7CagOoWMGvDu6W/zhhy2
         mel7Nu+NJl8MD/GjAncYHbAIJf4uqHyLuj5U84jj9hERQ8SQunLqfSZa2pukWtGvqw52
         Igeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJ1jAwa/+7BjPtt5g76BTIKEOFlfeh80CJPRRsz6gBY=;
        b=SvXbpxZ9uXlOXpPkN0GAw+UADySjxULNaqyQABUvIOYvr7qkWIfyI5Bwil13nqaeDU
         h3FYLb2dMB/JUN80ZkgzlwmSbi62zrukoM4incH6WYhn6v75v6yWPl6lsuNOFDB3+hB8
         j9vonK6BgtShjrcrfqdpm1Qx0q7B/C7XHVwo5JdksHle5TS1xs+JbVyhikD1pWhWJ8lI
         BrTcCQpTkveEwYdI6DAdT5yLfCp4DUe8aeRS/70E14zQfqb4nO2y4/sO9hDeyp0Hnet0
         s7O7WB7Sn6tQiHdQpmvozPCa2jDtadabrF/7/QbemfFsFBkgGKholomAt69TnXP5+uuH
         qw0g==
X-Gm-Message-State: AJIora85vWfm9ZZAH201l+KYfLvobk5xNkRybLqfcf00cWD1775thnCM
        mPvhsbRGht17gpsUSOAjSTrBEwndTtu6mg==
X-Google-Smtp-Source: AGRyM1sFJYD09SrNHrTBsRr5F+dNB4PCjRgumEjuEC8DVluJhWZ7budht3O44iDxJgZyA1gHbR9xqw==
X-Received: by 2002:a17:906:752:b0:726:a6c2:b242 with SMTP id z18-20020a170906075200b00726a6c2b242mr3854178ejb.33.1656321367816;
        Mon, 27 Jun 2022 02:16:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        jh80.chung@samsung.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Subject: Re: (subset) [PATCH 2/5] ARM: dts: s3c24xx: align SDHCI node name with dtschema
Date:   Mon, 27 Jun 2022 11:15:43 +0200
Message-Id: <165632135506.81841.714380645007134856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626120342.38851-3-krzysztof.kozlowski@linaro.org>
References: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org> <20220626120342.38851-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 26 Jun 2022 14:03:39 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects "mmc".
> 
> 

Applied, thanks!

[2/5] ARM: dts: s3c24xx: align SDHCI node name with dtschema
      https://git.kernel.org/krzk/linux/c/1923e58045471c7226eeab34762e2f821c2c31b7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
