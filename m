From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Thu, 9 Feb 2012 10:58:04 -0800
Message-ID: <CAJuYYwRn7Luhj0223-i9u3ETutb8qgFUY7FEBq-ZOUi74DouMA@mail.gmail.com>
References: <1324624169-16102-1-git-send-email-riverful.kim@samsung.com>
	<1327652483-15655-1-git-send-email-riverful.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:64067 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758256Ab2BIS6G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 13:58:06 -0500
Received: by vbjk17 with SMTP id k17so1284685vbj.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2012 10:58:04 -0800 (PST)
In-Reply-To: <1327652483-15655-1-git-send-email-riverful.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "HeungJun, Kim" <riverful.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Dear Mr. HeungJun Kim,

On 27 January 2012 00:21, HeungJun, Kim <riverful.kim@samsung.com> wrot=
e:
> This patch adds Samsung Mobile TRATS board support.
>
> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0| =A0 11 ++
> =A0arch/arm/mach-exynos/Makefile =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-exynos/mach-trats.c | =A0344 +++++++++++++++++++++++=
++++++++++++++
> =A03 files changed, 356 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos/mach-trats.c

The exynos4 dt-enabled board file can support most of the features
added in this board file. The other option that could be considered
here would be to add DT support for this board file, and use AUX_DATA
to supply platform data for drivers that do not have dt support yet.
It would be better to use dt support for new board support that we
add.

Thanks,
Thomas.

(snip)
