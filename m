From: Vinod Koul <vinod.koul@intel.com>
Subject: RE: [PATCH 1/2] DMA: PL330: Remove pm_runtime_xxx calls from pl330
 probe/remove
Date: Thu, 08 Dec 2011 13:46:45 +0530
Message-ID: <1323332205.1641.29.camel@vkoul-udesk3>
References: <1323168355-2764-1-git-send-email-tushar.behera@linaro.org>
	 <1323168355-2764-2-git-send-email-tushar.behera@linaro.org>
	 <1323329702.1641.26.camel@vkoul-udesk3>
	 <002201ccb57d$056d2440$10476cc0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:51373 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752219Ab1LHISL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 03:18:11 -0500
In-Reply-To: <002201ccb57d$056d2440$10476cc0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Thu, 2011-12-08 at 16:43 +0900, Kukjin Kim wrote:
> Vinod Koul wrote:
> > 
> > On Tue, 2011-12-06 at 16:15 +0530, Tushar Behera wrote:
> > > amba_probe() now calls pm_runtime_get_noresume() and pm_runtime_enable()
> > > for the devices before the device probe is called. Hence we don't need
> > > to call pm_runtime_get_xxx and pm_runtime_enable() in device probe again.
> > > In the same way, since amba_remove() calls the respective pm_runtime
> > > functions, those functions need not be called from device remove.
> > >
> > > This patch fixes following run time error with pl330 driver.
> > >
> > > dma-pl330 dma-pl330.0: Unbalanced pm_runtime_enable!
> > > dma-pl330 dma-pl330.0: failed to get runtime pm
> > >
> > > Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> > > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> > Looks fine to me. Do you want these to go thru slave-dma or samsung
> > tree.
> 
> Hi Vinod,
> 
> I think, this patch can be sent to upstream via slave-dma tree and
> second one via Samsung tree separately and you can add my and Boojin
> Kim's ack(actually, she replied) on this when you apply.
Okay, I have applied this one only

-- 
~Vinod
