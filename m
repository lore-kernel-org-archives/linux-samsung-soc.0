From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Spurious IPIs on secondary cpu bringup with EXYNOS 4412
Date: Tue, 2 Oct 2012 09:21:01 +0900
Message-ID: <CAH9JG2VgEtaFfMB8gw5ikTtRJQ4d4MKx9=sc+kjzc=R+8965Sg@mail.gmail.com>
References: <87obkmjfzv.fsf@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:53157 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751733Ab2JBAVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 20:21:03 -0400
Received: by weyt9 with SMTP id t9so3274088wey.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Oct 2012 17:21:01 -0700 (PDT)
In-Reply-To: <87obkmjfzv.fsf@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>
Cc: linux-samsung-soc@vger.kernel.org

On 10/2/12, Matthew Leach <matthew@mattleach.net> wrote:
> Hi,
>
> I applied the secondary CPU bringup patch [1] to mainline, however when
> booting I get the following spurious IPIs after each core has booted:
>
> [    0.050000] CPU1: Booted secondary processor
> [    0.075000] CPU1: thread -1, cpu 1, socket 10, mpidr 80000a01
> [    0.080000] CPU1: Unknown IPI message 0x1
> [    0.090000] CPU2: Booted secondary processor
> [    0.115000] CPU2: thread -1, cpu 2, socket 10, mpidr 80000a02
> [    0.120000] CPU2: Unknown IPI message 0x1
> [    0.130000] CPU3: Booted secondary processor
> [    0.155000] CPU3: thread -1, cpu 3, socket 10, mpidr 80000a03
> [    0.160000] CPU3: Unknown IPI message 0x1
>
> Has anyone that has access to the documentation for the 4412 know what
> this could be?
It's known issue, you can find the patch at arm mailing list to solve issue.
IOW it's not exynos specific, but arm specific issue.

Thank you,
Kyungmin Park
>
> [1]: ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
>
> ---
>
> Thanks,
> Matt
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
