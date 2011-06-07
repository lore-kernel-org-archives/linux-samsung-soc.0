From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 15:45:18 +0530
Message-ID: <BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58861 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041Ab1FGKPT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 06:15:19 -0400
Received: by bwz15 with SMTP id 15so4041232bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 03:15:18 -0700 (PDT)
In-Reply-To: <20110607081527.GB20929@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, root <alim.akhtar@samsung.com>

On Tue, Jun 7, 2011 at 1:45 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jun 07, 2011 at 01:39:43PM +0530, Jassi Brar wrote:
>> Unfortunately, no. There are some features of Samsung's DMA API that
>> the drivers have come to rely upon.
>> Besides, I am not particularly a fan of the generic API. And IIRC,
>> neither is Ben Dooks, the designer of the
>> Samsung's DMA API.
>
> We are now at the point where this is non-optional. =C2=A0If the gene=
ric API
> doesn't fit what Samsung needs, then that needs to be discussed and
> whatever problems there are need to be resolved.
The discussion did take off a few months ago, but we didn't reach anywh=
ere.
Being able to queue request from the 'done' callback, the need of
circular buffer
API (possibly a free-running one too) and callbacks in irq-context, as
they happen,
were a few requirements for having fast peripherals with shallow fifo
work without underruns.
