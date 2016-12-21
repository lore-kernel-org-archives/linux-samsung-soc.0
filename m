From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [2/4] PCI: exynos: Remove the unnecessary variables
Date: Wed, 21 Dec 2016 11:49:58 +0530
Message-ID: <63ae623f-303e-6bd6-e739-93d3e410628f@samsung.com>
References: <20161219081740.5457-3-jh80.chung@samsung.com>
 <CGME20161221061724epcas4p1020ae6823df0660fba63435130144a33@epcas4p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42495 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757380AbcLUGR0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Dec 2016 01:17:26 -0500
In-reply-to: <20161219081740.5457-3-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: helgaas@google.com, krzk@kernel.org, linux-kernel@vger.kernel.org, jingoohan1@gmail.com, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com

Hi Jaehoon,

On Monday 19 December 2016 01:47 PM, Jaehoon Chung wrote:
> Remove the unnecessary variables(elbi/phy/block_base).
> It needs one resource structure for assigning each resource.
> So it replaces with one 'res' variable.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/host/pci-exynos.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
