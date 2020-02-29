Return-Path: <SRS0=Xdun=4R=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEC1C3F2CD
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Feb 2020 14:42:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00C74246AF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Feb 2020 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582987324;
	bh=dSqY3s4nVRpjFr909SLJWucXmcDG/WI7KU/gJZgJjmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q/aeo10HthsjjhajbHS60ci5SpO6UxSpITlf8D+VLZuNTX6+Yc8IfBkqzqp9o+Rsp
	 nkXCfnGcfQOyJQsTdcUvSuay0WwoYTeFi/oGB5aDa0o2Ri2DuRBjibYlz9KHmXOYJq
	 xp1WVdGKXhtQJrKNBWMq0HW3Rcd9gVeS+Ggt3iyg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgB2OmD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Feb 2020 09:42:03 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41512 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgB2OmD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Feb 2020 09:42:03 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so7132635eds.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Feb 2020 06:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C3YWNLGQ6VFU9RB7boYRcc8KU2VF2OPWgz7bwm6NH00=;
        b=bPyAio+4q1/j3zVhOv2mGNPd78bhC1eK2XfQwQ7lq4MZI58fORzlY/UeZCycXiDf9V
         kuJtfrbfcUVjs9w1B/nrav92P8SY8t6azdEMR9qQJTmZHU3AnSFXnTPXls+aXuSv5DaE
         8UJuoIBFJGegWrpG6C4bLa4qXj8itOBc9JvXP/KnP9YVObF/sro1dBIdkyv/GTyzb48i
         zDzcOC0V4so4jipzMJswG3096vznEW2Ni4gQiClgBAzksoRF7MV0oHEkZFXl+Z1xpyao
         DDqT0oWI/K+4x1/yXfh9G06gQwjcPYe+9Wqq/220o45qfs9I8M0H+DQMcYDzaJkHKRIu
         X4IA==
X-Gm-Message-State: APjAAAXPWAw6h233PVzUvqo1PROplo3ntE6lCiT3l8g8S4h0FqUTOCrf
        fcody0weWkSR9iq50Q1XqW4=
X-Google-Smtp-Source: APXvYqz7+Y3lh3Bi+AqJ9CCmD7EuUa2DrJ999c+gVoqXLpngdKYmE0y5V34UVd6F6A+JtK3ZDe6kwg==
X-Received: by 2002:a17:906:b212:: with SMTP id p18mr8701022ejz.208.1582987320204;
        Sat, 29 Feb 2020 06:42:00 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id e17sm203411ejb.71.2020.02.29.06.41.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 06:41:59 -0800 (PST)
Date:   Sat, 29 Feb 2020 15:41:57 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Fix G3D power domain supply on
 Arndale Octa boards
Message-ID: <20200229144157.GB29448@kozik-lap>
References: <20200228145502.8316-1-m.szyprowski@samsung.com>
 <CGME20200228145522eucas1p240577364b62d00499ba1d45691c8430a@eucas1p2.samsung.com>
 <20200228145502.8316-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228145502.8316-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 03:55:02PM +0100, Marek Szyprowski wrote:
> G3D power domain in Exynos5420 SoC is supplied from PVDD_G3DS_1V0 and
> PVDD_G3D_1V0. Besides the main GPU MALI module it also contains the power
> domain control logic and clocks. Turning the power supplies off causes
> the power domain to fail to operate properly if GPU drivers are loaded as
> modules. GPU should use PVDD_G3D_1V0 supply mainly to control the DVFS.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 ++

Thanks, applied.

Best regards,
Krzysztof

