From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2] mmc: dw_mmc: change to use recommended reset procedure
Date: Tue, 13 May 2014 14:19:04 +0900
Message-ID: <073601cf6e6a$db71f0e0$9255d2a0$@samsung.com>
References: <1399945121-7387-1-git-send-email-sonnyrao@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36058 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750992AbaEMFTG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 01:19:06 -0400
In-reply-to: <1399945121-7387-1-git-send-email-sonnyrao@chromium.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sonny Rao' <sonnyrao@chromium.org>, linux-mmc@vger.kernel.org
Cc: grundler@chromium.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jh80.chung@samsung.com, cjb@laptop.org, tgih.jun@samsung.com, joshi@samsung.com, t.figa@samsung.com, dianders@chromium.org, 'Yuvaraj Kumar C D' <yuvaraj.cd@samsung.com>

Sonny Rao wrote:
> 
> This patch changes the fifo reset code to follow the reset procedure
> outlined in the documentation of Synopsys  Mobile storage host databook
> 7.2.13.
> 
> v2: Add Generic DMA support
>     per the documentation, move interrupt clear before wait
>     make the test for DMA host->use_dma rather than host->using_dma
>     add proper return values (although it appears no caller checks)

Above changes should be put after following '---'.

> 
> Signed-off-by: Sonny Rao <sonnyrao@chromium.org>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---

Here.

- Kukjin

>  drivers/mmc/host/dw_mmc.c | 55
> ++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/mmc/host/dw_mmc.h |  1 +
>  2 files changed, 55 insertions(+), 1 deletion(-)
