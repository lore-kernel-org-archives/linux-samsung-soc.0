From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] mfd: sec-core: Add SPDX license identifiers
Date: Fri, 24 Aug 2018 10:19:51 +0100
Message-ID: <20180824091951.GC28860@dell>
References: <20180807161125.18155-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807161125.18155-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 07 Aug 2018, Krzysztof Kozlowski wrote:

> Replace GPL v2.0+ license statements with SPDX license identifiers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/sec-core.c              | 16 ++++------------
>  drivers/mfd/sec-irq.c               | 16 ++++------------
>  include/linux/mfd/samsung/core.h    | 11 ++---------
>  include/linux/mfd/samsung/irq.h     | 10 ++--------
>  include/linux/mfd/samsung/rtc.h     | 15 ++-------------
>  include/linux/mfd/samsung/s2mpa01.h |  7 +------
>  include/linux/mfd/samsung/s2mps11.h |  9 +--------
>  include/linux/mfd/samsung/s2mps13.h | 14 +-------------
>  include/linux/mfd/samsung/s2mps14.h | 14 +-------------
>  include/linux/mfd/samsung/s2mps15.h | 11 +----------
>  include/linux/mfd/samsung/s2mpu02.h | 14 +-------------
>  include/linux/mfd/samsung/s5m8763.h | 10 ++--------
>  include/linux/mfd/samsung/s5m8767.h | 10 ++--------
>  13 files changed, 24 insertions(+), 133 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
