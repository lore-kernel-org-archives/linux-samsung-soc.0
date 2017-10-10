From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: ARM: s3c2410: Fix a typo in a comment line
Date: Tue, 10 Oct 2017 10:35:32 +0200
Message-ID: <CAJKOXPeujGfUt6Sw-N9kBGSyZKvpqdGu8=zoT0pSzi64ioVqOg@mail.gmail.com>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
 <b93ca267-88d2-b68a-1570-dc8fc71f3888@users.sourceforge.net>
 <20171004181420.lctwaocrvg6rxokk@kozik-lap> <0f6ea076-2d41-103a-b1a1-40edc38e2daf@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754788AbdJJIff (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 04:35:35 -0400
In-Reply-To: <0f6ea076-2d41-103a-b1a1-40edc38e2daf@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

On Tue, Oct 10, 2017 at 10:29 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> Thanks, applied, squashed and changed commit msg.
>
> Would it be more appropriate to use a commit subject like
> “ARM: s3c241x: Fix typos in two comments” (instead of
> “ARM: s3c2410: Fix typos in a comments”)?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6c7a7db2e4c25acf8bd8086797d39a51728139e0

Yes, it would but patch is already applied and I prefer to avoid
rebasing unless really necessary.

Best regards,
Krzysztof
