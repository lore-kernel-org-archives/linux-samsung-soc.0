From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [linux-next] make s5p64x0_defconfig build error
Date: Thu, 15 Dec 2011 07:54:58 +0800
Message-ID: <CAF+7xWn80ZsgBNS80f0JYUXx2KN3VGM-Y2EOba7OLMwMGNfbKg@mail.gmail.com>
References: <1323838630.18517.1.camel@phoenix> <20111214123244.GE7122@mudshark.cambridge.arm.com>
 <20111214191205.GF14542@n2100.arm.linux.org.uk> <028901ccbab8$c2c43890$484ca9b0$%kim@samsung.com>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:44954 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755603Ab1LNXzV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 18:55:21 -0500
In-Reply-To: <028901ccbab8$c2c43890$484ca9b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

> Axel and Will, thanks for pointing out.
>
> Oops, I couldn't have much time to follow up :(
> But let me look at that in this weekend and I know, it can be escaped before
> merge window :)

I also found the same build errors by:
make s5pc100_defconfig
make s5pv210_defconfig
make exynos4_defconfig

Regards,
Axel
