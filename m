From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 0/6] Add S/PDIF common driver for Samsung SoCs
Date: Wed, 13 Oct 2010 15:10:15 +0900
Message-ID: <AANLkTimb-a=nTNZ9Ebr0U9wQ-KwJd7OOhTbOB+PZ+ToJ@mail.gmail.com>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44629 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600Ab0JMGKQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 02:10:16 -0400
Received: by bwz15 with SMTP id 15so2960574bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2010 23:10:15 -0700 (PDT)
In-Reply-To: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Tue, Oct 12, 2010 at 8:19 PM, Seungwhan Youn <sw.youn@samsung.com> w=
rote:
> Hi,
>
> This patch-set is a 2nd version for new S/PDIF common driver that sup=
ports
> S/PDIF PCM audio on S5PC100, S5PC110 and S5PV210.
>
> This patch-set is based on two different branches that :-
> =C2=A0o ARM patches are based on Kukjin Kim's git branch 'for-next'
> =C2=A0 (commit id - 64dcc6aef86593e478cf297a8508e55b54cceaf8)
> =C2=A0o ASoC patches are based on Mark Brown's git branch 'for-next'
> =C2=A0 (commit id - fe3e2e7ff2da41bd7a985c4c206e05a95ebe7a6b)
>
> This patch-set updates followings from the 1st submit :-
> =C2=A0o Add EPLL enable and get_rate function as common EPLL function
> =C2=A0o Add EPLL rate change warning
> =C2=A0o Fix S/PDIF's audio clock divider set dynamically at CPU drive=
r
> =C2=A0o Move S/PDIF specific register macros and structure into CPU d=
river
>
> This patch-set contains followings :-
> =C2=A0o To Kukjin Kim and Ben Dooks,
> =C2=A0- [PATCH v2 1/6] ARM: S5P: Reduce duplicated EPLL control codes
> =C2=A0- [PATCH v2 2/6] ARM: S5PV210: Fix wrong EPLL rate getting on s=
etup clocks
> =C2=A0- [PATCH v2 3/6] ARM: S5PV210: Add EPLL clock operations
> =C2=A0- [PATCH v2 4/6] ARM: S5P: Add EPLL rate change warning
> =C2=A0o To Jassi Brar, Mark Brown and Liam Girdwood,
> =C2=A0- [PATCH v2 5/6] ASoC: SAMSUNG: Add S/PDIF CPU driver
> =C2=A0- [PATCH v2 6/6] ASoC: SAMSUNG: Add Machine driver for S/PDIF P=
CM audio

Though we need to also provide iecset control support, maybe later as
incremental patches.

All
Acked-by: Jassi Brar <jassi.brar@samsung.com>
