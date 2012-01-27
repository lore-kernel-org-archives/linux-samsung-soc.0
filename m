From: Sergey Lapin <slapin@ossfans.org>
Subject: Re: [PATCH v2] S3C24XX DMA resume regression fix
Date: Fri, 27 Jan 2012 07:25:39 -0500
Message-ID: <20120127122537.GF2056@build.ihdev.net>
References: <1327065184-9805-1-git-send-email-dron0gus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from slapinbuild.ihdev.net ([46.4.202.25]:43109 "EHLO
	build.ossfans.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747Ab2A0M0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 07:26:48 -0500
Content-Disposition: inline
In-Reply-To: <1327065184-9805-1-git-send-email-dron0gus@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gusakov Andrey <dron0gus@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jan 20, 2012 at 05:13:04PM +0400, Gusakov Andrey wrote:
> In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b
> (Use struct syscore_ops for "core" power management)
> suspend/resume hooks for each DMA channels were replaced with
> hooks that suspend/resume all channels. s3c2410_dma_suspend
> suspends channels from 0 to dma_channels. s3c2410_dma_resume
> resumes channels in reverse order. So pointer should be
> decremented insted of being incremented.
Any news regarding this patch?
> 
> Signed-off-by: Gusakov Andrey <dron0gus@gmail.com>
> ---
>  arch/arm/plat-s3c24xx/dma.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> v2: updated commit message with original commit summary
> 

All the best,
S.
