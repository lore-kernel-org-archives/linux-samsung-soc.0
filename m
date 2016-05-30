From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: exynos5420: Set ID for aclk333 gate clock
Date: Mon, 30 May 2016 14:49:37 +0200
Message-ID: <574C36E1.5000709@samsung.com>
References: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
 <1464111662-15336-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1464111662-15336-2-git-send-email-javier@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/24/2016 07:41 PM, Javier Martinez Canillas wrote:
> The aclk333 clock needs to be ungated during the MFC power domain switch,
> so set the clock ID to allow the Exynos power domain logic to lookup this
> clock if is defined in the MFC PD device tree node.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks, patch applied.

