From: Sekhar Nori <nori.sekhar@gmail.com>
Subject: Re: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Fri, 14 Dec 2012 11:20:26 +0000 (UTC)
Message-ID: <loom.20121214T121839-194@post.gmane.org>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com> <1348765784-7508-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:48485 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753501Ab2LNLY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 06:24:58 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1TjTO3-0004NK-Va
	for linux-samsung-soc@vger.kernel.org; Fri, 14 Dec 2012 12:25:04 +0100
Received: from dsl-KK-static-231.193.95.61.airtelbroadband.in ([dsl-KK-static-231.193.95.61.airtelbroadband.in])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Dec 2012 12:25:03 +0100
Received: from nori.sekhar by dsl-KK-static-231.193.95.61.airtelbroadband.in with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Dec 2012 12:25:03 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Arun Kumar K <arun.kk <at> samsung.com> writes:
> 
> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen <at> samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk <at> samsung.com>
> ---

> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt
b/Documentation/devicetree/bindings/media/s5p-mfc.txt

> +Required properties:
> +  - compatible : value should be either one among the following
> +	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
> +	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs

Sorry for replying on this patch so late, but this thread came
to my attention only recently.

I thought generic comaptibles like this are discouraged and instead
you are supposed to ground the compatible property to a real silicon name.
So you would use something like "samsung,exynos4212-mfc" and so on.

> +  - samsung,mfc-r : Base address of the first memory bank used by MFC
> +		    for DMA contiguous memory allocation and its size.
> +
> +  - samsung,mfc-l : Base address of the second memory bank used by MFC
> +		    for DMA contiguous memory allocation and its size.

> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
b/arch/arm/boot/dts/exynos5250-smdk5250.dts

> +
> +	codec <at> 11000000 {
> +		samsung,mfc-r = <0x43000000 0x800000>;
> +		samsung,mfc-l = <0x51000000 0x800000>;
> +	};

How are these addresses determined? Are they defined by hardware (so they are
not user configurable) or is the user free to choose them depending on where
he intends the contiguous memory to lie? If it is the later, I wonder if it
is considered okay to define this in device tree since it is supposed to be
a description of the hardware.

We have a similar situation on DaVinci and we are wondering how this should
be handled. The ideal choice seems to be module parameters, but there are
some challenges there. See:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/136996.html

I understand I am speaking too late on this patch (seems like it is already 
merged into linux-next at the least), but I still wanted to start the 
conversation here for future sake.

Thanks,
Sekhar
