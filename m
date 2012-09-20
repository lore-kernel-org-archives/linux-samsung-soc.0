From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 0/6] pinctrl: samsung: Remove static platform-specific data
Date: Thu, 20 Sep 2012 12:27:15 +0200
Message-ID: <CACRpkdYQF1+0Y=okdQPonZuHJBNy29gZyLQNzrns+CojtiyweQ@mail.gmail.com>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:65458 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab2ITK1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 06:27:16 -0400
Received: by mail-vb0-f46.google.com with SMTP id ff1so2360894vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 03:27:16 -0700 (PDT)
In-Reply-To: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

On Thu, Sep 20, 2012 at 10:53 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This RFC series is a work on replacing static platform-specific data in
> pinctrl-samsung driver with data dynamically parsed from device tree.

Please include Stephen Warren on this series, he know his way
around pinctrl <-> devicetree better than anyone else.

(I'll look and see if I can see something that sticks out...)

Yours,
Linus Walleij
