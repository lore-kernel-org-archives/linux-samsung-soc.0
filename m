From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/7] ASoC: Remove to support sound for S5PC100
Date: Thu, 12 May 2011 14:08:55 +0530
Message-ID: <BANLkTimZnzfWuKB+J0z7YT-0ZT_B5_OvBQ@mail.gmail.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
	<1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
	<BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
	<03fa01cc1079$c2583670$4708a350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37404 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754310Ab1ELIi4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2011 04:38:56 -0400
Received: by bwz15 with SMTP id 15so1103805bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 May 2011 01:38:55 -0700 (PDT)
In-Reply-To: <03fa01cc1079$c2583670$4708a350$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thu, May 12, 2011 at 1:23 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:

>> You might also want to remove smdkc100 support from
>> =C2=A0sound/soc/samsung/smdk_wm9713.c
>> =C2=A0sound/soc/samsung/smdk_wm8580.c
>> And three other references to smdkc100 in sound/soc/samsung/Kconfig
>
> I found something for smdkc100 in smdk_wm8580.c but I'm not sure whic=
h should be removed in smdk_wm9713.c.
>

Just the comment about jumper settings on smdkc100
otherwise it gives wrong impression that the board is supported.
