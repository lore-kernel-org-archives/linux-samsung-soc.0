From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
Date: Mon, 13 Jun 2011 15:10:54 +0530
Message-ID: <BANLkTi=mwc+xHupQEDfjrQ7XT8gn7fNveA@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-3-git-send-email-sbkim73@samsung.com>
	<BANLkTikND3dyqmi9xj93ZDPh2-NaXo_jTA@mail.gmail.com>
	<005001cc299f$5105b850$f31128f0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64844 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab1FMJkz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 05:40:55 -0400
Received: by bwz15 with SMTP id 15so3559740bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2011 02:40:54 -0700 (PDT)
In-Reply-To: <005001cc299f$5105b850$f31128f0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Mon, Jun 13, 2011 at 1:25 PM, Sangbeom Kim <sbkim73@samsung.com> wro=
te:
> On Thu, Jun 10, 2011 at 7:08 PM, Jassi Brar wrote:
>> For my convenience, could you please tell how does it differ from my
>> original implementation? =C2=A0Most things look same, except for a f=
ew
>> variables.
> Original code only can support specific buffer size and period count.
> New idma driver can work with various buffer size and multiple period=
=2E
I believe using flexible buffer and period size with secondary i/f
make sense only
when _system_ dma and memory is used. iDMA provides no benefit over sys=
tem DMA.
Whereas for LPAM mode, you can _never_ get more power saving than using=
 full
internal buffer with slightly smaller period size.
So IMHO iDMA driver should use the original approach, while system dma =
still
allows the user to have flexible buffer and period size for low
latency with sec i/f.

> And Original code is implemented it based on wrapper arch.
> But This patch can support driver arch.
Well, there was extra wrapper driver. This driver is mostly unchanged.

=46rankly, I don't see enough changes to justify overriding the MODULE_=
AUTHOR.
Of course, the copyright belongs to Samsung still.

Thnx,
-j
