From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Wed, 25 Jan 2017 09:48:54 +0200
Message-ID: <CAJKOXPdSk2LpUyBppvbJ=WUw2wCa2unUXZ5Fbm=tqGneWeiDCQ@mail.gmail.com>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
 <1485261928-10769-1-git-send-email-a.hajda@samsung.com> <20170124175206.m2hquaf7eylslydq@kozik-lap>
 <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com> <48fcf959-845e-f601-229d-83b8fb13c121@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751297AbdAYHs7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 02:48:59 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id ACAEC20456
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2017 07:48:57 +0000 (UTC)
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com [209.85.214.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E768203AD
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2017 07:48:55 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id r185so7039557ita.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2017 23:48:55 -0800 (PST)
In-Reply-To: <48fcf959-845e-f601-229d-83b8fb13c121@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 25, 2017 at 9:13 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Such leakage usually happens if there is a hw block, which have more than
> one
> power supply. Disabling power for the one power supply might turn the hw
> logic
> into some meta state, in which it still conduct a current from the other
> source.
>
> The best example of such behavior is Odroid U3 and its problems with reset
> when
> HDMI cable is connected. Sometimes the current leaks from the HDMI connector
> to
> the board when the main power supply is turned off and the board enters some
> kind of a a "meta state".
>
> We still have no idea which hw block causes this leakage in case of TM2/TM2e
> though.

Interesting topic... Thanks for explanation!

Best regards,
Krzysztof
