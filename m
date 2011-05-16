From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/7] ASoC: Remove to support sound for S5PC100
Date: Mon, 16 May 2011 12:58:20 +0530
Message-ID: <BANLkTikhD6XhsjzfwDKkDtqjrZfSgq1y0A@mail.gmail.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
	<1305162674-25860-3-git-send-email-kgene.kim@samsung.com>
	<BANLkTinqyFCwp3FCOyW=gVhotd1p8DnDyw@mail.gmail.com>
	<03fa01cc1079$c2583670$4708a350$%kim@samsung.com>
	<BANLkTimZnzfWuKB+J0z7YT-0ZT_B5_OvBQ@mail.gmail.com>
	<002201cc1399$8c39bd20$a4ad3760$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:46915 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645Ab1EPH2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 03:28:22 -0400
Received: by wwa36 with SMTP id 36so4796642wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 May 2011 00:28:20 -0700 (PDT)
In-Reply-To: <002201cc1399$8c39bd20$a4ad3760$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, May 16, 2011 at 12:49 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

>> > I found something for smdkc100 in smdk_wm8580.c but I'm not sure which
>> should be removed in smdk_wm9713.c.
>> >
>>
>> Just the comment about jumper settings on smdkc100
>> otherwise it gives wrong impression that the board is supported.
>
> Ok, I agree.
>
> But I'm not sure what is required for it.
> Could you please let me know about it after discussion of removing C100?

Simply doing this ....

diff --git a/sound/soc/samsung/smdk_wm9713.c b/sound/soc/samsung/smdk_wm9713.c
index ae5fed6..04ed8e4 100644
--- a/sound/soc/samsung/smdk_wm9713.c
+++ b/sound/soc/samsung/smdk_wm9713.c
@@ -24,7 +24,6 @@ static struct snd_soc_card smdk;
  * Default CFG switch settings to use this driver:
  *
  *   SMDK6410: Set CFG1 1-3 On, CFG2 1-4 Off
- *   SMDKC100: Set CFG6 1-3 On, CFG7 1   On
  *   SMDKC110: Set CFGB10 1-2 Off, CFGB12 1-3 On
  *   SMDKV210: Set CFGB10 1-2 Off, CFGB12 1-3 On
  *   SMDKV310: Set CFG2 1-2 Off, CFG4 All On, CFG7 All Off, CFG8 1-On


Thanks.
