From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 0/5] Fix Arndale Octa/Peach Pi boot on Audio subsystem
 clocks
Date: Wed, 26 Nov 2014 17:31:46 +0100
Message-ID: <54760072.8010307@collabora.co.uk>
References: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, Kevin Hilman <khilman@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 11/26/2014 03:24 PM, Krzysztof Kozlowski wrote:
> Description
> ===========
> This patchset tries to solve dependency between AudioSS components
> (clocks and GPIO) and main clock controller on Exynos platform.
> 
> This solves boot failure of Peach Pi/Pit and Arndale Octa [1].
> 

I tested and patches #2, #3, #4 solves the boot failure I was facing.
So for the whole series on an Exynos5420 Peach Pit:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Thanks a lot for solving this issue.

Best regards,
Javier
