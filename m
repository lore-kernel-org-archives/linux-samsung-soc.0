From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 3/7] ARM: dts: exynos4: add hdmi related nodes
Date: Sun, 23 Nov 2014 00:00:32 +0900
Message-ID: <5470A510.2050301@kernel.org>
References: <1415895785-26892-1-git-send-email-a.hajda@samsung.com> <1415895785-26892-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:58856 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbaKVPAg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 10:00:36 -0500
In-Reply-To: <1415895785-26892-4-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

On 11/14/14 01:23, Andrzej Hajda wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This patch adds entries for HDMI, Mixer and i2c with hdmi-phy modules
> found in Exynos 4210 and 4x12 SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

In this case, Andrzej's signed-off-by should be here as a submitter...
Note I can't add it because of legal issue...

Please re-spin this series based on for-next of samsung tree ;)

Thanks,
Kukjin

> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 40 +++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi | 11 +++++++++++
>  3 files changed, 59 insertions(+)
