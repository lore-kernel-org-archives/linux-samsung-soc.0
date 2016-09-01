From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 00/10] pinctrl: exynos/samsung: Add header with values
 used for configuration
Date: Thu, 1 Sep 2016 12:14:16 +0200
Message-ID: <f56eacb7-d861-cc95-f63f-4101e738ca09@osg.samsung.com>
References: <1472714638-15676-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472714638-15676-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 09/01/2016 09:23 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Merging
> =======
> Patch #1 should probably go through pinctrl tree. In that case I would
> appreciate a stable branch/tag so DTS could base on top of it.
> 
> 
> Changes since v1
> ================
> 1. Follow Arnd's suggestion about moving the macros to common place.
> 2. Subjects: replace "GPIO" with "pinctrl".
> 3. There were some major changes here so I did not add Javier's
>    reviewed-by and tested-by tags.
> 

I've reviewed this series + the v2.1 1/10 resend and looks good to me.
So for the whole series:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
