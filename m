From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V6 6/6] clk: exynos5250: Add enum entries for divider clock
 of i2s1 and i2s2
Date: Mon, 17 Jun 2013 19:15:27 +0900
Message-ID: <19ac01ce6b43$96bfb4d0$c43f1e70$%kim@samsung.com>
References: <1371024463-303-1-git-send-email-padma.v@samsung.com>
 <1371024463-303-7-git-send-email-padma.v@samsung.com>
 <20130612164553.26381.41398@quantum>
 <CAAgF-BfEvBcrm186t6U9Tp4r64wB3sEsy6hoXMQi=dHJgncvfw@mail.gmail.com>
 <CAAgF-Bf4BVfGVuFF8-CwPRi-em5VHA5HXYjkRDxPxvyAZPx7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35330 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932307Ab3FQKPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 06:15:33 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOJ00LZ78GYHMB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 19:15:28 +0900 (KST)
In-reply-to: <CAAgF-Bf4BVfGVuFF8-CwPRi-em5VHA5HXYjkRDxPxvyAZPx7kw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padma Venkat' <padma.kvr@gmail.com>, 'Mike Turquette' <mturquette@linaro.org>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, broonie@kernel.org

Padma Venkat wrote:
> 
> Hi Mike,
> 
> On Thu, Jun 13, 2013 at 8:32 AM, Padma Venkat <padma.kvr@gmail.com> wrote:
> > Hi Mike,
> >
> > On Wed, Jun 12, 2013 at 10:15 PM, Mike Turquette <mturquette@linaro.org>
> wrote:
> >> Quoting Padmavathi Venna (2013-06-12 01:07:43)
> >>> This patch adds enum entries for div_i2s1 and div_i2s2 which are
> >>> required for i2s1 and i2s2 controllers.
> >>>
> >>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> >>
> >> Looks good.  Did you want me to take the clk patches or just gathering
> >> Acks?
> >
> > Please take the patches :).
> >
> > Thanks
> > Padma
> 
> clk related patches in this set has some dependency on arch side
> patches because one of the patch replaces all '/include's with
> '#include's and adds a header file in
> arch/arm/boot/include/dt-bindings/. So all these patches required to
> go into one tree.
> 
> Hi Kukjin,
> 
> Can you please take all these patches into samsung-tree?
> 
Padma, sure, I will.

BTW, Mike, according to your reply, I may get your ack on 2nd and 6th clk
patches...If any problems, please kindly let me know.

Thanks,
- Kukjin
