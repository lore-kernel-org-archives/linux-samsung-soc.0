From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Don't gate CMU_{CCORE,
 FSYS0} blocks clock
Date: Mon, 30 May 2016 14:50:32 +0200
Message-ID: <574C3718.3050301@samsung.com>
References: <1460608972-13878-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1460608972-13878-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, thomas.ab@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, tomasz.figa@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/14/2016 06:42 AM, Alim Akhtar wrote:
> This patch adds CLK_IS_CRITICAL flag to ACLK_CCORE_133 and ACLK_FSYS0_200
> clocks. These clocks are critical for accessing CMU_CCORE and CMU_FSYS0
> blocks registers. Let these clocks to be enabled all the time.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Patch applied, thanks.

