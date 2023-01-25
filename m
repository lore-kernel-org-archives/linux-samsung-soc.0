Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DF6C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 21:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbjAYVxN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235443AbjAYVxM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 16:53:12 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8243C3A87
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 13:53:10 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D86B185666;
        Wed, 25 Jan 2023 22:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674683588;
        bh=cDj0qNJmpBxszzzfzQeDa9hoXH6ASKfJgUV396KDoi4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=yMYppRbEmxuVlCk2I+6gewu8P4WRG05+Af/RIB+8WcOlNsMMF3KBHAgT0Ct1Nga7J
         Q6j+KwRQiThlcV4Ir/d9/McGjdjbnNH120c0mbKudmAXOJqQUX8LvKd3vFTfjwtRPH
         nv8SaGeIg+bhY3b01CV0zQuliqrh/gpLz18+fwnxEKhKek8oxCqU97VeGHnwyBXFFC
         wvt9cu7FbJIi8cSSKReQefPOo4vcRQBeSjmXIs4rOIJfd0Pq8BQkUcULB9qLxUa0zm
         Uhzei/E8FhLLlvqGt36dCLvVaTkH+GjlTW6pixHsf3iDMmpCqeNW99qdg8GMqzIJxV
         lpKprB7/2oWfg==
Message-ID: <0a318675-8a9f-58da-ad3f-9eda6a701626@denx.de>
Date:   Wed, 25 Jan 2023 22:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
 <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
 <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
 <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
 <CAMty3ZDTcnN_NgjL8hEBnABpFcaE=hCegZnzaC9tz-7wFxYSmw@mail.gmail.com>
 <94f847b0-769d-e28b-11c0-b817b30c704f@denx.de>
 <CAMty3ZBTRO55N87u+YS+MtOn-D=-YRbe1Gnm8uuQM04ULuT_Vw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBTRO55N87u+YS+MtOn-D=-YRbe1Gnm8uuQM04ULuT_Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/25/23 20:24, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 11:33 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/25/23 18:35, Jagan Teki wrote:
>>
>> [...]
>>
>>>>> exynos_dsi_register_te_irq is done after the bridge attach is done in
>>>>> Exynos, here bridge attach is triggered in the component ops bind
>>>>> call, since samsung-dsim is a pure bridge w/o any component ops.
>>>>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
>>>>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
>>>>>
>>>>> Any suggestion on how to handle this?
>>>>
>>>> Why isn't the generic code calling drm_bridge_attach() in
>>>> samsung_dsim_host_attach(), like the exynos one ?
>>>
>>> Exynos drm drivers follow component ops and generic dsim is a pure drm
>>> bridge whose downstream bridge will attach in bridge ops attach and
>>> the component-based drivers require an initial bridge attach (whose
>>> previous is NULL) call in the component bind hook for establishing the
>>> bridge chain.
>>
>> Well in that case, call the exynos optional host_attach and register the
>> TE IRQ handler at the end, that should work just fine too, right ? If
>> so, then you can also move the IRQ handler registration into the generic
>> part of the driver.
> 
> Something like this?
> 
> samsung_dsim_host_attach()
> {
>          drm_bridge_add(&dsi->bridge);
> 
>          if (pdata->host_ops && pdata->host_ops->attach)
>                  pdata->host_ops->attach(dsi, device);
> 
>          exynos_dsi_register_te_irq
> 
>          dsi->lanes = device->lanes;
>          dsi->format = device->format;
>          dsi->mode_flags = device->mode_flags;
> }

Yes, I think that should work .
