From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/3] ARM: S5P6440: Added PL330 support in plat-samsung for
	samsung S5P6440 soc.
Date: Fri, 19 Mar 2010 20:10:55 +0900
Message-ID: <1b68c6791003190410i77989864p7187957bfefbb94c@mail.gmail.com>
References: <1268996540-15473-1-git-send-email-atul.dahiya@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:40052 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411Ab0CSLK4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 07:10:56 -0400
Received: by vws11 with SMTP id 11so359047vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Mar 2010 04:10:55 -0700 (PDT)
In-Reply-To: <1268996540-15473-1-git-send-email-atul.dahiya@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Atul Dahiya <atul.dahiya@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, Mar 19, 2010 at 8:02 PM, Atul Dahiya <atul.dahiya@samsung.com> wrote:
> This patch adds DMA pl330 mico code for S5P series in plat-samsung.This patch also
> moves some common code from s3c2410 to plat-samsung which can also be used by pl330.
Not sure if it's a correct approach when the mainline discussions have
already made it clear that PL-330
code shouldn't be Samsung specific.
Also, the samsung internal DMA driver style is needlessly borrowed
from s3c24xx dma. We don't
need that unnecessarily complicated state machine, though the API
should be kept.
