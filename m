From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Late Exynos stuff for v3.10
Date: Fri, 26 Apr 2013 00:38:56 +0900
Message-ID: <51794E10.1010205@samsung.com>
References: <5176B499.1000208@samsung.com> <51770697.7080504@samsung.com> <20130424000638.GA9067@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:64485 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758286Ab3DYPjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 11:39:01 -0400
Received: by mail-da0-f47.google.com with SMTP id p1so1477146dad.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2013 08:39:00 -0700 (PDT)
In-Reply-To: <20130424000638.GA9067@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 04/24/13 09:06, Olof Johansson wrote:
> Hi,
>
Hi Olof,

> Can I please ask you to make our life a little easier by telling us what the
> specific problems these patches solve are? What I am looking for is something
> along the lines of:
>
> --
>
> This branch includes some last-minute enablements of DT contents for features
> that are queued for 3.10:
>   - USB PHY drivers on Exynos 5250
>   - MMC (mshc) on Exynos 4x12
>   - XCHI (USB 3.0) on Exynos 5250
>
> It also contains a fix to disable RTC on exynos [because ... you fill in this
> part].
>
> --
>
> It doesn't have to be something super-elaborate, but I'd like it to be sort of
> self-documenting in a way that I don't have to look through the series of
> patches to get an overview of what's in the branch. Of course we'll also do
> that to review the code, but having the description there makes things easier
> for us to tell if we should even be looking at it, etc.
>
>
OK, I see. Let me do it more carefully.

And let me send pull-request again for fix and late dt branch with 
separated branches in a couple of hours not including usb stuff...

Thanks.

- Kukjin
