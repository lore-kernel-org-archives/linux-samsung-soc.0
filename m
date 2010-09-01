From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 1 Sep 2010 10:15:19 +0100
Message-ID: <20100901091519.GA17032@opensource.wolfsonmicro.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
 <20100820095351.GD13668@rakim.wolfsonmicro.main>
 <1282301229.3084.152.camel@odin>
 <011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60280 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751870Ab0IAJPD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 05:15:03 -0400
Content-Disposition: inline
In-Reply-To: <011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Liam Girdwood' <lrg@slimlogic.co.uk>, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org, 'Changhwan Youn' <chaos.youn@samsung.com>

On Wed, Sep 01, 2010 at 09:15:36AM +0900, Kukjin Kim wrote:

> Seems almost same between the operation of max8649 and max8952 except output
> voltage range.

> How do you think that can support max8952 with small modifying max8649?

Take a look at something like the WM831x drivers for how you can handle
multiple devices with one driver - you can register I2C IDs for multiple
devices and then select behaviour based on the name that was quoted.
