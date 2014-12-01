From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH RFT 2/2] arm: dts: disable CCI on exynos420 based arndale-octa
Date: Mon, 01 Dec 2014 10:50:29 -0800
Message-ID: <7hbnnn5hmy.fsf@deeprootsystems.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
	<1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:42464 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752771AbaLASuc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 13:50:32 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so11540210pad.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Dec 2014 10:50:32 -0800 (PST)
In-Reply-To: <1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
	(Abhilash Kesavan's message of "Fri, 28 Nov 2014 20:20:09 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, nicolas.pitre@linaro.org, lorenzo.pieralisi@arm.com, punit.agrawal@arm.com, will.deacon@arm.com, mark.rutland@arm.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, olof@lixom.net, kgene.kim@samsung.com, javier.martinez@collabora.co.uk, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, kesavan.abhilash@gmail.com, arnd@arndb.de

Abhilash Kesavan <a.kesavan@samsung.com> writes:

> The arndale-octa board was giving "imprecise external aborts" during
> boot-up with MCPM enabled. CCI enablement of the boot cluster was found
> to be the cause of these aborts (possibly because the secure f/w was not
> allowing it). Hence, disable CCI for the arndale-octa board.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

Tested-by: Kevin Hilman <khilman@linaro.org>

Tested on top of next-20141128 with exynos_defconfig on my Octa board
and I'm not seeing the imprecise aborts anymore.  

Thanks,

Kevin
