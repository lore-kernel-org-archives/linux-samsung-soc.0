From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Switch to kernel.org account for Krzysztof
 Kozlowski
Date: Tue, 16 Aug 2016 12:36:29 +0200
Message-ID: <1686159.ibR5sQZ1NC@amdc1976>
References: <1471281469-5847-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1471281469-5847-1-git-send-email-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Monday, August 15, 2016 07:17:49 PM Krzysztof Kozlowski wrote:
> Change my email address to kernel.org account instead of Samsung one.
> Also switch Maxim MUIC charger drivers from supported to maintained
> mode.

I would like to help with maintaining affected drivers/subsystems
from Samsung R&D Institute Poland's side (I can devote some of my
paid time for this) after your departure from the company.

Would it be possible to add me as co-maintainer to affected
drivers/subsystems (except pinctrl and sound/soc ones as they are
already covered by Sylwester Nawrocki)?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> 
> ---
> 
> Affected drivers/subsystems:
> 1. arch/arm,
> 2. mfd,
> 3. power,
> 4. regulator,
> 5. clk,
> 6. rtc,
> 7. extcon,
> 8. pinctrl,
> 9. sound/soc,
> 
> However if there are no objections, I can push it through my tree (to
> arm-soc folks).
> ---
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45c98485c3f0..d437e0123bac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1623,7 +1623,7 @@ N:	rockchip
>  
>  ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
>  M:	Kukjin Kim <kgene@kernel.org>
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  S:	Maintained
> @@ -7465,9 +7465,9 @@ F:	Documentation/devicetree/bindings/sound/max9860.txt
>  F:	sound/soc/codecs/max9860.*
>  
>  MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-pm@vger.kernel.org
> -S:	Supported
> +S:	Maintained
>  F:	drivers/power/supply/max14577_charger.c
>  F:	drivers/power/supply/max77693_charger.c
>  
> @@ -7481,7 +7481,7 @@ F:	include/dt-bindings/*/*max77802.h
>  
>  MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  F:	drivers/*/max14577*.c
> @@ -9258,7 +9258,7 @@ F:	drivers/pinctrl/sh-pfc/
>  
>  PIN CONTROLLER - SAMSUNG
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> @@ -10189,7 +10189,7 @@ S:	Maintained
>  F:	drivers/platform/x86/samsung-laptop.c
>  
>  SAMSUNG AUDIO (ASoC) DRIVERS
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Sangbeom Kim <sbkim73@samsung.com>
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> @@ -10204,7 +10204,7 @@ F:	drivers/video/fbdev/s3c-fb.c
>  
>  SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
>  M:	Sangbeom Kim <sbkim73@samsung.com>
> -M:	Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-kernel@vger.kernel.org
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
