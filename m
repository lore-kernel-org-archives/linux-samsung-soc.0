From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix the IRQ definitions for MIPI CSIS device
Date: Tue, 09 Aug 2011 15:36:04 +0400
Message-ID: <4E411BA4.2020909@ru.mvista.com>
References: <1312809118-6181-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52799 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254Ab1HILgs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Aug 2011 07:36:48 -0400
Received: by wyg24 with SMTP id 24so287821wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2011 04:36:47 -0700 (PDT)
In-Reply-To: <1312809118-6181-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, kgene.kim@samsung.com, m.szyprowski@samsung.com

Hello.

On 08-08-2011 17:11, Sylwester Nawrocki wrote:

> This is a regression fix after migration to the external GIC.
> The breakage has been introduced in commit:
> "ARM: EXYNOS4: modify interrupt mappings for external GIC"

    Would be good to also cite that commit's ID for gitweb.

> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>

WBR, Sergei
