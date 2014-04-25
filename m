From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCHv4 7/7] ARM: dts: Add device tree sources for Exynos3250
Date: Fri, 25 Apr 2014 10:08:53 +0530
Message-ID: <5359E6DD.6000608@linaro.org>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com> <1398388572-30239-8-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398388572-30239-8-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, sajjan.linux@gmail.com, sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/25/2014 06:46 AM, Chanwoo Choi wrote:
> From: Tomasz Figa <t.figa@samsung.com>
> 
> This patch add new exynos3250.dtsi to support Exynos3250 SoC based on Cortex-A7
> dual core and includes following dt nodes:
> 

[ ... ]

> ---
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 477 +++++++++++++++
>  arch/arm/boot/dts/exynos3250.dtsi         | 405 +++++++++++++
>  arch/arm/boot/dts/exynos4212-tizenw.dts   | 926 ++++++++++++++++++++++++++++++

exynos4412-tizenw.dts related changes are unrelated.

-- 
Tushar Behera
