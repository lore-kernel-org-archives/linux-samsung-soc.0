Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39A5C7EE30
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjB0O6m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjB0O6k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 09:58:40 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FCC83DA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 06:58:38 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F324085A6E;
        Mon, 27 Feb 2023 15:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677509917;
        bh=wZLI7hdr6HH44lVzor9TtB9EkjL2wZLffCqbHuZS5Ms=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fBRKCfgpE14QjQHA0aq2n+LegWmTd9ZIoT+U7Hfhaqiivjm8DXBWEsEq8TnS7xE7G
         zJQtX84RustiDGhGLc+iZ8h53XoozEDvmKhAHmHg9iRQ6FdWg0BGW81krmWWAXm7tE
         +7GgrtBQNiGrs2zlY7Fonz4gWj6Nlqh9Dh9P2bGHyJHpCSlyTzWReyXkfecMhCpIDZ
         k4Xyu22bql/DU39IqK5KD82Dca+2Cp481SAZTaOHSKBZnXgLK/LlqEbAQjgJBzYWLS
         uUSwLRJBq82x+pksJ9ma3Gl3Gv0bpdWyNdxdc1cAoS91Wmi9eShlAod04H9ZDRSFDu
         ZBxBTUhg5r65Q==
Message-ID: <3ba8caf1-9f6f-f3e6-28e8-1d6764911cde@denx.de>
Date:   Mon, 27 Feb 2023 15:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 12/18] drm: exynos: dsi: Consolidate component and
 bridge
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-13-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230227113925.875425-13-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/27/23 12:39, Jagan Teki wrote:

[...]

> @@ -1733,11 +1728,67 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>   	return 0;
>   }
>   
> +static int _exynos_dsi_host_attach(struct exynos_dsi *dsim,

I didn't notice it before, but please get rid of those leading 
underscores in function names, they shouldn't be necessary.

> +				   struct mipi_dsi_device *device)
> +{
> +	struct exynos_dsi_enc *dsi_enc = dsim->priv;

[...]
