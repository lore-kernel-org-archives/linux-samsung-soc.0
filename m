From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Remove vmmc-supply for mmc@12220000 on arndale-octa
 board
Date: Fri, 25 Apr 2014 22:16:30 +0200
Message-ID: <535AC29E.8010905@gmail.com>
References: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:33700 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754819AbaDYUQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 16:16:33 -0400
Received: by mail-ee0-f53.google.com with SMTP id b57so3101781eek.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2014 13:16:32 -0700 (PDT)
In-Reply-To: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

Hi Javi,

On 25.04.2014 22:11, Javi Merino wrote:
> d726ca2d3316 (ARM: dts: Add vmmc-supply to MMC on arndale-octa board)
> added the vmmc-supply to nodes mmc@12200000 and mmc@12220000 of the
> DT.  However, this makes the kernel fail to boot on the arndale-octa
> spews:
>
> [    5.060000] dwmmc_exynos 12200000.mmc: num-slots property not found, assuming 1 slot is available
> [    5.065000] platform 12200000.mmc: Driver dwmmc_exynos requests probe deferral
> [    5.075000] dwmmc_exynos 12220000.mmc: num-slots property not found, assuming 1 slot is available
> [    5.085000] platform 12220000.mmc: Driver dwmmc_exynos requests probe deferral
>
> And eventually hangs.  Without the vmmc-supply property in the
> mmc@12220000 node, the kernel boots again.
>
> Signed-off-by: Javi Merino <javi.merino@arm.com>
> ---
>
> Hi,
>
> Note that I don't know *why* removing the property works, all I know
> is that 3.15-rc2 fails to boot on my Arndale Octa unless I apply this
> patch.

Are you sure you have the required PMIC driver enabled in your kernel 
config?

Best regards,
Tomasz
