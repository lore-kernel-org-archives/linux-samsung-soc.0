Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F51C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 09:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiJQJ6T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Oct 2022 05:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiJQJ6S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 05:58:18 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825FE5D139
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 02:58:16 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q9so23783100ejd.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
        b=MUHWuYJag6UdIGNJWiJWxn8WAAZ42CXEFTnECn+6skOIqg/uauJYEVg974vMd9sMEk
         zE6zI7z18arTxzgN6sTudVQN0HH06/PzZJ+4X18m75Vy/bF7X3X+fEqiRAyn7cwpLeMe
         1S3Gkx8o3vO463r4qBmru/5P+HeV+QtYD7XFaMKTFQkBKEINKik6GSXOIGd4TakIzo/y
         22NV5ZvkVpf1kqoQWmMXugwEs+G3K/F00qz0J2gsZD0tyQrxzJVUb1Rv0OE2tl8BfDdT
         1Thx86QUb3Eo9BPHEOAqRcLadLrkm9xIrIOP9q0Nx+T+iVZxfi/eZSxmcD7GZQwM5l3C
         f6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
        b=A8ZHIjMKGBuMOG2+jIVbWfESmstttCGSrLv9ECPsJRPuVXBICTdU5FKnsg6PUFCqCn
         llAWiBEdtS1mEnW3OxlSK81bb4OU8/+jnzP+lwKSWlz5sFH+Ogb6pcHNrImZeQaIVj3R
         Us3H0N9T1V8fE6bYVzgAzfXrAHD9OK1L8fCteSY5hJGRfM9O+40oYA2iI73+88QoLw5f
         92lhIfXwIe4AT9Pboh32zTqCBnReFDQ5IL8PPnmdl8TKHU9uHR+HFEWsobcpHfu05M2F
         8bBB3BZN2X2U8YXx2st9Gq66aYZmiHN+GbFrQitJGhfJqBDeJbJQSKOVv+sJ6iTfi42m
         aHag==
X-Gm-Message-State: ACrzQf1jk9ejAW/z8kbSVHkHwRCm4esvwxb9yXaEghrcUG7o3tcpQwiO
        a84ogur/pXihwXNdZ6G6Qz34fiot0fH8qcYpUYe22A==
X-Google-Smtp-Source: AMsMyM4L0M6bcj2Wvh4KRdD8EKd7M4z6+eLVjZHPl1MFPGYp6JqekMO0KaAEpqZ8kDbWIS4EMUIR8qxcTy8qHdB2D/8=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7556783ejc.690.1666000695069; Mon, 17
 Oct 2022 02:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com> <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
In-Reply-To: <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:58:03 +0200
Message-ID: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> >
> > Aha I see you want to send a pull request so I backed out the applied patches
> > from the series for now.
>
> Can I consider all that you answered to as Rb tag?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I haven't reviewed in detail but I fully trust you to do the right thing
and fix any fallout so will happily pull this.

Yours,
Linus Walleij
