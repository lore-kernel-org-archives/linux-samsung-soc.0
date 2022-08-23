Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA6C32789
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 07:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240996AbiHWH0h (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240959AbiHWH0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 03:26:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B87A62AB0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:26:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n24so10660224ljc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J8u6XOZ3+5OnWV7Suub07jp0shX2a4U6qT+9ErWtKF8=;
        b=rdiAI00J4m73YNSjc72UGiqtKoXAQu6Yr/rrpWO2d/NmA8N3/OVbQKAJGlNRvPZSgs
         zEUWfUoX6uYAPAIUWydf/YGyzuW7oEbDFlDUQG5g+cZ9sFsjuDhbafJJHQjQho7IQBjG
         EcmYhL6p9ixjHE1NXHoU49fmuq+hXqI09eoVJ5qDw/ojjM7ZBEETWci2y0xo8iAS1G5+
         iBZRpilSP4wxjYPRqh77mWtQlK9iA2ujsYvICpiyuUT/On2FO3vc26n8qxR5UwNAmK6K
         Jaz7WS/rCUBNPEnau0phXbWDJYxjJyBXSn4QFwDCNV18iLTSkN/2cVuJS8jzbQOhKfby
         0Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J8u6XOZ3+5OnWV7Suub07jp0shX2a4U6qT+9ErWtKF8=;
        b=QPuU6nEIU3LU1zZogT1tWtP9Y09r6WAa/3X9oUnZTZpYIcZrk1+NnZIHPmzjrIR9on
         cKKHjYN3eQWFnniX0onbqft6iBT+UjbrPX0rFZlDnprXLIVQ4Dhiy/FUItTyUhgOREwm
         F3WWWRlmY/81dCgK60EoLQk1aYelHCLEmQ1E+4UfQ9sSRqxmPL8FbH/QIs9dtrYvQSW4
         F1Syk6QFEimLMaxYQsd7DzR387gwEB7lk1bLZ6nIJ9kIWh399jB9tt03RvxJy9Xr71LN
         HhUsBZduKTN4vYQMKIy9qeuZdIN+DJfA/sWRTz0IzunMAnXvl8Q/1nCPF0QeMKY5E2/n
         E5aQ==
X-Gm-Message-State: ACgBeo0e8lO1WYg5aZITx03u4FTgrW/Hrx/OPFbcipLH6sGJ1rbid76e
        qXWLnKm+J4Y8k8V5juhQRZ52HQ==
X-Google-Smtp-Source: AA6agR4ZZMX/TIi9KSCwYaiXNNouo3uMLZC2yG375OWN8koaYIlump3d0dtq6WBYXtoVvZD+/f1nSA==
X-Received: by 2002:a05:651c:a08:b0:25f:dc16:2161 with SMTP id k8-20020a05651c0a0800b0025fdc162161mr6967570ljq.165.1661239580417;
        Tue, 23 Aug 2022 00:26:20 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id i24-20020a196d18000000b0047f8e9826a1sm2357410lfc.31.2022.08.23.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:26:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     cgel.zte@gmail.com, s.nawrocki@samsung.com
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        chi.minghao@zte.com.cn, Krzysztof Kozlowski <krzk@kernel.org>,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
        linux-clk@vger.kernel.org, tomasz.figa@gmail.com
Subject: Re: [PATCH V2] clk/samsung: Use of_device_get_match_data()
Date:   Tue, 23 Aug 2022 10:26:13 +0300
Message-Id: <166123956379.357728.9628049310036670425.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
References: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 7 Mar 2022 03:35:46 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> v1->v2:
>   Add a judgment for returning variant to NULL
> 
> [...]

Applied, thanks!

[1/1] clk/samsung: Use of_device_get_match_data()
      https://git.kernel.org/krzk/linux/c/777aaf3d1daf793461269b49c063aca1cee06a44

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
