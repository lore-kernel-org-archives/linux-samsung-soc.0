From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/4] Use clock functions also for clk_h and clk_p on S3C2443/2416
Date: Wed, 07 Mar 2012 03:17:44 -0800
Message-ID: <4F5743D8.702@samsung.com>
References: <201203032214.36820.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:36424 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753067Ab2CGLRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 06:17:50 -0500
Received: by obbuo6 with SMTP id uo6so6773643obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 03:17:50 -0800 (PST)
In-Reply-To: <201203032214.36820.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 03/03/12 13:14, Heiko St=FCbner wrote:
> This series modifies the clock init in common-s3c2443 to use the
> struct clk operations also for clk_p and clk_h whose values were unti=
l
> now set statically in s3c24xx_setup_clocks - a function more suited t=
o
> the earlier S3C-SoCs.
>
> In the end it makes the code (hopefully) easier to read, as strange
> divisions through register values get replaced by simply clk_get_rate
> calls.
>
> To apply on top of the current s3c24xx consolidation.
>
OK, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
