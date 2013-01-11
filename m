From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: sorting the device nodes in alphabetical order
 for EXYNOS DT
Date: Thu, 10 Jan 2013 17:34:24 -0800
Message-ID: <CAOesGMjXSnE_k763T0RiJiZO2dDj1HX_HROU+dTtnVTCMdLnmQ@mail.gmail.com>
References: <1357861132-16275-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:57376 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753781Ab3AKBeY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 20:34:24 -0500
Received: by mail-ie0-f180.google.com with SMTP id c10so1687514ieb.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 17:34:24 -0800 (PST)
In-Reply-To: <1357861132-16275-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Jan 10, 2013 at 3:38 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> To reduce merge conflicts it would be easier maintain the device nodes
> under the root node sorted in alphabetical order.
>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

While this would be good to do; it's 600+ lines of pure churn and I
would like to keep the diffstat down in 3.9 given the comments we got
for 3.8.

So, let's hold this off for another release, please.


-Olof
