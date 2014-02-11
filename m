From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v1 0/1] Boot all secondary cores on Exynos SoC's
Date: Tue, 11 Feb 2014 11:47:15 +0530
Message-ID: <CAK9yfHzoBCBpUqhmOMvXmkR510EViBcciveD0rRNtiHxMRC9TQ@mail.gmail.com>
References: <1392084929-14116-1-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34136 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721AbaBKGRP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 01:17:15 -0500
Received: by mail-ob0-f174.google.com with SMTP id uy5so8327819obc.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2014 22:17:15 -0800 (PST)
In-Reply-To: <1392084929-14116-1-git-send-email-t.dakhran@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tarek Dakhran <t.dakhran@gmail.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Tarek,

On 11 February 2014 07:45, Tarek Dakhran <t.dakhran@samsung.com> wrote:
> Due to implementation of exynos_boot_secondary function
> only one secondary core boots on Exynos SoC's.

Even without this patch I could boot the secondary CPUs on Exynos4210, 4412 and
5250 based boards with the latest Linux kernel (v3.14-rc2+). Is this
patch required for
a specific use case or am I missing something?

---
With warm regards,
Sachin
