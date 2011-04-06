From: Paul Larson <paul.larson@linaro.org>
Subject: Re: Bug: SMDKV310: System hang during reboot
Date: Wed, 6 Apr 2011 09:14:46 -0500
Message-ID: <BANLkTinA0F8OfO2z51ote66ve4b1yEP+og@mail.gmail.com>
References: <BANLkTinNKKp1eP1iNDW1mQ0_EHuZJEvA6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:33840 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755986Ab1DFOPH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Apr 2011 10:15:07 -0400
Received: by wwa36 with SMTP id 36so1819965wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Apr 2011 07:15:06 -0700 (PDT)
In-Reply-To: <BANLkTinNKKp1eP1iNDW1mQ0_EHuZJEvA6A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org

Is there a bug for this in launchpad yet?  I see this hang on the
board we have in the validation lab too, and it's especially annoying
there since we don't have a good way to hard reset this board remotely
yet.

On Tue, Apr 5, 2011 at 4:40 AM, Tushar Behera <tushar.behera@linaro.org=
> wrote:
> Hi,
>
> While executing reboot call on SMDKV310, the system hangs during
> cpu_proc_fin() call.
>
> Commenting out this line of code, the reboot works properly.
>
> --- a/arch/arm/mm/proc-v7.S
> +++ b/arch/arm/mm/proc-v7.S
> @@ -46,7 +46,6 @@ ENTRY(cpu_v7_proc_fin)
> =A0 =A0 =A0 =A0mrc =A0 =A0 p15, 0, r0, c1, c0, 0 =A0 =A0 =A0 =A0 =A0 =
@ ctrl register
> =A0 =A0 =A0 =A0bic =A0 =A0 r0, r0, #0x1000 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 @ ...i............
> =A0 =A0 =A0 =A0bic =A0 =A0 r0, r0, #0x0006 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 @ .............ca.
> - =A0 =A0 =A0 mcr =A0 =A0 p15, 0, r0, c1, c0, 0 =A0 =A0 =A0 =A0 =A0 @=
 disable caches
> =A0 =A0 =A0 =A0mov =A0 =A0 pc, lr
> =A0ENDPROC(cpu_v7_proc_fin)
>
> Are we missing something in the Exynos4 machine code or is it a
> CPU_V7 specific issue?
>
> Regards,
> Tushar
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
