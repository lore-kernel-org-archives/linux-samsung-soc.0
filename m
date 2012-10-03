From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] [media] s5p-jpeg: use clk_prepare_enable and
 clk_disable_unprepare
Date: Wed, 03 Oct 2012 12:17:11 +0200
Message-ID: <506C10A7.4010606@samsung.com>
References: <1349222102-3183-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1349222102-3183-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-media@vger.kernel.org, mchehab@infradead.org, andrzej.p@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/03/2012 01:55 AM, Thomas Abraham wrote:
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Applied, thanks.
