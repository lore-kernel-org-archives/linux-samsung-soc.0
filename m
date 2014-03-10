From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 3/5] clk/samsung: add support for pll2650xx
Date: Mon, 10 Mar 2014 01:29:36 +0100
Message-ID: <531D0770.1050201@gmail.com>
References: <1393931558-23502-1-git-send-email-rahul.sharma@samsung.com> <1393931558-23502-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:48456 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090AbaCJA3j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 20:29:39 -0400
In-Reply-To: <1393931558-23502-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

On 04.03.2014 12:12, Rahul Sharma wrote:
> Add support for pll2650xx in samsung pll file. This pll variant
> is close to pll36xx but uses CON2 registers instead of CON1.
>
> Aud_pll in Exynos5260 is pll2650xx and uses this code.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>   drivers/clk/samsung/clk-pll.c |  101 +++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |    1 +
>   2 files changed, 102 insertions(+)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
