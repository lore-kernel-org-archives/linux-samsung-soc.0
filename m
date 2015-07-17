From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/2] MAINTAINERS: update max77686 entry and add one for max77802
Date: Fri, 17 Jul 2015 10:17:56 +0200
Message-ID: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53362 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752513AbbGQISJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 04:18:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hello Lee,

This series update the max77686 pmic drivers entry to also resolve the new
max77686 regulator DT binding doc and also adds an entry for the max77802.

The series depend on:

[PATCH v2 0/4] mfd: Improve DT binding docs for max77686 and max77802
https://lkml.org/lkml/2015/7/17/73


Javier Martinez Canillas (2):
  MAINTAINERS: add Device Tree binding doc for max77686 regulator
  MAINTAINERS: add an entry for the Maxim MAX77802 PMIC drivers

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.4.3
