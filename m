From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/8] clk: mux: Add support for read-only muxes.
Date: Tue, 23 Jul 2013 13:25:25 +0200
Message-ID: <3464612.aV7xx5H2mf@amdc1227>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <1374536965-3545-2-git-send-email-tomasz.figa@gmail.com>
 <51EE6784.2090808@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44554 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756174Ab3GWLZa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 07:25:30 -0400
In-reply-to: <51EE6784.2090808@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Sergei,

On Tuesday 23 of July 2013 15:22:44 Sergei Shtylyov wrote:
> Hello.
> 
> On 23-07-2013 3:49, Tomasz Figa wrote:
> > Some platforms have read-only clock muxes that are preconfigured at
> > reset and cannot be changed at runtime. This patch extends mux clock
> > driver to allow handling such read-only muxes by adding new
> > CLK_MUX_READ_ONLY mux flag.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> [...]
> 
> > diff --git a/include/linux/clk-provider.h
> > b/include/linux/clk-provider.h
> > index 1ec14a7..9487b96 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -327,8 +327,10 @@ struct clk_mux {
> > #define CLK_MUX_INDEX_ONE		BIT(0)
> > #define CLK_MUX_INDEX_BIT		BIT(1)
> > #define CLK_MUX_HIWORD_MASK		BIT(2)
> > +#define CLK_MUX_READ_ONLY	BIT(3) /* mux setting cannot be changed */
> 
>     Please align BIT(3) with the above BIT() invocations.

Different indentation was intended here to fit the comment, like in case of 
generic flags. IMHO remaining flags should be changed to this way as well, 
but this is probably material for another patch.

Best regards,
Tomasz
