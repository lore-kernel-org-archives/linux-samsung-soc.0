From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 0/7] ARM: SAMSUNG: Cleanup SPI platform specific code
Date: Thu, 30 Jun 2011 13:01:57 +0530
Message-ID: <BANLkTin2MAsTn3UhJDOLVvsams=xRR=REQ@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:63302 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754038Ab1F3Hb7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 03:31:59 -0400
Received: by bwd5 with SMTP id 5so1602208bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 00:31:57 -0700 (PDT)
In-Reply-To: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 30, 2011 at 5:55 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patchset does the following:
>
> 1. Move duplicated code to common place
> [PATCH 1/7] ARM: SAMSUNG: Move SPI device definitions to plat-samsung
> SPI platform devices are defined in respective machine folder of
> Samsung S3C64XX and S5P series SoCs.This is duplicated for every SoC.
> So all SPI platform devices are moved to a common place.

The machine specific code is put in machine specific location for some reason.
And the code is not duplicated, it's mostly data structures
initialized with machine
specific values.

Have you considered if it would still be possible to build kernel
image supporting
more than 1 soc after your changes ?
