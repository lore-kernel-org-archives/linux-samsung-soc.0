From: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Subject: Re: [PATCH v2] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 08:05:18 +0000
Message-ID: <20151130080514.GA27761@jci-VirtualBox>
References: <20151130072852.GA25202@jci-VirtualBox>
 <565BFB57.2000701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-db3on0103.outbound.protection.outlook.com ([157.55.234.103]:30306
	"EHLO emea01-db3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752447AbbK3IFW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 03:05:22 -0500
In-Reply-To: <565BFB57.2000701@samsung.com>
Content-Language: en-US
Content-ID: <8DAC5D3FDB75AB469E5A09117A9FCF01@eurprd06.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Nov 30, 2015 at 04:31:35PM +0900, Krzysztof Kozlowski wrote:
> On 30.11.2015 16:28, Mutharaju, Prasanna (P.) wrote:
> > From: Prasanna Karthik <mkarthi3@visteon.com>
> > 
> > Remove unneeded variable used to store return value.
> > V2: Modified subject  
> 
> Changelog (v2) should go after '---' separator so it won't get included
> in the commit message.
> 

Done in v3. 

> Now I see that you Signed-off-by is okay - same email address... I got
> confused by the difference in name.

Yeah, my gitconfig and outlook account differ little. 

> Best regards,
> Krzysztof
> > 
> > Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>
> > ---
> >  drivers/clk/samsung/clk-s3c2410-dclk.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
> > index e9eb935..ec6fb14 100644
> > --- a/drivers/clk/samsung/clk-s3c2410-dclk.c
> > +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> > @@ -77,12 +77,11 @@ static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
> >  static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
> >  {
> >  	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
> > -	int ret = 0;
> >  
> >  	s3c2410_modify_misccr((clkout->mask << clkout->shift),
> >  			      (index << clkout->shift));
> >  
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static const struct clk_ops s3c24xx_clkout_ops = {
> > 
> 