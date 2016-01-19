From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 2/2] clk: s2mps11: allocate only one structure for clock init
Date: Mon, 18 Jan 2016 17:11:23 -0800
Message-ID: <CAKew6eVNWB+VB1yUxuKELPW_n63H5kaFrcj8+Ormd2RKKDL_Cw@mail.gmail.com>
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
	<1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
	<CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
	<569D87E0.6020001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <569D87E0.6020001@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

>>
>> IMHO, with all these modifications, it will leave driver with some extra
>> checks and reduced readability, perhaps will make it complex to add
>> support for similar clocks but with different clk_ops, if next version or
>>  any similar mfd chip comes up in future.
>
> There is no evidence that some future chip will require clk_ops. All of
> them are so far exactly the same. Even the newly added S2MPS15 is the same.
>

Can we guaranty about future chips?
Even we didn't expect there will be one less clock in case of s2mps14.

> This really should be simplified.
>

IMO, it is just reduction of LoC.

Regards,
Yadwinder
