From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v6 01/16] clk: samsung: add common clock framework helper
 functions for Samsung platforms
Date: Sun, 03 Mar 2013 12:59:03 +0100
Message-ID: <51333B07.7050106@gmail.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org> <1361175686-19400-2-git-send-email-thomas.abraham@linaro.org> <201303030208.49722.heiko@sntech.de> <51333149.1060105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:37297 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752790Ab3CCL7I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Mar 2013 06:59:08 -0500
Received: by mail-ee0-f53.google.com with SMTP id e53so3370083eek.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Mar 2013 03:59:07 -0800 (PST)
In-Reply-To: <51333149.1060105@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com

On 03/03/2013 12:17 PM, Sylwester Nawrocki wrote:
> On 03/03/2013 02:08 AM, Heiko St=C3=BCbner wrote:
>> But is there an easy way to define more than one alias? On the s3c24=
16
>> for
>> example the hsmmc hclk is the "hsmmc" io-clock, as well as the sourc=
e
>> for the
>> "mmc_busclk.0". Same for the "uart" pclk, that is also a baud clock
>> source.
[...]
> But those multiple aliases are important only for machines with devic=
e
                                                              ^^^^^
Sorry, this should have read "without". Also please note that due to
representing original struct clk_clksrc objects (mux + div + gate clock=
)
with separate primitive clocks device drivers may not work as before
where clk_{set/get}_parent() was called. I.e. a separate consumer clock
id needs to be used to control a clock mux. Hmm, however this issue
doesn't affect anything on s3c24xx, since such composite clocks have
been introduced only starting from s3c64xx.

I guess to create multiple aliases now a new helper function could be
created that takes as an argument a clock index (as in enum exynos4_clk=
s)
and adds a clkdev lookup entry to a matched clk object. Probably it
wouldn't be difficult to rework the driver to be registering all clkdev
entries like this.

Do you have your source tree in any public git available ? ;) Perhaps
I could find a time to adjust and try it with s3c2440 based board.

> tree support, aren't they ?
