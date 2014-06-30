From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 3/3] clk: samsung: exynos5420: Setup clocks before
 system suspend
Date: Mon, 30 Jun 2014 19:58:58 +0200
Message-ID: <53B1A562.6000300@samsung.com>
References: <1403781135-6538-1-git-send-email-vikas.sajjan@samsung.com>
 <1403781135-6538-4-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8649 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754652AbaF3R72 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 13:59:28 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Z00MCGTYU0KC0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 18:59:18 +0100 (BST)
In-reply-to: <1403781135-6538-4-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, Abhilash Kesavan <a.kesavan@samsung.com>

Hi Vikas, Abhilash,

On 26.06.2014 13:12, Vikas Sajjan wrote:
> Prior to suspending the system, we need to ensure that certain
> clock source and gate registers are unmasked.
> 
> while at it, add these clks to save/restore list also.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Looks good. Will apply.

Best regards,
Tomasz
