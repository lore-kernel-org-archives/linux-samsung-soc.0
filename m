From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: exynos4: fix g3d clocks
Date: Mon, 22 Sep 2014 14:32:57 +0200
Message-ID: <542016F9.9090306@gmail.com>
References: <1411388232-6271-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:49197 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753948AbaIVMdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 08:33:00 -0400
Received: by mail-wg0-f52.google.com with SMTP id n12so896785wgh.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Sep 2014 05:32:59 -0700 (PDT)
In-Reply-To: <1411388232-6271-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

On 22.09.2014 14:17, Marek Szyprowski wrote:
> sclk_g3d clock doesn't have enable/disable bits, but the driver hijacked
> g3d gate clock bits for this purpose and didn't provide real g3d clock
> at all. This patch fixes this issue by adding proper definition for g3d
> clock and removing incorrect access to GATE_IP_G3D register in sclk_g3d.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied for next with a minor adjustment of patch description.

Best regards,
Tomasz
