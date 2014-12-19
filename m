From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Add clocks for MSCL block
Date: Fri, 19 Dec 2014 17:21:58 +0100
Message-ID: <549450A6.9020205@samsung.com>
References: <1418801617-7593-1-git-send-email-tony.kn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27935 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbaLSQWE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 11:22:04 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGU00HR28BG7OB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Dec 2014 16:26:04 +0000 (GMT)
In-reply-to: <1418801617-7593-1-git-send-email-tony.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tony K Nadackal <tony.kn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, a.kesavan@samsung.com, bhushan.r@samsung.com

Hi,

On 17/12/14 08:33, Tony K Nadackal wrote:
> Add clock support for the MSCL block for Exynos7.
> 
> Signed-off-by: Tony K Nadackal <tony.kn@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos7-clock.txt    |   1 +
>  drivers/clk/samsung/clk-exynos7.c                  | 124 +++++++++++++++++++++
>  include/dt-bindings/clock/exynos7-clk.h            |  40 ++++++-
>  3 files changed, 164 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos7-clock.txt b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> index 6d3d5f8..d0e048c 100644
> --- a/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
> @@ -34,6 +34,7 @@ Required Properties for Clock Controller:
>  	- "samsung,exynos7-clock-peris"
>  	- "samsung,exynos7-clock-fsys0"
>  	- "samsung,exynos7-clock-fsys1"
> +	- "samsung,exynos7-clock-mscl"

I can't see anything controversial in the patch, but I've got some doubts
regarding the compatible string. Is there a SoC named just "Exynos7"?
If not, what are exact SoC names the "samsung,exynos7-clock-mscl" compatible
is supposed to cover ?
It would be good to list in this file the exact SoCs names this binding applies
to, unless there is indeed Exynos7 SoC.

--
Thanks,
Sylwester
