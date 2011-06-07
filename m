From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 13:39:43 +0530
Message-ID: <BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43316 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261Ab1FGIJo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:09:44 -0400
Received: by bwz15 with SMTP id 15so3966041bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 01:09:43 -0700 (PDT)
In-Reply-To: <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: root <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Jassi Brar <jassi.brar@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jun 7, 2011 at 1:30 PM, Kyungmin Park <kmpark@infradead.org> wrote:
>
> As I know there's are PL330 DMA implementation by
> MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");
Thanks for CC'ing me, though my current contact is
jaswinder.singh@linaro.org or jassisinghbrar@gmail.com
Perhaps I need to change the email in all locations.

> Doesn't it better to use the generic PL330 instead of Samsung specific
> PL330 implementation?
Unfortunately, no. There are some features of Samsung's DMA API that
the drivers have come to rely upon.
Besides, I am not particularly a fan of the generic API. And IIRC,
neither is Ben Dooks, the designer of the
Samsung's DMA API.

> As I remember Jassi has a plan to use generic one?
No plans, sorry.

thnx
-j
