From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and SMDKV310
Date: Tue, 23 Oct 2012 20:19:37 +0200
Message-ID: <1375453.WR9khS7opQ@flatron>
References: <1349701968-6675-1-git-send-email-t.figa@samsung.com> <16890730.oeOgcP5xf2@flatron> <01d201cdb116$59de2520$0d9a6f60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:60740 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756823Ab2JWSTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 14:19:36 -0400
Received: by mail-ee0-f46.google.com with SMTP id b15so1530152eek.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Oct 2012 11:19:33 -0700 (PDT)
In-Reply-To: <01d201cdb116$59de2520$0d9a6f60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

On Tuesday 23 of October 2012 21:03:01 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > However I think this should be considered a fix, because without it
> > serial console on Origen and SMDKV310 will be broken.
> 
> Well, I couldn't find any broken due to miss this for v3.7. I think,
> there is no usage of serial controller in mainline for Origen and
> SMDKV310 now. So this should be queued for -next. If not, please let me
> know.

Personally I'm fine with this, but it sounds a bit off, since (correct me 
if I am wrong) it looks like serial console is the only way to check if 
the board boots.

Best regards,
Tomasz Figa
