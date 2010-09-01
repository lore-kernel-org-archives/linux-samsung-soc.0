From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 1 Sep 2010 12:16:02 +0100
Message-ID: <20100901111602.GF17548@opensource.wolfsonmicro.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
 <20100820095351.GD13668@rakim.wolfsonmicro.main>
 <1282301229.3084.152.camel@odin>
 <011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
 <20100901091519.GA17032@opensource.wolfsonmicro.com>
 <000801cb49ba$3e1e50f0$ba5af2d0$%kim@samsung.com>
 <AANLkTinUNXmDc=H16gS5EXEAdrGAU=zK4cjsHSh7UQ8Q@mail.gmail.com>
 <001101cb49c0$3fd715c0$bf854140$%kim@samsung.com>
 <AANLkTi=akjQ2wUp7h4gJfsn52BozMprVn9oKygec-0DU@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59037 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752379Ab0IALPp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 07:15:45 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=akjQ2wUp7h4gJfsn52BozMprVn9oKygec-0DU@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org, Changhwan Youn <chaos.youn@samsung.com>

On Wed, Sep 01, 2010 at 07:36:40PM +0900, Kyungmin Park wrote:

> As your word, first check the ID1 to detect the 8649 and 8952 and read
> ID2 again to distinguish it. But actually we pass the max8952 as
> platform device, so don't need to read ID2.

If you can read the ID from the chip it's always good to do so in order
to verify that the user has supplied accurate information.
