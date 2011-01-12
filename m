From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH/RFC 0/3] ARM: S5P: Add a common platform setup code for
 MIPI CSIS/DSIM
Date: Wed, 12 Jan 2011 12:39:37 +0100
Message-ID: <4D2D92F9.3000902@gmail.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63755 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab1ALLjm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jan 2011 06:39:42 -0500
Received: by pzk35 with SMTP id 35so76385pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2011 03:39:42 -0800 (PST)
In-Reply-To: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Inki Dae <inki.dae@samsung.com>

On 01/04/2011 04:09 PM, Sylwester Nawrocki wrote:
> Hello,
>
> the following patch series adds the common platform code for configuration
> of the MIPI CSIS and MIPI DSIM PHYs on S5PV210 and S5PV310 SoCs.
> The spinlock is used to avoid races while the common PHY control register
> is accessed from within MIPI DSIM and MIPI CSIS drivers.
> The common PHY enable bit is cleared only when both CSIS and DSIM devices
> are not in use.
>
>
> The patch series contains:
>
> [PATCH/RFC 1/3] ARM: S5P: Add a platform callback for MIPI CSIS PHY control
> [PATCH/RFC 2/3] ARM: S5PV310: Add a platform helper for MIPI DSIM/CSIS setup
> [PATCH/RFC 3/3] ARM: S5PV210: Add a platform helper for MIPI DSIM/CSIS setup
>

Any comments on this one?

Regards,
Sylwester
