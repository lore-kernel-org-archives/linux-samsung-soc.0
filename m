From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 0/3] dt-bindings: regulator/clock/mfd: Reorganize S2M/S5M
 bindings
Date: Mon, 28 Dec 2015 10:15:11 +0900
Message-ID: <1451265314-4232-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42044 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbbL1BP2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Dec 2015 20:15:28 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org

Hi,


I got all acks for the patches. Please kindly pick up. Maybe Rob or Lee?


The patchset tries to bring some order to the chaotic bindings for family
of Samsung PMIC devices: S2MPS/S2MPA/S5M.

Beside of renaming and removal of common parts I also tried to make
a consistent style used in the files. The bindings itself were not
modified.

Rebased on next-20151223.


Changes since v1:
1. Added accumulated acks.
2. Use -M20% so renames will be more visible (formatting is changed so
   default -M50% does not consider it as renames).


Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: regulator/clock/mfd: Reorganize S2MPS-family bindings
  dt-bindings: regulator/mfd: Reorganize S5M8767 bindings
  dt-bindings: regulator/mfd: Reorganize S2MPA01 bindings

 .../devicetree/bindings/clock/samsung,s2mps11.txt  |  49 +++++++
 .../devicetree/bindings/mfd/samsung,sec-core.txt   |  88 ++++++++++++
 .../s2mpa01.txt => regulator/samsung,s2mpa01.txt}  |  69 ++++------
 .../s2mps11.txt => regulator/samsung,s2mps11.txt}  | 135 ++++++------------
 .../{s5m8767-regulator.txt => samsung,s5m8767.txt} | 152 +++++++++------------
 MAINTAINERS                                        |   6 +-
 6 files changed, 279 insertions(+), 220 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 rename Documentation/devicetree/bindings/{mfd/s2mpa01.txt => regulator/samsung,s2mpa01.txt} (37%)
 rename Documentation/devicetree/bindings/{mfd/s2mps11.txt => regulator/samsung,s2mps11.txt} (25%)
 rename Documentation/devicetree/bindings/regulator/{s5m8767-regulator.txt => samsung,s5m8767.txt} (34%)

-- 
1.9.1
