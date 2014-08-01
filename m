From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 01/10] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Fri, 1 Aug 2014 09:26:48 -0700
Message-ID: <CAD=FV=VBa5rs_woj0mshFFbA69Nhyi3hXK_XX7-54T3vFyKYHA@mail.gmail.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
	<1406868897-26874-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:56146 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbaHAQ0t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 12:26:49 -0400
Received: by mail-vc0-f173.google.com with SMTP id hy10so7012665vcb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2014 09:26:48 -0700 (PDT)
In-Reply-To: <1406868897-26874-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Hi,

On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> The pinctrl properties should be on the device directly and not on th=
e
> slot sub-node.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

Let's land this one before Jaehoon's, since it was a hidden
functionality change in his patch.  It will be an easy conflict to
resolve when his patch is applied.

Reviewed-by: Doug Anderson <dianders@chromium.org>
