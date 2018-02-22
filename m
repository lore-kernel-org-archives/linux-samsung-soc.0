From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Validate alias coming from DT
Date: Fri, 23 Feb 2018 00:18:15 +0900
Message-ID: <CA+Ln22Hv=AawNquvGT=n4gxy7S=wOELPXX=c9NvzepmQjUVQqQ@mail.gmail.com>
References: <20180220181751.20826-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220181751.20826-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, linux-gpio@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

2018-02-21 3:17 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> Driver uses alias from Device Tree as an index of pin controller data
> array.  In case of a wrong DTB or an out-of-tree DTB, the alias could be
> outside of this data array leading to out-of-bounds access.
>
> Depending on binary and memory layout, this could be handled properly
> (showing error like "samsung-pinctrl 3860000.pinctrl: driver data not
> available") or could lead to exceptions.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: <stable@vger.kernel.org>
> Fixes: 30574f0db1b1 ("pinctrl: add samsung pinctrl and gpiolib driver")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Issue is present since first version of this driver so this should be
> backported as far as possible.
>
> Tested on Odroid HC1 (Exynos5422). Tests on S3C24xx, S3C64xx, Exynos
> ARM64 and any other chips are highly appreciated.
>
> Linus,
> I can take it through samsung/pinctrl tree and later send you again as
> pull request... or you can apply it directly as I do not have any other
> pinctrl patches queued so far.
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 56 +++++++++++++++++++----
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 14 +++++-
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c      | 28 ++++++++++--
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c      |  7 ++-
>  drivers/pinctrl/samsung/pinctrl-samsung.c      | 61 ++++++++++++++++----------
>  drivers/pinctrl/samsung/pinctrl-samsung.h      | 40 ++++++++++-------
>  6 files changed, 154 insertions(+), 52 deletions(-)

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Thanks Geert for the report and Krzysztof for the patch.

Best regards,
Tomasz
