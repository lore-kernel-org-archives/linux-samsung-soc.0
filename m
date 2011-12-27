From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and
 V210 boards
Date: Tue, 27 Dec 2011 11:39:33 +0530
Message-ID: <CAK9yfHyXazVh3weycF-FCHYtH==m4J-YtwnZfsAdfeAB9mBnkQ@mail.gmail.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:58972 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750847Ab1L0GJe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 01:09:34 -0500
Received: by qadb15 with SMTP id b15so7568160qad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 22:09:34 -0800 (PST)
In-Reply-To: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Hi Kukjin,

Please pick up the MFC patches (patches 1 & 2) from this series. I
will post a separate patch series for FIMC related changes.

Regards
Sachin

On 26 December 2011 15:30, Sachin Kamat <sachin.kamat@linaro.org> wrote=
:
> This patch series adds support for MFC and FIMC on SMDK C110 and V210=
 boards.
> It is based on Kukjin Kim's latest for-next branch.
>
> Sachin Kamat (4):
> =A0ARM: S5PV210: Enable MFC on SMDKV210
> =A0ARM: S5PV210: Enable MFC on SMDKC110
> =A0ARM: S5PV210: Enable FIMC on SMDKV210
> =A0ARM: S5PV210: Enable FIMC on SMDKC110
>
> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 ++++++++
> =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 14 ++++++++++++++
> =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 13 +++++++++++++
> =A03 files changed, 35 insertions(+), 0 deletions(-)
>
> --
> 1.7.4.1
>



--=20
With warm regards,
Sachin
