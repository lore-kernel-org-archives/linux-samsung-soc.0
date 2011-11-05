From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Sat, 5 Nov 2011 15:05:32 -0400
Message-ID: <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
References: <4E8C5425.80303@arm.com>
	<1317892206-3600-1-git-send-email-javi.merino@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:59989 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751369Ab1KETFd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Nov 2011 15:05:33 -0400
Received: by gyc15 with SMTP id 15so2633073gyc.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Nov 2011 12:05:32 -0700 (PDT)
In-Reply-To: <1317892206-3600-1-git-send-email-javi.merino@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, Jassi Brar <jassi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Javi,

On 6 October 2011 05:10, Javi Merino <javi.merino@arm.com> wrote:
> If two requests have been submitted and one of them is running, if yo=
u
> call pl330_chan_ctrl(ch_id, PL330_OP_START), there's a window of time
> between the spin_lock_irqsave() and the _state() check in which the
> running transaction may finish. =A0In that case, we don't receive the
> interrupt (because they are disabled), but _start() sees that the DMA
> is stopped, so it starts it. =A0The problem is that it sends the
> transaction that has just finished again, because pl330_update()
> hasn't mark it as done yet.
>
> This patch fixes this race condition by not calling _start() if the
> DMA is already executing transactions. =A0When interrupts are reenabl=
ed,
> pl330_update() will call _start().
>
> Signed-off-by: Javi Merino <javi.merino@arm.com>
> Acked-by: Jassi Brar <jassi.brar@samsung.com>
> ---
> =A0arch/arm/common/pl330.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
> index 97912fa..7129cfb 100644
> --- a/arch/arm/common/pl330.c
> +++ b/arch/arm/common/pl330.c
> @@ -1546,7 +1546,7 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_cha=
n_op op)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Start the next */
> =A0 =A0 =A0 =A0case PL330_OP_START:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!_start(thrd))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!_thrd_active(thrd) && !_start(thrd=
))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -EIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;

On Samsung's Exynos4 platform, while testing audio playback with i2s
interface, the above change causes the playback to freeze. The
_thrd_active(thrd) call always returns '1' and hence _start(thrd) is
not getting called.

I have not debugged this much but if there is something that I am
missing, please let me know. Meanwhile, I will continue checking on
this.

Thanks,
Thomas.


>
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
