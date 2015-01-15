From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] clk: exynos-audss: Fix memory leak on driver unbind or
 probe failure
Date: Thu, 15 Jan 2015 09:14:23 +0100
Message-ID: <1421309663.12511.2.camel@AMDC1943>
References: <1420451561-12360-1-git-send-email-k.kozlowski@samsung.com>
 <1420451561-12360-2-git-send-email-k.kozlowski@samsung.com>
 <54AEF541.1090700@codeaurora.org> <20150114222504.22722.49023@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43934 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbbAOIO1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 03:14:27 -0500
In-reply-to: <20150114222504.22722.49023@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On =C5=9Bro, 2015-01-14 at 14:25 -0800, Mike Turquette wrote:
> Quoting Stephen Boyd (2015-01-08 13:23:13)
> > On 01/05/2015 01:52 AM, Krzysztof Kozlowski wrote:
> > > The memory allocated by basic clock divider/gate/mux (struct clk_=
gate,
> > > clk_divider and clk_mux) was leaking. During driver unbind or pro=
be
> > > failure the driver only unregistered the clocks.
> > >
> > > Use clk_unregister_{gate,divider,mux} to release all resources.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > >
> >=20
> > Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
>=20
> I've applied both patches to clk-next. Krzysztof, let me know if you
> would prefer to take the audss patch through the samsung clock branch
> instead (to include it in a later pull request).

Thanks! I'm fine with applying them to clk-next.

Best regards,
Krzysztof


>=20
> Regards,
> Mike
>=20
> >=20
> > --=20
> > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >=20
