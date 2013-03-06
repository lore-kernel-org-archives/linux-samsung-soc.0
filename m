From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/23] ASoC: samsung: convert to dmaengine API
Date: Wed, 6 Mar 2013 12:01:59 +0000
Message-ID: <201303061201.59414.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <1362505353-8873-19-git-send-email-arnd@arndb.de> <CAAgF-Bd=b721r_hiJKGDhw1AqRKC8bNkLh6f9ipcGdFtkM62vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:58233 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757903Ab3CFMCL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 07:02:11 -0500
In-Reply-To: <CAAgF-Bd=b721r_hiJKGDhw1AqRKC8bNkLh6f9ipcGdFtkM62vQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Wednesday 06 March 2013, Padma Venkat wrote:

> > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +                       config.direction = DMA_MEM_TO_DEV;
> > +                       config.dst_addr = prtd->params->dma_size;
> > +                       config.dst_addr_width = prtd->params->dma_addr;
> 
> dma_addr and dma_size got interchanged.

Ok, fixed.

> Except the above one I tested this patch on 5250. It's working fine.

Thanks a lot for testing this!

	Arnd
