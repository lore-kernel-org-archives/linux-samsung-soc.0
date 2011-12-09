From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] mfd: add irq domain support for max8997 interrupts
Date: Fri, 9 Dec 2011 12:41:11 +0800
Message-ID: <20111209044109.GB26952@opensource.wolfsonmicro.com>
References: <1323361659-11835-1-git-send-email-thomas.abraham@linaro.org>
 <1323361659-11835-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38879 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750790Ab1LIElQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 23:41:16 -0500
Content-Disposition: inline
In-Reply-To: <1323361659-11835-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Dec 08, 2011 at 09:57:38PM +0530, Thomas Abraham wrote:

You should be sending this to Samuel for review as it's a MFD patch.

> Add irq domain support for max8997 interrupts. All uses of irq_base in platform
> data and max8997 driver private data are removed.

Removing irq_base from platform data isn't going to be helpful for
anyone using the driver on non-DT platforms as it's going to make it
impossible to find the interrupts.
