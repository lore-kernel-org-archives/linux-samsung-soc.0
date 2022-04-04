Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E828FC4167D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382379AbiDDV2L (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379371AbiDDRDy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:54 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C99D40A24
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:01:57 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g20so11880517edw.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5Fmb4acPC59cWZXdkuaYjyiaNIFHAYaKvTirVUtyb4=;
        b=R8hcC66HpgMWLqprAc3n6eEdxFsgMtSPa37JJtF4M0LOQQxhDV5/c47atRSa8zHosK
         Kj07u92mYfjSCKDxQZFzeMjmsmm7NhVNpY5mDun8DDsQF4JXKdDOelLXIdq98qZ7/IL9
         g6bE11BZY9RBWmwwWMvikscr8Amc9ceyc7EEEEpaUrDTePh7BARB0NmuQqIQqVV60bO3
         GiPI6qxMRN40VVREzeXloXjPRaeTBLUNufaBhPEFyffYoIJIeH+L1HvOF/Xht0HgJ/ap
         61sRx4y6JRk8DqFdDNReLUgtRu17YVLKHYcC9EzLe+eUFkzUW2EckiHPNdxFgYDlWW5D
         xLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5Fmb4acPC59cWZXdkuaYjyiaNIFHAYaKvTirVUtyb4=;
        b=iwB9eDmnOFcgewkx2NtvkEQaMdSbbyPwogDAcaHMR7o+sQM9ytOFW5Rf/M639IKlgi
         DddvbSryKrpat1AcCz6D/yhTD+rAXMUCgrnWg0KKIhBLma5mx8C/DyRd8hLg4REv7UBY
         P6d3Ec1xy7IeVkaQhkq7zTqD2/ovL+dkUVfM+OoktGx8hyt7hOr7rHk+2fFeyeqQCpBh
         +dCC5LpD9IuVUIu6aRg3xY4Iv32eZHdWvc7tqg9npAgT5TTcOReoeqcHGXBRFEyIPON0
         CrESPTABw9EW2V4OADuOVeXjFpd3wsENLkcFGcu01spbEuBievS/KVI435Sr1i9uvcXQ
         rkYw==
X-Gm-Message-State: AOAM531O6pUyYFo9pqlBzWRNiz9hIioQ7qJ1MVXb4lZtT2UJiYXFT6I5
        c18uKgPfulFYMvpYYEhCbtlKBg==
X-Google-Smtp-Source: ABdhPJxw9oxoZGvi5JcalnhggHj8GMN53jspFBnnKS9BPbdilK/xZWUSjz+E8N965+hn6nwIGmMlgA==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id l24-20020a056402231800b004137645fa51mr1136945eda.201.1649091716073;
        Mon, 04 Apr 2022 10:01:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/5] ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
Date:   Mon,  4 Apr 2022 19:01:45 +0200
Message-Id: <164909169269.1688455.16830992649596254488.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-2-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com> <20220314181948.246434-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 14 Mar 2022 19:19:45 +0100, Krzysztof Kozlowski wrote:
> The node names should be generic and USB DT schema expects "usb" names.
> 
> 

Applied, thanks!

[2/5] ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
      commit: ab92681ca16194c966844ed4dd2c336705e0c727

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
