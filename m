From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC PATCH] clocksource: exynos_mct: use container_of() instead
 of this_cpu_ptr()
Date: Tue, 15 Sep 2015 10:47:49 +0200
Message-ID: <55F7DB35.9070803@linaro.org>
References: <1441324198-14513-1-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35265 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbbIOIrx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 04:47:53 -0400
Received: by wicge5 with SMTP id ge5so18189456wic.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2015 01:47:52 -0700 (PDT)
In-Reply-To: <1441324198-14513-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <alexey.klimov@linaro.org>, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, yury.norov@gmail.com, klimov.linux@gmail.com, kgene@kernel.org

On 09/04/2015 01:49 AM, Alexey Klimov wrote:
> Since evt structure is embedded in per-CPU mevt structure it's
> definitely faster to use container_of() to get access to mevt
> if we have evt (for example as incoming function argument) instead
> of more expensive approach with this_cpu_ptr(&percpu_mct_tick).
> this_cpu_ptr() on per-CPU mevt structure leads to access to cp15
> to get cpu id and arithmetic operations.
> Container_of() is cheaper since it's just one asm instruction.
> This should work if used evt pointer is correct and owned by
> local mevt structure.
>
> For example, before this patch set_state_shutdown() looks like:
>
>   4a4:	e92d4010 	push	{r4, lr}
>   4a8:	e3004000 	movw	r4, #0
>   4ac:	ebfffffe 	bl	0 <debug_smp_processor_id>
>   4b0:	e3003000 	movw	r3, #0
>   4b4:	e3404000 	movt	r4, #0
>   4b8:	e3403000 	movt	r3, #0
>   4bc:	e7933100 	ldr	r3, [r3, r0, lsl #2]
>   4c0:	e0844003 	add	r4, r4, r3
>   4c4:	e59400c0 	ldr	r0, [r4, #192]	; 0xc0
>   4c8:	ebffffd4 	bl	420 <exynos4_mct_tick_stop.isra.1>
>   4cc:	e3a00000 	mov	r0, #0
>   4d0:	e8bd8010 	pop	{r4, pc}
>
> With this patch:
>
>   4a4:	e92d4010 	push	{r4, lr}
>   4a8:	e59000c0 	ldr	r0, [r0, #192]	; 0xc0
>   4ac:	ebffffdb 	bl	420 <exynos4_mct_tick_stop.isra.1>
>   4b0:	e3a00000 	mov	r0, #0
>   4b4:	e8bd8010 	pop	{r4, pc}
>
> Also, for me size of exynos_mct.o decreased from 84588 bytes
> to 83956.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Despite the RFC I applied the patch as it seems simple enough and it ha=
s=20
been reviewed by Krzysztof.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
