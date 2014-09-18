From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 6/8] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC)
 support
Date: Thu, 18 Sep 2014 17:18:33 +0100
Message-ID: <20140918161832.GD25330@e104818-lin.cambridge.arm.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
 <1410535592-5782-8-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss-mx-na.foss.arm.com ([217.140.108.86]:34319 "EHLO
	foss-mx-na.foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756666AbaIRQSn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 12:18:43 -0400
Content-Disposition: inline
In-Reply-To: <1410535592-5782-8-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Alim Akhtar <alim.akhtar@samsung.com>

On Fri, Sep 12, 2014 at 04:26:30PM +0100, Naveen Krishna Chatradhi wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> This patch adds the necessary Kconfig entries to enable
> support for the ARMv8 based Exynos7 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/Kconfig |   12 ++++++++++++

Please update the defconfig as well as we want the default image build
to contain all the available platforms.

-- 
Catalin
