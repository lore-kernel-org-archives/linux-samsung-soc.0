Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F128CC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 06:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237107AbiFGGjs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbiFGGjj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:39:39 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2ABDFD0B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:39:35 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gl15so19272556ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/TKI0KNcFRBTQHLmJqq5f5OwL65S8oJ+dKfTOU4Rz8=;
        b=o27wuozEjkNzWwl2kVShg28Bxgi568Fk2f/tX1nG6jWBQeqiujJPnNhUR+YIp/VB+Z
         8sh1xRa+41ZvhwMyWGnUaknX00UfJB5HoJq8cI1lGwRr8qkFWAqsmJiB/ph8HjD4KGbn
         jHDGbGWoLV+4EeT/s/zvDhuRfjTeLZ1KXuLfpn5Zi68XLWrcVrabwh0mKWUabB4Ivg26
         43tCaP++ReoQADUW6/nqzJcISf3l5FYgfw8IQvQLKYbjsgB0ZDTG8qx59/v5PqEb5tyg
         4nNGmcmIUnKUafjiAGc3aYLXwPXSUhNhjv4+po+EPQ+fC6F25eL4/CLJps1NJ/VhpOVx
         Fmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/TKI0KNcFRBTQHLmJqq5f5OwL65S8oJ+dKfTOU4Rz8=;
        b=lMP0LO7JYv0/68a2xIwqhT7MV5F7qh7HqKIJGCE+2zBH5xxPv83KZdqkvpZ6ZdVVDn
         HFfErXYFSkNezu1nrARn/DSQXATAdDXVT9Y3cKa2RiN87kB5fESTEqWdtq01uzFo1w/X
         dbtkLKBdKWSC/o/yPqnE8ozjbggfo7857lr3MZmJKRJuMwn2JGSuFJ91V6tgbWjgAYLu
         CwRWu583vYLd1d8PWu60ek/WSFVY3Z8oQQ55O+ZTKcfaD2aPwuEmswhUDYDgThtZc5yA
         MGie4wYa4QQGoedo5C2Xiw/bJskzUIRHW9bd5TlXgL7IX9/7HSGXx/4zrE1+NFZwQ+TL
         EXxQ==
X-Gm-Message-State: AOAM530fTADts2r8KdfCrGmSmZjnPiHTU+Q0fpAPgdMaDM/belX7kDmd
        WxYnwcKmPo/AL1MYLlL2PyLUMw==
X-Google-Smtp-Source: ABdhPJzANmpcgwCRdLhkfvloqqmowEiViMHu9oP9cKZT1DzaWvIkR5Nubq2k8K7qnkDVIt04FL3NEQ==
X-Received: by 2002:a17:907:7ea9:b0:6fe:d412:ec2c with SMTP id qb41-20020a1709077ea900b006fed412ec2cmr25002358ejc.613.1654583975120;
        Mon, 06 Jun 2022 23:39:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm6116052ejm.119.2022.06.06.23.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:39:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v3 7/8] pinctrl: samsung: do not use bindings header with constants
Date:   Tue,  7 Jun 2022 08:39:33 +0200
Message-Id: <165458396991.8066.3661403493901937424.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-8-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 5 Jun 2022 18:05:07 +0200, Krzysztof Kozlowski wrote:
> The Samsung SoC pin controller driver uses only three defines from the
> bindings header with pin configuration register values, which proves
> the point that this header is not a proper bindings-type abstraction
> layer with IDs.
> 
> Define the needed register values directly in the driver and stop using
> the bindings header.
> 
> [...]

Applied, thanks!

[7/8] pinctrl: samsung: do not use bindings header with constants
      https://git.kernel.org/pinctrl/samsung/c/91a22d47f383aed2741b63df153bb331905859a7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
