From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/9] pinctrl: samsung: Remove dead code
Date: Sun, 25 Dec 2016 14:51:46 +0200
Message-ID: <20161225125146.xfuhy24ceg2jxhfx@kozik-lap>
References: <1482495889-6201-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161223122524epcas1p4f0235bcdabe1e7bffa141e0b2e32de7f@epcas1p4.samsung.com>
 <1482495889-6201-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482495889-6201-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 23, 2016 at 01:24:43PM +0100, Marek Szyprowski wrote:
> 'enable' parameter has been removed a while ago, so all code for handling
> it can be simply removed.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

