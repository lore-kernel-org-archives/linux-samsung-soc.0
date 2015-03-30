From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Mon, 30 Mar 2015 17:09:41 +0100
Message-ID: <20150330160940.GA13731@leverpostej>
References: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
 <1426637856-3730-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426637856-3730-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "kgene@kernel.org" <kgene@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, Mar 18, 2015 at 12:17:28AM +0000, Chanwoo Choi wrote:
> This patch adds new Exynos5433 dtsi to support 64-bit Exynos5433 SoC based on
> Octal core CPUs (quad Cortex-A57 and quad Cortex-A53). And Exynos5433 supports
> PSCI (Power State Coordination Interface) v0.1.
> 
> This patch includes following dt node to support Exynos5433 SoC:
> 1. Octa core for big.LITTLE architecture
> - Cortex-A53 LITTLE Quad-core
> - Cortex-A57 big Quad-core
> - Support PSCI v0.1

Is CPU0 hotplug still broken, or has the FW been fixed?

I'm very worried about adding a DT that's known broken, especially when
we have no idea as to if/when the FW will be fixed judging from prior
replies.

Mark.
