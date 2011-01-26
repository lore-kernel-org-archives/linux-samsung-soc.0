From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH] ARM: S5PV210: Add GONI board setup for CIF camera support
Date: Wed, 26 Jan 2011 21:52:55 +0900
Message-ID: <4D401927.6040005@gmail.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:54432 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab1AZMxC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jan 2011 07:53:02 -0500
Received: by pzk35 with SMTP id 35so52879pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2011 04:53:02 -0800 (PST)
In-Reply-To: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Hello,

On 01/08/2011 01:57 AM, Sylwester Nawrocki wrote:
> Hello,
>
> the following patch series introduces changes in GONI board setup file
> required for the CIF camera sensor driver.
> The first patch adds the I2C0 bus driver, the second one adds the regulator
> supply definitions and the third one just increases virtual size
> of the framebuffer window 0 for preview double buffering.
>
>
> The patch series contains:
>
> [PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
> [PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
> [PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI
>
> Created against kgene-for-next branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>

Any comments about these patches?

Regards,
Sylwester
