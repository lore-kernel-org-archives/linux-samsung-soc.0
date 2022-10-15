Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69EDC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Oct 2022 21:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJOVuO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Oct 2022 17:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJOVuM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:50:12 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1953831F9A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:50:10 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7B7BA84D45;
        Sat, 15 Oct 2022 23:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665870608;
        bh=r9TEMNbq1LO0stJhtoFSbaMOMmZklHrhmRiRCkBzHdA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QkrfdPnC1mkSK4Pf2wBQ3FLnPPlFlyQPBIAjuzNzjZl4FYBS2ICD66C/TAgVFU3ff
         7lHjJeHrP9Y9PcTOyIUhmlovGnQnzqxDtHkmk+iqBGSbdhx4lFVegS4bUPYXebWW7W
         02g8w5JstoEo4iZe3sNTwKhUnZxJNMy92A1tIsTXaRGIni2ZelwyyuEflO6eZgEHV/
         L6EsoOHDzEm/DWrCpYl+KhdTnJHaAJbCLIRz7GjFhvtl6DHKYwY/5ZgxncYkeHWEsA
         w/swVgPX/cZqvZ/FZFHNVVzuEQvAdsmEZU/zc4GLvUJcuGcl1Z3gL9/sF0XOhInh92
         LkeAzWbNEbgUg==
Message-ID: <2443a93b-a155-b983-6c7c-4bfd2a50b18f@denx.de>
Date:   Sat, 15 Oct 2022 23:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 03/10] drm: bridge: samsung-dsim: Mark PHY as optional
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-4-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-4-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:
> In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit

8M Plus too.

> to reset in order to activate the PHY and that can be done via
> upstream i.MX8M blk-ctrl driver.
> 
> So, mark the phy get as optional.

Reviewed-by: Marek Vasut <marex@denx.de>
