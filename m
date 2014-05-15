From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Thu, 15 May 2014 23:14:13 +0200
Message-ID: <53752E25.9060604@gmail.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:62751 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbaEOVOZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 17:14:25 -0400
Received: by mail-ee0-f48.google.com with SMTP id e49so996538eek.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 14:14:24 -0700 (PDT)
In-Reply-To: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chirantan Ekbote <chirantan@chromium.org>, Russell King <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Chirantan,

On 15.05.2014 23:07, Chirantan Ekbote wrote:
> The multi core timer and the ARM architected timer are two different
> interfaces to the same underlying hardware timer.  This causes some
> strange timing issues when they are both enabled at the same time so
> remove the mct from the device tree and keep only the architected
> timer.

Huh? I've always thought MCT is a completely separate hardware block
outside of ARM cores, while architected timers are embedded inside the
CPU block in which the ARM cores reside. Could you elaborate on this?

Best regards,
Tomasz
