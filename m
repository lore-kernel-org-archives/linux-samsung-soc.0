From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 5/7] ARM: dts: Update DP controller DT Node for Exynos5
 based SoCs
Date: Thu, 12 Sep 2013 19:56:34 +0900
Message-ID: <001401ceafa6$beef0350$3ccd09f0$%han@samsung.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
 <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org>
 <002d01cea207$ff2c57d0$fd850770$%han@samsung.com>
 <CAD025yQ62VW4ou67GEi5=WwQy+j5r80haBp--ioPiw9U0o-e=Q@mail.gmail.com>
 <06f501ceafa4$00ed4490$02c7cdb0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54061 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682Ab3ILK4f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:56:35 -0400
In-reply-to: <06f501ceafa4$00ed4490$02c7cdb0$@org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene@kernel.org>, 'Vikas Sajjan' <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>, 'devicetree' <devicetree@vger.kernel.org>, 'InKi Dae' <inki.dae@samsung.com>, 'Ajay kumar' <ajaynumb@gmail.com>, 'Patch Tracking' <patches@linaro.org>, linaro-kernel@lists.linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, September 12, 2013 7:37 PM, Kukjin Kim wrote:
> 
> Vikas Sajjan wrote:
> >
> > Hi Mr. Jingoo Han,
> >
> > On 26 August 2013 08:27, Jingoo Han <jg1.han@samsung.com> wrote:

[.....]

> > >
> > > Oops!!!
> > >
> > > This patch should be reverted.
> > > Or, fix patch should be re-sent.
> > > 'dp phy' driver is not yet merged to mainline kernel.
> > >
> >
> > As you suggest, since the DP-PHY driver is NOT yet in mainline, we may
> > have to keep this patch reverted till your patch series gets merged to
> > have DP working on exynos5 .
> >
> OK, got it. Please send patch fixing this issue for v3.12. Of course, we
> need this from v3.13 which will be including the DP-PHY driver.
> 

I already sent the patch fixing this.
([PATCH V2] ARM: dts: Remove DP PHY node from exynos5250.dtsi)
Please refer to the following. :-)

http://www.spinics.net/lists/linux-samsung-soc/msg22023.html

Best regards,
Jingoo Han
