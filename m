From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/2] DMA: PL330: Removes useless function
Date: Sun, 11 Dec 2011 15:12:05 +0530
Message-ID: <CABb+yY2gyBXSW98EEF_t-RjCFwxLuOtaRBxTXBD_6Q5M0kR9aA@mail.gmail.com>
References: <Acy1grs8azr8gcXzQzOmZ6e1pLhc6Q==>
	<002a01ccb582$bbcdbba0$336932e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64222 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211Ab1LKJmH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 04:42:07 -0500
Received: by bkcjm19 with SMTP id jm19so449822bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Dec 2011 01:42:05 -0800 (PST)
In-Reply-To: <002a01ccb582$bbcdbba0$336932e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Linus Walleij <linus.walleij@linaro.org>, rmk+kernel@arm.linux.org.uk, Boojin Kim <boojin.kim@samsung.com>

On Thu, Dec 8, 2011 at 1:53 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Boojin Kim <boojin.kim@samsung.com>
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0drivers/dma/pl330.c | =C2=A0 47 -------------------------------=
----------------
> =C2=A01 files changed, 0 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 35f0904..b917477 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -1512,53 +1512,6 @@ static int pl330_chan_ctrl(void *ch_id, enum p=
l330_chan_op op)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> =C2=A0}
>
> -static int pl330_chan_status(void *ch_id, struct pl330_chanstatus *p=
status)
> -{
> - =C2=A0 =C2=A0 =C2=A0 struct pl330_thread *thrd =3D ch_id;
> - =C2=A0 =C2=A0 =C2=A0 struct pl330_dmac *pl330;
> - =C2=A0 =C2=A0 =C2=A0 struct pl330_info *pi;
> - =C2=A0 =C2=A0 =C2=A0 void __iomem *regs;
> - =C2=A0 =C2=A0 =C2=A0 int active;
> - =C2=A0 =C2=A0 =C2=A0 u32 val;
> -
> - =C2=A0 =C2=A0 =C2=A0 if (!pstatus || !thrd || thrd->free)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> -
> - =C2=A0 =C2=A0 =C2=A0 pl330 =3D thrd->dmac;
> - =C2=A0 =C2=A0 =C2=A0 pi =3D pl330->pinfo;
> - =C2=A0 =C2=A0 =C2=A0 regs =3D pi->base;
> -
> - =C2=A0 =C2=A0 =C2=A0 /* The client should remove the DMAC and add a=
gain */
> - =C2=A0 =C2=A0 =C2=A0 if (pl330->state =3D=3D DYING)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->dmac_halt=
ed =3D true;
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->dmac_halt=
ed =3D false;
> -
> - =C2=A0 =C2=A0 =C2=A0 val =3D readl(regs + FSC);
> - =C2=A0 =C2=A0 =C2=A0 if (val & (1 << thrd->id))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->faulting =
=3D true;
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->faulting =
=3D false;
> -
> - =C2=A0 =C2=A0 =C2=A0 active =3D _thrd_active(thrd);
> -
> - =C2=A0 =C2=A0 =C2=A0 if (!active) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Indicate that t=
he thread is not running */
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->top_req =3D=
 NULL;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->wait_req =
=3D NULL;
> - =C2=A0 =C2=A0 =C2=A0 } else {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 active--;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->top_req =3D=
 thrd->req[active].r;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pstatus->wait_req =
=3D !IS_FREE(&thrd->req[1 - active])
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? thrd-=
>req[1 - active].r : NULL;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 pstatus->src_addr =3D readl(regs + SA(thrd->id=
));
> - =C2=A0 =C2=A0 =C2=A0 pstatus->dst_addr =3D readl(regs + DA(thrd->id=
));
> -
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
>
NAK.
Recently Samsung ASoC regressed to update DMA pointer only at period bo=
undaries.
I am sure other platforms would like to have low audio latencies and
hence need this function.
