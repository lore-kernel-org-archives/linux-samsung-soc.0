From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 0/4] 0/4] ARM: dts: add support for hdmi to exynos4412
Date: Sun, 27 Jan 2013 21:43:22 +0100
Message-ID: <5105916A.3060200@gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:54978 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756116Ab3A0Una (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jan 2013 15:43:30 -0500
Received: by mail-bk0-f46.google.com with SMTP id j5so1022004bkw.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 12:43:29 -0800 (PST)
In-Reply-To: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi,

On 01/25/2013 11:39 AM, Rahul Sharma wrote:
> This patch enables hdmi support for Samsung Exynos4412 soc based Origen Board.
>
> This set is base on "for next" branch at
> git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git
>
> Rahul Sharma (4):
>    ARM: dts: add support for hdmi to exynos4
>    ARM: dts: add support for mixer to exynos4
>    ARM: dts: add support for hdmi-ddc to exynos4412-origen
>    ARM: dts: add support for hdmi-phy to exynos4412
>
>   arch/arm/boot/dts/exynos4.dtsi          | 24 +++++++++++++++++++++++-
>   arch/arm/boot/dts/exynos4412-origen.dts | 13 +++++++++++++
>   arch/arm/boot/dts/exynos4412.dtsi       | 11 +++++++++++
>   arch/arm/mach-exynos/mach-exynos4-dt.c  |  6 ++++++

Is the device tree bindings documentation related to this patch
series available somewhere else ?

>   4 files changed, 53 insertions(+), 1 deletion(-)
>   mode change 100644 =>  100755 arch/arm/boot/dts/exynos4.dtsi

Please make sure you don't change the file permissions to random
values.

--

Thanks,
Sylwester
