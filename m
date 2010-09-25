From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH 2/5] h1940: fix h1940-bluetooth compilation
Date: Sun, 26 Sep 2010 00:22:59 +0100
Message-ID: <4C9E8453.2020306@simtec.co.uk>
References: <1283871605-32068-1-git-send-email-anarsoul@gmail.com> <1283871605-32068-3-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:46818 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751448Ab0IYXXU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Sep 2010 19:23:20 -0400
In-Reply-To: <1283871605-32068-3-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 07/09/10 16:00, Vasily Khoruzhick wrote:
> h1940-bluetooth.c doesn't compile after s3c gpio API changes,
> this patch fixes issue.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2410/h1940-bluetooth.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

thanks, applied to for-linus/2636/s3c24xx-fixes.

-- 
Ben
