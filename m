Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0E7C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 Aug 2022 07:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiHQHbg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 Aug 2022 03:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiHQHbf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Aug 2022 03:31:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4A86D549
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2022 00:31:34 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id x9so12740631ljj.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2022 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=n866UwlVQsvEsNFKCS8hnoSDwI11hrtsqigMztK4PUg=;
        b=P5fgpWe4cPrzCJusVO6q5+NjmimvA7suGtowiRgC7IkHvYFbrYfNOz3kmbiEgRSIqR
         QgY/zeWNw9ClHhckGsh20186cIiVx0tu5qb1/MQKpmVn57BDLMUKxzSjurdDIOXNPfF9
         5IO/YzPq2vbW9I7rCdS2atffVlubqHXp64UdJpyhhSFFXOATF0er+Xr7Qyu50X3yQqmG
         yKAlqqUxb/132vkBY8sqygKsbExmhkXiFF5f3184FqLM5PUWKIXQPVQcLAROrWxq49wn
         yJBB7rR/yDMrzxwD2y/RBRwuSHD/sLgC2DANofXZdrgQLTWA7aEVVNvKwWhspgrk7z4B
         TCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=n866UwlVQsvEsNFKCS8hnoSDwI11hrtsqigMztK4PUg=;
        b=Ek0oR10MhGv+CqUH3S37SvMh+2FZ5oYBiPwUtsf1okPxuTw8NYZNtu0y6HAAcNpLl2
         0z5eVEicRi6L+HCyq1zjsWxIxX0eFj+UstY2Zt9DIdnAMjgaZ8bXEUBQ+UqLbg8k/e8c
         XWCTz8ARUMfD9Tz5suzu/tvR6k+akL/ZolPi8ZRq+mSwIVcZMCIG5e/1jkXS6cKIOTbF
         QM5Cqo5EJDhJNhen/GvL2OMliNsuQTJFoZ5/+P9sYSNW0MGzL+v4hh60dLiLt9Xxkdi+
         YslTLaPAZpjNrywQ4AebufHmGfv7NdnNMhfvgH5GOv59eSHfv3mQ4ka6Xk2XbRYsGP9S
         I69g==
X-Gm-Message-State: ACgBeo2as8TpYCmsvfOq8APYHMUusnanpMSqJSA5WUg7tT+9mC51j3fC
        sSrYvInSn5KGAOSqXKGdbUXk5G1nVQQc5WX2
X-Google-Smtp-Source: AA6agR4ZRa7kPXpKMgSEeReObwfLq016wKe9tLYdc9p31rQ9SyozcH3P6Vxjtg66mc6ooTXwgNS2Ow==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id o10-20020a2e944a000000b0024f10bdb7e8mr8241865ljh.238.1660721492560;
        Wed, 17 Aug 2022 00:31:32 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id j24-20020ac253b8000000b0048b2f079cf7sm1591957lfh.239.2022.08.17.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:31:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
        daniel.lezcano@linaro.org, hdegoede@redhat.com,
        krzysztof.kozlowski+dt@linaro.org, daniel@ffwll.ch,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        lee@kernel.org, robh+dt@kernel.org, cw00.choi@samsung.com,
        linux-fbdev@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        broonie@kernel.org, linux-kernel@vger.kernel.org
Cc:     bzolnier@gmail.com
Subject: Re: (subset) [PATCH 1/3] MAINTAINERS: Drop Bartlomiej Zolnierkiewicz
Date:   Wed, 17 Aug 2022 10:31:28 +0300
Message-Id: <166072148468.30126.5293143761869366053.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 8 Aug 2022 13:15:24 +0300, Krzysztof Kozlowski wrote:
> Bartlomiej's Samsung email address is not working since around last
> year and there was no follow up patch take over of the drivers, so drop
> the email from maintainers.
> 
> 

Applied, thanks!

[1/3] MAINTAINERS: Drop Bartlomiej Zolnierkiewicz
      https://git.kernel.org/krzk/linux/c/20b02590a3f76ee4895a917da28897736b20eda9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
