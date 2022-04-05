Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F26C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Apr 2022 14:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbiDEOed (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378124AbiDENNR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 09:13:17 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9289E9A98F
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Apr 2022 05:13:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so22812826ejd.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Apr 2022 05:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w/Z5VzjPaah7N0YUbtAhapqjSjMXfGCadaBASbAspD0=;
        b=7dOiBFDRRvuhX8nNQguHmbWm8+QE2DPP5lE6QQD4Pd+x55V/KnhDuzAmKXTJfOARUL
         v+TNzqGFPW3+EGqiUCPOVmiDKgZxsGTSTnC0X5ZQVtl974YDs4B5Iz5CXjBqWbou2Awp
         yWqAzw62kex2Pk0y9GpVAT1Se8ZGHdxfLA76vbdm1RNCzc9+ANL/kg7ntkI2zIpHTr/m
         Llp/luaTI55RpNSJ/yjFbyWKipC98B7qcWuHW98I4ksMx0B2VYan5xfJEd3fz9r65Fbo
         yYv+658/+ggJ1eqVFoc8k39bYRCt6XFnmBAmyIWw26HtjOd8PhMgKFU8rHcLxqexneSl
         iQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/Z5VzjPaah7N0YUbtAhapqjSjMXfGCadaBASbAspD0=;
        b=r7CQVEax/Gdts7J2XiXdP3p7nvv3vYqamCAXPs9CInrygTTW1nbhCCpAGIse7PEEoQ
         0Jp+9H6dJ13BBSWb8qAymYhkfGTW0Bxs5tR+uF8XrCBft30LwpdlWHVzOKSctnCweVLw
         VWSuFcE8mC3Z+tnC1b2Iox9Dj7B67rA6j4RKm/WtOKEaa3aUsSh0rcHQkE0oxDftLprC
         WKYnk39l7BD9iFOThFMF100psxU0JHTMLD7bKd8Jl2/Z3Hu6sI22h/p8yDy++reNoymW
         WzlpNiwAN4FO9OjbpWlreIr964tl3pU+7N5ImX4RefBuahMiVTOL7VmI7TQ/neohixtZ
         hdeA==
X-Gm-Message-State: AOAM530dvt4kKnodin7tJPXF3mkbBdlPY9EGVsDzidBIXnJWjQ4u3i4X
        rPA12llrXSNKGammb16sf5P1xZo1ZLV9zn7tzwVVyQ==
X-Google-Smtp-Source: ABdhPJxVvhV5WZmApCq0DsgEovGa26+9MHznvNSVzqBc6ACt4ofBrfoHmbUA4s/kOIOSyV1hrsGZJlqKWGVuGtI+4qo=
X-Received: by 2002:a17:906:6a1d:b0:6e8:35a:4439 with SMTP id
 qw29-20020a1709066a1d00b006e8035a4439mr3387538ejc.734.1649160799105; Tue, 05
 Apr 2022 05:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com> <20220401103604.8705-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-3-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 14:13:08 +0200
Message-ID: <CAMRc=MeaSC6kvwfGAhX7XbeFvaw7MiozTj1p+ThZYCHZFppSzg@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: Introduce gpiochip_node_count() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The gpiochip_node_count() helper iterates over the device child nodes that
> have the "gpio-controller" property set. It returns the number of such nodes
> under a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/gpio/driver.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index bfc91f122d5f..12de0b22b4ef 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -755,4 +755,15 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>         device_for_each_child_node(dev, child)                                  \
>                 if (!fwnode_property_present(child, "gpio-controller")) {} else
>
> +static inline unsigned int gpiochip_node_count(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +       unsigned int count = 0;
> +
> +       for_each_gpiochip_node(dev, child)
> +               count++;
> +
> +       return count;
> +}
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
