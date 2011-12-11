From: "Javi Merino" <javi.merino@arm.com>
Subject: [PATCH] ARM: PL330: Fix driver freeze
Date: Sun, 11 Dec 2011 19:27:17 +0000
Message-ID: <1323631637-9610-1-git-send-email-javi.merino@arm.com>
References: <4EE4EB91.6020508@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:33138 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263Ab1LKT1o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 14:27:44 -0500
In-Reply-To: <4EE4EB91.6020508@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: jassisinghbrar@gmail.com, kgene.kim@samsung.com, boojin.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Javi Merino <javi.merino@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>

Add a req_running field to the pl330_thread to track which request (if
any) has been submitted to the DMA.  This mechanism replaces the old
one in which we tried to guess the same by looking at the PC of the
DMA, which could prevent the driver from sending more requests if it
didn't guess correctly.

Signed-off-by: Javi Merino <javi.merino@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
---
 arch/arm/common/pl330.c |  116 ++++++++++++++++++++-----------------------=
----
 1 files changed, 49 insertions(+), 67 deletions(-)

diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
index f407a6b..8d8df74 100644
--- a/arch/arm/common/pl330.c
+++ b/arch/arm/common/pl330.c
@@ -221,17 +221,6 @@
  */
 #define MCODE_BUFF_PER_REQ=09256
=20
-/*
- * Mark a _pl330_req as free.
- * We do it by writing DMAEND as the first instruction
- * because no valid request is going to have DMAEND as
- * its first instruction to execute.
- */
-#define MARK_FREE(req)=09do { \
-=09=09=09=09_emit_END(0, (req)->mc_cpu); \
-=09=09=09=09(req)->mc_len =3D 0; \
-=09=09=09} while (0)
-
 /* If the _pl330_req is available to the client */
 #define IS_FREE(req)=09(*((u8 *)((req)->mc_cpu)) =3D=3D CMD_DMAEND)
=20
@@ -301,8 +290,10 @@ struct pl330_thread {
 =09struct pl330_dmac *dmac;
 =09/* Only two at a time */
 =09struct _pl330_req req[2];
-=09/* Index of the last submitted request */
+=09/* Index of the last enqueued request */
 =09unsigned lstenq;
+=09/* Index of the last submitted request or -1 if the DMA is stopped */
+=09int req_running;
 };
=20
 enum pl330_dmac_state {
@@ -778,6 +769,22 @@ static inline void _execute_DBGINSN(struct pl330_threa=
d *thrd,
 =09writel(0, regs + DBGCMD);
 }
=20
+/*
+ * Mark a _pl330_req as free.
+ * We do it by writing DMAEND as the first instruction
+ * because no valid request is going to have DMAEND as
+ * its first instruction to execute.
+ */
+static void mark_free(struct pl330_thread *thrd, int idx)
+{
+=09struct _pl330_req *req =3D &thrd->req[idx];
+
+=09_emit_END(0, req->mc_cpu);
+=09req->mc_len =3D 0;
+
+=09thrd->req_running =3D -1;
+}
+
 static inline u32 _state(struct pl330_thread *thrd)
 {
 =09void __iomem *regs =3D thrd->dmac->pinfo->base;
@@ -836,31 +843,6 @@ static inline u32 _state(struct pl330_thread *thrd)
 =09}
 }
=20
-/* If the request 'req' of thread 'thrd' is currently active */
-static inline bool _req_active(struct pl330_thread *thrd,
-=09=09struct _pl330_req *req)
-{
-=09void __iomem *regs =3D thrd->dmac->pinfo->base;
-=09u32 buf =3D req->mc_bus, pc =3D readl(regs + CPC(thrd->id));
-
-=09if (IS_FREE(req))
-=09=09return false;
-
-=09return (pc >=3D buf && pc <=3D buf + req->mc_len) ? true : false;
-}
-
-/* Returns 0 if the thread is inactive, ID of active req + 1 otherwise */
-static inline unsigned _thrd_active(struct pl330_thread *thrd)
-{
-=09if (_req_active(thrd, &thrd->req[0]))
-=09=09return 1; /* First req active */
-
-=09if (_req_active(thrd, &thrd->req[1]))
-=09=09return 2; /* Second req active */
-
-=09return 0;
-}
-
 static void _stop(struct pl330_thread *thrd)
 {
 =09void __iomem *regs =3D thrd->dmac->pinfo->base;
@@ -892,17 +874,22 @@ static bool _trigger(struct pl330_thread *thrd)
 =09struct _arg_GO go;
 =09unsigned ns;
 =09u8 insn[6] =3D {0, 0, 0, 0, 0, 0};
+=09int idx;
=20
 =09/* Return if already ACTIVE */
 =09if (_state(thrd) !=3D PL330_STATE_STOPPED)
 =09=09return true;
=20
-=09if (!IS_FREE(&thrd->req[1 - thrd->lstenq]))
-=09=09req =3D &thrd->req[1 - thrd->lstenq];
-=09else if (!IS_FREE(&thrd->req[thrd->lstenq]))
-=09=09req =3D &thrd->req[thrd->lstenq];
-=09else
-=09=09req =3D NULL;
+=09idx =3D 1 - thrd->lstenq;
+=09if (!IS_FREE(&thrd->req[idx]))
+=09=09req =3D &thrd->req[idx];
+=09else {
+=09=09idx =3D thrd->lstenq;
+=09=09if (!IS_FREE(&thrd->req[idx]))
+=09=09=09req =3D &thrd->req[idx];
+=09=09else
+=09=09=09req =3D NULL;
+=09}
=20
 =09/* Return if no request */
 =09if (!req || !req->r)
@@ -933,6 +920,8 @@ static bool _trigger(struct pl330_thread *thrd)
 =09/* Only manager can execute GO */
 =09_execute_DBGINSN(thrd, insn, true);
=20
+=09thrd->req_running =3D idx;
+
 =09return true;
 }
=20
@@ -1382,8 +1371,8 @@ static void pl330_dotask(unsigned long data)
=20
 =09=09=09thrd->req[0].r =3D NULL;
 =09=09=09thrd->req[1].r =3D NULL;
-=09=09=09MARK_FREE(&thrd->req[0]);
-=09=09=09MARK_FREE(&thrd->req[1]);
+=09=09=09mark_free(thrd, 0);
+=09=09=09mark_free(thrd, 1);
=20
 =09=09=09/* Clear the reset flag */
 =09=09=09pl330->dmac_tbd.reset_chan &=3D ~(1 << i);
@@ -1461,14 +1450,12 @@ int pl330_update(const struct pl330_info *pi)
=20
 =09=09=09thrd =3D &pl330->channels[id];
=20
-=09=09=09active =3D _thrd_active(thrd);
-=09=09=09if (!active) /* Aborted */
+=09=09=09active =3D thrd->req_running;
+=09=09=09if (active =3D=3D -1) /* Aborted */
 =09=09=09=09continue;
=20
-=09=09=09active -=3D 1;
-
 =09=09=09rqdone =3D &thrd->req[active];
-=09=09=09MARK_FREE(rqdone);
+=09=09=09mark_free(thrd, active);
=20
 =09=09=09/* Get going again ASAP */
 =09=09=09_start(thrd);
@@ -1509,7 +1496,7 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_chan_op o=
p)
 =09struct pl330_thread *thrd =3D ch_id;
 =09struct pl330_dmac *pl330;
 =09unsigned long flags;
-=09int ret =3D 0, active;
+=09int ret =3D 0, active =3D thrd->req_running;
=20
 =09if (!thrd || thrd->free || thrd->dmac->state =3D=3D DYING)
 =09=09return -EINVAL;
@@ -1525,28 +1512,24 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_chan_op=
 op)
=20
 =09=09thrd->req[0].r =3D NULL;
 =09=09thrd->req[1].r =3D NULL;
-=09=09MARK_FREE(&thrd->req[0]);
-=09=09MARK_FREE(&thrd->req[1]);
+=09=09mark_free(thrd, 0);
+=09=09mark_free(thrd, 1);
 =09=09break;
=20
 =09case PL330_OP_ABORT:
-=09=09active =3D _thrd_active(thrd);
-
 =09=09/* Make sure the channel is stopped */
 =09=09_stop(thrd);
=20
 =09=09/* ABORT is only for the active req */
-=09=09if (!active)
+=09=09if (active =3D=3D -1)
 =09=09=09break;
=20
-=09=09active--;
-
 =09=09thrd->req[active].r =3D NULL;
-=09=09MARK_FREE(&thrd->req[active]);
+=09=09mark_free(thrd, active);
=20
 =09=09/* Start the next */
 =09case PL330_OP_START:
-=09=09if (!_thrd_active(thrd) && !_start(thrd))
+=09=09if ((active =3D=3D -1) && !_start(thrd))
 =09=09=09ret =3D -EIO;
 =09=09break;
=20
@@ -1587,14 +1570,13 @@ int pl330_chan_status(void *ch_id, struct pl330_cha=
nstatus *pstatus)
 =09else
 =09=09pstatus->faulting =3D false;
=20
-=09active =3D _thrd_active(thrd);
+=09active =3D thrd->req_running;
=20
-=09if (!active) {
+=09if (active =3D=3D -1) {
 =09=09/* Indicate that the thread is not running */
 =09=09pstatus->top_req =3D NULL;
 =09=09pstatus->wait_req =3D NULL;
 =09} else {
-=09=09active--;
 =09=09pstatus->top_req =3D thrd->req[active].r;
 =09=09pstatus->wait_req =3D !IS_FREE(&thrd->req[1 - active])
 =09=09=09=09=09? thrd->req[1 - active].r : NULL;
@@ -1659,9 +1641,9 @@ void *pl330_request_channel(const struct pl330_info *=
pi)
 =09=09=09=09thrd->free =3D false;
 =09=09=09=09thrd->lstenq =3D 1;
 =09=09=09=09thrd->req[0].r =3D NULL;
-=09=09=09=09MARK_FREE(&thrd->req[0]);
+=09=09=09=09mark_free(thrd, 0);
 =09=09=09=09thrd->req[1].r =3D NULL;
-=09=09=09=09MARK_FREE(&thrd->req[1]);
+=09=09=09=09mark_free(thrd, 1);
 =09=09=09=09break;
 =09=09=09}
 =09=09}
@@ -1767,14 +1749,14 @@ static inline void _reset_thread(struct pl330_threa=
d *thrd)
 =09thrd->req[0].mc_bus =3D pl330->mcode_bus
 =09=09=09=09+ (thrd->id * pi->mcbufsz);
 =09thrd->req[0].r =3D NULL;
-=09MARK_FREE(&thrd->req[0]);
+=09mark_free(thrd, 0);
=20
 =09thrd->req[1].mc_cpu =3D thrd->req[0].mc_cpu
 =09=09=09=09+ pi->mcbufsz / 2;
 =09thrd->req[1].mc_bus =3D thrd->req[0].mc_bus
 =09=09=09=09+ pi->mcbufsz / 2;
 =09thrd->req[1].r =3D NULL;
-=09MARK_FREE(&thrd->req[1]);
+=09mark_free(thrd, 1);
 }
=20
 static int dmac_alloc_threads(struct pl330_dmac *pl330)
--=20
1.7.0.4
