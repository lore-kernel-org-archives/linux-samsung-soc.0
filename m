From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: Move display-timings node under fimd node
Date: Mon, 30 Jun 2014 15:26:41 +0530
Message-ID: <CAK5sBcF9K59Xb__oxnFPesM=F=Leb=atDjWPTfEE=U9APbw57g@mail.gmail.com>
References: <1403499552-12464-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:35673 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752372AbaF3J4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 05:56:43 -0400
Received: by mail-lb0-f169.google.com with SMTP id l4so5757768lbv.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 02:56:41 -0700 (PDT)
In-Reply-To: <1403499552-12464-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <trblinux@gmail.com>

On Mon, Jun 23, 2014 at 10:29 AM, Tushar Behera <tushar.b@samsung.com> wrote:
> 'display-timings' should be a subnode for fimd node. Moving this
> node appropriately gets the display back on Origen/Origen-Quad boards.
>
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>

Works fine on Origen 4210 board.

Tested-by: Sachin Kamat <sachin.kamat@samsung.com>


-- 
Regards,
Sachin.
