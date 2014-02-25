From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Tue, 25 Feb 2014 10:00:49 +0900
Message-ID: <530BEB41.5070107@samsung.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>	<CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>	<53075239.4010603@samsung.com>	<2200834.G3JJLYQl5i@wuerfel>	<53076F00.7000001@samsung.com>	<53077160.5030202@samsung.com> <CAK9yfHxiHkrf1xmSFbfoKqFFSCU6w4QqwPnQNdv1m1PGtrwsLQ@mail.gmail.com> <530BE557.20106@samsung.com> <530BE93F.2070904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:54978 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbaBYBBF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 20:01:05 -0500
In-Reply-To: <530BE93F.2070904@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Tomasz Figa <t.figa@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 02/25/14 09:52, Tomasz Figa wrote:
> On 25.02.2014 01:35, Kukjin Kim wrote:

[...]

>> Well, let me see common.c and mach-exynos.c, one is for SoC specific
>> stuff and the other is for Board specific so I think, keeping current
>> file would be good, we can change the file name mach-exynos.c or
>> board-exynos.c though.
>
> There is no board specific stuff in mach-exynos/ with DT, so there is no
> need to keep those file separate, especially when stuff from common.c is
> constantly being (re)moved.
>
OK.

> Also I'd rather stick to what other platforms use, which would be
> exynos.c (like tegra.c), as Arnd proposed.
>
agreed. OK.

- Kukjin
