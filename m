From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCHv3 0/2] clk: samsung: Add clock controller driver for
 Exynos4415 SoC
Date: Mon, 27 Oct 2014 11:39:31 +0100
Message-ID: <544E20E3.5030609@samsung.com>
References: <1414372318-594-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29401 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbaJ0Kjw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 06:39:52 -0400
In-reply-to: <1414372318-594-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/10/14 02:11, Chanwoo Choi wrote:
> Chanwoo Choi (2):
>   clk: samsung: exynos4415: Add clocks using common clock framework
>   clk: samsung: Document binding for Exynos4415 clock controller

Added both to my tree, thanks. In future please put DT binding
documentation first in the series, before the actual driver patch.

--
Thanks,
Sylwester
