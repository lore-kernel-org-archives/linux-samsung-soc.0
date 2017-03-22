From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Remove unused pin-bank macro
Date: Wed, 22 Mar 2017 20:11:27 +0200
Message-ID: <20170322181127.aolaevubauaolb3g@kozik-lap>
References: <1490169812-25225-1-git-send-email-cw00.choi@samsung.com>
 <CGME20170322080335epcas5p2f514974da14bd739d712cf1ab1a4cc0c@epcas5p2.samsung.com>
 <1490169812-25225-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490169812-25225-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, javier@osg.samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 22, 2017 at 05:03:32PM +0900, Chanwoo Choi wrote:
> After merged commit 1259feddd0f8 ("pinctrl: samsung: Fix the width
> of PINCFG_TYPE_DRV bitfields for Exynos5433"), EXYNOS_PIN_BANK_EINTW
> was replaced by EXYNOS5433_PIN_BANK_EINTW_EXT. This patch removes
> the unused pin-bank macro (EXYNOS_PIN_BANK_EINTW).
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Thanks, applied and squashed with previous one (it is logically the same
change).

Best regards,
Krzysztof

