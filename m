From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: boot failure of exynos4 on 3.1.0-rc7
Date: Wed, 28 Sep 2011 15:37:24 +0900
Message-ID: <CAH9JG2XqW+A1Y6US5TaavSt7vmkXWEMpiftH7fnOU5jnuNaJmA@mail.gmail.com>
References: <4E82BFC5.2020409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:54008 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558Ab1I1GhY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 02:37:24 -0400
Received: by qyk7 with SMTP id 7so8813821qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2011 23:37:24 -0700 (PDT)
In-Reply-To: <4E82BFC5.2020409@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Subash Patel <subashrp@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Wed, Sep 28, 2011 at 3:33 PM, Subash Patel <subashrp@gmail.com> wrot=
e:
> Hello,
>
> I am attempting to boot linux version in subject on SMDKV310 board[EV=
T0].
> The booting stops after "Uncompressing Linux... done, booting the ker=
nel."
> After some debugging I found that the timer initialization fails.
> exynos4_mct_frc_start() calls exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT=
_L)
> which fails to write to the register, which should have asserted
> G-CNT_WSTAT[0] to 1. Hence panic() will be called which halts booting=
=2E
>
> I have booted 3.0.0-rc1 before this, which used PWM. I found a relate=
d
> thread for C210, which I couldnt make head-tail out of it :(
> http://www.spinics.net/lists/arm-kernel/msg140431.html
>
> Can anyone let me know if this is known issue and if there is a solut=
ion
> available for this.
Need to wait for sched_clock patch are merged. Before that, you need a
workaround patch as universal_c210 does.
Note that de-select the MCT timer since EVT0 doesn't have it.

Thank you,
Kyungmin Park
>
> Regards,
> Subash
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
