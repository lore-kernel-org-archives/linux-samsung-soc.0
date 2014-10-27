From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 2/3] regulator: max77686: Implement suspend disable
 for some LDOs
Date: Mon, 27 Oct 2014 11:32:40 +0100
Message-ID: <544E1F48.9050105@collabora.co.uk>
References: <1414403066-7872-1-git-send-email-k.kozlowski@samsung.com> <1414403066-7872-3-git-send-email-k.kozlowski@samsung.com> <544E19A4.6040603@collabora.co.uk> <1414405641.1674.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:57116 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522AbaJ0Kct (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 06:32:49 -0400
In-Reply-To: <1414405641.1674.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 10/27/2014 11:27 AM, Krzysztof Kozlowski wrote:
> 
> Storing opmode in non-shifted form is intuitive also to me. That's way I
> slipped the bug in previous version.
> 

Great.

> I'll change this to non-shifted opmode. The patch will grow bigger but
> the code should be more readable.
> 

Maybe split in two patches? A preparatory that adds max77686_get_opmode_shift()
and changes the current driver and a second one that implements suspend disable
for LDOs?

> Thanks!

You are welcome.

Best regards,
Javier
