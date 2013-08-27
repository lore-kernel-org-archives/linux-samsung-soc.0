From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] clk: samsung: pll: Use new registration method for PLL6552
 and PLL6553
Date: Wed, 28 Aug 2013 02:16:14 +0900
Message-ID: <521CDEDE.1070003@samsung.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <158901ce9b34$c0ac8720$42059560$@org> <20130820002258.4443.34197@quantum> <1856348.DCxTucbm8V@flatron> <20130827011422.8231.95092@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:48806 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751715Ab3H0RQW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 13:16:22 -0400
In-Reply-To: <20130827011422.8231.95092@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?=27Heiko_St=FCbner=27?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>, gregkh@linuxfoundation.org, 'Tomasz Figa' <t.figa@samsung.com>, linux-usb@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, stern@rowland.harvard.edu, 'Mark Brown' <broonie@kernel.org>, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org

On 08/27/13 10:14, Mike Turquette wrote:
> Quoting Tomasz Figa (2013-08-20 17:33:21)
>> This patch modifies PLL6552 and PLL6553 clock drivers to use recently
>> added common Samsung PLL registration method.
>>
>> Signed-off-by: Tomasz Figa<tomasz.figa@gmail.com>
>
> Sigh. This change won't apply on top of clk-next-s3c64xx since it
> requires Yadwinder's change (amongst) others.
>
> The best I could do was spin out another topic branch with the relevant
> changes and apply this patch on top. It is a subset of clk-next but it
> is almost entirely Samsung patches:
>
> git://git.linaro.org/people/mturquette/linux.git clk-next-s3c64xx-delta
>
> Kukjin&  Tomasz, let me know if this OK for you to add as a dependency
> to the Samsung tree. If it is I will merge it into clk-next, but I want
> your OK that this branch is OK for you to take.
>
Hi Mike,

I merged the branch clk-next-s3c64xx-delta you provided on top of 
previous clk-next-s3c64xx for common-clk-s3c64xx and dt-s3c64xx and it 
looks fine to me.

Thanks,
Kukjin
