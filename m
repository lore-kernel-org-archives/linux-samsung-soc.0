From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/2] regulator: max77686: Implement suspend disable for
 some LDOs
Date: Tue, 21 Oct 2014 11:54:16 +0200
Message-ID: <54462D48.2070702@collabora.co.uk>
References: <1413879912-26606-1-git-send-email-k.kozlowski@samsung.com> <1413879912-26606-2-git-send-email-k.kozlowski@samsung.com> <54462304.8050602@collabora.co.uk> <1413884182.26980.12.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:41060 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753120AbaJUJyX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 05:54:23 -0400
In-Reply-To: <1413884182.26980.12.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Krzysztof,

On 10/21/2014 11:36 AM, Krzysztof Kozlowski wrote:
> On wto, 2014-10-21 at 11:10 +0200, Javier Martinez Canillas wrote:
>> 
>> In general, could you please take a look to the latest patches I posted for the
>> max77802? They are in a topic branch in Mark's regulator tree [1]. I would like
>> both 77686 and 77802 drivers to handle things similarly even though I know that
>> the PMICs don't behave identically and that's why we decided to have different
>> drivers (although maybe that was a mistake and makes more sense to merge them).
> 
> I looked at them. In this patchset I didn't want to implement fully the
> whole suspend-mode-thing. Just the first, easier part - set suspend
> disable.
> 

Agreed, incremental support makes sense to me as well.

I also want to configure the regulator modes in suspend for the Snow Chromebook
using the same modes that are in the downstream Chrome OS tree and I think your
changes will be enough for that too.

> In general I would like to do it similar to your solution but that is
> work for future. Especially as I would like to wait for merging your
> "Add max77802 regulator operating mode support".
> 

Perfect, thanks a lot for working on this!

> Best regards,
> Krzysztof
> 

Best regards,
Javier
