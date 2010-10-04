From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/10] Add S/PDIF common driver for Samsung SoCs
Date: Mon, 4 Oct 2010 22:35:23 +0900
Message-ID: <AANLkTik1651oFOoC8vwDBDUmU4mDX6jpS=eyB3C0FVxJ@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:42554 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753741Ab0JDNfZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 09:35:25 -0400
Received: by bwz11 with SMTP id 11so3543376bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 06:35:23 -0700 (PDT)
In-Reply-To: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Mon, Oct 4, 2010 at 8:25 PM, Seungwhan Youn <sw.youn@samsung.com> wr=
ote:
> Hi,
>
> This patch-set is for new S/PDIF common driver that supports S/PDIF
> PCM audio on S5PC100, S5PC110 and S5PV210.
>
> This patch-set is based on two different branches that :-
> =C2=A0o ASoC patches are based on Mark Brown's git branch 'for-next'
> =C2=A0 (commit id - 135e44aaa47c22b66c8d2acb54da1106a6c17598)
> =C2=A0o ARM patches are based on Kukjin Kim's git branch 'for-next'
> =C2=A0 (commit id - a9d09cac7485062c599ee8f341bb0c5ccc2cc9d6)
>
> Based on these patches S/PDIF driver supports followings :-
> =C2=A0o Playback supports {32, 44.1, 48 and 96}kHz sampling rates.
> =C2=A0o Playback supports 16-bit Little-endian PCM format.
>
> This patch-set contains followings :-
> =C2=A0o To Kukjin Kim and Ben Dooks,
> =C2=A0- [PATCH 1/10] ARM: S5PC100: Add S/PDIF platform device
> =C2=A0- [PATCH 2/10] ARM: S5PC100: Modify SCLK_AUDIO{0,1,2} clock as
> =C2=A0 =C2=A0sysclks
> =C2=A0- [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
> =C2=A0- [PATCH 4/10] ARM: S5PV210: Add S/PDIF platform device
> =C2=A0- [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
> =C2=A0- [PATCH 6/10] ARM: S5PV210: Add audio clocks as sysclk
> =C2=A0- [PATCH 7/10] ARM: S5PV210: Fix wrong EPLL rate getting on
> =C2=A0 =C2=A0setup clocks
> =C2=A0- [PATCH 8/10] ARM: S5PV210: Add EPLL clock operations
> =C2=A0o To Jassi Brar, Mark Brown and Liam Girdwood,
> =C2=A0- [PATCH 9/10] ASoC: SAMSUNG: Add S/PDIF CPU driver
> =C2=A0- [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for S/PDIF PC=
M audio

All
Acked-by: Jassi Brar <jassi.brar@samsung.com>
