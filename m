Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21709C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Sep 2022 12:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbiI3MZU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Sep 2022 08:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiI3MZJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 08:25:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86BC20BD8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 05:25:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so6593353lfp.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=njbWtD08ViSccnQ66ue7s1hY8BgSMKUfwf3StI6pfZQ=;
        b=qKNmQxnFH8bG4C61TzRUUFnmbtU7nuUiN8cOygFVZUui/21GTVsjyK5UTyMP9Qq9/d
         dQgAZbueTYbN+5GV5sv2yjn0iqFKwQnZISXK/mgps27L5XuUOkrarxTvWIOtc69bXEFE
         MLeHg56BmO4aBAbvd+2OESIwwZKE0m5ZLv9zilns25+7BRNaD53ZGa15TtfnHiEwPaJt
         uFe2H8yLnnhnEUNKbjCJyNrJeEqG5EnR5gBK6hqyuHi9XbD6QGZdbDWdJKzfPLb5eq1z
         co8GsuCWIagqCI7xrlRBY37GCR/RDPn4450FWgZ2OZabuwEWcwlHbMkuZZmAMyNLlRut
         1aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=njbWtD08ViSccnQ66ue7s1hY8BgSMKUfwf3StI6pfZQ=;
        b=5bzJkHFjbdZ4AhlmkPiULcZcR+oSl2KW4WvpRgvuUUTdmVc7KH9DGL+HbK2lv+B8Bd
         XEvZzZg3GDgS5Xfgd6aKoekqkHuSbU1H5mX1rURhUoK56xeJ284P5uWVUQv4m60hwB2W
         v/DU+L4xdQj2MNRV91SOwL9JGuKdJ0kIoIP9Bk0De+FejlM4p6x/ludJvyCRsFbR2M6n
         jP8EDZnYKJlzjJMx1ozX4Um9Qnb4r+qYMZWj8sdgeR/JdYi6z8ls/SkJQ/EI/jD91BHP
         fX5XPyVWHvUCLCZXEh8d2JRQM+kozsvsjA+/VCbYLEXfriEsmn240ctc6elqzH6wfaf/
         oyDw==
X-Gm-Message-State: ACrzQf2IK6HoTtSYhPWCYhgJ0gpWjNUaNCMJxfnHpjKnsyfwsZdRt7tp
        z7Wjfek0egngBuGyqP/8WjjyHA==
X-Google-Smtp-Source: AMsMyM4fPRKZsl6+dn1tqcCBJgqnDC/nLU7itisMB6n6xQaJb7w+9dbGVQ/2hIynUoFV0Wurk+kw/g==
X-Received: by 2002:ac2:5462:0:b0:49b:8aee:3535 with SMTP id e2-20020ac25462000000b0049b8aee3535mr3078001lfn.410.1664540705955;
        Fri, 30 Sep 2022 05:25:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512318c00b004a031805c8bsm282968lfe.106.2022.09.30.05.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 05:25:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: exynos: fix polarity of VBUS GPIO
Date:   Fri, 30 Sep 2022 14:25:02 +0200
Message-Id: <166454069282.276470.5690165135266592824.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927220504.3744878-1-dmitry.torokhov@gmail.com>
References: <20220927220504.3744878-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 27 Sep 2022 15:05:03 -0700, Dmitry Torokhov wrote:
> EHCI Oxynos (drivers/usb/host/ehci-exynos.c) drives VBUS GPIO high when
> trying to power up the bus, therefore the GPIO in DTS must be marked as
> "active high". This will be important when EHCI driver is converted to
> gpiod API that respects declared polarities.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: fix polarity of VBUS GPIO
      https://git.kernel.org/krzk/linux/c/a08137bd1e0a7ce951dce9ce4a83e39d379b6e1b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
