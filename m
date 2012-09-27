From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: [PATCH 3/3] DMA: PL330: Balance module remove function with
 probe
Date: Thu, 27 Sep 2012 15:18:12 +0530
Message-ID: <1348739292.1648.15.camel@vkoul-udesk3>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
	 <1348563456-30569-4-git-send-email-inderpal.singh@linaro.org>
	 <CABb+yY3TcVr=0Po0N7TLCkQ9TmMJuvQhKJj3aQ1bP9+68T+Ogw@mail.gmail.com>
	 <CAG17yqSOWhg_4KrQNojdYcpygkznvrzO74qnh8yasK=UH1f05Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:40706 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752070Ab2I0JyI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 05:54:08 -0400
In-Reply-To: <CAG17yqSOWhg_4KrQNojdYcpygkznvrzO74qnh8yasK=UH1f05Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, boojin.kim@samsung.com, patches@linaro.org, kgene.kim@samsung.com

On Wed, 2012-09-26 at 12:11 +0530, Inderpal Singh wrote:
> If we fail pl330_remove while some client is queued, the force unload
> will fail and the
> force unload will lose its purpose.
> How about conditionally DMA_TERMINATE_ALL and free resources like
> below ? 
Why would you want to remove the driver when it is doing something
useful? You have to ensure driver is not doing anything.

What is point here?

-- 
~Vinod
