From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/3] ARM: S5P6440: Added PL330 support for samsung S5P6440
	soc.
Date: Fri, 19 Mar 2010 20:18:50 +0900
Message-ID: <1b68c6791003190418t7306a75webe238a25afb5b04@mail.gmail.com>
References: <1268996572-15513-1-git-send-email-atul.dahiya@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:34368 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380Ab0CSLSv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 07:18:51 -0400
Received: by vws11 with SMTP id 11so360656vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Mar 2010 04:18:50 -0700 (PDT)
In-Reply-To: <1268996572-15513-1-git-send-email-atul.dahiya@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Atul Dahiya <atul.dahiya@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, Mar 19, 2010 at 8:02 PM, Atul Dahiya <atul.dahiya@samsung.com> =
wrote:
> This patch adds the DMA pl330 driver functions to plat-s5.
>
> +int s5p_dma_enqueue(unsigned int channel, void *id,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dma_addr_t data, int size)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct s5p_dma_chan *chan =3D lookup_dma_chann=
el(channel);
> + =C2=A0 =C2=A0 =C2=A0 struct s5p_dma_buf *buf;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long flags;
> + =C2=A0 =C2=A0 =C2=A0 buf =3D kmem_cache_alloc(dma_kmem, GFP_ATOMIC)=
;

> + =C2=A0 =C2=A0 =C2=A0 buf->mcptr_cpu =3D dma_alloc_coherent(NULL, SI=
ZE_OF_MICRO_CODES,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&buf->mcptr, GFP_ATOMIC);

ever wonder what would these calls do, if enqueued from DMA callbacks?
that sometimes cause IRQ missing problems while using playing audio.
And this is not the only problem with this driver.
I remember only a few hours ago, I informed you about this issue.
