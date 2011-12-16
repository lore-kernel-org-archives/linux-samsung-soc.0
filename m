From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH] ARM: PL330: Fix driver freeze
Date: Fri, 16 Dec 2011 11:57:49 +0530
Message-ID: <CAJe_Zhcud_hLU_G_H5NM=5H=_szYa_FfBRfvyGvx+vohfczc6A@mail.gmail.com>
References: <4EE4EB91.6020508@arm.com>
	<1323631637-9610-1-git-send-email-javi.merino@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:35594 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab1LPG1v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Dec 2011 01:27:51 -0500
Received: by wgbdr13 with SMTP id dr13so5568610wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2011 22:27:49 -0800 (PST)
In-Reply-To: <1323631637-9610-1-git-send-email-javi.merino@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, boojin.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On 12 December 2011 00:57, Javi Merino <javi.merino@arm.com> wrote:
> Add a req_running field to the pl330_thread to track which request (i=
f
> any) has been submitted to the DMA. =A0This mechanism replaces the ol=
d
> one in which we tried to guess the same by looking at the PC of the
> DMA, which could prevent the driver from sending more requests if it
> didn't guess correctly.
>
> Signed-off-by: Javi Merino <javi.merino@arm.com>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> ---
> =A0arch/arm/common/pl330.c | =A0116 ++++++++++++++++++++-------------=
--------------
> =A01 files changed, 49 insertions(+), 67 deletions(-)
>
> diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
> index f407a6b..8d8df74 100644
> --- a/arch/arm/common/pl330.c
> +++ b/arch/arm/common/pl330.c
> @@ -221,17 +221,6 @@
> =A0*/
> =A0#define MCODE_BUFF_PER_REQ =A0 =A0 256
>
> -/*
> - * Mark a _pl330_req as free.
> - * We do it by writing DMAEND as the first instruction
> - * because no valid request is going to have DMAEND as
> - * its first instruction to execute.
> - */
> -#define MARK_FREE(req) do { \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _emit_E=
ND(0, (req)->mc_cpu); \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (req)->=
mc_len =3D 0; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (0)
> -
> =A0/* If the _pl330_req is available to the client */
> =A0#define IS_FREE(req) =A0 (*((u8 *)((req)->mc_cpu)) =3D=3D CMD_DMAE=
ND)
>
> @@ -301,8 +290,10 @@ struct pl330_thread {
> =A0 =A0 =A0 =A0struct pl330_dmac *dmac;
> =A0 =A0 =A0 =A0/* Only two at a time */
> =A0 =A0 =A0 =A0struct _pl330_req req[2];
> - =A0 =A0 =A0 /* Index of the last submitted request */
> + =A0 =A0 =A0 /* Index of the last enqueued request */
> =A0 =A0 =A0 =A0unsigned lstenq;
> + =A0 =A0 =A0 /* Index of the last submitted request or -1 if the DMA=
 is stopped */
> + =A0 =A0 =A0 int req_running;
> =A0};
>
> =A0enum pl330_dmac_state {
> @@ -778,6 +769,22 @@ static inline void _execute_DBGINSN(struct pl330=
_thread *thrd,
> =A0 =A0 =A0 =A0writel(0, regs + DBGCMD);
> =A0}
>
> +/*
> + * Mark a _pl330_req as free.
> + * We do it by writing DMAEND as the first instruction
> + * because no valid request is going to have DMAEND as
> + * its first instruction to execute.
> + */
> +static void mark_free(struct pl330_thread *thrd, int idx)
> +{
> + =A0 =A0 =A0 struct _pl330_req *req =3D &thrd->req[idx];
> +
> + =A0 =A0 =A0 _emit_END(0, req->mc_cpu);
> + =A0 =A0 =A0 req->mc_len =3D 0;
> +
> + =A0 =A0 =A0 thrd->req_running =3D -1;
> +}
> +
> =A0static inline u32 _state(struct pl330_thread *thrd)
> =A0{
> =A0 =A0 =A0 =A0void __iomem *regs =3D thrd->dmac->pinfo->base;
> @@ -836,31 +843,6 @@ static inline u32 _state(struct pl330_thread *th=
rd)
> =A0 =A0 =A0 =A0}
> =A0}
>
> -/* If the request 'req' of thread 'thrd' is currently active */
> -static inline bool _req_active(struct pl330_thread *thrd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct _pl330_req *req)
> -{
> - =A0 =A0 =A0 void __iomem *regs =3D thrd->dmac->pinfo->base;
> - =A0 =A0 =A0 u32 buf =3D req->mc_bus, pc =3D readl(regs + CPC(thrd->=
id));
> -
> - =A0 =A0 =A0 if (IS_FREE(req))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
> -
> - =A0 =A0 =A0 return (pc >=3D buf && pc <=3D buf + req->mc_len) ? tru=
e : false;
> -}
> -
> -/* Returns 0 if the thread is inactive, ID of active req + 1 otherwi=
se */
> -static inline unsigned _thrd_active(struct pl330_thread *thrd)
> -{
> - =A0 =A0 =A0 if (_req_active(thrd, &thrd->req[0]))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1; /* First req active */
> -
> - =A0 =A0 =A0 if (_req_active(thrd, &thrd->req[1]))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 2; /* Second req active */
> -
> - =A0 =A0 =A0 return 0;
> -}
> -
> =A0static void _stop(struct pl330_thread *thrd)
> =A0{
> =A0 =A0 =A0 =A0void __iomem *regs =3D thrd->dmac->pinfo->base;
> @@ -892,17 +874,22 @@ static bool _trigger(struct pl330_thread *thrd)
> =A0 =A0 =A0 =A0struct _arg_GO go;
> =A0 =A0 =A0 =A0unsigned ns;
> =A0 =A0 =A0 =A0u8 insn[6] =3D {0, 0, 0, 0, 0, 0};
> + =A0 =A0 =A0 int idx;
>
> =A0 =A0 =A0 =A0/* Return if already ACTIVE */
> =A0 =A0 =A0 =A0if (_state(thrd) !=3D PL330_STATE_STOPPED)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return true;
>
> - =A0 =A0 =A0 if (!IS_FREE(&thrd->req[1 - thrd->lstenq]))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D &thrd->req[1 - thrd->lstenq];
> - =A0 =A0 =A0 else if (!IS_FREE(&thrd->req[thrd->lstenq]))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D &thrd->req[thrd->lstenq];
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D NULL;
> + =A0 =A0 =A0 idx =3D 1 - thrd->lstenq;
> + =A0 =A0 =A0 if (!IS_FREE(&thrd->req[idx]))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D &thrd->req[idx];
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idx =3D thrd->lstenq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!IS_FREE(&thrd->req[idx]))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D &thrd->req[idx]=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 req =3D NULL;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* Return if no request */
> =A0 =A0 =A0 =A0if (!req || !req->r)
> @@ -933,6 +920,8 @@ static bool _trigger(struct pl330_thread *thrd)
> =A0 =A0 =A0 =A0/* Only manager can execute GO */
> =A0 =A0 =A0 =A0_execute_DBGINSN(thrd, insn, true);
>
> + =A0 =A0 =A0 thrd->req_running =3D idx;
> +
> =A0 =A0 =A0 =A0return true;
> =A0}
>
> @@ -1382,8 +1371,8 @@ static void pl330_dotask(unsigned long data)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->req[0].r =3D NUL=
L;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->req[1].r =3D NUL=
L;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(&thrd->req[0]=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(&thrd->req[1]=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, 1);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Clear the reset fla=
g */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pl330->dmac_tbd.reset_=
chan &=3D ~(1 << i);
> @@ -1461,14 +1450,12 @@ int pl330_update(const struct pl330_info *pi)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd =3D &pl330->chann=
els[id];
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 active =3D _thrd_active=
(thrd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!active) /* Aborted=
 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 active =3D thrd->req_ru=
nning;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (active =3D=3D -1) /=
* Aborted */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0contin=
ue;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 active -=3D 1;
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rqdone =3D &thrd->req[=
active];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(rqdone);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, active)=
;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Get going again ASA=
P */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0_start(thrd);
> @@ -1509,7 +1496,7 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_cha=
n_op op)
> =A0 =A0 =A0 =A0struct pl330_thread *thrd =3D ch_id;
> =A0 =A0 =A0 =A0struct pl330_dmac *pl330;
> =A0 =A0 =A0 =A0unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0, active;
> + =A0 =A0 =A0 int ret =3D 0, active =3D thrd->req_running;
>
> =A0 =A0 =A0 =A0if (!thrd || thrd->free || thrd->dmac->state =3D=3D DY=
ING)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> @@ -1525,28 +1512,24 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_c=
han_op op)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->req[0].r =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->req[1].r =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(&thrd->req[0]);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(&thrd->req[1]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case PL330_OP_ABORT:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 active =3D _thrd_active(thrd);
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Make sure the channel is stopped */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0_stop(thrd);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* ABORT is only for the active req */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!active)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (active =3D=3D -1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 active--;
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->req[active].r =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FREE(&thrd->req[active]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_free(thrd, active);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Start the next */
> =A0 =A0 =A0 =A0case PL330_OP_START:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!_thrd_active(thrd) && !_start(thrd=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((active =3D=3D -1) && !_start(thrd)=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -EIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> @@ -1587,14 +1570,13 @@ int pl330_chan_status(void *ch_id, struct pl3=
30_chanstatus *pstatus)
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pstatus->faulting =3D false;
>
> - =A0 =A0 =A0 active =3D _thrd_active(thrd);
> + =A0 =A0 =A0 active =3D thrd->req_running;
>
> - =A0 =A0 =A0 if (!active) {
> + =A0 =A0 =A0 if (active =3D=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Indicate that the thread is not run=
ning */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pstatus->top_req =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pstatus->wait_req =3D NULL;
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 active--;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pstatus->top_req =3D thrd->req[active]=
=2Er;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pstatus->wait_req =3D !IS_FREE(&thrd->=
req[1 - active])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0? thrd->req[1 - active].r : NULL;
> @@ -1659,9 +1641,9 @@ void *pl330_request_channel(const struct pl330_=
info *pi)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->=
free =3D false;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->=
lstenq =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->=
req[0].r =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FR=
EE(&thrd->req[0]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_fr=
ee(thrd, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thrd->=
req[1].r =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MARK_FR=
EE(&thrd->req[1]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mark_fr=
ee(thrd, 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -1767,14 +1749,14 @@ static inline void _reset_thread(struct pl330=
_thread *thrd)
> =A0 =A0 =A0 =A0thrd->req[0].mc_bus =3D pl330->mcode_bus
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ (thr=
d->id * pi->mcbufsz);
> =A0 =A0 =A0 =A0thrd->req[0].r =3D NULL;
> - =A0 =A0 =A0 MARK_FREE(&thrd->req[0]);
> + =A0 =A0 =A0 mark_free(thrd, 0);
>
> =A0 =A0 =A0 =A0thrd->req[1].mc_cpu =3D thrd->req[0].mc_cpu
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ pi->=
mcbufsz / 2;
> =A0 =A0 =A0 =A0thrd->req[1].mc_bus =3D thrd->req[0].mc_bus
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ pi->=
mcbufsz / 2;
> =A0 =A0 =A0 =A0thrd->req[1].r =3D NULL;
> - =A0 =A0 =A0 MARK_FREE(&thrd->req[1]);
> + =A0 =A0 =A0 mark_free(thrd, 1);
> =A0}
>
> =A0static int dmac_alloc_threads(struct pl330_dmac *pl330)
> --
Seems ok, except that 'unsigned lstenq' and 'int req_running' occupy
real estate more than they should for their purpose. Though otherwise
the necessary helpers would bloat the code too.

Hoping you have done testing of enough corner cases...
Acked-by: Jassi Brar <jaswinder.singh@linaro.org>

Thanks.
