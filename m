Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CACFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29032610F9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:25:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhJNL1y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 07:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhJNL1x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 07:27:53 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDC2C061753
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:25:48 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id h4so10598443uaw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kSckpstnup2DmrGx5/lGiQeAbXcf7pXBoI+smXRBHM=;
        b=zQCyOXiH6/zHZe0gpe+oikxi2opvKMhIvaoF8PKvbU8RZzA5iuQU1+t+POg7tOqT+x
         7VtjwHdWHxH4EujiGXf3a+uH+KjftQTyeLsb6IFjwGJD5ZP+gVKa9S6HwQ9CjfB24ZJz
         IyKG88gn8ylL9Ie0hmSQ7jfxPA+9QZT3HIfiEicX+iaP6ZvlmWWq9BUJJWGDpFk7PNnI
         8ohuyFlLmEop2upSAltY6YIlWrCUg4qihDjfOMA3K8yuRJ2r17kbVanxS5nWkNVAQkEK
         ZApuQUBCrkoJ/xwxFiwO+q39FfCoICL4BjNlgh6MMoEMIGqkdqELKFtAOYlh8CDqf5v/
         rAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kSckpstnup2DmrGx5/lGiQeAbXcf7pXBoI+smXRBHM=;
        b=Y6+5M1/wSfie55kKbhvsrzyV6YUOCGR6EqcNZ2aqN0P/ELtFuZGizoGkMMw0y+BFg+
         QwR0hjocm0YuJlgxvp8HVXmt01H7zgz7MUco0bNjX51hg4ls/+9Tk0G5zXoSqLGBIQA6
         6p36h1bkSKtMNA9aFm6LsX1g5N9ShdFdtRy3zsde+weQw0nYijuqFFR2Gb8hhfbJYUeX
         J+A5p2M5F3/avuxfP9+oLRwwtPyR315g+hNM0ARaZaxItaBZDGFBJZWkCfnayxFtp8tB
         Vvkez53pbyMK+iKAUpYNRfCMDXfCjr7NHx4pzglRWw6ftYowaTeLR1mi5NZT3Qjl+qhK
         yVLw==
X-Gm-Message-State: AOAM530zkCRS/oxmkC8wedOQSnGuWxFDzGuRu/uis/O7mynezOiuS664
        kRvn1qhBSgLpLO3ZXLN3VU8awvSSKd/9dpTe9/wLBQ==
X-Google-Smtp-Source: ABdhPJw7tA5Itylbliuf7uRWxKCnJodfXYqfOPUb1k3YcjKxi04jWBTcookWXl0DvsdLYHC8ihFrLDT3VdUPs07klso=
X-Received: by 2002:a67:1781:: with SMTP id 123mr5847970vsx.1.1634210747944;
 Thu, 14 Oct 2021 04:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211013202110.31701-1-semen.protsenko@linaro.org> <3460c787-0a72-3c37-1075-dfee9cc2c0b3@canonical.com>
In-Reply-To: <3460c787-0a72-3c37-1075-dfee9cc2c0b3@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 14 Oct 2021 14:25:36 +0300
Message-ID: <CAPLW+4mw8e+r=Jf8unQtLGXHpxvioQinOjrDChdvs8S+hddotw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 14 Oct 2021 at 09:41, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 13/10/2021 22:21, Sam Protsenko wrote:
> > Old Exynos SoCs have both Product ID and Revision ID in one single
> > register, while new SoCs tend to have two separate registers for those
> > IDs. Implement handling of both cases by passing Revision ID register
> > offsets in driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
> >  include/linux/soc/samsung/exynos-chipid.h |  6 +-
> >  2 files changed, 58 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> > index 5c1d0f97f766..7837331fb753 100644
> > --- a/drivers/soc/samsung/exynos-chipid.c
> > +++ b/drivers/soc/samsung/exynos-chipid.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> > @@ -24,6 +25,17 @@
>
> Include a changelog please. Your patch does not apply and there is no
> information on tree which it was based on.
>

Sorry, my bad. Will do in v3. As for the tree: it's based on the
latest mainline/master. I'll double check if patches apply correctly
to that before sending v3. Please let me know if you want me to rebase
this series on top of some other tree.

>
> Best regards,
> Krzysztof
