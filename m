From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/4] mfd: sec-core: Allow building as module
Date: Fri, 24 Aug 2018 10:20:47 +0100
Message-ID: <20180824092047.GF28860@dell>
References: <20180807161125.18155-1-krzk@kernel.org>
 <20180807161125.18155-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807161125.18155-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 07 Aug 2018, Krzysztof Kozlowski wrote:

> The main MFD driver for Samsung PMICs (S2MPSXX, S5M876X) used with
> Exynos SoCs can be compiled and used as a module.  The dependent clock,
> regulator and RTC drivers already can be built as a module.
> 
> Building entire set of drivers as modules might require using initial
> ramdisk and can make booting process longer (due to probe deferrals).
> However adding such option is useful for testing and for multi-platform
> configurations.
> 
> This also add required module authors to sec-irq.c file based on recent
> main contributors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/Kconfig   | 11 +++++++++--
>  drivers/mfd/sec-irq.c |  8 ++++++++
>  2 files changed, 17 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
