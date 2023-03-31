Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03EAC76196
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Mar 2023 12:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbjCaMkl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjCaMjp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 08:39:45 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9807E20C02
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Mar 2023 05:37:33 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-53d277c1834so412041907b3.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Mar 2023 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=ZMrC7RQQSpVfgy/SHMpfC+E2QpLMDaY5/yaDkSHUKYAESGTlYtEL7g/qRUeknQy91P
         zUvgfNL0L6h3FNfh9c8D2HFAFVYOCP9WG625XToYyxYEiXALrCS5KsLDkaIeSbXlXde1
         eg6UEhsSIBdX6MmhPhtTRLpJ9X4gdd+QI1NZNQSGtPnmNcH0Md5Wv/wDx/8mZJzSNT7K
         vAZIJkR9VzoIqc5aO0g4o0xB+IpDOheOKDhB6ttu5EMPirHAV26dyaOz/pB9Dw1cQhWl
         Nw5HjfOlvF3F0OheAjfDdZPbDekSVJ+CefyXJevdAGQrjbRZSi8YsUnd1+evdQw6Mb3h
         4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=TKcMlVQ3pKRTjn4RF+Pp7DjpfZr8ZLMvceIo6tKnaospj4zGe4pDbZHe+JQ/fz1IMk
         c74bbbT2wZpVi6UnETnGr8INb7kwAEpAggwK/GCILNNs6lTakdY/c++/vWf2IGk+4a1w
         f62bzPeUvzdJrULmP2YzVtgxAe/7rv/lsz0VEFO3zcps7tswYLxPRJj7+J8MAkweil/G
         rT7bd0H3wyxdJcZCrguIHyZed05Ybttizl7QHe6aswpNhT+XDE9mb3Qg1kl/xf5gp+Or
         QcEWM2b1fJs1O1aOCKJbpxSAEXHJk6FctkZd07L59tRPuVokxJp8M3lb2wgCcXlNrNXL
         xFQg==
X-Gm-Message-State: AAQBX9foKlYrM/hxxxskLmrjcOrWXXIRfqsD8Rz9y9L87DMUDV7e4cub
        12feEfOqb2IYJ4nBZL6DEauwU/t4zo1TQxSKr36ALw==
X-Google-Smtp-Source: AKy350aQG4pTb9063C5UpGPTZlWu/1jB1S9bOfbEf1bci1cyW8YxugalTaCiIXNAm4RWMBbCrWxYKS+tBxFA+9FzOXI=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr13384037ywl.9.1680266252481; Fri, 31
 Mar 2023 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330200402.2731992-1-robh@kernel.org>
In-Reply-To: <20230330200402.2731992-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:37:21 +0200
Message-ID: <CACRpkdYwM5Kw4XB9S5qoqdK-boiYp2iu=LRZ-B-vJb1k9fNnig@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Michal Simek <michal.simek@xilinx.com>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        - <patches@opensource.cirrus.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peng Fan <peng.fan@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Drew Fustini <drew@beagleboard.org>,
        Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 30, 2023 at 10:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Hector Martin <marcan@marcan.st>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Rebase on pinctrl tree

I applied it quickly before something else changes!

Thanks for respinning, and thanks as always for driving these changes.

Yours,
Linus Walleij
