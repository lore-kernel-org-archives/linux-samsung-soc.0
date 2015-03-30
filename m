From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 1/2] ARM: dts: Add bindings for 32kHz clocks from s2mps11
Date: Mon, 30 Mar 2015 16:38:57 +0200
Message-ID: <CAJKOXPcuzRGHePaGFy_9G7Nym+JJC5ovN+1Q6NjDJ7czcMRTrw@mail.gmail.com>
References: <55195A8E.6050709@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f45.google.com ([209.85.213.45]:34260 "EHLO
	mail-yh0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752541AbbC3Oi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 10:38:57 -0400
Received: by yhch68 with SMTP id h68so57978234yhc.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 07:38:57 -0700 (PDT)
In-Reply-To: <55195A8E.6050709@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

2015-03-30 16:15 GMT+02:00 Markus Reichl <m.reichl@fivetechno.de>:
> This creates include/dt-bindings/clock/samsung,s2mps11.h with the three
> 32kHz clock outputs from the s2mps11 mfd.
>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes since v1:
> 1. Dropped Documentation.
> 2. Split into 2 parts.
> ---
>  include/dt-bindings/clock/samsung,s2mps11.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/clock/samsung,s2mps11.h

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
