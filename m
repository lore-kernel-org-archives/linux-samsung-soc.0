From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: clk: samsung: Checking a kmemdup() call in
 _samsung_clk_register_pll()
Date: Mon, 14 Oct 2019 15:55:38 +0900
Message-ID: <725ace30-a4a7-25dd-2351-f007bb8b35ed@samsung.com>
References: <CGME20191012141739epcas3p31e41c151b30d49c94aeb933aa42dc9f7@epcas3p3.samsung.com>
        <c1bc5e4d-0802-4485-2c07-248bab2a3330@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1bc5e4d-0802-4485-2c07-248bab2a3330@web.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Elfring <Markus.Elfring@web.de>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 19. 10. 12. 오후 11:17, Markus Elfring wrote:
> Hello,
> 
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “_samsung_clk_register_pll” contains also a call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-pll.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1275
> https://protect2.fireeye.com/url?k=7e77b0ebee9a0c3e.7e763ba4-43f341fdfe1d32b1&u=https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/samsung/clk-pll.c#L1275
> 
> * Do you find the usage of the format string “%s: could not allocate
>   rate table for %s\n” still appropriate at this place?
> 
> * Is there a need to adjust the error handling here?

drivers/clk/samsung/clk-pll.c considers the case of 'pll->rate_table is NULL'
So, maybe just show the warning message if failed to allocate memory
of 'pll->rate_table'. Bu, IMHO, the error handling is necessary
in order to support what 'pll_clk->rate_table' isn't NULL.

> 
> Regards,
> Markus
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
