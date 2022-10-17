Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9284AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 07:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJQHXr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Oct 2022 03:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiJQHXq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:23:46 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2395A3EF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:23:43 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9AF0684EED;
        Mon, 17 Oct 2022 09:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665991421;
        bh=5AvXb0yNwDTk6wu4dwvL/wvs6QyAVItX+4FFDSoWdYM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wuZh0Z9iI6cNOxQGk6v9zRTe4zUzuv0THRIqdVAbuh5Xtk/Cg/4b8hiIah630Oabe
         wdyvOt1cOx1hNdMqrOCfvaXfrgJnJqiFvkuTyI1aYDKWPEFJ13Pdb+RiCCAY5Y6N88
         ijIAQ+IhPePvs+KYqiI1/OlLSmTq0C8F2Z39jnqdJnbU2I2jM76ldAZ64uQfoBZC95
         LaDY9UamHB+i4nNCCYOQxg9JbWkQKK4AD0/dO7jgjfuT+W4l7WBhZFeuuBXrIPGSWX
         +JDYjYsJdsQJX6Klegmu12ZtKvh9C+ao+/2BUVNxhM+NbGyy8mMleg1D8RRx2IQPyU
         XnsRO53JCrt1Q==
Message-ID: <80ace77a-49c6-9b22-5c59-d0afa9b32153@denx.de>
Date:   Mon, 17 Oct 2022 09:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-6-jagan@amarulasolutions.com>
 <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
 <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/17/22 05:54, Jagan Teki wrote:
> On Sun, Oct 16, 2022 at 2:53 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/5/22 17:13, Jagan Teki wrote:
>>> Look like an explicit fixing up of mode_flags is required for DSIM IP
>>> present in i.MX8M Mini/Nano SoCs.
>>>
>>> At least the LCDIF + DSIM needs active low sync polarities in order
>>> to correlate the correct sync flags of the surrounding components in
>>> the chain to make sure the whole pipeline can work properly.
>>>
>>> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
>>> Rev. 3, 11/2020 says.
>>> "13.6.3.5.2 RGB interface
>>>    Vsync, Hsync, and VDEN are active high signals."
>>>
>>> No clear evidence about whether it can be documentation issues or
>>> something, so added a comment FIXME for this and updated the active low
>>> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
>>
>> [...]
>>
>>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>> +                                  struct drm_bridge_state *bridge_state,
>>> +                                  struct drm_crtc_state *crtc_state,
>>> +                                  struct drm_connector_state *conn_state)
>>> +{
>>> +     struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>>> +
>>> +     if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
>>> +             /**
>>> +              * FIXME:
>>> +              * At least LCDIF + DSIM needs active low sync,
>>> +              * but i.MX 8M Mini Applications Processor Reference Manual,
>>> +              * Rev. 3, 11/2020 says
>>> +              *
>>> +              * 13.6.3.5.2 RGB interface
>>> +              * Vsync, Hsync, and VDEN are active high signals.
>>> +              */
>>> +             adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
>>> +             adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>> +     }
>>
>> It would be good to explain what exactly is going on here in the
>> comment, the comment says "Vsync, Hsync, and VDEN are active high
>> signals." and the code below does exact opposite and sets NxSYNC flags.
>>
>> Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that
>> MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three,
>> active HIGH.
> 
> This is what exactly is mentioned in the comments.
> 
> 2nd line mentioned the active low of signals.
>>> +              * At least LCDIF + DSIM needs active low sync,
> 
> from 3rd line onwards it mentioned what reference manual is referring
> 
> Not quite understand what is misleading here.

This part:
"
+  * Vsync, Hsync, and VDEN are active high signals.
+  */
+  adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
"

Comment claims the signals are active high by quoting datasheet, and 
then sets the exact opposite on next line of code.

Have a look at this patch, I updated the comment there for MX8MP too:
[PATCH] drm: bridge: samsung-dsim: Add i.MX8M Plus support
