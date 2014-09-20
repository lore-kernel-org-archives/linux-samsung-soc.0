From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: s5pv210: add missing call to samsung_clk_of_add_provider()
Date: Sat, 20 Sep 2014 20:20:10 +0200
Message-ID: <541DC55A.9080702@gmail.com>
References: <1411117216-11456-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:33493 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756508AbaITSUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Sep 2014 14:20:14 -0400
In-Reply-To: <1411117216-11456-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@linaro.org>

On 19.09.2014 11:00, Marek Szyprowski wrote:
> Commit d5e136a21b2028fb1f45143ea7112d5869bfc6c7 ("clk: samsung: Register
> clk provider only after registering its all clocks", merged to v3.17-rc1)
> modified a way that driver registers registers to core framework. This
> change has not been applied to s5pv210 clocks driver, which has been
> merged in parallel to that commit. This patch adds a missing call to
> samsung_clk_of_add_provider(), so the driver is operational again.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Hello!
> 
> This is an important fix to v3.17-rcX. Without it support for Samsung
> S5PV210 SoCs is not functional.
> 
> Mike, could you take it to the fixes branch?

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Mike, since it seems like this is the only fix to be queued for next -rc
release, I think it would be reasonable if you picked it up directly.

Best regards,
Tomasz
