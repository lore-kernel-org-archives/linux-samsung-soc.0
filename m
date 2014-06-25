From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 4/6] ARM: SAMSUNG: Restore Samsung PM Debug functionality
Date: Wed, 25 Jun 2014 11:09:11 +0100
Message-ID: <CAD8Lp46GpaGzq+2bkyujRtSVYJt7PWWT47NvjifoxzJk7aKs6A@mail.gmail.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
	<1403618235-19353-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:43787 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752361AbaFYKJP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 06:09:15 -0400
Received: by mail-we0-f180.google.com with SMTP id x48so1753087wes.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 03:09:12 -0700 (PDT)
In-Reply-To: <1403618235-19353-5-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Tomasz,

On Tue, Jun 24, 2014 at 2:57 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Due to recently merged patches and previous merge conflicts, the Samsung
> PM Debug functionality no longer can be enabled. This patch fixes
> incorrect dependency of SAMSUNG_PM_DEBUG on an integer symbol and adds
> missing header inclusion.

Testing against 3.16-rc2, this doesn't quite work for me.
SAMSUNG_PM_DEBUG still doesn't appear in menuconfig.

HAVE_SAMSUNG_PM_DEBUG is 'n'. Looks like the select from
DEBUG_S3C_UART is not working, but I'm not sure why.

Daniel
