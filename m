From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/7] ASoC: Remove to support sound for S5PC100
Date: Thu, 12 May 2011 11:41:26 +0530
Message-ID: <BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
	<1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43310 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755045Ab1ELGL2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2011 02:11:28 -0400
Received: by bwz15 with SMTP id 15so1021859bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2011 23:11:27 -0700 (PDT)
In-Reply-To: <1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thu, May 12, 2011 at 6:41 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> According to removing ARCH_S5PC100, we don't need to support
> sound for S5PC100.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0sound/soc/samsung/Kconfig | =C2=A0 =C2=A02 +-

You might also want to remove smdkc100 support from
 sound/soc/samsung/smdk_wm9713.c
 sound/soc/samsung/smdk_wm8580.c
And three other references to smdkc100 in sound/soc/samsung/Kconfig
