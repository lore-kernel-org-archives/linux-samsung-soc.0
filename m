From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 0/4] s2mps11 clock driver refactoring
Date: Thu, 21 Jan 2016 09:18:20 +0900
Message-ID: <56A023CC.6@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33591 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbcAUASX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 19:18:23 -0500
In-reply-to: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>

On 20.01.2016 19:14, Andi Shyti wrote:
> Hi,
> 
> This patchset contains some code refactoring on the s2mps11 clock
> device driver. The main goal is to remove some dead code and
> improve its readability.
> 
> At any iteration the patchset is getting a patch more, so that
> this time there are four patches :)

Which means that if I have more comments now, you will send a v5 with 5
patches inside? Oh...

BR,
Krzysztof

> 
> Thanks to Krzysztof for his review, the changset is coming from
> his suggestions:
> 
> V1 -> V2
>  - the order of the patches has changed
>  - the second patch has been added and it merges a for loop
>    inside
>    a previous one
>  - the 3rd patch (which in the first version was the 1st)
>    contains some more redundant variables removal.
> 
> V2 -> V3
>  - The "merge two for loops in one" has been moved as first patch
>  - removed the global variable clk_data
> 
> The patches have been applied on next-20160120 and tested on
> Odroid Xu4.
> 
> Andi Shyti (4):
>   clk: s2mps11: merge two for loops in one
>   clk: s2mps11: allocate only one structure for clock init
>   clk: s2mps11: remove redundant static variables declaration
>   clk: s2mps11: remove redundant code
> 
>  drivers/clk/clk-s2mps11.c | 108 +++++++++++++---------------------------------
>  1 file changed, 31 insertions(+), 77 deletions(-)
> 
