From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH-RESEND 0/4] ARM: S5PV210: Enable FIMC & MFC on SMDKC110
 & V210 boards
Date: Thu, 16 Feb 2012 22:00:45 +0900
Message-ID: <4F3CFDFD.1000804@samsung.com>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:55864 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab2BPNAv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 08:00:51 -0500
Received: by pbcun15 with SMTP id un15so2485785pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 05:00:51 -0800 (PST)
In-Reply-To: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 02/13/12 14:18, Sachin Kamat wrote:
> Re-sending the patch series rebased onto next/board-samsung branch of
> Kukjin Kim's tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> Sachin Kamat (4):
>    ARM: S5PV210: Enable MFC on SMDKV210
>    ARM: S5PV210: Enable MFC on SMDKC110
>    ARM: S5PV210: Enable FIMC on SMDKV210
>    ARM: S5PV210: Enable FIMC on SMDKC110
>
>   arch/arm/mach-s5pv210/Kconfig         |    8 ++++++++
>   arch/arm/mach-s5pv210/mach-smdkc110.c |   14 ++++++++++++++
>   arch/arm/mach-s5pv210/mach-smdkv210.c |   14 ++++++++++++++
>   3 files changed, 36 insertions(+), 0 deletions(-)
>

Hi Sachin,

Looks good to me, will apply this whole series.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
