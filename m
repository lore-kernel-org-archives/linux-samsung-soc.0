From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] watchdog: s3c2410: Constify local structures
Date: Sat, 25 Feb 2017 09:42:37 +0200
Message-ID: <20170225074237.txpetwb6e5p4bqyt@kozik-lap>
References: <20170224210746.12459-1-krzk@kernel.org>
 <20170224210746.12459-5-krzk@kernel.org>
 <7100fd29-a21d-25c0-b989-644e1358b34b@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36693 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbdBYHmo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2017 02:42:44 -0500
Content-Disposition: inline
In-Reply-To: <7100fd29-a21d-25c0-b989-644e1358b34b@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, Feb 24, 2017 at 02:05:56PM -0800, Guenter Roeck wrote:
> On 02/24/2017 01:07 PM, Krzysztof Kozlowski wrote:
> > Structures watchdog_device, watchdog_ops and s3c2410_wdt_variant are not
> > modified so they can be made const to increase code safeness.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Conflicts with "watchdog: constify watchdog_ops structures" in my tree.
> I rebased my tree to v4.10 (which I should not really have done ;-), but
> it still doesn't apply due to "fatal: sha1 information is lacking or useless"
> and "error: could not build fake ancestor". The subsequent patches also don't
> apply. You may have to wait until after -rc1, rebase your patches, and
> resubmit.

Sure, I'll resend after merge window. These aren't important fixes so
there is no problem in waiting for merge window to end.

Thanks for reviews.

Best regards,
Krzysztof
