Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02FEC04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 16:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjHHQ5n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjHHQ5D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 12:57:03 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C87F19429
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:00:03 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d479d128596so4834641276.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510384; x=1692115184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=ZxFJ7JzLoh7bauSZ/OIy2u43pTKXbKGVdv9x8Enh4z7wsAgmd7BDjDzgAzYOgdChhJ
         GPR4GuxiqEGOIuV3zBceQ07Bvz9a6v7wPWJaJf+nBb56Aw+ldFFgkyfzlUz3umgI7XNp
         6gA/OG9SL1Rj5aINaJE+IAUOMe/XT+n1/dl6WZxMJXNqDN9IrmsmprKxduPdu7DZfuqd
         8e8meI7N6MdakwEItgWaWVh8vhvBoiigeFaHbH+B60n7KLWdQzB809seRbIJvrJRSg+d
         tGqTMIe5C0k3AbekEjABJrM+9DGP7MJasBMpnhlw62ocpliLJghAJWa+wKaNMXt1P3u0
         nPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510384; x=1692115184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=EKYQwNpNKT/p+WtoEp0LOW+GwM2QwTbSCJj3xfahp8E7Bh/CyeFBR2ao53qUMYKzhz
         mGLQcN9QpCMmR/YP6Yh6kuYslbkEjbIX1n7Xgso7sG/kkxVpISX+5IP7ESFf32FevL5m
         p/0VFCOTLBdHYU3tzrx/swKwYWQUcLCI/F+d4vCxqh24F+oFUci+3mco/sjgNK35lDHq
         E+qYt7AM1KfeB4us6l242PpWeQVMNGnDv4yWQ/CqlrLTPTl00XS99G/bDU2eg+7t2hag
         AOlCYFqBeL/0y7+H7ECnyaeM0SBgHSUyEe9GUCIZUuIsOim/UfgYKDjutjbdl8gPrRXr
         XwDA==
X-Gm-Message-State: AOJu0Yzfd5vdnJNls8TKXwcBaCKkkBxmBothiPPfO2aok1ZR7LttLgfZ
        TC1cZObAfaC/K/SgWu2lbGIcHvNS+T6M3kg17+eKfTPzbzg2Ff0K
X-Google-Smtp-Source: AGHT+IGCQegfute4wq8vuctRCNyh2F9D25HtOrYRCxA1KPyHbK9gB5btAs+lYOVd+Us7kHls2/CFh6KxK9tgT70dyU8=
X-Received: by 2002:a25:d14e:0:b0:cee:80e:23af with SMTP id
 i75-20020a25d14e000000b00cee080e23afmr3349036ybg.11.1691500721596; Tue, 08
 Aug 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Aug 2023 15:18:30 +0200
Message-ID: <CACRpkdZ4OqLywBhCkDmA6bEkf3rfHpCODba9Rhx36fuP8ywt6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Walle <michael@walle.cc>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sean Anderson <sean.anderson@seco.com>,
        Michal Simek <michal.simek@amd.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 4, 2023 at 4:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> (implicit) v1 of this series can be found at
> https://lore.kernel.org/linux-pwm/20230803140633.138165-1-u.kleine-koenig=
@pengutronix.de .
>
> Changes since then only affect documentation that I missed to adapt befor=
e.
> Thanks to Laurent for catching that
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (2):
>   pwm: Manage owner assignment implicitly for drivers
>   pwm: crc: Allow compilation as module and with COMPILE_TEST

Clearly the right thing to do! Nice patches.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
