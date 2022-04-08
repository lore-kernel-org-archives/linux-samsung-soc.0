Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2505C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 15:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237497AbiDHPYb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 11:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237495AbiDHPYa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 11:24:30 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F41108746
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 08:22:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q19so13399557wrc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sPygLbD1B7EQ520hW5RQW4mGJJ5DO7vPlVdwf9z6NxI=;
        b=rnNZUmsDC25DLs3861xbnitTubGbaLpRp0g4SSNU90qrEH3Em2POjR8w4Wc+PNhH+N
         x2k51skqLe1F+lNYA9yvKLgAqtBISBFL6XVsgUZcRPfauhPI80VDFulZpkt5bmLpVDYY
         ZtcQhj39tTE2VqLciTtIybGXe+9YaHlgWcLqIkY0nOkMJZBBMOlSvxWId5Ha6vVxvmYz
         7xnHdPudHX8+SFOLpTAwifky/xUbZjXnyx5436vJaaC0pZeTZxL3DQb4xvQz3KJUXv9q
         L9x98EaoaCIDFhQ0BAtDJvGbbNLRFinrYxieLx/dCD5jaTsZlGT4ryA5e8iHSxWZ89Kc
         mMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sPygLbD1B7EQ520hW5RQW4mGJJ5DO7vPlVdwf9z6NxI=;
        b=115aQDv+qmoPpiDQXQveZOYj0Eg7XqwJkiN7faWyO+mK8MMk/Vdwuif66l7MDnR/5q
         vpb0QOyu53TQgpvxQrnjeRoARYXFEJxsPYZs3ZuWf92+DSVDOL5SiBnatG0PgoXDEF/A
         cRq0pIrjw2vmUCSjdQ7aBFGwez9Dqmx1S9CiWZ6nam/B4rttjPefgDlxsAkcc0DyyB3q
         6JLbLBa4M+ELHYf5zmwXwMd9hWbOdO7lOmfSBtHneRv1DzVZj7qwPgq3nyiz4kqgovuF
         tOux2EFEVW1/oHDIhl/ELs1X7duh4aET/iFf7VQyCBFNVLQf9jg+Ysqfj9WJP1Yvd7d5
         XrDA==
X-Gm-Message-State: AOAM532F3ZEcwk4ND3YVliU0SAqdaccQiO8mxtwHaarlcgyw6Kxq6k5B
        PEmVCF6gH8JkwpN/kk3QUry1Iw==
X-Google-Smtp-Source: ABdhPJxGPNgXgsufUjB8Lp8JJWbca8cu17Hg8qjIbnxCrticuxKM/31Uln39Sz96BlX1M76FBt7ZIw==
X-Received: by 2002:a5d:6dac:0:b0:204:12ba:45ef with SMTP id u12-20020a5d6dac000000b0020412ba45efmr14920479wrs.416.1649431343717;
        Fri, 08 Apr 2022 08:22:23 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r4-20020a1c2b04000000b0038a0e15ee13sm10714642wmr.8.2022.04.08.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 08:22:23 -0700 (PDT)
Message-ID: <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
Date:   Fri, 8 Apr 2022 17:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
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
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/04/2022 12:35, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 

(...)

>  /*
>   * Iterate over all driver pin banks to find one matching the name of node,
>   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
>   */
> -static void samsung_banks_of_node_get(struct device *dev,
> -				      struct samsung_pinctrl_drv_data *d,
> -				      struct device_node *node)
> +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)

This is worth simplification anyway, so please split it to separate patch.

>  {
>  	const char *suffix = "-gpio-bank";
>  	struct samsung_pin_bank *bank;
> -	struct device_node *child;
> +	struct fwnode_handle *child;
>  	/* Pin bank names are up to 4 characters */
>  	char node_name[20];
>  	unsigned int i;
> @@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
>  			continue;
>  		}
>  
> -		for_each_child_of_node(node, child) {
> -			if (!of_find_property(child, "gpio-controller", NULL))
> -				continue;

This does not look equivalent. There are nodes without this property.

> -			if (of_node_name_eq(child, node_name))
> +		for_each_gpiochip_node(dev, child) {
> +			struct device_node *np = to_of_node(child);
> +
> +			if (of_node_name_eq(np, node_name))
>  				break;
> -			else if (of_node_name_eq(child, bank->name))
> +			if (of_node_name_eq(np, bank->name))
>  				break;
>  		}

This patch has to wait till someone provides you a tested-by. I might do
it around next week.

Best regards,
Krzysztof
