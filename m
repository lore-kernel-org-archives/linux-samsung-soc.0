From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Update I2C-1 Clock Register Property.
Date: Fri, 20 Aug 2010 19:31:29 +0900
Message-ID: <00da01cb4052$dcb20020$96160060$%kim@samsung.com>
References: <1282199919-32523-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14129 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250Ab0HTKbV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 06:31:21 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7G002GJ587T850@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 19:31:19 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7G005YZ587QI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 19:31:19 +0900 (KST)
In-reply-to: <1282199919-32523-1-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com

MyungJoo Ham wrote:
> 
> CLK_GATE_IP3[8] is RESERVED. The port "I2C_HDMI_DDY" of
> CLK_GATE_IP3[10] is used as another I2C port (but not dedicated to HDMI
> as if it is a general I2C port)
> 
> Therefore, we define the unused I2C-1 (IP3[8] is not used) as another
> I2C there was left undefined but used.
> 

Your patch file is right, but your comment is not.
Because actually, I2C1 is dedicated to I2C_HDMI_DDC...

Anyway, will apply.

> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index af91fef..825b868 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -357,7 +357,7 @@ static struct clk init_clocks_disable[] = {
>  		.id		= 1,
>  		.parent		= &clk_pclk_psys.clk,
>  		.enable		= s5pv210_clk_ip3_ctrl,
> -		.ctrlbit	= (1<<8),
> +		.ctrlbit	= (1 << 10),
>  	}, {
>  		.name		= "i2c",
>  		.id		= 2,
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
