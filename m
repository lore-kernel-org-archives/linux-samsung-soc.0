From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] ASoC: SAMSUNG: Change platform driver for SMDKs
Date: Fri, 10 Jun 2011 12:33:38 +0530
Message-ID: <BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-4-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:47558 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752818Ab1FJHDk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 03:03:40 -0400
Received: by bwz15 with SMTP id 15so1950720bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jun 2011 00:03:38 -0700 (PDT)
In-Reply-To: <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Jun 9, 2011 at 1:39 PM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> Change platform driver to support internal dma
> for smdk_wm8994 and smdk_wm8580
>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---

NAK.
It will break the most common user - SMDK6410, as s3c6410 doesn't have any
I2S internal DMA.
Please try to test the changes before submitting. I know it's boring,
but it's even more important :)

Thanks
-j
