From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 11:56:59 -0800
Message-ID: <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f177.google.com ([209.85.210.177]:51938 "EHLO
	mail-ia0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917Ab2LTT47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 14:56:59 -0500
Received: by mail-ia0-f177.google.com with SMTP id u21so3167614ial.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Dec 2012 11:56:59 -0800 (PST)
In-Reply-To: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On Thu, Dec 20, 2012 at 11:03 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> The size of memory bank should be under 256MB, because current
> section size is 256MB on EXYNOS SoCs. This patch fixes it.

This makes no sense. You don't have to split up memory ranges, the
code should be made to handle it instead.

What's the actual bug caused by this? The description is vague.


-Olof
